
<%@ page import="rdmdt.Clinician" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clinician.label', default: 'Clinician')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-clinician" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.departmentName.label" default="Department Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "departmentName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.speciality.label" default="Speciality" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clinicianInstance, field: "speciality")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.actingClinician.label" default="Acting Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="actingClinician" action="show" id="${clinicianInstance?.actingClinician?.id}">${clinicianInstance?.actingClinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clinician.membership.label" default="Role" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${clinicianInstance.membership}" var="m">
						<li><g:link controller="membership" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>

			<g:if test="${clinicianInstance.referralRecords}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="clinician.referralRecords.label" default="Referral Records" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
						<g:each in="${clinicianInstance.referralRecords}" var="r">
							<li><g:link controller="referralRecord" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>

				</tr>
			</g:if>
		
		</tbody>
	</table>
</section>

<hr/>

<p class="text-primary">Available Actions</p>

<a class='btn btn-primary btn-xs' <g:link controller="referralRecord" action="create" params="['clinician.id': clinicianInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Add Referral</g:link>

</body>

</html>
