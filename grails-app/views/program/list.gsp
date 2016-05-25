
<%@ page import="rdmdt.Program" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-program" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'program.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'program.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'program.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'program.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${programInstanceList}" status="i" var="programInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${programInstance.id}">${fieldValue(bean: programInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: programInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: programInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: programInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${programInstanceCount}" />
	</div>
</section>

</body>

</html>
