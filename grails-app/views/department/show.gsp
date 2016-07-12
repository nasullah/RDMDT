
<%@ page import="rdmdt.Department" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-department" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="department.departmentName.label" default="Department Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: departmentInstance, field: "departmentName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
