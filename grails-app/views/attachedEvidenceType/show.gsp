
<%@ page import="rdmdt.AttachedEvidenceType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'attachedEvidenceType.label', default: 'Attached Evidence Type')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-attachedEvidenceType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attachedEvidenceType.attachedEvidenceTypeName.label" default="Attached Evidence Type Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: attachedEvidenceTypeInstance, field: "attachedEvidenceTypeName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
