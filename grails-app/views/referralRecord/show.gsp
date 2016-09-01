
<%@ page import="rdmdt.Program; rdmdt.ReferralStatus; rdmdt.Patient; rdmdt.ReferralRecord" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>Application ${referralRecordInstance?.uniqueRef}</title>
</head>

<body>

<section id="show-referralRecord" class="first">

	<table class="table">
		<tbody>

			<g:if test="${referralRecordInstance?.referralStatus?.referralStatusName == 'Submitted'}">
				<tr class="prop" bgcolor="#ff7f50">
					<td valign="top" class="name"><strong>Application Status</strong></td>

					<td valign="top" class="value"><strong>${referralRecordInstance?.referralStatus} ${referralRecordInstance?.submittedDate}</strong></td>

				</tr>
			</g:if>
			<g:elseif test="${referralRecordInstance?.referralStatus?.referralStatusName == 'Approval' || referralRecordInstance?.referralStatus?.referralStatusName == 'Conditional Approval'}">
				<tr class="prop" bgcolor="lime">
					<td valign="top" class="name"><strong>Application Status</strong></td>

					<td valign="top" class="value"><strong>${referralRecordInstance?.referralStatus}</strong></td>

				</tr>
			</g:elseif>
			<g:elseif test="${referralRecordInstance?.referralStatus?.referralStatusName == 'Withdrawn' || referralRecordInstance?.referralStatus?.referralStatusName == 'Not Approved'}">
				<tr class="prop" bgcolor="#f08080">
					<td valign="top" class="name"><strong>Application Status</strong></td>

					<td valign="top" class="value"><strong>${referralRecordInstance?.referralStatus}</strong></td>

				</tr>
			</g:elseif>
			<g:else>
				<tr class="prop" bgcolor="#e6e6fa">
					<td valign="top" class="name"><strong>Application Status</strong></td>

					<td valign="top" class="value"><strong>${referralRecordInstance?.referralStatus}</strong></td>

				</tr>
			</g:else>

			<g:if test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Conditional Approval')}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.conditionalApprovalDetails.label" default="Conditional approval details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "conditionalApprovalDetails")}</td>

				</tr>
			</g:if>

			<g:elseif test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Approval')}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.approvalDetails.label" default="Approval details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "approvalDetails")}</td>

				</tr>
			</g:elseif>
			<g:elseif test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Not Approved')}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.notApprovedDetails.label" default="Not Approved details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "notApprovedDetails")}</td>

				</tr>
			</g:elseif>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.clinician.label" default="Applicant" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance?.clinician, field: "forename")} ${fieldValue(bean: referralRecordInstance?.clinician, field: "surname")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Responsible Consultant Name</td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance?.correspondingClinician, field: "forename")} ${fieldValue(bean: referralRecordInstance?.correspondingClinician, field: "surname")}</td>

			</tr>

			<g:if test="${referralRecordInstance.coApplicants}">
				<tr class="prop">
					<td valign="top" class="name">Co-applicant Details</td>

					<td valign="top" style="text-align: left;" class="value">
						<g:each in="${referralRecordInstance.coApplicants}" var="c">
							<p>${c?.coApplicant?.forename} ${c?.coApplicant?.surname}</P>
						</g:each>
					</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.yourRef.label" default="Unique Ref" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "uniqueRef")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Proband's forename</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.givenName}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Proband's surname</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.familyName}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">NHS number of the proband</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.nhsNumber}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Gender of the proband</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.gender}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Ethnicity of the proband</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.ethnicity}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Other ethnicity of the proband</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.otherEthnicity}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Age of the proband</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.age}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Age unit</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.ageUnit}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.disorderName.label" default="Name or brief description of disorder"/></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "disorderName")}</td>

			</tr>
		%{----}%
			%{--<tr class="prop">--}%
				%{--<td valign="top" class="name"><g:message code="referralRecord.causativeVariantAffect.label" default="Causative variant affect" /></td>--}%
				%{----}%
				%{--<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "causativeVariantAffect")}</td>--}%
				%{----}%
			%{--</tr>--}%
		%{----}%
			%{--<tr class="prop">--}%
				%{--<td valign="top" class="name"><g:message code="referralRecord.knownGeneVariant.label" default="Known gene variant" /></td>--}%
				%{----}%
				%{--<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "knownGeneVariant")}</td>--}%
				%{----}%
			%{--</tr>--}%
		%{----}%
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.ageOfSymptoms.label" default="Age of onset of main symptoms" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "ageOfSymptoms")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.symptomEgeUnit.label" default="Unit" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "symptomEgeUnit")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.clinicalDetails.label" default="Clinical Details" /></td>

				<td valign="top" style="text-align: left;" class="value">
					<g:each in="${referralRecordInstance.clinicalDetails}" var="c">
						<p>${c}</P>
					</g:each>
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.geneticTestingOnProband.label" default="Genetic Testing On Proband" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "geneticTestingOnProband")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.otherTestingOnProband.label" default="Other Testing On Proband (metabolic, nerve conduction tests, muscle/skin biopsy, etc.)" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "otherTestingOnProband")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.arrayCGH.label" default="Has arrayCGH been performed?" /></td>

				<td valign="top" class="value"><g:formatBoolean boolean="${referralRecordInstance?.arrayCGH}" false="No" true="Yes" /></td>

			</tr>

			<g:if test="${referralRecordInstance.arrayCGHDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.arrayCGHDetails.label" default="arrayCGH Results" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "arrayCGHDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.otherFamilyMembersAffected.label" default="Are any other family members affected with the same or a related condition?" /></td>

				<td valign="top" class="value"><g:formatBoolean boolean="${referralRecordInstance?.otherFamilyMembersAffected}" false="No" true="Yes" /></td>

			</tr>

			<g:if test="${referralRecordInstance.otherFamilyMembersAffectedDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.otherFamilyMembersAffectedDetails.label" default="Other Family Members Affected Details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "otherFamilyMembersAffectedDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.pedigree.label" default="3-generation pedigree diagram" /></td>
				
				<td valign="top" class="value"><g:link action="download" id="${referralRecordInstance.id}">${referralRecordInstance.pedigree}</g:link></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.consanguinityEvidence.label" default="Evidence of consanguinity" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "consanguinityEvidence")}</td>

			</tr>

			<g:if test="${referralRecordInstance.consanguinityEvidenceDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.consanguinityEvidenceDetails.label" default="Evidence of consanguinity details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "consanguinityEvidenceDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.penetrance.label" default=" Is there evidence of reduced penetrance" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "penetrance")}</td>

			</tr>

			<g:if test="${referralRecordInstance.penetranceDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.penetranceDetails.label" default="Reduced penetrance details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "penetranceDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name">Paternal Breast And Or Ovarian Cancer</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Paternal Colorectal Cancer</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.paternal?.first()?.colorectalCancer}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Paternal Ischaemic Heart Disease Or Stroke</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Paternal Endocrine Tumours</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.paternal?.first()?.endocrineTumours}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Maternal Breast And Or Ovarian Cancer</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Maternal Colorectal Cancer</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.maternal?.first()?.colorectalCancer}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Maternal Ischaemic Heart Disease Or Stroke</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke}" /></td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Maternal Endocrine Tumours</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.maternal?.first()?.endocrineTumours}" /></td>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.furtherDetailsOfHistory.label" default="Details and/or note any other significant family history" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "furtherDetailsOfHistory")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Ethnicity of immediate family</td>

				<td valign="top" style="text-align: left;" class="value">
					<g:each in="${referralRecordInstance.patients}" var="p">
						<g:if test="${!p.isProband}">
							<p>${p.relatedFrom.relationshipType}: ${p.ethnicity}</p>
						</g:if>
					</g:each>
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.identityOfFamilyMembersSamplesForSeq.label" default="Identity of family members" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "identityOfFamilyMembersSamplesForSeq")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.numberOfSamplesForSeq.label" default="Number of samples for seq." /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "numberOfSamplesForSeq")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Are any of the samples are taken from deceased individuals</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.isAnySampleFromDeceasedIndividuals}" /></td>

			</tr>

			<g:if test="${referralRecordInstance.isAnySampleFromDeceasedIndividualsDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.isAnySampleFromDeceasedIndividualsDetails.label" default="Sample from deceased individuals details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "isAnySampleFromDeceasedIndividualsDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name">Further information about sample availability</td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "samplesForSeqDetails")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Are any individuals proposed for sequencing out of area</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.anyIndividualsForSeqOutOfArea}" /></td>

			</tr>

			<g:if test="${referralRecordInstance.anyIndividualsForSeqOutOfAreaDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.anyIndividualsForSeqOutOfAreaDetails.label" default="Any individuals for seq out of area details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "anyIndividualsForSeqOutOfAreaDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.program.label" default="Program" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "program")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.note.label" default="Note" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "note")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.targetCategory.label" default="Target 100,000 Genomes Project Rare Disease category" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "targetCategory")}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.eligibility.label" default="Is this patient/family eligible?" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "eligibility")}</td>

			</tr>

			<g:if test="${referralRecordInstance.eligibilityDetails}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.eligibilityDetails.label" default="Patient/family eligibility details" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "eligibilityDetails")}</td>

				</tr>
			</g:if>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.consentPatientOrFamily.label" default="Consent patient or family" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "consentPatientOrFamily")}</td>

			</tr>
		
			%{--<tr class="prop">--}%
				%{--<td valign="top" class="name"><g:message code="referralRecord.proposedDiagnosis.label" default="Proposed Diagnosis" /></td>--}%
				%{----}%
				%{--<td valign="top" class="value"><g:link controller="OMIM" action="show" id="${referralRecordInstance?.proposedDiagnosis?.id}">${referralRecordInstance?.proposedDiagnosis?.encodeAsHTML()}</g:link></td>--}%
				%{----}%
			%{--</tr>--}%
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.assignedTo.label" default="Assigned To" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "assignedTo")}</td>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.reviewDetails.label" default="Review Details" /></td>

				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "reviewDetails")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.meetingDate.label" default="Meeting Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${referralRecordInstance?.meetingDate}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.attachedEvidence.label" default="Attached Evidence" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${referralRecordInstance.attachedEvidence}" var="a">
						<li><g:link controller="attachedEvidence" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>

			<g:if test="${!referralRecordInstance?.extraTests?.empty}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.extraTests.label" default="Extra Tests" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance?.extraTests?.first(), field: "testName")}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="referralRecord.extraTests.label" default="Extra Tests" /></td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance?.extraTests?.first(), field: "requestedDate")}</td>
				</tr>
			</g:if>

			<sec:ifAnyGranted roles="ROLE_ADMIN">
				<tr class="prop">
					<td valign="top" class="name">Approved Program</td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "approvedTargetCategory")}</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name">Approved Target 100,000 Genomes Project Rare Disease category</td>

					<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "approvedProgram")}</td>

				</tr>
			</sec:ifAnyGranted>
		
		</tbody>
	</table>
