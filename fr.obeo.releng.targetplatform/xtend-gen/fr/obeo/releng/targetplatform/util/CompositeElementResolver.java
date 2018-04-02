package fr.obeo.releng.targetplatform.util;

import com.google.inject.Inject;
import fr.obeo.releng.targetplatform.IncludeDeclaration;
import fr.obeo.releng.targetplatform.Location;
import fr.obeo.releng.targetplatform.TargetContent;
import fr.obeo.releng.targetplatform.TargetPlatform;
import fr.obeo.releng.targetplatform.TargetPlatformFactory;
import fr.obeo.releng.targetplatform.VarDefinition;
import fr.obeo.releng.targetplatform.util.ImportVariableManager;
import fr.obeo.releng.targetplatform.util.LocationIndexBuilder;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.emf.common.util.EList;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class CompositeElementResolver {
  @Inject
  private LocationIndexBuilder locationIndexBuilder;
  
  @Inject
  private ImportVariableManager importVariableManager;
  
  /**
   * Composite elements are string defined by a concatenation of static string and variable call:
   * "string1" + ${var1} + "aaa" + ${var2} +...
   */
  public void resolveCompositeElements(final TargetPlatform targetPlatform) {
    boolean _isCompositeElementsResolved = targetPlatform.isCompositeElementsResolved();
    boolean _equals = (_isCompositeElementsResolved == true);
    if (_equals) {
      return;
    }
    this.overrideVariableDefinition(targetPlatform);
    this.searchAndAppendDefineFromIncludedTpd(targetPlatform);
    this.resolveLocations(targetPlatform);
    final LinkedList<TargetPlatform> importedTargetPlatforms = this.locationIndexBuilder.getImportedTargetPlatforms(targetPlatform);
    final Consumer<TargetPlatform> _function = new Consumer<TargetPlatform>() {
      @Override
      public void accept(final TargetPlatform it) {
        CompositeElementResolver.this.resolveLocations(it);
      }
    };
    importedTargetPlatforms.forEach(_function);
  }
  
  private void overrideVariableDefinition(final TargetPlatform targetPlatform) {
    final HashSet<TargetPlatform> alreadyVisitedTarget = CollectionLiterals.<TargetPlatform>newHashSet();
    this.overrideVariableDefinition(targetPlatform, alreadyVisitedTarget);
  }
  
  /**
   * Override value of variable definition with command line or environment variable
   */
  private void overrideVariableDefinition(final TargetPlatform targetPlatform, final Set<TargetPlatform> alreadyVisitedTarget) {
    alreadyVisitedTarget.add(targetPlatform);
    final Function1<TargetContent, Boolean> _function = new Function1<TargetContent, Boolean>() {
      @Override
      public Boolean apply(final TargetContent it) {
        return Boolean.valueOf((it instanceof VarDefinition));
      }
    };
    final Consumer<TargetContent> _function_1 = new Consumer<TargetContent>() {
      @Override
      public void accept(final TargetContent it) {
        final VarDefinition varDef = ((VarDefinition) it);
        final String varDefName = varDef.getName();
        final String variableValue = CompositeElementResolver.this.importVariableManager.getVariableValue(varDefName);
        boolean _tripleNotEquals = (variableValue != null);
        if (_tripleNotEquals) {
          varDef.setOverrideValue(variableValue);
        }
      }
    };
    IterableExtensions.<TargetContent>filter(targetPlatform.getContents(), _function).forEach(_function_1);
    final List<TargetPlatform> directlyImportedTargetPlatforms = this.searchDirectlyImportedTpd(targetPlatform);
    final Function1<TargetPlatform, Boolean> _function_2 = new Function1<TargetPlatform, Boolean>() {
      @Override
      public Boolean apply(final TargetPlatform it) {
        boolean _contains = alreadyVisitedTarget.contains(it);
        return Boolean.valueOf((!_contains));
      }
    };
    final Consumer<TargetPlatform> _function_3 = new Consumer<TargetPlatform>() {
      @Override
      public void accept(final TargetPlatform it) {
        CompositeElementResolver.this.overrideVariableDefinition(it, alreadyVisitedTarget);
      }
    };
    IterableExtensions.<TargetPlatform>filter(directlyImportedTargetPlatforms, _function_2).forEach(_function_3);
  }
  
  /**
   * Resolve location ("location" directive) means resolve variable call used in location declaration
   */
  private void resolveLocations(final TargetPlatform targetPlatform) {
    final Consumer<Location> _function = new Consumer<Location>() {
      @Override
      public void accept(final Location it) {
        it.resolveUri();
        it.resolveIUsVersion();
      }
    };
    targetPlatform.getLocations().forEach(_function);
    targetPlatform.setCompositeElementsResolved(true);
  }
  
  void searchAndAppendDefineFromIncludedTpd(final TargetPlatform targetPlatform) {
    final HashSet<TargetPlatform> alreadyVisitedTarget = CollectionLiterals.<TargetPlatform>newHashSet();
    this.searchAndAppendDefineFromIncludedTpd(targetPlatform, alreadyVisitedTarget);
  }
  
  /**
   * Search and append to the list of "define": variable definition of the current tpd file (targetPlatform)
   * the list of "define" found in sub tpd: imported with "include" directive
   */
  private void searchAndAppendDefineFromIncludedTpd(final TargetPlatform targetPlatform, final Set<TargetPlatform> alreadyVisitedTarget) {
    final HashSet<VarDefinition> ImportedDefineFromSubTpd = CollectionLiterals.<VarDefinition>newHashSet();
    final LinkedList<TargetPlatform> processedTargetPlatform = CollectionLiterals.<TargetPlatform>newLinkedList();
    alreadyVisitedTarget.add(targetPlatform);
    List<TargetPlatform> directlyImportedTargetPlatforms = this.searchDirectlyImportedTpd(targetPlatform);
    while ((directlyImportedTargetPlatforms.size() > processedTargetPlatform.size())) {
      {
        final Function1<TargetPlatform, Boolean> _function = new Function1<TargetPlatform, Boolean>() {
          @Override
          public Boolean apply(final TargetPlatform it) {
            boolean _contains = alreadyVisitedTarget.contains(it);
            return Boolean.valueOf((!_contains));
          }
        };
        final Function1<TargetPlatform, Boolean> _function_1 = new Function1<TargetPlatform, Boolean>() {
          @Override
          public Boolean apply(final TargetPlatform it) {
            boolean _contains = processedTargetPlatform.contains(it);
            return Boolean.valueOf((!_contains));
          }
        };
        final Consumer<TargetPlatform> _function_2 = new Consumer<TargetPlatform>() {
          @Override
          public void accept(final TargetPlatform it) {
            TargetPlatform notProcessedTargetPlatform = it;
            CompositeElementResolver.this.overrideVariableDefinition(notProcessedTargetPlatform);
            CompositeElementResolver.this.searchAndAppendDefineFromIncludedTpd(notProcessedTargetPlatform, CollectionLiterals.<TargetPlatform>newHashSet(((TargetPlatform[])Conversions.unwrapArray(alreadyVisitedTarget, TargetPlatform.class))));
            final Consumer<TargetContent> _function = new Consumer<TargetContent>() {
              @Override
              public void accept(final TargetContent it) {
                if ((it instanceof VarDefinition)) {
                  ImportedDefineFromSubTpd.add(((VarDefinition)it));
                }
              }
            };
            notProcessedTargetPlatform.getContents().forEach(_function);
          }
        };
        IterableExtensions.<TargetPlatform>filter(IterableExtensions.<TargetPlatform>filter(directlyImportedTargetPlatforms, _function), _function_1).forEach(_function_2);
        final Function1<TargetPlatform, Boolean> _function_3 = new Function1<TargetPlatform, Boolean>() {
          @Override
          public Boolean apply(final TargetPlatform it) {
            boolean _contains = processedTargetPlatform.contains(it);
            return Boolean.valueOf((!_contains));
          }
        };
        final Set<TargetPlatform> newlyProcessedTarget = IterableExtensions.<TargetPlatform>toSet(IterableExtensions.<TargetPlatform>filter(directlyImportedTargetPlatforms, _function_3));
        processedTargetPlatform.addAll(newlyProcessedTarget);
        this.mergeImportedDefine(targetPlatform, ImportedDefineFromSubTpd);
        directlyImportedTargetPlatforms = this.searchDirectlyImportedTpd(targetPlatform);
      }
    }
  }
  
  /**
   * Targets that are directly imported, with an "include" directive present in the current
   * target: "targetPlatform". Do not look for target imported through an imported target
   */
  private List<TargetPlatform> searchDirectlyImportedTpd(final TargetPlatform targetPlatform) {
    final Function1<IncludeDeclaration, TargetPlatform> _function = new Function1<IncludeDeclaration, TargetPlatform>() {
      @Override
      public TargetPlatform apply(final IncludeDeclaration it) {
        return CompositeElementResolver.this.locationIndexBuilder.getImportedTargetPlatform(targetPlatform.eResource(), it);
      }
    };
    final Function1<TargetPlatform, Boolean> _function_1 = new Function1<TargetPlatform, Boolean>() {
      @Override
      public Boolean apply(final TargetPlatform it) {
        return Boolean.valueOf((it != null));
      }
    };
    return IterableExtensions.<TargetPlatform>toList(IterableExtensions.<TargetPlatform>filter(ListExtensions.<IncludeDeclaration, TargetPlatform>map(targetPlatform.getIncludes(), _function), _function_1));
  }
  
  /**
   * "variable define" of deepest include are override by "define" of lowest level
   */
  private void mergeImportedDefine(final TargetPlatform targetPlatform, final Set<VarDefinition> ImportedDefineFromSubTpd) {
    final HashSet<VarDefinition> toBeAddedDefine = CollectionLiterals.<VarDefinition>newHashSet();
    final EList<TargetContent> targetContent = targetPlatform.getContents();
    final Consumer<VarDefinition> _function = new Consumer<VarDefinition>() {
      @Override
      public void accept(final VarDefinition it) {
        final VarDefinition currentImportedDefine = it;
        final Function1<TargetContent, Boolean> _function = new Function1<TargetContent, Boolean>() {
          @Override
          public Boolean apply(final TargetContent it) {
            return Boolean.valueOf((it instanceof VarDefinition));
          }
        };
        final Function1<TargetContent, Boolean> _function_1 = new Function1<TargetContent, Boolean>() {
          @Override
          public Boolean apply(final TargetContent it) {
            boolean _xblockexpression = false;
            {
              final VarDefinition alreadyExistingDefine = ((VarDefinition) it);
              final String varName = alreadyExistingDefine.getName();
              boolean _equals = currentImportedDefine.getName().equals(varName);
              _xblockexpression = (!_equals);
            }
            return Boolean.valueOf(_xblockexpression);
          }
        };
        boolean toBeAdded = IterableExtensions.<TargetContent>forall(IterableExtensions.<TargetContent>filter(targetContent, _function), _function_1);
        if (toBeAdded) {
          final VarDefinition currentImportedDefineCopy = TargetPlatformFactory.eINSTANCE.createVarDefinition();
          currentImportedDefineCopy.setName(currentImportedDefine.getName());
          currentImportedDefineCopy.setValue(currentImportedDefine.getValue());
          currentImportedDefineCopy.setOverrideValue(currentImportedDefine.getOverrideValue());
          toBeAddedDefine.add(currentImportedDefineCopy);
        }
      }
    };
    ImportedDefineFromSubTpd.forEach(_function);
    targetContent.addAll(toBeAddedDefine);
  }
}
