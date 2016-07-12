
<%@ page import="rdmdt.Department" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-department" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="departmentName" title="${message(code: 'department.departmentName.label', default: 'Department Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${departmentInstanceList}" status="i" var="departmentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${departmentInstance.id}">${fieldValue(bean: departmentInstance, field: "departmentName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${departmentInstanceCount}" />
	</div>
</section>

</body>

</html>
