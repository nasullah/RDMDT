
<%@ page import="rdmdt.Patient; rdmdt.ReferralRecord" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>List Applications</title>
	<r:require module="filterpane" />
</head>

<body>

<p>
<p>
<div style="background: rgba(80, 110, 56, 0.04);">
	<div class="container">
		<p>
		<h5 class="text-center">Search Options</h5>
		<p>
			<filterpane:filterButton text="Filter This List" />
			<filterpane:filterPane domain="rdmdt.ReferralRecord"
								   excludeProperties="assignedOn, meetingDate"
								   associatedProperties="clinician.name, clinician.telephone, clinician.departmentName, clinician.speciality,
								   						 patients.nhsNumber, patients.gender.genderName, patients.ethnicity.ethnicityName,
								   						 patients.ege, patients.egeUnit.egeUnitName, clinicalDetails.clinicalDetailsName,
								   						 unrelatedClinicalFeatures.unrelatedClinicalFeatures, paternal.breastAndOrOvarianCancer,
								   						 paternal.colorectalCancer, paternal.ischaemicHeartDiseaseOrStroke, paternal.endocrineTumours,
								   						 maternal.breastAndOrOvarianCancer, maternal.colorectalCancer, maternal.ischaemicHeartDiseaseOrStroke,
								   						 maternal.endocrineTumours, extraTests.testName"/>
		<p>
		<p>
	</div>
</div>

<hr/>
<section id="list-referralRecord" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
		<tr>

			<g:sortableColumn property="yourRef" title="${message(code: 'referralRecord.yourRef.label', default: 'Unique Ref')}" />

			<th>Proband Name</th>

			<th><g:message code="referralRecord.disorderName.label" default="Clinician Name" /></th>

			<g:sortableColumn property="referralDate" title="${message(code: 'referralRecord.referralDate.label', default: 'Application Status')}" />


		</tr>
		</thead>
		<tbody>
		<g:each in="${referralRecordInstanceList}" status="i" var="referralRecordInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${referralRecordInstance.id}">${fieldValue(bean: referralRecordInstance, field: "uniqueRef")}</g:link></td>

				<td>${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.givenName} ${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.familyName}</td>

				<td>${fieldValue(bean: referralRecordInstance?.clinician, field: "surname")}</td>

				<td>${fieldValue(bean: referralRecordInstance, field: "referralStatus")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${referralRecordInstanceTotal == null ? ReferralRecord.count(): referralRecordInstanceTotal}" params="${filterParams}" />
		<a>Number of records: ${referralRecordInstanceTotal == null ? ReferralRecord.count(): referralRecordInstanceTotal}</a>
	</div>
</section>

</body>

</html>
