import rdmdt.ReferralRecord
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_referralRecordlist_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/referralRecord/list.gsp" }
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
invokeTag('message','g',9,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(2)
invokeTag('require','r',10,['module':("filterpane")],-1)
printHtmlPart(0)
})
invokeTag('captureHead','sitemesh',11,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('filterButton','filterpane',22,['text':("Filter This List")],-1)
printHtmlPart(5)
invokeTag('filterPane','filterpane',31,['domain':("rdmdt.ReferralRecord"),'excludeProperties':("assignedOn, meetingDate"),'associatedProperties':("""clinician.name, clinician.telephone, clinician.departmentName, clinician.speciality,
								   						 patients.nhsNumber, patients.gender.genderName, patients.ethnicity.ethnicityName,
								   						 patients.ege, patients.egeUnit.egeUnitName, clinicalDetails.clinicalDetailsName,
								   						 unrelatedClinicalFeatures.unrelatedClinicalFeatures, paternal.breastAndOrOvarianCancer,
								   						 paternal.colorectalCancer, paternal.ischaemicHeartDiseaseOrStroke, paternal.endocrineTumours,
								   						 maternal.breastAndOrOvarianCancer, maternal.colorectalCancer, maternal.ischaemicHeartDiseaseOrStroke,
								   						 maternal.endocrineTumours, extraTests.testName""")],-1)
printHtmlPart(6)
invokeTag('message','g',44,['code':("referralRecord.disorderName.label"),'default':("Disorder Name")],-1)
printHtmlPart(7)
invokeTag('sortableColumn','g',46,['property':("referralDate"),'title':(message(code: 'referralRecord.referralDate.label', default: 'Referral Status'))],-1)
printHtmlPart(8)
invokeTag('sortableColumn','g',48,['property':("yourRef"),'title':(message(code: 'referralRecord.yourRef.label', default: 'Unique Ref'))],-1)
printHtmlPart(9)
loop:{
int i = 0
for( referralRecordInstance in (referralRecordInstanceList) ) {
printHtmlPart(10)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(11)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "disorderName"))
})
invokeTag('link','g',56,['action':("show"),'id':(referralRecordInstance.id)],3)
printHtmlPart(12)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "referralStatus"))
printHtmlPart(12)
expressionOut.print(fieldValue(bean: referralRecordInstance, field: "uniqueRef"))
printHtmlPart(13)
i++
}
}
printHtmlPart(14)
invokeTag('paginate','g',67,['total':(referralRecordInstanceTotal == null ? ReferralRecord.count(): referralRecordInstanceTotal),'params':(filterParams)],-1)
printHtmlPart(15)
expressionOut.print(referralRecordInstanceTotal == null ? ReferralRecord.count(): referralRecordInstanceTotal)
printHtmlPart(16)
})
invokeTag('captureBody','sitemesh',72,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464860779951L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
