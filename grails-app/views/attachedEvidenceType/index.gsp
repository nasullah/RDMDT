
<%@ page import="rdmdt.AttachedEvidenceType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'attachedEvidenceType.label', default: 'Attached Evidence Type')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-attachedEvidenceType" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="attachedEvidenceTypeName" title="${message(code: 'attachedEvidenceType.attachedEvidenceTypeName.label', default: 'Attached Evidence Type Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${attachedEvidenceTypeInstanceList}" status="i" var="attachedEvidenceTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${attachedEvidenceTypeInstance.id}">${fieldValue(bean: attachedEvidenceTypeInstance, field: "attachedEvidenceTypeName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${attachedEvidenceTypeInstanceCount}" />
	</div>
</section>

</body>

</html>
