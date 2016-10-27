
<%@ page import="rdmdt.FamilyHistoryType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'familyHistoryType.label', default: 'Family History Type')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-familyHistoryType" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="familyHistoryTypeName" title="${message(code: 'familyHistoryType.familyHistoryTypeName.label', default: 'Family History Type Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${familyHistoryTypeInstanceList}" status="i" var="familyHistoryTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${familyHistoryTypeInstance.id}">${fieldValue(bean: familyHistoryTypeInstance, field: "familyHistoryTypeName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${familyHistoryTypeInstanceCount}" />
	</div>
</section>

</body>

</html>
