import rdmdt.Clinician
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_clinicianshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/clinician/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'clinician.label', default: 'Clinician'))],-1)
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
invokeTag('message','g',20,['code':("clinician.name.label"),'default':("Name")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "name"))
printHtmlPart(6)
invokeTag('message','g',27,['code':("clinician.email.label"),'default':("Email")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "email"))
printHtmlPart(6)
invokeTag('message','g',34,['code':("clinician.telephone.label"),'default':("Telephone")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "telephone"))
printHtmlPart(6)
invokeTag('message','g',41,['code':("clinician.departmentName.label"),'default':("Department Name")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "departmentName"))
printHtmlPart(6)
invokeTag('message','g',48,['code':("clinician.speciality.label"),'default':("Speciality")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "speciality"))
printHtmlPart(6)
invokeTag('message','g',55,['code':("clinician.actingClinician.label"),'default':("Acting Clinician")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(clinicianInstance?.actingClinician?.encodeAsHTML())
})
invokeTag('link','g',57,['controller':("actingClinician"),'action':("show"),'id':(clinicianInstance?.actingClinician?.id)],2)
printHtmlPart(6)
invokeTag('message','g',62,['code':("clinician.membership.label"),'default':("Role")],-1)
printHtmlPart(7)
for( m in (clinicianInstance.membership) ) {
printHtmlPart(8)
createTagBody(3, {->
expressionOut.print(m?.encodeAsHTML())
})
invokeTag('link','g',67,['controller':("membership"),'action':("show"),'id':(m.id)],3)
printHtmlPart(9)
}
printHtmlPart(10)
if(true && (clinicianInstance.referralRecords)) {
printHtmlPart(11)
invokeTag('message','g',76,['code':("clinician.referralRecords.label"),'default':("Referral Records")],-1)
printHtmlPart(12)
for( r in (clinicianInstance.referralRecords) ) {
printHtmlPart(13)
createTagBody(4, {->
expressionOut.print(r?.encodeAsHTML())
})
invokeTag('link','g',81,['controller':("referralRecord"),'action':("show"),'id':(r.id)],4)
printHtmlPart(14)
}
printHtmlPart(15)
}
printHtmlPart(16)
createClosureForHtmlPart(17, 2)
invokeTag('link','g',97,['controller':("referralRecord"),'action':("create"),'params':(['clinician.id': clinicianInstance?.id])],2)
printHtmlPart(3)
})
invokeTag('captureBody','sitemesh',99,[:],1)
printHtmlPart(18)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464002704031L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
