
<%@ page import="rdmdt.Centre" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'centre.label', default: 'Centre')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-centre" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="centre.centreName.label" default="Centre Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: centreInstance, field: "centreName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
