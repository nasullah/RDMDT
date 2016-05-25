
<%@ page import="rdmdt.Clinician" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clinician.label', default: 'Clinician')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-clinician" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'clinician.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'clinician.email.label', default: 'Email')}" />

				<g:sortableColumn property="departmentName" title="${message(code: 'clinician.departmentName.label', default: 'Department Name')}" />
			
				<g:sortableColumn property="speciality" title="${message(code: 'clinician.speciality.label', default: 'Speciality')}" />

				<th>Action</th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${clinicianInstanceList}" status="i" var="clinicianInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clinicianInstance.id}">${fieldValue(bean: clinicianInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: clinicianInstance, field: "email")}</td>

				<td>${fieldValue(bean: clinicianInstance, field: "departmentName")}</td>
			
				<td>${fieldValue(bean: clinicianInstance, field: "speciality")}</td>

				<td><a class='btn btn-primary btn-xs' <g:link controller="referralRecord" action="create" params="['clinician.id': clinicianInstance?.id]"><i class="glyphicon glyphicon-plus"></i>Add Referral</g:link></td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${clinicianInstanceCount}" />
	</div>
</section>

</body>

</html>
