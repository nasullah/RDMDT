
<%@ page import="rdmdt.Penetrance" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'penetrance.label', default: 'Penetrance')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-penetrance" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="penetranceName" title="${message(code: 'penetrance.penetranceName.label', default: 'Penetrance Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${penetranceInstanceList}" status="i" var="penetranceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${penetranceInstance.id}">${fieldValue(bean: penetranceInstance, field: "penetranceName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${penetranceInstanceCount}" />
	</div>
</section>

</body>

</html>
