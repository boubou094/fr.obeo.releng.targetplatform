/*
* generated by Xtext
*/
grammar InternalTargetPlatform;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package fr.obeo.releng.targetplatform.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package fr.obeo.releng.targetplatform.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.common.util.Enumerator;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import fr.obeo.releng.targetplatform.services.TargetPlatformGrammarAccess;

}

@parser::members {

 	private TargetPlatformGrammarAccess grammarAccess;
 	
    public InternalTargetPlatformParser(TokenStream input, TargetPlatformGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "TargetPlatform";	
   	}
   	
   	@Override
   	protected TargetPlatformGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleTargetPlatform
entryRuleTargetPlatform returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getTargetPlatformRule()); }
	 iv_ruleTargetPlatform=ruleTargetPlatform 
	 { $current=$iv_ruleTargetPlatform.current; } 
	 EOF 
;

// Rule TargetPlatform
ruleTargetPlatform returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='target' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getTargetPlatformAccess().getTargetKeyword_0());
    }
(
(
		lv_name_1_0=RULE_STRING
		{
			newLeafNode(lv_name_1_0, grammarAccess.getTargetPlatformAccess().getNameSTRINGTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getTargetPlatformRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_1_0, 
        		"STRING");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getTargetPlatformAccess().getContentsTargetContentParserRuleCall_2_0()); 
	    }
		lv_contents_2_0=ruleTargetContent		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTargetPlatformRule());
	        }
       		add(
       			$current, 
       			"contents",
        		lv_contents_2_0, 
        		"TargetContent");
	        afterParserOrEnumRuleCall();
	    }

)
)*)?
;





// Entry rule entryRuleTargetContent
entryRuleTargetContent returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getTargetContentRule()); }
	 iv_ruleTargetContent=ruleTargetContent 
	 { $current=$iv_ruleTargetContent.current; } 
	 EOF 
;

// Rule TargetContent
ruleTargetContent returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
    { 
        newCompositeNode(grammarAccess.getTargetContentAccess().getOptionsParserRuleCall_0()); 
    }
    this_Options_0=ruleOptions
    { 
        $current = $this_Options_0.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getTargetContentAccess().getEnvironmentParserRuleCall_1()); 
    }
    this_Environment_1=ruleEnvironment
    { 
        $current = $this_Environment_1.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getTargetContentAccess().getIncludeDeclarationParserRuleCall_2()); 
    }
    this_IncludeDeclaration_2=ruleIncludeDeclaration
    { 
        $current = $this_IncludeDeclaration_2.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getTargetContentAccess().getLocationParserRuleCall_3()); 
    }
    this_Location_3=ruleLocation
    { 
        $current = $this_Location_3.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getTargetContentAccess().getVarDefinitionParserRuleCall_4()); 
    }
    this_VarDefinition_4=ruleVarDefinition
    { 
        $current = $this_VarDefinition_4.current; 
        afterParserOrEnumRuleCall();
    }
)
;





// Entry rule entryRuleOptions
entryRuleOptions returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getOptionsRule()); }
	 iv_ruleOptions=ruleOptions 
	 { $current=$iv_ruleOptions.current; } 
	 EOF 
;

// Rule Options
ruleOptions returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='with' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getOptionsAccess().getWithKeyword_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getOptionsAccess().getOptionsOptionEnumRuleCall_1_0()); 
	    }
		lv_options_1_0=ruleOption		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getOptionsRule());
	        }
       		add(
       			$current, 
       			"options",
        		lv_options_1_0, 
        		"Option");
	        afterParserOrEnumRuleCall();
	    }

)
)((	otherlv_2=',' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getOptionsAccess().getCommaKeyword_2_0());
    }
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getOptionsAccess().getOptionsOptionEnumRuleCall_2_1_0()); 
	    }
		lv_options_3_0=ruleOption		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getOptionsRule());
	        }
       		add(
       			$current, 
       			"options",
        		lv_options_3_0, 
        		"Option");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleEnvironment
