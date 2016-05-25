import rdmdt.RelationshipType
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_relationshipType_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/relationshipType/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: relationshipTypeInstance, field: 'relationshipTypeName', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("relationshipType.relationshipTypeName.label"),'default':("Relationship Type Name")],-1)
printHtmlPart(2)
invokeTag('textField','g',9,['class':("form-control"),'name':("relationshipTypeName"),'value':(relationshipTypeInstance?.relationshipTypeName)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: relationshipTypeInstance, field: 'relationshipTypeName', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: relationshipTypeInstance, field: 'relationshipTypeInverse', 'error'))
printHtmlPart(5)
invokeTag('message','g',17,['code':("relationshipType.relationshipTypeInverse.label"),'default':("Relationship Type Inverse")],-1)
printHtmlPart(2)
invokeTag('textField','g',19,['class':("form-control"),'name':("relationshipTypeInverse"),'value':(relationshipTypeInstance?.relationshipTypeInverse)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: relationshipTypeInstance, field: 'relationshipTypeInverse', 'error'))
printHtmlPart(6)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1463750419657L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
