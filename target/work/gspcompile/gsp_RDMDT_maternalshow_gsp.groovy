import rdmdt.Maternal
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_maternalshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/maternal/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'maternal.label', default: 'Maternal'))],-1)
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
invokeTag('message','g',20,['code':("maternal.breastAndOrOvarianCancer.label"),'default':("Breast And Or Ovarian Cancer")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',22,['boolean':(maternalInstance?.breastAndOrOvarianCancer)],-1)
printHtmlPart(6)
invokeTag('message','g',27,['code':("maternal.colorectalCancer.label"),'default':("Colorectal Cancer")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',29,['boolean':(maternalInstance?.colorectalCancer)],-1)
printHtmlPart(6)
invokeTag('message','g',34,['code':("maternal.ischaemicHeartDiseaseOrStroke.label"),'default':("Ischaemic Heart Disease Or Stroke")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',36,['boolean':(maternalInstance?.ischaemicHeartDiseaseOrStroke)],-1)
printHtmlPart(6)
invokeTag('message','g',41,['code':("maternal.endocrineTumours.label"),'default':("Endocrine Tumours")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',43,['boolean':(maternalInstance?.endocrineTumours)],-1)
printHtmlPart(6)
invokeTag('message','g',48,['code':("maternal.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(maternalInstance?.referralRecord?.encodeAsHTML())
})
invokeTag('link','g',50,['controller':("referralRecord"),'action':("show"),'id':(maternalInstance?.referralRecord?.id)],2)
printHtmlPart(7)
})
invokeTag('captureBody','sitemesh',58,[:],1)
printHtmlPart(8)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464015056547L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
