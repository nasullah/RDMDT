
<%@ page import="rdmdt.OMIM" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'OMIM.label', default: 'OMIM')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-OMIM" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="term" title="${message(code: 'OMIM.term.label', default: 'Term')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${OMIMInstanceList}" status="i" var="OMIMInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${OMIMInstance.id}">${fieldValue(bean: OMIMInstance, field: "term")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${OMIMInstanceCount}" />
	</div>
</section>

</body>

</html>
