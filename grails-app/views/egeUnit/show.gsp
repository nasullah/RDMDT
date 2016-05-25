
<%@ page import="rdmdt.EgeUnit" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'egeUnit.label', default: 'Age Unit')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-egeUnit" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="egeUnit.egeUnitName.label" default="Age Unit Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: egeUnitInstance, field: "egeUnitName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
