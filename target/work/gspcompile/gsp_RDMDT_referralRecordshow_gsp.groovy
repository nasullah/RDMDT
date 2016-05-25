import rdmdt.Patient
import  rdmdt.ReferralRecord
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_referralRecordshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/referralRecord/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'referralRecord.label', default: 'Referral Record'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(0)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',20,['code':("referralRecord.clinician.label"),'default':("Clinician")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.clinician?.encodeAsHTML())
})
invokeTag('link','g',22,['controller':("clinician"),'action':("show"),'id':(referralRecordInstance?.clinician?.id)],2)
printHtmlPart(6)
invokeTag('message','g',27,['code':("referralRecord.yourRef.label"),'default':("Unique Ref")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "uniqueRef"))
printHtmlPart(7)
expressionOut.print(Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.nhsNumber)
printHtmlPart(8)
expressionOut.print(Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.gender)
printHtmlPart(9)
expressionOut.print(Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.ethnicity)
printHtmlPart(10)
expressionOut.print(Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.otherEthnicity)
printHtmlPart(11)
expressionOut.print(Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.ege)
printHtmlPart(12)
expressionOut.print(Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.egeUnit)
printHtmlPart(13)
invokeTag('message','g',76,['code':("referralRecord.disorderName.label"),'default':("Disorder name")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "disorderName"))
printHtmlPart(6)
invokeTag('message','g',83,['code':("referralRecord.causativeVariantAffect.label"),'default':("Causative variant affect")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "causativeVariantAffect"))
printHtmlPart(6)
invokeTag('message','g',90,['code':("referralRecord.knownGeneVariant.label"),'default':("Known gene variant")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "knownGeneVariant"))
printHtmlPart(6)
invokeTag('message','g',97,['code':("referralRecord.ageOfSymptoms.label"),'default':("Age of onset of symptoms in the proband")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "ageOfSymptoms"))
printHtmlPart(14)
invokeTag('message','g',104,['code':("referralRecord.symptomEgeUnit.label"),'default':("Unit")],-1)
printHtmlPart(15)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "symptomEgeUnit"))
printHtmlPart(13)
invokeTag('message','g',111,['code':("referralRecord.clinicalDetails.label"),'default':("Clinical Details")],-1)
printHtmlPart(16)
for( c in (referralRecordInstance.clinicalDetails) ) {
printHtmlPart(17)
expressionOut.print(c)
printHtmlPart(18)
}
printHtmlPart(19)
invokeTag('message','g',122,['code':("referralRecord.unrelatedClinicalFeatures.label"),'default':("Unrelated Clinical Features")],-1)
printHtmlPart(16)
for( u in (referralRecordInstance.unrelatedClinicalFeatures) ) {
printHtmlPart(17)
expressionOut.print(u)
printHtmlPart(18)
}
printHtmlPart(19)
invokeTag('message','g',133,['code':("referralRecord.geneticTestingOnProband.label"),'default':("Genetic Testing On Proband")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "geneticTestingOnProband"))
printHtmlPart(6)
invokeTag('message','g',140,['code':("referralRecord.otherTestingOnProband.label"),'default':("Other Testing On Proband")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "otherTestingOnProband"))
printHtmlPart(6)
invokeTag('message','g',147,['code':("referralRecord.pedigree.label"),'default':("Pedigree")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "pedigree"))
printHtmlPart(20)
invokeTag('formatBoolean','g',156,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer)],-1)
printHtmlPart(21)
invokeTag('formatBoolean','g',163,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.paternal?.first()?.colorectalCancer)],-1)
printHtmlPart(22)
invokeTag('formatBoolean','g',170,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke)],-1)
printHtmlPart(23)
invokeTag('formatBoolean','g',177,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.paternal?.first()?.endocrineTumours)],-1)
printHtmlPart(24)
invokeTag('formatBoolean','g',184,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer)],-1)
printHtmlPart(25)
invokeTag('formatBoolean','g',191,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.maternal?.first()?.colorectalCancer)],-1)
printHtmlPart(26)
invokeTag('formatBoolean','g',198,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke)],-1)
printHtmlPart(27)
invokeTag('formatBoolean','g',205,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.maternal?.first()?.endocrineTumours)],-1)
printHtmlPart(28)
invokeTag('message','g',210,['code':("referralRecord.furtherDetailsOfHistory.label"),'default':("Further Details Of History")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "furtherDetailsOfHistory"))
printHtmlPart(29)
for( p in (referralRecordInstance.patients) ) {
printHtmlPart(30)
if(true && (!p.isProband && p.availableForOAR)) {
printHtmlPart(31)
expressionOut.print(p.relatedFrom.relationshipType)
printHtmlPart(32)
}
printHtmlPart(33)
}
printHtmlPart(34)
invokeTag('formatBoolean','g',232,['false':("No"),'true':("Yes"),'boolean':(referralRecordInstance?.isAnySampleFromDeceasedIndividuals)],-1)
printHtmlPart(28)
invokeTag('message','g',237,['code':("referralRecord.numberOfSamplesForSeq.label"),'default':("Number Of Samples For Seq")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "numberOfSamplesForSeq"))
printHtmlPart(6)
invokeTag('message','g',244,['code':("referralRecord.consanguinityEvidence.label"),'default':("Consanguinity Evidence")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.consanguinityEvidence?.encodeAsHTML())
})
invokeTag('link','g',246,['controller':("consanguinity"),'action':("show"),'id':(referralRecordInstance?.consanguinityEvidence?.id)],2)
printHtmlPart(6)
invokeTag('message','g',251,['code':("referralRecord.penetrance.label"),'default':("Penetrance")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.penetrance?.encodeAsHTML())
})
invokeTag('link','g',253,['controller':("penetrance"),'action':("show"),'id':(referralRecordInstance?.penetrance?.id)],2)
printHtmlPart(6)
invokeTag('message','g',258,['code':("referralRecord.referralStatus.label"),'default':("Referral Status")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.referralStatus?.encodeAsHTML())
})
invokeTag('link','g',260,['controller':("referralStatus"),'action':("show"),'id':(referralRecordInstance?.referralStatus?.id)],2)
printHtmlPart(6)
invokeTag('message','g',265,['code':("referralRecord.note.label"),'default':("Note")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "note"))
printHtmlPart(6)
invokeTag('message','g',272,['code':("referralRecord.program.label"),'default':("Program")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.program?.encodeAsHTML())
})
invokeTag('link','g',274,['controller':("program"),'action':("show"),'id':(referralRecordInstance?.program?.id)],2)
printHtmlPart(6)
invokeTag('message','g',279,['code':("referralRecord.proposedDiagnosis.label"),'default':("Proposed Diagnosis")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.proposedDiagnosis?.encodeAsHTML())
})
invokeTag('link','g',281,['controller':("OMIM"),'action':("show"),'id':(referralRecordInstance?.proposedDiagnosis?.id)],2)
printHtmlPart(6)
invokeTag('message','g',286,['code':("referralRecord.assignedTo.label"),'default':("Assigned To")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(referralRecordInstance?.assignedTo?.encodeAsHTML())
})
invokeTag('link','g',288,['controller':("person"),'action':("show"),'id':(referralRecordInstance?.assignedTo?.id)],2)
printHtmlPart(6)
invokeTag('message','g',293,['code':("referralRecord.assignedOn.label"),'default':("Assigned On")],-1)
printHtmlPart(5)
invokeTag('formatDate','g',295,['format':("yyyy-MM-dd"),'date':(referralRecordInstance?.assignedOn)],-1)
printHtmlPart(6)
invokeTag('message','g',300,['code':("referralRecord.meetingDate.label"),'default':("Meeting Date")],-1)
printHtmlPart(5)
invokeTag('formatDate','g',302,['format':("yyyy-MM-dd"),'date':(referralRecordInstance?.meetingDate)],-1)
printHtmlPart(6)
invokeTag('message','g',307,['code':("referralRecord.numberOfSampleOtherRel.label"),'default':("Number Of Sample Other Rel")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "numberOfSampleOtherRel"))
printHtmlPart(6)
invokeTag('message','g',314,['code':("referralRecord.attachedEvidence.label"),'default':("Attached Evidence")],-1)
printHtmlPart(35)
for( a in (referralRecordInstance.attachedEvidence) ) {
printHtmlPart(36)
createTagBody(3, {->
expressionOut.print(a?.encodeAsHTML())
})
invokeTag('link','g',319,['controller':("attachedEvidence"),'action':("show"),'id':(a.id)],3)
printHtmlPart(37)
}
printHtmlPart(38)
invokeTag('message','g',327,['code':("referralRecord.extraTests.label"),'default':("Extra Tests")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: referralRecordInstance?.extraTests?.first(), field: "testName"))
printHtmlPart(39)
invokeTag('message','g',333,['code':("referralRecord.extraTests.label"),'default':("Extra Tests")],-1)
printHtmlPart(15)
expressionOut.print(fieldValue(bean: referralRecordInstance?.extraTests?.first(), field: "requestedDate"))
printHtmlPart(40)
})
invokeTag('captureBody','sitemesh',342,[:],1)
printHtmlPart(41)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464182355828L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