entryRuleEnvironment returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEnvironmentRule()); }
	 iv_ruleEnvironment=ruleEnvironment 
	 { $current=$iv_ruleEnvironment.current; } 
	 EOF 
;

// Rule Environment
ruleEnvironment returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
    {
        $current = forceCreateModelElement(
            grammarAccess.getEnvironmentAccess().getEnvironmentAction_0(),
            $current);
    }
)	otherlv_1='environment' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getEnvironmentAccess().getEnvironmentKeyword_1());
    }
(
(
		lv_env_2_0=RULE_ID
		{
			newLeafNode(lv_env_2_0, grammarAccess.getEnvironmentAccess().getEnvIDTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEnvironmentRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"env",
        		lv_env_2_0, 
        		"ID");
	    }

)
)((	otherlv_3=',' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getEnvironmentAccess().getCommaKeyword_3_0());
    }
)?(
(
		lv_env_4_0=RULE_ID
		{
			newLeafNode(lv_env_4_0, grammarAccess.getEnvironmentAccess().getEnvIDTerminalRuleCall_3_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEnvironmentRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"env",
        		lv_env_4_0, 
        		"ID");
	    }

)
))*)
;





// Entry rule entryRuleVarDefinition
entryRuleVarDefinition returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getVarDefinitionRule()); }
	 iv_ruleVarDefinition=ruleVarDefinition 
	 { $current=$iv_ruleVarDefinition.current; } 
	 EOF 
;

// Rule VarDefinition
ruleVarDefinition returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='define' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getVarDefinitionAccess().getDefineKeyword_0());
    }
(
(
		lv_name_1_0=RULE_ID
		{
			newLeafNode(lv_name_1_0, grammarAccess.getVarDefinitionAccess().getNameIDTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getVarDefinitionRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_1_0, 
        		"ID");
	    }

)
)	otherlv_2='=' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getVarDefinitionAccess().getEqualsSignKeyword_2());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getVarDefinitionAccess().getValueCompositeStringParserRuleCall_3_0()); 
	    }
		lv_value_3_0=ruleCompositeString		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getVarDefinitionRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_3_0, 
        		"CompositeString");
	        afterParserOrEnumRuleCall();
	    }

)
))
;





// Entry rule entryRuleCompositeString
entryRuleCompositeString returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getCompositeStringRule()); }
	 iv_ruleCompositeString=ruleCompositeString 
	 { $current=$iv_ruleCompositeString.current; } 
	 EOF 
;

// Rule CompositeString
ruleCompositeString returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
    {
        $current = forceCreateModelElement(
            grammarAccess.getCompositeStringAccess().getCompositeStringAction_0(),
            $current);
    }
)(
(
		{ 
	        newCompositeNode(grammarAccess.getCompositeStringAccess().getStringPartsCompositeStringPartParserRuleCall_1_0()); 
	    }
		lv_stringParts_1_0=ruleCompositeStringPart		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getCompositeStringRule());
	        }
       		add(
       			$current, 
       			"stringParts",
        		lv_stringParts_1_0, 
        		"CompositeStringPart");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_2='+' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getCompositeStringAccess().getPlusSignKeyword_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getCompositeStringAccess().getStringPartsCompositeStringPartParserRuleCall_2_1_0()); 
	    }
		lv_stringParts_3_0=ruleCompositeStringPart		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getCompositeStringRule());
	        }
       		add(
       			$current, 
       			"stringParts",
        		lv_stringParts_3_0, 
        		"CompositeStringPart");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleCompositeStringPart
entryRuleCompositeStringPart returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getCompositeStringPartRule()); }
	 iv_ruleCompositeStringPart=ruleCompositeStringPart 
	 { $current=$iv_ruleCompositeStringPart.current; } 
	 EOF 
;

