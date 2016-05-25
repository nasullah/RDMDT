
<%@ page import="rdmdt.EgeUnit" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'egeUnit.label', default: 'Age Unit')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-egeUnit" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="egeUnitName" title="${message(code: 'egeUnit.egeUnitName.label', default: 'Age Unit Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${egeUnitInstanceList}" status="i" var="egeUnitInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${egeUnitInstance.id}">${fieldValue(bean: egeUnitInstance, field: "egeUnitName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${egeUnitInstanceCount}" />
	</div>
</section>

</body>

</html>
