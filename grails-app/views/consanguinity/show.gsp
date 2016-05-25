
<%@ page import="rdmdt.Consanguinity" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consanguinity.label', default: 'Consanguinity')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-consanguinity" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consanguinity.consanguinityEvidence.label" default="Consanguinity Evidence" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consanguinityInstance, field: "consanguinityEvidence")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