// Rule CompositeStringPart
ruleCompositeStringPart returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
    { 
        newCompositeNode(grammarAccess.getCompositeStringPartAccess().getVarCallParserRuleCall_0()); 
    }
    this_VarCall_0=ruleVarCall
    { 
        $current = $this_VarCall_0.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getCompositeStringPartAccess().getStaticStringParserRuleCall_1()); 
    }
    this_StaticString_1=ruleStaticString
    { 
        $current = $this_StaticString_1.current; 
        afterParserOrEnumRuleCall();
    }
)
;





// Entry rule entryRuleVarCall
entryRuleVarCall returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getVarCallRule()); }
	 iv_ruleVarCall=ruleVarCall 
	 { $current=$iv_ruleVarCall.current; } 
	 EOF 
;

// Rule VarCall
ruleVarCall returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='${' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getVarCallAccess().getDollarSignLeftCurlyBracketKeyword_0());
    }
(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getVarCallRule());
	        }
        }
	otherlv_1=RULE_ID
	{
		newLeafNode(otherlv_1, grammarAccess.getVarCallAccess().getVarNameVarDefinitionCrossReference_1_0()); 
	}

)
)	otherlv_2='}' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getVarCallAccess().getRightCurlyBracketKeyword_2());
    }
)
;





// Entry rule entryRuleStaticString
entryRuleStaticString returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getStaticStringRule()); }
	 iv_ruleStaticString=ruleStaticString 
	 { $current=$iv_ruleStaticString.current; } 
	 EOF 
;

// Rule StaticString
ruleStaticString returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
(
		lv_value_0_0=RULE_STRING
		{
			newLeafNode(lv_value_0_0, grammarAccess.getStaticStringAccess().getValueSTRINGTerminalRuleCall_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getStaticStringRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"value",
        		lv_value_0_0, 
        		"STRING");
	    }

)
)
;





// Entry rule entryRuleIncludeDeclaration
entryRuleIncludeDeclaration returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getIncludeDeclarationRule()); }
	 iv_ruleIncludeDeclaration=ruleIncludeDeclaration 
	 { $current=$iv_ruleIncludeDeclaration.current; } 
	 EOF 
;

// Rule IncludeDeclaration
ruleIncludeDeclaration returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='include' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getIncludeDeclarationAccess().getIncludeKeyword_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getIncludeDeclarationAccess().getCompositeImportURICompositeStringParserRuleCall_1_0()); 
	    }
		lv_compositeImportURI_1_0=ruleCompositeString		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getIncludeDeclarationRule());
	        }
       		set(
       			$current, 
       			"compositeImportURI",
        		lv_compositeImportURI_1_0, 
        		"CompositeString");
	        afterParserOrEnumRuleCall();
	    }

)
))
;





// Entry rule entryRuleLocation
entryRuleLocation returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getLocationRule()); }
	 iv_ruleLocation=ruleLocation 
	 { $current=$iv_ruleLocation.current; } 
	 EOF 
;

// Rule Location
ruleLocation returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='location' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getLocationAccess().getLocationKeyword_0());
    }
