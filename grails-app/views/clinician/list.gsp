
<%@ page import="rdmdt.Clinician" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clinician.label', default: 'Clinician')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-clinician" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
		<tr>

			<th>Name</th>

			<g:sortableColumn property="centre" title="${message(code: 'clinician.centreName.label', default: 'Main Centre')}" />

			<g:sortableColumn property="departmentName" title="${message(code: 'clinician.departmentName.label', default: 'Department')}" />

			<g:sortableColumn property="roleType" title="${message(code: 'clinician.roleType.label', default: 'Role')}" />

			<th>Action</th>

		</tr>
		</thead>
		<tbody>
		<g:each in="${clinicianInstanceList}" status="i" var="clinicianInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${clinicianInstance.id}">${clinicianInstance?.forename} ${clinicianInstance?.surname}</g:link></td>

				<td>${fieldValue(bean: clinicianInstance, field: "centreName")}</td>

				<td>${fieldValue(bean: clinicianInstance, field: "departmentName")}</td>

				<td>${fieldValue(bean: clinicianInstance, field: "roleType")}</td>

				<td><a class='btn btn-primary btn-xs' <g:link controller="referralRecord" action="create" params="['clinician.id': clinicianInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Add Application</g:link></td>

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
