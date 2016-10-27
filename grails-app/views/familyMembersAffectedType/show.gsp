
<%@ page import="rdmdt.FamilyMembersAffectedType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'familyMembersAffectedType.label', default: 'Family Members Affected Type')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-familyMembersAffectedType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="familyMembersAffectedType.familyMembersAffectedTypeName.label" default="Family Members Affected Type Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: familyMembersAffectedTypeInstance, field: "familyMembersAffectedTypeName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
