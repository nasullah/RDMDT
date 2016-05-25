import rdmdt.Relationship
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_relationship_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/relationship/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: relationshipInstance, field: 'relationshipType', 'error'))
printHtmlPart(1)
invokeTag('message','g',6,['code':("relationship.relationshipType.label"),'default':("Relationship Type")],-1)
printHtmlPart(2)
invokeTag('select','g',8,['class':("many-to-one"),'id':("relationshipType"),'name':("relationshipType.id"),'from':(rdmdt.RelationshipType.list()),'optionKey':("id"),'required':(""),'value':(relationshipInstance?.relationshipType?.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: relationshipInstance, field: 'relationshipType', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: relationshipInstance, field: 'relatedFrom', 'error'))
printHtmlPart(5)
invokeTag('message','g',14,['code':("relationship.relatedFrom.label"),'default':("Related From")],-1)
printHtmlPart(6)
invokeTag('select','g',16,['class':("many-to-many"),'name':("relatedFrom"),'from':(rdmdt.Patient.list()),'multiple':("multiple"),'optionKey':("id"),'size':("5"),'value':(relationshipInstance?.relatedFrom*.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: relationshipInstance, field: 'relatedFrom', 'error'))
printHtmlPart(7)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464081749336L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
