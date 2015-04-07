#!/bin/bash
#=====================================================================
#
# File:      build_installer_bp.sh
#
#=====================================================================
#

date

# Check arguments
if [ $# -ne 6 ]; then
    echo
    echo "Usage: ./build_installer_bp.sh <product_branch> <staging_path> <izpack_path> <output_dir> <os> <release_version>"
    echo "      product_branch -- e.g. master, R4_2_1"
    echo "      staging_path -- path to the location of the Eclipse bases and BridgePoint deliverables"
    echo "      izpack_path -- path to the root of the izpack installation"
    echo "      output_dir -- path to the location to output the installers"
    echo "      os - windows or linux"
    echo "      release_version -- e.g. 4.2.1"
    echo
    exit 0
fi

PRODUCT_BRANCH="$1"
STAGING_PATH="$2"
IZPACK_PATH="$3"
OUTPUT_DIR="$4"
OS_ARG="$5"
BP_VERSION="$6"
OUTPUT_DIR_EXTENSION="${OUTPUT_DIR}-extension"
# TODO - remove override below (which is here for testing)
OUTPUT_DIR_EXTENSION="/tmp/installer-testing"

PRODUCT_NAME="BridgePoint"
ECLIPSE_VER="3.7"

# Assume windows unless we case-insensitively match Linux on the argument
OS="windows"
BP_BASE_DIR="${STAGING_PATH}/${PRODUCT_NAME}_e${ECLIPSE_VER}"
MCMC_EXE="org.xtuml.bp.mc.c.binary_${BP_VERSION}/mc3020/bin/mcmc.exe"
if [ "${OS_ARG,,}" = "linux" ]; then
  OS="linux"
  BP_BASE_DIR="${STAGING_PATH}/${PRODUCT_NAME}_for_Linux_e${ECLIPSE_VER}"
  MCMC_EXE="org.xtuml.bp.mc.c.binary_${BP_VERSION}/mc3020/bin/mcmc"
fi

TEMP_DIR="/tmp"
SEQUENCE_CREATOR="org.xtuml.bp.sequencecapture_${BP_VERSION}.jar"
# TODO - SERVER="tucson.wv"
# TODO - REMOTE_RELEASE_DIR="/arch1/products/tiger/releases/${PRODUCT_BRANCH}"
EXT_SRC_FILE="${PRODUCT_NAME}_extension_${PRODUCT_BRANCH}.zip"
INSTALLER_DATA_DIR="${BP_BASE_DIR}/${PRODUCT_NAME}Deliverables/eclipse_extensions"

echo "INFO: Building ${PRODUCT_NAME} installer for ${OS}."

# Put the new ${PRODUCT_NAME} extension in place for the installer
echo "INFO: Copying new source data to ${TEMP_DIR}."
cd "${TEMP_DIR}"
echo "INFO:   Copying in ${OUTPUT_DIR_EXTENSION}/${EXT_SRC_FILE}."
cp -f "${OUTPUT_DIR_EXTENSION}/${EXT_SRC_FILE}" .
if [ ! -e "${OUTPUT_DIR_EXTENSION}/${EXT_SRC_FILE}" ]; then
  echo "ERROR: Source extension (${TEMP_DIR}/${EXT_SRC_FILE}) does not exist.  Exiting."
  exit 2
fi
echo "INFO: Done."

echo "INFO: Unzipping new source data in ${TEMP_DIR}."
echo "INFO:   Unzipping ${EXT_SRC_FILE}."
rm -rf ${PRODUCT_NAME}
rm -rf ${PRODUCT_NAME}_${PRODUCT_BRANCH}
unzip -q "${EXT_SRC_FILE}"
if [ -e "${PRODUCT_NAME}_${PRODUCT_BRANCH}" ]; then
  mv "${PRODUCT_NAME}_${PRODUCT_BRANCH}" "${PRODUCT_NAME}"
  rm -f "${EXT_SRC_FILE}"
else
  echo "ERROR: Error creating the new extension directory.  Exiting."
  exit 3
fi
echo "INFO: Done."

echo "INFO: Moving new extension data to ${INSTALLER_DATA_DIR}."
cd "${INSTALLER_DATA_DIR}"
rm -rf ${PRODUCT_NAME}
mv "${TEMP_DIR}/${PRODUCT_NAME}" .
echo "INFO: Done."

echo "INFO: Setting up docgen executable"
cd "${BP_BASE_DIR}/BridgePointDeliverables/tools/docgen"
cp -f "${INSTALLER_DATA_DIR}/${PRODUCT_NAME}/eclipse/plugins/${MCMC_EXE}" docgen.exe
echo "INFO: Done."

echo "INFO: Disabling sequence creator plugin."
cd "${INSTALLER_DATA_DIR}/${PRODUCT_NAME}/eclipse/plugins/"
mv -f ${SEQUENCE_CREATOR} ${SEQUENCE_CREATOR}.no
echo "INFO: Done."

# Start IzPack
echo "INFO: Running IzPack to create the installer."
cd ${GIT_BP}/src/${install_project}
${IZPACK_PATH}/bin/compile install_${OS}.xml -b ${STAGING_PATH} -o ${OUTPUT_DIR}/${PRODUCT_NAME}_${OS}.jar
echo "INFO: Done."

# Rename the output file
DATESTAMP=`date +%Y%m%d%H%M`
echo "INFO: Renaming the output file to ${PRODUCT_NAME}_${PRODUCT_BRANCH}_${DATESTAMP}.jar."
if [ "${PRODUCT_BRANCH}" = "master" ]; then
  rm -rf ${PRODUCT_NAME}_${PRODUCT_BRANCH}_*.jar
fi
mv "${PRODUCT_NAME}_${OS}.jar" "${PRODUCT_NAME}_${PRODUCT_BRANCH}_${DATESTAMP}_${OS}.jar"
echo "INFO: Done."

# Make sure the output looks good
size=$(du -k ${PRODUCT_NAME}_${PRODUCT_BRANCH}_${DATESTAMP}_${OS}.jar | sed 's/\([0-9]*\)\(.*\)/\1/')
if [ ${size} -lt 300000 ]; then
  echo "ERROR: Created installer file size is less than expected, exiting."
  exit 5
fi

# Move it to the release area
echo "INFO: Copying the new installer to the release website."
if [ "${PRODUCT_BRANCH}" = "master" ]; then
  # TODO - ssh ${SERVER} "(cd '${REMOTE_RELEASE_DIR}'; rm -rf ${PRODUCT_NAME}_${PRODUCT_BRANCH}_*.jar)"
fi
cp -f "${PRODUCT_NAME}_${PRODUCT_BRANCH}_${DATESTAMP}_${OS}.jar" "${OUTPUT_DIR}"
# TODO - ssh ${SERVER} "(cd '${REMOTE_RELEASE_DIR}'; chmod 755 ${PRODUCT_NAME}_${PRODUCT_BRANCH}_*.jar)"
echo "INFO: Done."

echo "INFO: ${PRODUCT_NAME} for ${OS} installer creation complete.  Goodbye."