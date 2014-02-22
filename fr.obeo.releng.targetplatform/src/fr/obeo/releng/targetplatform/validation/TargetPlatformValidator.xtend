/*
 * generated by Xtext
 */
package fr.obeo.releng.targetplatform.validation

import fr.obeo.releng.targetplatform.targetplatform.Location
import fr.obeo.releng.targetplatform.targetplatform.Option
import fr.obeo.releng.targetplatform.targetplatform.TargetPlatform
import fr.obeo.releng.targetplatform.targetplatform.TargetplatformPackage
import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.validation.Check
import org.eclipse.xtext.nodemodel.util.NodeModelUtils
import org.eclipse.xtext.nodemodel.impl.CompositeNode
import fr.obeo.releng.targetplatform.targetplatform.IU
import org.eclipse.xtext.RuleCall
import com.google.common.collect.Sets

//import org.eclipse.xtext.validation.Check

/**
 * Custom validation rules. 
 *
 * see http://www.eclipse.org/Xtext/documentation.html#validation
 */
class TargetPlatformValidator extends AbstractTargetPlatformValidator {

	public static final String CHECK__OPTIONS_SELF_EXCLUDING_ALL_ENV_REQUIRED = "CHECK__OPTIONS_SELF_EXCLUDING_ALL_ENV_REQUIRED";
	public static final String CHECK__OPTIONS_EQUALS_ALL_LOCATIONS = "CHECK__OPTIONS_EQUALS_ALL_LOCATIONS";
	public static final String DEPRECATE__OPTIONS_ON_LOCATIONS = "DEPRECATE__OPTIONS_ON_LOCATIONS";
	public static final String DEPRECATE__STRINGS_ON_IU_VERSION = "DEPRECATE__STRINGS_ON_IU_VERSION";
	
	@Check
	def checkAllEnvAndRequiredAreSelfExluding(Location location) {
		doCheckAllEnvAndRequiredAreSelfExluding(location, location.options)
	}
	
	@Check
	def checkAllEnvAndRequiredAreSelfExluding(TargetPlatform targetPlatform) {
		doCheckAllEnvAndRequiredAreSelfExluding(targetPlatform, targetPlatform.options);
	}
	
	def doCheckAllEnvAndRequiredAreSelfExluding(EObject optionOwner, List<Option> options) {
		if (options.contains(Option.INCLUDE_ALL_ENVIRONMENTS) && options.contains(Option.INCLUDE_REQUIRED)) {
			error("All environments can not be included along with required artifacts, you must choose one of the two options", 
					optionOwner, 
					TargetplatformPackage.Literals.LOCATION__OPTIONS, 
					options.indexOf(Option.INCLUDE_REQUIRED), CHECK__OPTIONS_SELF_EXCLUDING_ALL_ENV_REQUIRED)
			
			error("All environments can not be included along with required artifacts, you must choose one of the two options", 
					optionOwner, 
					TargetplatformPackage.Literals.LOCATION__OPTIONS, 
					options.indexOf(Option.INCLUDE_ALL_ENVIRONMENTS), CHECK__OPTIONS_SELF_EXCLUDING_ALL_ENV_REQUIRED)
		}
	}
	
	@Check
	def checkOptionsOnLocationAreIdentical(TargetPlatform targetPlatform) {
		val listOptions = targetPlatform.locations
		val first = listOptions.head
		val conflicts = listOptions.tail.filter[_| !Sets::symmetricDifference(_.options.toSet,first.options.toSet).empty]
		if (!conflicts.empty) {
			listOptions.forEach[_ |
				val nodes = NodeModelUtils::findNodesForFeature(_, TargetplatformPackage.Literals.LOCATION__OPTIONS)
				if (!nodes.empty) {
					val withKeyword = (nodes.head as CompositeNode).previousSibling
					val lastOption = (nodes.last as CompositeNode)
					acceptError("Options of every locations must be the same",
						_, withKeyword.offset, lastOption.endOffset - withKeyword.offset, CHECK__OPTIONS_EQUALS_ALL_LOCATIONS)
				} else {
					val node = NodeModelUtils::getNode(_)
					acceptError("Options of every locations must be the same",
						_, node.offset, node.length, CHECK__OPTIONS_EQUALS_ALL_LOCATIONS)
				}
			]
		}
	}
	
	@Check
	def deprecateOptionsOnLocation(Location location) {
		val listOptions = (location.eContainer as TargetPlatform).locations
		val first = listOptions.head
		val conflicts = listOptions.tail.filter[_| !Sets::symmetricDifference(_.options.toSet,first.options.toSet).empty]
		if (conflicts.empty && !location.options.empty) {
			val nodes = NodeModelUtils::findNodesForFeature(location, TargetplatformPackage.Literals.LOCATION__OPTIONS)
			val withKeyword = (nodes.head as CompositeNode).previousSibling
			val lastOption = (nodes.last as CompositeNode);
			acceptWarning("Option on location is deprecated. Define the option at the target level",
				location, withKeyword.offset, lastOption.endOffset - withKeyword.offset, DEPRECATE__OPTIONS_ON_LOCATIONS)
		}
	}
	
	@Check
	def deprecateIUVersionRangeWihString(IU iu) {
		if (iu.version != null) {
			val nodes = NodeModelUtils::findNodesForFeature(iu, TargetplatformPackage.Literals.IU__VERSION)
			if ("STRING".equals((nodes.head.grammarElement as RuleCall).rule.name)) {
				warning("Usage of Strings is deprecated for version range. You should remove the quotes.",
					iu, 
					TargetplatformPackage.Literals.IU__VERSION,
					DEPRECATE__STRINGS_ON_IU_VERSION)
			}
		}
	}
}
