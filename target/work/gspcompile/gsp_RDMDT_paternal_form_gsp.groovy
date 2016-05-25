import rdmdt.Paternal
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT_paternal_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/paternal/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'breastAndOrOvarianCancer', 'error'))
printHtmlPart(1)
invokeTag('message','g',6,['code':("paternal.breastAndOrOvarianCancer.label"),'default':("Breast And Or Ovarian Cancer")],-1)
printHtmlPart(2)
invokeTag('checkBox','bs',8,['name':("breastAndOrOvarianCancer")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'breastAndOrOvarianCancer', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'colorectalCancer', 'error'))
printHtmlPart(5)
invokeTag('message','g',14,['code':("paternal.colorectalCancer.label"),'default':("Colorectal Cancer")],-1)
printHtmlPart(2)
invokeTag('checkBox','bs',16,['name':("colorectalCancer")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'colorectalCancer', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'ischaemicHeartDiseaseOrStroke', 'error'))
printHtmlPart(6)
invokeTag('message','g',22,['code':("paternal.ischaemicHeartDiseaseOrStroke.label"),'default':("Ischaemic Heart Disease Or Stroke")],-1)
printHtmlPart(2)
invokeTag('checkBox','bs',24,['name':("ischaemicHeartDiseaseOrStroke")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'ischaemicHeartDiseaseOrStroke', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'endocrineTumours', 'error'))
printHtmlPart(7)
invokeTag('message','g',30,['code':("paternal.endocrineTumours.label"),'default':("Endocrine Tumours")],-1)
printHtmlPart(2)
invokeTag('checkBox','bs',32,['name':("endocrineTumours")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'endocrineTumours', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'referralRecord', 'error'))
printHtmlPart(8)
invokeTag('message','g',38,['code':("paternal.referralRecord.label"),'default':("Referral Record")],-1)
printHtmlPart(9)
invokeTag('select','g',40,['class':("many-to-one"),'id':("referralRecord"),'name':("referralRecord.id"),'from':(rdmdt.ReferralRecord.list()),'optionKey':("id"),'required':(""),'value':(paternalInstance?.referralRecord?.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: paternalInstance, field: 'referralRecord', 'error'))
printHtmlPart(10)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464096362363L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
