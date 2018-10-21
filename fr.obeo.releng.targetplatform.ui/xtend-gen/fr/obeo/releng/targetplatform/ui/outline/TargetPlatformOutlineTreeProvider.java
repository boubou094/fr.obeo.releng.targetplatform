/**
 * Copyright (c) 2012-2014 Obeo.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *     Mikael Barbero (Obeo) - initial API and implementation
 */
package fr.obeo.releng.targetplatform.ui.outline;

import com.google.inject.Inject;
import fr.obeo.releng.targetplatform.IncludeDeclaration;
import fr.obeo.releng.targetplatform.TargetPlatform;
import fr.obeo.releng.targetplatform.util.LocationIndexBuilder;
import java.util.LinkedList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.ui.editor.outline.IOutlineNode;
import org.eclipse.xtext.ui.editor.outline.impl.DefaultOutlineTreeProvider;

/**
 * Customization of the default outline structure.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#outline
 */
@SuppressWarnings("all")
public class TargetPlatformOutlineTreeProvider extends DefaultOutlineTreeProvider {
  @Inject
  private LocationIndexBuilder indexBuilder;
  
  protected void _createChildren(final IOutlineNode parentNode, final IncludeDeclaration includeDeclaration) {
    super._createChildren(parentNode, includeDeclaration);
    EObject _eContainer = includeDeclaration.eContainer();
    final TargetPlatform enclosingTargetPlatform = ((TargetPlatform) _eContainer);
    final URI enclosingTargetUri = enclosingTargetPlatform.eResource().getURI();
    final LinkedList<TargetPlatform> importedTargetPlatforms = this.indexBuilder.getImportedTargetPlatforms(enclosingTargetPlatform);
    importedTargetPlatforms.size();
    enclosingTargetUri.toString();
  }
}
