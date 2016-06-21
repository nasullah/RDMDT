import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT__menu_submenubar_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/_menu/_submenubar.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
if(true && (params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home')) {
printHtmlPart(1)
invokeTag('set','g',12,['var':("entityName"),'value':(message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase()))],-1)
printHtmlPart(2)
if(true && (params.controller == 'referralRecord')) {
printHtmlPart(3)
createTagBody(3, {->
printHtmlPart(4)
expressionOut.print(params.action == "list" ? 'active' : '')
printHtmlPart(5)
createTagBody(4, {->
printHtmlPart(6)
invokeTag('message','g',17,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('link','g',17,['action':("list")],4)
printHtmlPart(7)
})
invokeTag('ifAnyGranted','sec',17,['roles':("ROLE_ADMIN")],3)
printHtmlPart(8)
expressionOut.print(params.action == "filteredReferralList" ? 'active' : '')
printHtmlPart(9)
createClosureForHtmlPart(10, 3)
invokeTag('link','g',21,['action':("filteredReferralList")],3)
printHtmlPart(11)
}
printHtmlPart(12)
expressionOut.print(params.action == "create" ? 'active' : '')
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(14)
invokeTag('message','g',26,['code':("default.new.label"),'args':([entityName])],-1)
})
invokeTag('link','g',26,['action':("create")],2)
printHtmlPart(15)
if(true && (params.action == 'show' || params.action == 'edit')) {
printHtmlPart(16)
expressionOut.print(params.action == "edit" ? 'active' : '')
printHtmlPart(9)
createTagBody(3, {->
printHtmlPart(17)
invokeTag('message','g',32,['code':("default.edit.label"),'args':([entityName])],-1)
})
invokeTag('link','g',32,['action':("edit"),'id':(params.id)],3)
printHtmlPart(18)
invokeTag('render','g',32,['template':("/_common/modals/deleteTextLink")],-1)
printHtmlPart(11)
}
printHtmlPart(19)
}
printHtmlPart(20)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464780675388L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