(

(
	{ 
	  getUnorderedGroupHelper().enter(grammarAccess.getLocationAccess().getUnorderedGroup_1());
	}
	(
		(

			( 
				{getUnorderedGroupHelper().canSelect(grammarAccess.getLocationAccess().getUnorderedGroup_1(), 0)}?=>(
					{ 
	 				  getUnorderedGroupHelper().select(grammarAccess.getLocationAccess().getUnorderedGroup_1(), 0);
	 				}
					({true}?=>(
(
		lv_ID_2_0=RULE_ID
		{
			newLeafNode(lv_ID_2_0, grammarAccess.getLocationAccess().getIDIDTerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getLocationRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"ID",
        		lv_ID_2_0, 
        		"ID");
	    }

)
))
					{ 
	 				  getUnorderedGroupHelper().returnFromSelection(grammarAccess.getLocationAccess().getUnorderedGroup_1());
	 				}
 				)
			)  |

			( 
				{getUnorderedGroupHelper().canSelect(grammarAccess.getLocationAccess().getUnorderedGroup_1(), 1)}?=>(
					{ 
	 				  getUnorderedGroupHelper().select(grammarAccess.getLocationAccess().getUnorderedGroup_1(), 1);
	 				}
					({true}?=>(
(
		{ 
	        newCompositeNode(grammarAccess.getLocationAccess().getCompositeUriCompositeStringParserRuleCall_1_1_0()); 
	    }
		lv_compositeUri_3_0=ruleCompositeString		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getLocationRule());
	        }
       		set(
       			$current, 
       			"compositeUri",
        		lv_compositeUri_3_0, 
        		"CompositeString");
	        afterParserOrEnumRuleCall();
	    }

)
))
					{ 
	 				  getUnorderedGroupHelper().returnFromSelection(grammarAccess.getLocationAccess().getUnorderedGroup_1());
	 				}
 				)
			)  

		)+
	  	{getUnorderedGroupHelper().canLeave(grammarAccess.getLocationAccess().getUnorderedGroup_1())}?	
	)
)
	{ 
	  getUnorderedGroupHelper().leave(grammarAccess.getLocationAccess().getUnorderedGroup_1());
	}

)(	otherlv_4='{' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getLocationAccess().getLeftCurlyBracketKeyword_2_0());
    }
(	otherlv_5='with' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getLocationAccess().getWithKeyword_2_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getLocationAccess().getOptionsOptionEnumRuleCall_2_1_1_0()); 
	    }
		lv_options_6_0=ruleOption		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getLocationRule());
	        }
       		add(
       			$current, 
       			"options",
        		lv_options_6_0, 
        		"Option");
	        afterParserOrEnumRuleCall();
	    }

)
)((	otherlv_7=',' 
    {
    	newLeafNode(otherlv_7, grammarAccess.getLocationAccess().getCommaKeyword_2_1_2_0());
    }
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getLocationAccess().getOptionsOptionEnumRuleCall_2_1_2_1_0()); 
	    }
		lv_options_8_0=ruleOption		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getLocationRule());
	        }
       		add(
       			$current, 
       			"options",
        		lv_options_8_0, 
        		"Option");
	        afterParserOrEnumRuleCall();
	    }

)
))*)?(
(
		{ 
	        newCompositeNode(grammarAccess.getLocationAccess().getIusIUParserRuleCall_2_2_0()); 
	    }
		lv_ius_9_0=ruleIU		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getLocationRule());
	        }
       		add(
       			$current, 
       			"ius",
        		lv_ius_9_0, 
        		"IU");
	        afterParserOrEnumRuleCall();
	    }

)
)*	otherlv_10='}' 
    {
    	newLeafNode(otherlv_10, grammarAccess.getLocationAccess().getRightCurlyBracketKeyword_2_3());
    }
)?)
;





// Entry rule entryRuleIU
entryRuleIU returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getIURule()); }
	 iv_ruleIU=ruleIU 
	 { $current=$iv_ruleIU.current; } 
	 EOF 
;