</section>

<p class="text-primary">Available Actions</p>

%{--<a class='btn btn-primary btn-xs' <g:link controller="attachedEvidence" action="create" params="['referralRecord.id': referralRecordInstance?.id]"><i class="glyphicon glyphicon-plus"></i> Attach evidence</g:link>--}%

<g:if test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Submitted')}">
	<a class='btn btn-success btn-xs' <g:link action="updateStatus" params="['referralRecord': referralRecordInstance?.id, referralStatus: ReferralStatus.findByReferralStatusName('Submitted')?.id]"><i class="glyphicon glyphicon-ok"></i> Re-submit Application</g:link>
</g:if>
<g:else>
	<a class='btn btn-success btn-xs' <g:link action="updateStatus" params="['referralRecord': referralRecordInstance?.id, referralStatus: ReferralStatus.findByReferralStatusName('Submitted')?.id]"><i class="glyphicon glyphicon-ok"></i> Submit Application</g:link>
</g:else>
<g:if test="${referralRecordInstance.referralStatus != ReferralStatus.findByReferralStatusName('Withdrawn')}">
	<a class='btn btn-warning btn-xs' <g:link action="updateStatus" params="['referralRecord': referralRecordInstance?.id, referralStatus: ReferralStatus.findByReferralStatusName('Withdrawn')?.id]"><i class="glyphicon glyphicon-flag"></i> Withdraw Application</g:link>
