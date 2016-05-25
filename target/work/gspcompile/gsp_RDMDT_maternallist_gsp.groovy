import rdmdt.Maternal
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_maternallist_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/maternal/list.gsp" }
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
invokeTag('message','g',9,['code':("default.list.label"),'args':([entityName])],-1)
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
invokeTag('sortableColumn','g',20,['property':("breastAndOrOvarianCancer"),'title':(message(code: 'maternal.breastAndOrOvarianCancer.label', default: 'Breast And Or Ovarian Cancer'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',22,['property':("colorectalCancer"),'title':(message(code: 'maternal.colorectalCancer.label', default: 'Colorectal Cancer'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',24,['property':("ischaemicHeartDiseaseOrStroke"),'title':(message(code: 'maternal.ischaemicHeartDiseaseOrStroke.label', default: 'Ischaemic Heart Disease Or Stroke'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',26,['property':("endocrineTumours"),'title':(message(code: 'maternal.endocrineTumours.label', default: 'Endocrine Tumours'))],-1)
printHtmlPart(6)
invokeTag('message','g',28,['code':("maternal.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(7)
loop:{
int i = 0
for( maternalInstance in (maternalInstanceList) ) {
printHtmlPart(8)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(9)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: maternalInstance, field: "breastAndOrOvarianCancer"))
})
invokeTag('link','g',36,['action':("show"),'id':(maternalInstance.id)],3)
printHtmlPart(10)
invokeTag('formatBoolean','g',38,['boolean':(maternalInstance.colorectalCancer)],-1)
printHtmlPart(10)
invokeTag('formatBoolean','g',40,['boolean':(maternalInstance.ischaemicHeartDiseaseOrStroke)],-1)
printHtmlPart(10)
invokeTag('formatBoolean','g',42,['boolean':(maternalInstance.endocrineTumours)],-1)
printHtmlPart(10)
expressionOut.print(fieldValue(bean: maternalInstance, field: "referralRecord"))
printHtmlPart(11)
i++
}
}
printHtmlPart(12)
invokeTag('paginate','bs',51,['total':(maternalInstanceCount)],-1)
printHtmlPart(13)
})
invokeTag('captureBody','sitemesh',55,[:],1)
printHtmlPart(14)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464015056479L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
