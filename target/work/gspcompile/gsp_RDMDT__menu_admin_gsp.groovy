import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDMDT__menu_admin_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/_menu/_admin.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
createTagBody(1, {->
printHtmlPart(0)
expressionOut.print(createLink(uri: '/role/create'))
printHtmlPart(1)
expressionOut.print(createLink(uri: '/role'))
printHtmlPart(2)
expressionOut.print(createLink(uri: '/user/create'))
printHtmlPart(3)
expressionOut.print(createLink(uri: '/user'))
printHtmlPart(4)
expressionOut.print(createLink(uri: '/attachedEvidenceType'))
printHtmlPart(5)
expressionOut.print(createLink(uri: '/consanguinity'))
printHtmlPart(6)
expressionOut.print(createLink(uri: '/egeUnit'))
printHtmlPart(7)
expressionOut.print(createLink(uri: '/ethnicity'))
printHtmlPart(8)
expressionOut.print(createLink(uri: '/gender'))
printHtmlPart(9)
expressionOut.print(createLink(uri: '/OMIM'))
printHtmlPart(10)
expressionOut.print(createLink(uri: '/penetrance'))
printHtmlPart(11)
expressionOut.print(createLink(uri: '/program'))
printHtmlPart(12)
expressionOut.print(createLink(uri: '/referralStatus'))
printHtmlPart(13)
expressionOut.print(createLink(uri: '/relationshipType'))
printHtmlPart(14)
expressionOut.print(createLink(uri: '/roleType'))
printHtmlPart(15)
})
invokeTag('ifAnyGranted','sec',134,['roles':("ROLE_ADMIN")],1)
printHtmlPart(16)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1464185937077L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
