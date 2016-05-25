import rdmdt.AttachedEvidence
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_attachedEvidence_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/attachedEvidence/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'referralRecord', 'error'))
printHtmlPart(1)
invokeTag('message','g',6,['code':("attachedEvidence.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(2)
invokeTag('select','g',8,['class':("many-to-one"),'id':("referralRecord"),'name':("referralRecord.id"),'from':(rdmdt.ReferralRecord.list()),'optionKey':("id"),'required':(""),'value':(attachedEvidenceInstance?.referralRecord?.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'referralRecord', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'addedOn', 'error'))
printHtmlPart(5)
invokeTag('message','g',16,['code':("attachedEvidence.addedOn.label"),'default':("Added On")],-1)
printHtmlPart(6)
invokeTag('datePicker','bs',18,['name':("addedOn"),'precision':("day"),'value':(attachedEvidenceInstance?.addedOn),'default':("none"),'noSelection':(['': ''])],-1)
printHtmlPart(7)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'addedOn', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'type', 'error'))
printHtmlPart(9)
invokeTag('message','g',26,['code':("attachedEvidence.type.label"),'default':("Type")],-1)
printHtmlPart(10)
invokeTag('select','g',28,['class':("form-control"),'id':("type"),'name':("type.id"),'from':(rdmdt.AttachedEvidenceType.list()),'optionKey':("id"),'required':(""),'value':(attachedEvidenceInstance?.type?.id)],-1)
printHtmlPart(7)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'type', 'error'))
printHtmlPart(8)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'content', 'error'))
printHtmlPart(11)
invokeTag('message','g',36,['code':("attachedEvidence.content.label"),'default':("Content")],-1)
printHtmlPart(6)
invokeTag('textField','g',38,['class':("form-control"),'name':("content"),'value':(attachedEvidenceInstance?.content)],-1)
printHtmlPart(7)
expressionOut.print(hasErrors(bean: attachedEvidenceInstance, field: 'content', 'error'))
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464175493353L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
