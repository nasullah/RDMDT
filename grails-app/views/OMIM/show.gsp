
<%@ page import="rdmdt.OMIM" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'OMIM.label', default: 'OMIM')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-OMIM" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="OMIM.term.label" default="Term" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: OMIMInstance, field: "term")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
