import rdmdt.Clinician
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_clinician_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/clinician/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'name', 'error'))
printHtmlPart(1)
invokeTag('message','g',8,['code':("clinician.name.label"),'default':("Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['class':("form-control"),'name':("name"),'value':(clinicianInstance?.name),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'name', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'email', 'error'))
printHtmlPart(5)
invokeTag('message','g',18,['code':("clinician.email.label"),'default':("Email")],-1)
printHtmlPart(6)
invokeTag('textField','g',20,['class':("form-control"),'name':("email"),'value':(clinicianInstance?.email)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'email', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'telephone', 'error'))
printHtmlPart(7)
invokeTag('message','g',28,['code':("clinician.telephone.label"),'default':("Telephone")],-1)
printHtmlPart(6)
invokeTag('textField','g',30,['class':("form-control"),'name':("telephone"),'value':(clinicianInstance?.telephone)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'telephone', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'departmentName', 'error'))
printHtmlPart(8)
invokeTag('message','g',38,['code':("clinician.departmentName.label"),'default':("Department Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',40,['class':("form-control"),'name':("departmentName"),'value':(clinicianInstance?.departmentName),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'departmentName', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'speciality', 'error'))
printHtmlPart(9)
invokeTag('message','g',48,['code':("clinician.speciality.label"),'default':("Speciality")],-1)
printHtmlPart(2)
invokeTag('textField','g',50,['class':("form-control"),'name':("speciality"),'value':(clinicianInstance?.speciality),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: clinicianInstance, field: 'speciality', 'error'))
printHtmlPart(10)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464005197281L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
