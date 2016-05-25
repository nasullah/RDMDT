import rdmdt.AttachedEvidence
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_attachedEvidenceshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/attachedEvidence/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'attachedEvidence.label', default: 'Attached Evidence'))],-1)
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
invokeTag('message','g',20,['code':("attachedEvidence.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(attachedEvidenceInstance?.referralRecord?.encodeAsHTML())
})
invokeTag('link','g',22,['controller':("referralRecord"),'action':("show"),'id':(attachedEvidenceInstance?.referralRecord?.id)],2)
printHtmlPart(6)
invokeTag('message','g',27,['code':("attachedEvidence.addedOn.label"),'default':("Added On")],-1)
printHtmlPart(5)
invokeTag('formatDate','g',29,['date':(attachedEvidenceInstance?.addedOn)],-1)
printHtmlPart(6)
invokeTag('message','g',34,['code':("attachedEvidence.type.label"),'default':("Type")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(attachedEvidenceInstance?.type?.encodeAsHTML())
})
invokeTag('link','g',36,['controller':("attachedEvidenceType"),'action':("show"),'id':(attachedEvidenceInstance?.type?.id)],2)
printHtmlPart(6)
invokeTag('message','g',41,['code':("attachedEvidence.content.label"),'default':("Content")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: attachedEvidenceInstance, field: "content"))
printHtmlPart(7)
})
invokeTag('captureBody','sitemesh',51,[:],1)
printHtmlPart(8)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464175493400L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
