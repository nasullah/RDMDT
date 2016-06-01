import rdmdt.Program
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_program_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/program/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: programInstance, field: 'name', 'error'))
printHtmlPart(1)
invokeTag('message','g',8,['code':("program.name.label"),'default':("Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['class':("form-control"),'name':("name"),'value':(programInstance?.name),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: programInstance, field: 'name', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: programInstance, field: 'email', 'error'))
printHtmlPart(5)
invokeTag('message','g',18,['code':("program.email.label"),'default':("Email")],-1)
printHtmlPart(6)
invokeTag('textField','g',20,['class':("form-control"),'name':("email"),'value':(programInstance?.email)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: programInstance, field: 'email', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: programInstance, field: 'telephone', 'error'))
printHtmlPart(7)
invokeTag('message','g',28,['code':("program.telephone.label"),'default':("Telephone")],-1)
printHtmlPart(6)
invokeTag('textField','g',30,['class':("form-control"),'name':("telephone"),'value':(programInstance?.telephone)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: programInstance, field: 'telephone', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: programInstance, field: 'description', 'error'))
printHtmlPart(8)
invokeTag('message','g',38,['code':("program.description.label"),'default':("Description")],-1)
printHtmlPart(2)
invokeTag('textField','g',40,['class':("form-control"),'name':("description"),'value':(programInstance?.description),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: programInstance, field: 'description', 'error'))
printHtmlPart(9)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464256605678L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
