import rdmdt.Paternal
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_paternalshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/paternal/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'paternal.label', default: 'Paternal'))],-1)
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
invokeTag('message','g',20,['code':("paternal.breastAndOrOvarianCancer.label"),'default':("Breast And Or Ovarian Cancer")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',22,['boolean':(paternalInstance?.breastAndOrOvarianCancer)],-1)
printHtmlPart(6)
invokeTag('message','g',27,['code':("paternal.colorectalCancer.label"),'default':("Colorectal Cancer")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',29,['boolean':(paternalInstance?.colorectalCancer)],-1)
printHtmlPart(6)
invokeTag('message','g',34,['code':("paternal.ischaemicHeartDiseaseOrStroke.label"),'default':("Ischaemic Heart Disease Or Stroke")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',36,['boolean':(paternalInstance?.ischaemicHeartDiseaseOrStroke)],-1)
printHtmlPart(6)
invokeTag('message','g',41,['code':("paternal.endocrineTumours.label"),'default':("Endocrine Tumours")],-1)
printHtmlPart(5)
invokeTag('formatBoolean','g',43,['boolean':(paternalInstance?.endocrineTumours)],-1)
printHtmlPart(6)
invokeTag('message','g',48,['code':("paternal.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(paternalInstance?.referralRecord?.encodeAsHTML())
})
invokeTag('link','g',50,['controller':("referralRecord"),'action':("show"),'id':(paternalInstance?.referralRecord?.id)],2)
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
public static final long LAST_MODIFIED = 1464015023934L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
