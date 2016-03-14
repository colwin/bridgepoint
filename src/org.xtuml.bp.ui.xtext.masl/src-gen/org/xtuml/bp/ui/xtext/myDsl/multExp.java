/**
 * generated by Xtext 2.9.1
 */
package org.xtuml.bp.ui.xtext.myDsl;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>mult Exp</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.xtuml.bp.ui.xtext.myDsl.multExp#getU <em>U</em>}</li>
 * </ul>
 *
 * @see org.xtuml.bp.ui.xtext.myDsl.MyDslPackage#getmultExp()
 * @model
 * @generated
 */
public interface multExp extends EObject
{
  /**
   * Returns the value of the '<em><b>U</b></em>' containment reference list.
   * The list contents are of type {@link org.xtuml.bp.ui.xtext.myDsl.unaryExp}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>U</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>U</em>' containment reference list.
   * @see org.xtuml.bp.ui.xtext.myDsl.MyDslPackage#getmultExp_U()
   * @model containment="true"
   * @generated
   */
  EList<unaryExp> getU();

} // multExp