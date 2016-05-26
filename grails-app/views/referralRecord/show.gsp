
<%@ page import="rdmdt.Patient; rdmdt.ReferralRecord" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'referralRecord.label', default: 'Referral Record')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-referralRecord" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.clinician.label" default="Clinician" /></td>
				
				<td valign="top" class="value"><g:link controller="clinician" action="show" id="${referralRecordInstance?.clinician?.id}">${referralRecordInstance?.clinician?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.yourRef.label" default="Unique Ref" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "uniqueRef")}</td>
				
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

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.ege}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Age unit</td>

				<td valign="top" class="value">${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.egeUnit}</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.disorderName.label" default="Disorder name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "disorderName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.causativeVariantAffect.label" default="Causative variant affect" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "causativeVariantAffect")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.knownGeneVariant.label" default="Known gene variant" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "knownGeneVariant")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.ageOfSymptoms.label" default="Age of onset of symptoms in the proband" /></td>
				
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
				<td valign="top" class="name"><g:message code="referralRecord.unrelatedClinicalFeatures.label" default="Unrelated Clinical Features" /></td>

				<td valign="top" style="text-align: left;" class="value">
					<g:each in="${referralRecordInstance.unrelatedClinicalFeatures}" var="u">
						<p>${u}</P>
					</g:each>
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.geneticTestingOnProband.label" default="Genetic Testing On Proband" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "geneticTestingOnProband")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.otherTestingOnProband.label" default="Other Testing On Proband" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "otherTestingOnProband")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.pedigree.label" default="Pedigree" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "pedigree")}</td>
				
			</tr>

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
				<td valign="top" class="name"><g:message code="referralRecord.furtherDetailsOfHistory.label" default="Further Details Of History" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "furtherDetailsOfHistory")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name">Family members available for OAR</td>

				<td valign="top" style="text-align: left;" class="value">
					<g:each in="${referralRecordInstance.patients}" var="p">
						<g:if test="${!p.isProband && p.availableForOAR}">
							<p>${p.relatedFrom.relationshipType}</p>
						</g:if>
					</g:each>
				</td>

			</tr>

			<tr class="prop">
				<td valign="top" class="name">Is any of the samples are taken from deceased individuals</td>

				<td valign="top" class="value"><g:formatBoolean false="No" true="Yes" boolean="${referralRecordInstance?.isAnySampleFromDeceasedIndividuals}" /></td>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.numberOfSamplesForSeq.label" default="Number Of Samples For Seq" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "numberOfSamplesForSeq")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.consanguinityEvidence.label" default="Consanguinity Evidence" /></td>
				
				<td valign="top" class="value"><g:link controller="consanguinity" action="show" id="${referralRecordInstance?.consanguinityEvidence?.id}">${referralRecordInstance?.consanguinityEvidence?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.penetrance.label" default="Penetrance" /></td>
				
				<td valign="top" class="value"><g:link controller="penetrance" action="show" id="${referralRecordInstance?.penetrance?.id}">${referralRecordInstance?.penetrance?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.referralStatus.label" default="Referral Status" /></td>
				
				<td valign="top" class="value"><g:link controller="referralStatus" action="show" id="${referralRecordInstance?.referralStatus?.id}">${referralRecordInstance?.referralStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.note.label" default="Note" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "note")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.program.label" default="Program" /></td>
				
				<td valign="top" class="value"><g:link controller="program" action="show" id="${referralRecordInstance?.program?.id}">${referralRecordInstance?.program?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.proposedDiagnosis.label" default="Proposed Diagnosis" /></td>
				
				<td valign="top" class="value"><g:link controller="OMIM" action="show" id="${referralRecordInstance?.proposedDiagnosis?.id}">${referralRecordInstance?.proposedDiagnosis?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.assignedTo.label" default="Assigned To" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${referralRecordInstance?.assignedTo?.id}">${referralRecordInstance?.assignedTo?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.assignedOn.label" default="Assigned On" /></td>
				
				<td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${referralRecordInstance?.assignedOn}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.meetingDate.label" default="Meeting Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${referralRecordInstance?.meetingDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralRecord.numberOfSampleOtherRel.label" default="Number Of Sample Other Rel" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralRecordInstance, field: "numberOfSampleOtherRel")}</td>
				
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
		
		</tbody>
	</table>
</section>

</body>

</html>
