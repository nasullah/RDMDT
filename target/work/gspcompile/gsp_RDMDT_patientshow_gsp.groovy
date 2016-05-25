import rdmdt.Patient
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_patientshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/patient/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'patient.label', default: 'Patient'))],-1)
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
invokeTag('message','g',20,['code':("patient.givenName.label"),'default':("Given Name")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: patientInstance, field: "givenName"))
printHtmlPart(6)
invokeTag('message','g',27,['code':("patient.familyName.label"),'default':("Family Name")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: patientInstance, field: "familyName"))
printHtmlPart(6)
invokeTag('message','g',34,['code':("patient.nhsNumber.label"),'default':("Nhs Number")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: patientInstance, field: "nhsNumber"))
printHtmlPart(6)
invokeTag('message','g',41,['code':("patient.mrn.label"),'default':("Mrn")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: patientInstance, field: "mrn"))
printHtmlPart(6)
invokeTag('message','g',48,['code':("patient.dateOfBirth.label"),'default':("Date Of Birth")],-1)
printHtmlPart(5)
invokeTag('formatDate','g',50,['date':(patientInstance?.dateOfBirth)],-1)
printHtmlPart(6)
invokeTag('message','g',55,['code':("patient.gender.label"),'default':("Gender")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(patientInstance?.gender?.encodeAsHTML())
})
invokeTag('link','g',57,['controller':("gender"),'action':("show"),'id':(patientInstance?.gender?.id)],2)
printHtmlPart(6)
invokeTag('message','g',62,['code':("patient.ethnicity.label"),'default':("Ethnicity")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(patientInstance?.ethnicity?.encodeAsHTML())
})
invokeTag('link','g',64,['controller':("ethnicity"),'action':("show"),'id':(patientInstance?.ethnicity?.id)],2)
printHtmlPart(6)
invokeTag('message','g',69,['code':("patient.otherEthnicity.label"),'default':("Other Ethnicity")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: patientInstance, field: "otherEthnicity"))
printHtmlPart(6)
invokeTag('message','g',76,['code':("patient.availableForOAR.label"),'default':("Available For OAR")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',78,['boolean':(patientInstance?.availableForOAR)],-1)
printHtmlPart(6)
invokeTag('message','g',83,['code':("patient.isProband.label"),'default':("Is Proband")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',85,['boolean':(patientInstance?.isProband)],-1)
printHtmlPart(6)
invokeTag('message','g',90,['code':("patient.ege.label"),'default':("Ege")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: patientInstance, field: "ege"))
printHtmlPart(6)
invokeTag('message','g',97,['code':("patient.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(patientInstance?.referralRecord?.encodeAsHTML())
})
invokeTag('link','g',99,['controller':("referralRecord"),'action':("show"),'id':(patientInstance?.referralRecord?.id)],2)
printHtmlPart(6)
invokeTag('message','g',104,['code':("patient.relationshipTo.label"),'default':("Relationship To")],-1)
printHtmlPart(7)
for( r in (patientInstance.relationshipTo) ) {
printHtmlPart(8)
createTagBody(3, {->
expressionOut.print(r?.encodeAsHTML())
})
invokeTag('link','g',109,['controller':("relationship"),'action':("show"),'id':(r.id)],3)
printHtmlPart(9)
}
printHtmlPart(10)
createClosureForHtmlPart(11, 2)
invokeTag('link','g',121,['controller':("relationship"),'action':("create"),'params':(['patient': patientInstance?.id])],2)
printHtmlPart(3)
})
invokeTag('captureBody','sitemesh',123,[:],1)
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464082188966L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
