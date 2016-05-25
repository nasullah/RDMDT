import rdmdt.Clinician
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_clinicianindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/clinician/index.gsp" }
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
invokeTag('message','g',9,['code':("default.index.label"),'args':([entityName])],-1)
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
invokeTag('sortableColumn','g',20,['property':("name"),'title':(message(code: 'clinician.name.label', default: 'Name'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',22,['property':("email"),'title':(message(code: 'clinician.email.label', default: 'Email'))],-1)
printHtmlPart(6)
invokeTag('sortableColumn','g',24,['property':("departmentName"),'title':(message(code: 'clinician.departmentName.label', default: 'Department Name'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',26,['property':("speciality"),'title':(message(code: 'clinician.speciality.label', default: 'Speciality'))],-1)
printHtmlPart(7)
loop:{
int i = 0
for( clinicianInstance in (clinicianInstanceList) ) {
printHtmlPart(8)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(9)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: clinicianInstance, field: "name"))
})
invokeTag('link','g',36,['action':("show"),'id':(clinicianInstance.id)],3)
printHtmlPart(10)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "email"))
printHtmlPart(11)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "departmentName"))
printHtmlPart(10)
expressionOut.print(fieldValue(bean: clinicianInstance, field: "speciality"))
printHtmlPart(12)
createClosureForHtmlPart(13, 3)
invokeTag('link','g',44,['controller':("referralRecord"),'action':("create"),'params':(['clinician.id': clinicianInstance?.id])],3)
printHtmlPart(14)
i++
}
}
printHtmlPart(15)
invokeTag('paginate','bs',51,['total':(clinicianInstanceCount)],-1)
printHtmlPart(16)
})
invokeTag('captureBody','sitemesh',55,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464004761383L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