// Rule IU
ruleIU returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_ID_0_0=RULE_ID
		{
			newLeafNode(lv_ID_0_0, grammarAccess.getIUAccess().getIDIDTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getIURule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"ID",
        		lv_ID_0_0, 
        		"ID");
	    }

)
)((	otherlv_1=';' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getIUAccess().getSemicolonKeyword_1_0_0());
    }
	otherlv_2='version' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getIUAccess().getVersionKeyword_1_0_1());
    }
	otherlv_3='=' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getIUAccess().getEqualsSignKeyword_1_0_2());
    }
)?(((
(
		{ 
	        newCompositeNode(grammarAccess.getIUAccess().getVersionVersionRangeParserRuleCall_1_1_0_0_0()); 
	    }
		lv_version_4_0=ruleVersionRange		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getIURule());
	        }
       		set(
       			$current, 
       			"version",
        		lv_version_4_0, 
        		"VersionRange");
	        afterParserOrEnumRuleCall();
	    }

)
)
    |(
(
		lv_version_5_0=RULE_STRING
		{
			newLeafNode(lv_version_5_0, grammarAccess.getIUAccess().getVersionSTRINGTerminalRuleCall_1_1_0_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getIURule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"version",
        		lv_version_5_0, 
        		"STRING");
	    }

)
))
    |(
(
		{ 
	        newCompositeNode(grammarAccess.getIUAccess().getVarVersionVarCallParserRuleCall_1_1_1_0()); 
	    }
		lv_varVersion_6_0=ruleVarCall		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getIURule());
	        }
       		set(
       			$current, 
       			"varVersion",
        		lv_varVersion_6_0, 
        		"VarCall");
	        afterParserOrEnumRuleCall();
	    }

)
)))?)
;





// Entry rule entryRuleVersion
entryRuleVersion returns [String current=null] 
	@init { 
		HiddenTokens myHiddenTokenState = ((XtextTokenStream)input).setHiddenTokens();
	}
	:
	{ newCompositeNode(grammarAccess.getVersionRule()); } 
	 iv_ruleVersion=ruleVersion 
	 { $current=$iv_ruleVersion.current.getText(); }  
	 EOF 
;
finally {
	myHiddenTokenState.restore();
}

// Rule Version
ruleVersion returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
		HiddenTokens myHiddenTokenState = ((XtextTokenStream)input).setHiddenTokens();
    }
    @after { leaveRule(); }:
(    this_INT_0=RULE_INT    {
		$current.merge(this_INT_0);
    }

    { 
    newLeafNode(this_INT_0, grammarAccess.getVersionAccess().getINTTerminalRuleCall_0()); 
    }
(
	kw='.' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionAccess().getFullStopKeyword_1_0()); 
    }
    this_INT_2=RULE_INT    {
		$current.merge(this_INT_2);
    }

    { 
    newLeafNode(this_INT_2, grammarAccess.getVersionAccess().getINTTerminalRuleCall_1_1()); 
    }
(
	kw='.' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionAccess().getFullStopKeyword_1_2_0()); 
    }
    this_INT_4=RULE_INT    {
		$current.merge(this_INT_4);
    }

    { 
    newLeafNode(this_INT_4, grammarAccess.getVersionAccess().getINTTerminalRuleCall_1_2_1()); 
    }
(
	kw='.' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionAccess().getFullStopKeyword_1_2_2_0()); 
    }
(    this_ID_6=RULE_ID    {
		$current.merge(this_ID_6);
    }

    { 
    newLeafNode(this_ID_6, grammarAccess.getVersionAccess().getIDTerminalRuleCall_1_2_2_1_0()); 
    }

    |    this_INT_7=RULE_INT    {
		$current.merge(this_INT_7);
    }

    { 
    newLeafNode(this_INT_7, grammarAccess.getVersionAccess().getINTTerminalRuleCall_1_2_2_1_1()); 
    }

    |    this_QUALIFIER_8=RULE_QUALIFIER    {
		$current.merge(this_QUALIFIER_8);
    }

    { 
    newLeafNode(this_QUALIFIER_8, grammarAccess.getVersionAccess().getQUALIFIERTerminalRuleCall_1_2_2_1_2()); 
    }
))?)?)?)
    ;
finally {
	myHiddenTokenState.restore();
}





// Entry rule entryRuleVersionRange
entryRuleVersionRange returns [String current=null] 
	@init { 
		HiddenTokens myHiddenTokenState = ((XtextTokenStream)input).setHiddenTokens("RULE_WS");
	}
	:
	{ newCompositeNode(grammarAccess.getVersionRangeRule()); } 
	 iv_ruleVersionRange=ruleVersionRange 
	 { $current=$iv_ruleVersionRange.current.getText(); }  
	 EOF 
