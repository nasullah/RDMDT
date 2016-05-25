
<%@ page import="rdmdt.Penetrance" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'penetrance.label', default: 'Penetrance')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-penetrance" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="penetrance.penetranceName.label" default="Penetrance Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: penetranceInstance, field: "penetranceName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