</g:if>
<g:if test="${referralRecordInstance.referralStatus != ReferralStatus.findByReferralStatusName('Suspended')}">
	<a class='btn btn-warning btn-xs' <g:link action="updateStatus" params="['referralRecord': referralRecordInstance?.id, referralStatus: ReferralStatus.findByReferralStatusName('Suspended')?.id]"><i class="glyphicon glyphicon-flag"></i> Suspend Application</g:link>
</g:if>

<hr/>

<sec:ifAnyGranted roles="ROLE_ADMIN">

	<p class="text-primary">Letters</p>

	<g:if test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusNameOrReferralStatusName('In Review', 'Review Requested')}">
		<a class='btn btn-default btn-xs' <g:link  action="renderWednesdayMeetingReviewLetter" id="${referralRecordInstance?.id}"><i class="glyphicon glyphicon-print"></i> Print Wednesday Meeting Review Letter</g:link>
	</g:if>

	<g:if test="${(referralRecordInstance.program && referralRecordInstance.program == Program.findByName('HICF2 Whole Genome Sequencing Programme')) || (referralRecordInstance.approvedProgram && referralRecordInstance.approvedProgram == Program.findByName('HICF2 Whole Genome Sequencing Programme'))}">
		<a class='btn btn-default btn-xs' <g:link  action="renderHICFLetter" id="${referralRecordInstance?.id}"><i class="glyphicon glyphicon-print"></i> Print HICF Letter</g:link>
	</g:if>

	<g:if test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Conditional Approval')}">
		<a class='btn btn-default btn-xs' <g:link  action="renderOtherTestingConditionalLetter" id="${referralRecordInstance?.id}"><i class="glyphicon glyphicon-print"></i> Print Other testing (conditional) Letter</g:link>
	</g:if>

	<g:if test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Not Approved')}">
		<a class='btn btn-default btn-xs' <g:link  action="renderNotApprovedLetter" id="${referralRecordInstance?.id}"><i class="glyphicon glyphicon-print"></i> Print Not Approved Letter</g:link>
	</g:if>

	<g:if test="${referralRecordInstance.referralStatus == ReferralStatus.findByReferralStatusName('Approval')}">
		<a class='btn btn-default btn-xs' <g:link  action="renderStandardApprovalLetter" id="${referralRecordInstance?.id}"><i class="glyphicon glyphicon-print"></i> Print Standard Approval Letter</g:link>
	</g:if>

	<hr/>
</sec:ifAnyGranted>

</body>

</html>
