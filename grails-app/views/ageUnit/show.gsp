
<%@ page import="rdmdt.AgeUnit" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ageUnit.label', default: 'Age Unit')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ageUnit" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ageUnit.ageUnitName.label" default="Age Unit Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ageUnitInstance, field: "ageUnitName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
