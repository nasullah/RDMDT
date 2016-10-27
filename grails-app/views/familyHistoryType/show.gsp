
<%@ page import="rdmdt.FamilyHistoryType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'familyHistoryType.label', default: 'Family History Type')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-familyHistoryType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="familyHistoryType.familyHistoryTypeName.label" default="Family History Type Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: familyHistoryTypeInstance, field: "familyHistoryTypeName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
