
<%@ page import="rdmdt.AttachedEvidence" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'attachedEvidence.label', default: 'Attached Evidence')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-attachedEvidence" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attachedEvidence.referralRecord.label" default="Referral Record" /></td>
				
				<td valign="top" class="value"><g:link controller="referralRecord" action="show" id="${attachedEvidenceInstance?.referralRecord?.id}">${attachedEvidenceInstance?.referralRecord?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attachedEvidence.addedOn.label" default="Added On" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${attachedEvidenceInstance?.addedOn}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attachedEvidence.type.label" default="Type" /></td>
				
				<td valign="top" class="value"><g:link controller="attachedEvidenceType" action="show" id="${attachedEvidenceInstance?.type?.id}">${attachedEvidenceInstance?.type?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attachedEvidence.content.label" default="Content" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: attachedEvidenceInstance, field: "content")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