;
finally {
	myHiddenTokenState.restore();
}

// Rule VersionRange
ruleVersionRange returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
		HiddenTokens myHiddenTokenState = ((XtextTokenStream)input).setHiddenTokens("RULE_WS");
    }
    @after { leaveRule(); }:
(((
	kw='(' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionRangeAccess().getLeftParenthesisKeyword_0_0_0()); 
    }

    |
	kw='[' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionRangeAccess().getLeftSquareBracketKeyword_0_0_1()); 
    }
)
    { 
        newCompositeNode(grammarAccess.getVersionRangeAccess().getVersionParserRuleCall_0_1()); 
    }
    this_Version_2=ruleVersion    {
		$current.merge(this_Version_2);
    }

    { 
        afterParserOrEnumRuleCall();
    }

	kw=',' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionRangeAccess().getCommaKeyword_0_2()); 
    }

    { 
        newCompositeNode(grammarAccess.getVersionRangeAccess().getVersionParserRuleCall_0_3()); 
    }
    this_Version_4=ruleVersion    {
		$current.merge(this_Version_4);
    }

    { 
        afterParserOrEnumRuleCall();
    }
(
	kw=')' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionRangeAccess().getRightParenthesisKeyword_0_4_0()); 
    }

    |
	kw=']' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionRangeAccess().getRightSquareBracketKeyword_0_4_1()); 
    }
))
    |
    { 
        newCompositeNode(grammarAccess.getVersionRangeAccess().getVersionParserRuleCall_1()); 
    }
    this_Version_7=ruleVersion    {
		$current.merge(this_Version_7);
    }

    { 
        afterParserOrEnumRuleCall();
    }

    |
	kw='lazy' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getVersionRangeAccess().getLazyKeyword_2()); 
    }
)
    ;
finally {
	myHiddenTokenState.restore();
}





// Rule Option
ruleOption returns [Enumerator current=null] 
    @init { enterRule(); }
    @after { leaveRule(); }:
((	enumLiteral_0='requirements' 
	{
        $current = grammarAccess.getOptionAccess().getINCLUDE_REQUIREDEnumLiteralDeclaration_0().getEnumLiteral().getInstance();
        newLeafNode(enumLiteral_0, grammarAccess.getOptionAccess().getINCLUDE_REQUIREDEnumLiteralDeclaration_0()); 
    }
)
    |(	enumLiteral_1='allEnvironments' 
	{
        $current = grammarAccess.getOptionAccess().getINCLUDE_ALL_ENVIRONMENTSEnumLiteralDeclaration_1().getEnumLiteral().getInstance();
        newLeafNode(enumLiteral_1, grammarAccess.getOptionAccess().getINCLUDE_ALL_ENVIRONMENTSEnumLiteralDeclaration_1()); 
    }
)
    |(	enumLiteral_2='source' 
	{
        $current = grammarAccess.getOptionAccess().getINCLUDE_SOURCEEnumLiteralDeclaration_2().getEnumLiteral().getInstance();
        newLeafNode(enumLiteral_2, grammarAccess.getOptionAccess().getINCLUDE_SOURCEEnumLiteralDeclaration_2()); 
    }
)
    |(	enumLiteral_3='configurePhase' 
	{
        $current = grammarAccess.getOptionAccess().getINCLUDE_CONFIGURE_PHASEEnumLiteralDeclaration_3().getEnumLiteral().getInstance();
        newLeafNode(enumLiteral_3, grammarAccess.getOptionAccess().getINCLUDE_CONFIGURE_PHASEEnumLiteralDeclaration_3()); 
    }
));



RULE_INT : ('0'..'9')+;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('.'? ('a'..'z'|'A'..'Z'|'^'|'_'|'-'|'0'..'9'))*;

RULE_QUALIFIER : ('a'..'z'|'A'..'Z'|'_'|'-'|'0'..'9')*;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


