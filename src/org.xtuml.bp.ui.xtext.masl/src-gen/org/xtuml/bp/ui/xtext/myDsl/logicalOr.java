/**
 * generated by Xtext 2.9.1
 */
package org.xtuml.bp.ui.xtext.myDsl;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>logical Or</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.xtuml.bp.ui.xtext.myDsl.logicalOr#getL <em>L</em>}</li>
 * </ul>
 *
 * @see org.xtuml.bp.ui.xtext.myDsl.MyDslPackage#getlogicalOr()
 * @model
 * @generated
 */
public interface logicalOr extends EObject
{
  /**
   * Returns the value of the '<em><b>L</b></em>' containment reference list.
   * The list contents are of type {@link org.xtuml.bp.ui.xtext.myDsl.logicalXor}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>L</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>L</em>' containment reference list.
   * @see org.xtuml.bp.ui.xtext.myDsl.MyDslPackage#getlogicalOr_L()
   * @model containment="true"
   * @generated
   */
  EList<logicalXor> getL();

} // logicalOr
