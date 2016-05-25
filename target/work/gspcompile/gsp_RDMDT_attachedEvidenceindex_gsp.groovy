import rdmdt.AttachedEvidence
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_attachedEvidenceindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/attachedEvidence/index.gsp" }
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
invokeTag('message','g',20,['code':("attachedEvidence.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',22,['property':("addedOn"),'title':(message(code: 'attachedEvidence.addedOn.label', default: 'Added On'))],-1)
printHtmlPart(6)
invokeTag('message','g',24,['code':("attachedEvidence.type.label"),'default':("Type")],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',26,['property':("content"),'title':(message(code: 'attachedEvidence.content.label', default: 'Content'))],-1)
printHtmlPart(7)
loop:{
int i = 0
for( attachedEvidenceInstance in (attachedEvidenceInstanceList) ) {
printHtmlPart(8)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(9)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: attachedEvidenceInstance, field: "referralRecord"))
})
invokeTag('link','g',34,['action':("show"),'id':(attachedEvidenceInstance.id)],3)
printHtmlPart(10)
invokeTag('formatDate','g',36,['date':(attachedEvidenceInstance.addedOn)],-1)
printHtmlPart(10)
expressionOut.print(fieldValue(bean: attachedEvidenceInstance, field: "type"))
printHtmlPart(10)
expressionOut.print(fieldValue(bean: attachedEvidenceInstance, field: "content"))
printHtmlPart(11)
i++
}
}
printHtmlPart(12)
invokeTag('paginate','bs',47,['total':(attachedEvidenceInstanceCount)],-1)
printHtmlPart(13)
})
invokeTag('captureBody','sitemesh',51,[:],1)
printHtmlPart(14)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464175493338L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
