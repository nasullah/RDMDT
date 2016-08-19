<%@ page import="rdmdt.RelationshipType; rdmdt.Clinician; rdmdt.ReferralRecord" %>


		<h2>Clinician Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'clinician', 'error')} required">
					<g:if test="${referralRecordInstance?.clinician?.id}">
						<label for="clinician" class="control-label"><g:message code="referralRecord.clinician.label" default="Clinician" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="clinician" name="clinician.id" from="${rdmdt.Clinician.list()}" optionKey="id" required="" value="${referralRecordInstance?.clinician?.id}"/>
							<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'clinician', 'error')}</span>
						</div>
					</g:if>
					<g:else>
						<label for="clinician" class="control-label">Clinician (enter name)<span class="required-indicator">*</span></label>
						<richui:autoComplete class="form-control"  name="clinicianName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.clinician}" onItemSelect="callClinician(id)"  />
						<g:hiddenField id ="clinician" name ="clinician" value="${referralRecordInstance?.clinician?.id}"/>
					</g:else>
				</div>
			</div>

			<div class="col-lg-3">
				<div class="">
					<label class="control-label">Responsible consultant forename</label>
					<div>
						<g:textField class="form-control" name="correspondingClinicianForename" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-3">
				<div class="">
					<label class="control-label">Responsible consultant surname</label>
					<div>
						<g:textField class="form-control" name="correspondingClinicianSurname" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="addCoapplicantDetailsButton">
					<label class="control-label">Add Co-applicant</label>
					<div>
						<button type="button" id="addCoapplicantButton" class="btn btn-primary btn" value="add" onClick= 'addCoAppButton()'><span class="glyphicon glyphicon-plus"></span> Add</button>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Responsible clinician email</label>
					<div>
						<g:textField class="form-control" name="correspondingClinicianEmail" value=""/>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="coapplicantDetails">
			<div class="col-lg-3">
				<div class="">
					<label class="control-label">Co-applicant forename</label>
					<div>
						<g:textField class="form-control" name="coapplicantForename" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-3">
				<div class="">
					<label class="control-label">Co-applicant surname</label>
					<div>
						<g:textField class="form-control" name="coapplicantSurname" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Co-applicant email</label>
					<div>
						<g:textField class="form-control" name="coapplicantEmail" value=""/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>About The Proband</h2>

		<div class="row">

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'givenName', 'error')} ">
					<label for="givenName" class="control-label"><g:message code="patient.givenName.label" default="Given Name" /></label>
					<div>
						<g:textField class="form-control" name="givenName" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'familyName', 'error')} ">
					<label for="familyName" class="control-label"><g:message code="patient.familyName.label" default="Family Name" /></label>
					<div>
						<g:textField class="form-control" name="familyName" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'uniqueRef', 'error')} ">
					<label for="uniqueRef" class="control-label"><g:message code="referralRecord.uniqueRef.label" default="Unique Ref (case number or other local identifier)" /><span class="required-indicator">*</span></label>
					<div>
						<g:textField class="form-control" name="uniqueRef" value="${referralRecordInstance?.uniqueRef}" required=""/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'uniqueRef', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'nhsNumber', 'error')} ">
					<label for="nhsNumber" class="control-label">NHS number of the proband<span class="required-indicator">*</span></label>
					<div>
						<g:textField class="form-control" name="nhsNumberProband" value="" required=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'gender', 'error')} ">
					<label for="genderProband" class="control-label"><g:message code="patient.gender.label" default="Gender" /></label>
					<div>
						<g:select class="form-control" id="genderProband" name="genderProband" from="${rdmdt.Gender.list()}" optionKey="id" value="${patientInstance?.gender?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'gender', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'ethnicity', 'error')} ">
					<label for="ethnicityProband" class="control-label"><g:message code="patient.ethnicity.label" default="Ethnicity" /><span class="required-indicator">*</span></label>
					<div>
						<g:select class="form-control" id="ethnicityProband" name="ethnicityProband" from="${rdmdt.Ethnicity.list()}" required="" onchange="otherEthnicityProbandOpt()" optionKey="id" value="${patientInstance?.ethnicity?.id}" noSelection="['':'- Choose -']" />
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'ethnicity', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="otherEthnicityOption">
				<div class="${hasErrors(bean: patientInstance, field: 'otherEthnicity', 'error')} ">
					<label for="otherEthnicityProband" class="control-label"><g:message code="patient.otherEthnicity.label" default="Please specify" /></label>
					<div>
						<g:textField class="form-control" id="otherEthnicityProband" name="otherEthnicityProband" value="${patientInstance?.otherEthnicity}"/>
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'otherEthnicity', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div>
					<label for="ageProband" class="control-label">Age (if deceased, age at death)</label>
					<div>
						<g:field class="form-control" name="ageProband" type="number" min="1" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div>
					<label for="egeUnitProband" class="control-label">Age unit</label>
					<div>
						<g:select class="form-control" id="egeUnitProband" name="egeUnitProband" from="${rdmdt.EgeUnit.list()}" optionKey="id"  value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Clinical details</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'disorderName', 'error')} ">
					<label for="disorderName" class="control-label"><g:message code="referralRecord.disorderName.label" default="Name or brief description of disorder" /><span class="required-indicator">*</span></label>
					<div>
						<g:textField class="form-control" name="disorderName" value="${referralRecordInstance?.disorderName}" required=""/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'disorderName', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'ageOfSymptoms', 'error')} ">
					<label for="ageOfSymptoms" class="control-label"><g:message code="referralRecord.ageOfSymptoms.label" default="Age of onset of main symptoms" /></label>
					<div>
						<g:field class="form-control" name="ageOfSymptoms" type="number" min="1" value="${referralRecordInstance.ageOfSymptoms}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'ageOfSymptoms', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div>
					<label class="control-label">Unit</label>
					<div>
						<g:select class="form-control" id="symptomEgeUnit" name="symptomEgeUnit.id" from="${rdmdt.EgeUnit.list()}" optionKey="id"  value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div id="clinicalDetails0">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails0" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="addClinicalDetailsButton">
					<label class="control-label">Add More Clinical Details</label>
					<div>
						<button type="button" id="addClinicalButton" class="btn btn-primary btn" value="add" onClick= 'addClinicalDetails()'><span class="glyphicon glyphicon-plus"></span> Add</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div id="clinicalDetails1">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails1" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails2">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails2" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails3">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails3" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails4">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails4" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails5">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails5" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails6">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails6" type="text" value=""/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'geneticTestingOnProband', 'error')} ">
					<label for="geneticTestingOnProband" class="control-label"><g:message code="referralRecord.geneticTestingOnProband.label" default="Genetic Testing (chromosome analysis, single gene, gene panel, etc.)" /></label>
					<div>
						<g:textField class="form-control" name="geneticTestingOnProband" value="${referralRecordInstance?.geneticTestingOnProband}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'geneticTestingOnProband', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'otherTestingOnProband', 'error')} ">
					<label for="otherTestingOnProband" class="control-label"><g:message code="referralRecord.otherTestingOnProband.label" default="Other Testing On Proband" /></label>
					<div>
						<g:textField class="form-control" name="otherTestingOnProband" value="${referralRecordInstance?.otherTestingOnProband}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'otherTestingOnProband', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: personInstance, field: 'arrayCGH', 'error')} ">
					<label class="control-label">Has arrayCGH been performed?</label>
					<div>
						<label class="radio-inline"><input type="radio" name="arrayCGH" id="arrayCGHYes" value="true" ${referralRecordInstance.arrayCGH == true ? 'checked="checked"' : ''} onclick="showArrayCGHDetails()">Yes</label>
						<label class="radio-inline"><input type="radio" name="arrayCGH" id="arrayCGHNo" value="false" ${referralRecordInstance.arrayCGH == false ? 'checked="checked"' : ''} onclick="hideArrayCGHDetails()">No</label>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'arrayCGH', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="arrayCGHDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'arrayCGHDetails', 'error')} ">
					<label class="control-label">Please provide results</label>
					<div>
						<g:textField class="form-control" id="arrayCGHDetails" name="arrayCGHDetails" value="${referralRecordInstance?.arrayCGHDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'arrayCGHDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>About The Family</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: personInstance, field: 'otherFamilyMembersAffected', 'error')} ">
					<label class="control-label">Are any other family members affected with the same or a related condition?</label>
					<div>
						<label class="radio-inline"><input type="radio" name="otherFamilyMembersAffected" id="otherFamilyMembersAffectedYes" value="true" ${referralRecordInstance.otherFamilyMembersAffected == true ? 'checked="checked"' : ''} onclick="showOtherFamilyMembersAffectedDetailsOpt()">Yes</label>
						<label class="radio-inline"><input type="radio" name="otherFamilyMembersAffected" id="otherFamilyMembersAffectedNo" value="false" ${referralRecordInstance.otherFamilyMembersAffected == false ? 'checked="checked"' : ''} onclick="hideOtherFamilyMembersAffectedDetailsOpt()">No</label>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'otherFamilyMembersAffected', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="otherFamilyMembersAffectedDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'otherFamilyMembersAffectedDetails', 'error')} ">
					<label class="control-label">Please provide details</label>
					<div>
						<g:textField class="form-control" id="otherFamilyMembersAffectedDetails" name="otherFamilyMembersAffectedDetails" value="${referralRecordInstance?.otherFamilyMembersAffectedDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'otherFamilyMembersAffectedDetails', 'error')}</span>
					</div>
				</div>
			</div>

			<g:if test="${referralRecordInstance?.pedigree == null}">
				<div class="col-lg-6">
					<div class="">
						<label  class="control-label">Please upload a 3-generation pedigree diagram if possible</label>
						<div>
							<input type="file" id="pedigreeFile" name="pedigreeFile" />
						</div>
					</div>
				</div>
			</g:if>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'consanguinityEvidence', 'error')} required">
					<label for="consanguinityEvidence" class="control-label">Is there evidence of consanguinity?</label>
					<div>
						<g:select class="form-control" id="consanguinityEvidence" name="consanguinityEvidence.id" from="${rdmdt.Consanguinity.list()}" optionKey="id" onchange="consanguinityEvidenceDetailsOpt()" value="${referralRecordInstance?.consanguinityEvidence?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'consanguinityEvidence', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="consanguinityEvidenceDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'consanguinityEvidenceDetails', 'error')} ">
					<label class="control-label">Please provide details</label>
					<div>
						<g:textField class="form-control" id="consanguinityEvidenceDetails" name="consanguinityEvidenceDetails" value="${referralRecordInstance?.consanguinityEvidenceDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'consanguinityEvidenceDetails', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'penetrance', 'error')} required">
					<label for="penetrance" class="control-label">Is there evidence of reduced penetrance?</label>
					<div>
						<g:select class="form-control" id="penetrance" name="penetrance.id" from="${rdmdt.Penetrance.list()}" optionKey="id" onchange="penetranceDetailsOpt()" value="${referralRecordInstance?.penetrance?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'penetrance', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="penetranceDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'penetranceDetails', 'error')} ">
					<label class="control-label">Please provide details</label>
					<div>
						<g:textField class="form-control" id="penetranceDetails" name="penetranceDetails" value="${referralRecordInstance?.penetranceDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'penetranceDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h3>Family History</h3>

		<br/>

		<h4>Paternal</h4>

		<div class="row">

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Breast And Or Ovarian Cancer</label>
					<div>
						<g:radioGroup name="breastAndOrOvarianCancerPaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Colorectal Cancer</label>
					<div>
						<g:radioGroup name="colorectalCancerPaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ischaemic Heart Disease Or Stroke</label>
					<div>
						<g:radioGroup name="ischaemicHeartDiseaseOrStrokePaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Endocrine Tumours</label>
					<div>
						<g:radioGroup name="endocrineTumoursPaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>
		</div>

		<br/>

		<h4>Maternal</h4>

		<div class="row">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Breast And Or Ovarian Cancer</label>
					<div>
						<g:radioGroup name="breastAndOrOvarianCancerMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Colorectal Cancer</label>
					<div>
						<g:radioGroup name="colorectalCancerMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ischaemic Heart Disease Or Stroke</label>
					<div>
						<g:radioGroup name="ischaemicHeartDiseaseOrStrokeMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Endocrine Tumours</label>
					<div>
						<g:radioGroup name="endocrineTumoursMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="false">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'furtherDetailsOfHistory', 'error')} ">
					<label for="furtherDetailsOfHistory" class="control-label"><g:message code="referralRecord.furtherDetailsOfHistory.label" default="Please add details and/or note any other significant family history" /></label>
					<div>
						<g:textArea class="form-control" name="furtherDetailsOfHistory" value="${referralRecordInstance?.furtherDetailsOfHistory}" rows="4" cols="40"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'furtherDetailsOfHistory', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h4>Ethnicity of immediate family</h4>

		<div class="row">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Mother</label>
					<div>
						<g:select class="form-control" id="ethnicityMother" name="ethnicityMother" from="${rdmdt.Ethnicity.list()}" optionKey="id" value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Father</label>
					<div>
						<g:select class="form-control" id="ethnicityFather" name="ethnicityFather" from="${rdmdt.Ethnicity.list()}" optionKey="id" value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Sample And Sequencing Information</h2>

		<h3>Number and identity of family members proposed for sequencing</h3>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'identityOfFamilyMembersSamplesForSeq', 'error')} ">
					<label for="identityOfFamilyMembersSamplesForSeq" class="control-label"><g:message code="referralRecord.identityOfFamilyMembersSamplesForSeq.label" default="Identity of family members (e.g. proband and both parents)"/></label>
					<div>
						<g:field class="form-control" name="identityOfFamilyMembersSamplesForSeq" type="text" value="${referralRecordInstance.identityOfFamilyMembersSamplesForSeq}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'identityOfFamilyMembersSamplesForSeq', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'numberOfSamplesForSeq', 'error')} ">
					<label for="numberOfSamplesForSeq" class="control-label"><g:message code="referralRecord.numberOfSamplesForSeq.label" default="Number of samples" /></label>
					<div>
						<g:field class="form-control" name="numberOfSamplesForSeq" type="number" min="1" value="${referralRecordInstance.numberOfSamplesForSeq}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'numberOfSamplesForSeq', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'samplesForSeqDetails', 'error')} ">
					<label for="samplesForSeqDetails" class="control-label"><g:message code="referralRecord.samplesForSeqDetails.label" default="Details of samples" /></label>
					<div>
						<g:textArea class="form-control" name="samplesForSeqDetails" value="${referralRecordInstance?.samplesForSeqDetails}" rows="4" cols="40"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'samplesForSeqDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividuals', 'error')} ">
					<label for="isAnySampleFromDeceasedIndividuals" class="control-label"><g:message code="referralRecord.isAnySampleFromDeceasedIndividuals.label" default="Is any of the samples are taken from deceased individuals?" /></label>
					<div>
						<label class="radio-inline"><input type="radio" name="isAnySampleFromDeceasedIndividuals" id="isAnySampleFromDeceasedIndividualsYes" value="true" ${referralRecordInstance.isAnySampleFromDeceasedIndividuals == true ? 'checked="checked"' : ''} onclick="showIsAnySampleFromDeceasedIndividualsDetailsOpt()">Yes</label>
						<label class="radio-inline"><input type="radio" name="isAnySampleFromDeceasedIndividuals" id="isAnySampleFromDeceasedIndividualsNo" value="false" ${referralRecordInstance.isAnySampleFromDeceasedIndividuals == false ? 'checked="checked"' : ''} onclick="hideIsAnySampleFromDeceasedIndividualsDetailsOpt()">No</label>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividuals', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="isAnySampleFromDeceasedIndividualsDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividualsDetails', 'error')} ">
					<label class="control-label">Please provide details</label>
					<div>
						<g:textField class="form-control" id="isAnySampleFromDeceasedIndividualsDetails" name="isAnySampleFromDeceasedIndividualsDetails" value="${referralRecordInstance?.isAnySampleFromDeceasedIndividualsDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividualsDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'anyIndividualsForSeqOutOfArea', 'error')} ">
					<label for="anyIndividualsForSeqOutOfArea" class="control-label"><g:message code="referralRecord.anyIndividualsForSeqOutOfArea.label" default="Are any individuals proposed for sequencing out of area?" /></label>
					<div>
						<label class="radio-inline"><input type="radio" name="anyIndividualsForSeqOutOfArea" id="anyIndividualsForSeqOutOfAreaYes" value="true" ${referralRecordInstance.anyIndividualsForSeqOutOfArea == true ? 'checked="checked"' : ''} onclick="showAnyIndividualsForSeqOutOfAreaDetailsOpt()">Yes</label>
						<label class="radio-inline"><input type="radio" name="anyIndividualsForSeqOutOfArea" id="anyIndividualsForSeqOutOfAreaNo" value="false" ${referralRecordInstance.anyIndividualsForSeqOutOfArea == false ? 'checked="checked"' : ''} onclick="hideAnyIndividualsForSeqOutOfAreaDetailsOpt()">No</label>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'anyIndividualsForSeqOutOfArea', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="anyIndividualsForSeqOutOfAreaDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'anyIndividualsForSeqOutOfAreaDetails', 'error')} ">
					<label class="control-label">Please provide details</label>
					<div>
						<g:textField class="form-control" id="anyIndividualsForSeqOutOfAreaDetails" name="anyIndividualsForSeqOutOfAreaDetails" value="${referralRecordInstance?.anyIndividualsForSeqOutOfAreaDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'anyIndividualsForSeqOutOfAreaDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h4>The default programme for whole genome sequencing is the national 100,000 Genomes Project, but other local providers may be available.  Please add any supporting information or comments regarding this, especially if this is not applicable or appropriate for any reason.
		If this case has been discussed through the Clinical Genetics Consultants Meeting, please also indicate here.</h4>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'program', 'error')} ">
					<label for="program" class="control-label"><g:message code="referralRecord.program.label" default="Program" /></label>
					<div>
						<g:select class="form-control" id="program" name="program.id" from="${rdmdt.Program.list()}" optionKey="id" value="${referralRecordInstance?.program?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'program', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'note', 'error')} ">
					<label for="note" class="control-label"><g:message code="referralRecord.note.label" default="Note" /></label>
					<div>
						<g:textArea class="form-control"  name="note" value="${referralRecordInstance?.note}" rows="4" cols="40"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'note', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<label class="control-label">Target 100,000 Genomes Project Disorder Name (enter key word)</label>
				<richui:autoComplete class="form-control" name="targetCategoryName" action="${createLinkTo('dir': 'referralRecord/searchRareDiseaseCondition')}" value="${participantInstance?.targetCategory}" onItemSelect="callCategory(id)"  maxResultsDisplayed="20" minQueryLength="2"/>
				<g:hiddenField id ="targetCategory" name ="targetCategory" value="${participantInstance?.targetCategory?.id}"/>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'eligibility', 'error')} required">
					<label for="eligibility" class="control-label">Is this patient/family eligible?</label>
					<div>
						<g:select class="form-control" id="eligibility" name="eligibility.id" from="${rdmdt.EligibilityType.list()}" optionKey="id" onchange="eligibilityDetailsOpt()" value="${referralRecordInstance?.eligibility?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'eligibility', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="eligibilityDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'eligibilityDetails', 'error')} ">
					<label class="control-label">Please provide details</label>
					<div>
						<g:textField class="form-control" id="eligibilityDetails" name="eligibilityDetails" value="${referralRecordInstance?.eligibilityDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'eligibilityDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>100,000 Genomes Project Recruitment</h2>

		<h4>The Clinical Genetics Department runs dedicated recruitment clinics for the 100,000 Genomes Project.  At your request, this application can stand as a referral for a Genetic Counsellor to consent the patient or family and collect samples through one of these clinics.  Please select from the following options below:</h4>

		<div class="row">
			<div class="col-lg-12">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'consentPatientOrFamily', 'error')} ">
					<g:radioGroup name="consentPatientOrFamily" values="['YES, I would like this application to stand as a referral to Clinical Genetics for consenting and am happy for this patient/family to be contacted immediately','YES, I would like this application to stand as a referral to Clinical Genetics for consenting but request that the patient/family are not contacted until confirmation that this can proceed is received','NO, I do not wish to refer this patient/family to Clinical Genetics for consenting']"
								  value="${referralRecordInstance.consentPatientOrFamily}"
					              labels="['YES, I would like this application to stand as a referral to Clinical Genetics for consenting and am happy for this patient/family to be contacted immediately','YES, I would like this application to stand as a referral to Clinical Genetics for consenting but request that the patient/family are not contacted until confirmation that this can proceed is received','NO, I do not wish to refer this patient/family to Clinical Genetics for consenting']">
						<p>${it.radio} &nbsp; ${it.label}</p>
					</g:radioGroup>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Status Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'referralStatus', 'error')} required">
					<label for="referralStatus" class="control-label"><g:message code="referralRecord.referralStatus.label" default="Application Status" /><span class="required-indicator">*</span></label>
					<div>
						<g:select class="form-control" id="referralStatus" name="referralStatus.id" from="${rdmdt.ReferralStatus.list().sort{it.id}}" optionKey="id" onchange="statusDetailsOpt()" required="" value="${referralRecordInstance?.referralStatus?.id}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'referralStatus', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="conditionalApprovalDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'conditionalApprovalDetails', 'error')} ">
					<label class="control-label">Please provide further details</label>
					<div>
						<g:textField class="form-control" id="conditionalApprovalDetails" name="conditionalApprovalDetails" value="${referralRecordInstance?.conditionalApprovalDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'conditionalApprovalDetails', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="approvalDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'approvalDetails', 'error')} ">
					<label class="control-label">Please specify who gets sequenced</label>
					<div>
						<g:textField class="form-control" id="approvalDetails" name="approvalDetails" value="${referralRecordInstance?.approvalDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'approvalDetails', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="notApprovedDetailsOption">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'notApprovedDetails', 'error')} ">
					<label class="control-label">Please provide further details</label>
					<div>
						<g:textField class="form-control" id="notApprovedDetails" name="notApprovedDetails" value="${referralRecordInstance?.notApprovedDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'notApprovedDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'assignedTo', 'error')} ">
					<label for="assignedTo" class="control-label"><g:message code="referralRecord.assignedTo.label" default="Assigned To" /></label>
					<div>
						<g:select class="form-control" id="assignedTo" name="assignedTo.id" from="${rdmdt.Clinician.list()}" optionKey="id" value="${referralRecordInstance?.assignedTo?.id}"  noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'assignedTo', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'reviewDetails', 'error')} ">
					<label for="reviewDetails" class="control-label"><g:message code="referralRecord.reviewDetails.label" default="Add Review" /></label>
					<div>
						<g:textArea class="form-control" name="reviewDetails" value="${referralRecordInstance?.reviewDetails}" rows="4" cols="40"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'reviewDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'proposedDiagnosis', 'error')} ">
					<label for="proposedDiagnosis" class="control-label"><g:message code="referralRecord.proposedDiagnosis.label" default="Proposed Diagnosis" /></label>
					<div>
						<g:select class="form-control" id="proposedDiagnosis" name="proposedDiagnosis.id" from="${rdmdt.OMIM.list()}" optionKey="id" value="${referralRecordInstance?.proposedDiagnosis?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'proposedDiagnosis', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'meetingDate', 'error')} ">
					<label for="meetingDate" class="control-label"><g:message code="referralRecord.meetingDate.label" default="Meeting Date" /></label>
					<div>
						<bs:datePicker name="meetingDate" precision="day"  value="${referralRecordInstance?.meetingDate}" default="none" noSelection="['': '']" />
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'meetingDate', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Extra tests requested</label>
					<div>
						<g:field class="form-control" name="extraTestsRequested" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Requested Date</label>
					<div>
						<bs:datePicker name="requestedDate" precision="day"  value="" default="none" noSelection="['': '']" />
					</div>
				</div>
			</div>
		</div>

<g:javascript plugin="jquery" library="jquery" />
<script>
	function callClinician(clinician){
		document.getElementById('clinician').value = clinician;
	}

	hideClinicalDetails();
	var count = 1;
	function hideClinicalDetails(){
		if ($("#cDetails1").val() == ""){
			$("#clinicalDetails1").hide();
		}
		if ($("#cDetails2").val() == ""){
			$("#clinicalDetails2").hide();
		}
		if ($("#cDetails3").val() == ""){
			$("#clinicalDetails3").hide();
		}
		if ($("#cDetails4").val() == ""){
			$("#clinicalDetails4").hide();
		}
		if ($("#cDetails5").val() == ""){
			$("#clinicalDetails5").hide();
		}
		if ($("#cDetails6").val() == ""){
			$("#clinicalDetails6").hide();
		}
	}

	function addClinicalDetails(){
		$("#clinicalDetails"+count).show();
		count++;
		if (count > 6){
			$("#addClinicalDetailsButton").hide();
		}
	}

	$("#coapplicantDetails").hide();
	function addCoAppButton(){
		$("#addCoapplicantDetailsButton").hide();
		$("#coapplicantDetails").show();
	}

//	hideUnrelatedClinicalFeatures();
//	var countUnrelated = 1;
//	function hideUnrelatedClinicalFeatures(){
//		if ($("#unrelatedFeature1").val() == ""){
//			$("#unrelatedClinicalFeature1").hide();
//		}
//		if ($("#unrelatedFeature2").val() == ""){
//			$("#unrelatedClinicalFeature2").hide();
//		}
//		if ($("#unrelatedFeature3").val() == ""){
//			$("#unrelatedClinicalFeature3").hide();
//		}
//		if ($("#unrelatedFeature4").val() == ""){
//			$("#unrelatedClinicalFeature4").hide();
//		}
//		if ($("#unrelatedFeature5").val() == ""){
//			$("#unrelatedClinicalFeature5").hide();
//		}
//		if ($("#unrelatedFeature6").val() == ""){
//			$("#unrelatedClinicalFeature6").hide();
//		}
//	}
//
//	function addUnrelatedClinicalFeatures(){
//		$("#unrelatedClinicalFeature"+countUnrelated).show();
//		countUnrelated++;
//		if (countUnrelated > 6){
//			$("#addUnrelatedClinicalFeatureButton").hide();
//		}
//	}

	function callCategory(targetCategory){
		document.getElementById('targetCategory').value = targetCategory;
	}

	otherEthnicityProbandOpt();
	function otherEthnicityProbandOpt(){
		var ethnicityProband = $("#ethnicityProband").val();
//		var otherEthnicityOption = $("#otherEthnicityOption").val();
		if (ethnicityProband == ${rdmdt.Ethnicity.findByEthnicityName('Other')?.id}){
			$("#otherEthnicityOption").show();
		}else{
			$("#otherEthnicityOption").hide();
			$("#otherEthnicityProband").val("");
		}
	}

	function showArrayCGHDetails(){
		$("#arrayCGHDetailsOption").show();
	}

	hideArrayCGHDetails();
	function hideArrayCGHDetails(){
		$("#arrayCGHDetailsOption").hide();
		$("#arrayCGHDetails").val("");
	}

	function showOtherFamilyMembersAffectedDetailsOpt(){
		$("#otherFamilyMembersAffectedDetailsOption").show();
	}

	hideOtherFamilyMembersAffectedDetailsOpt();
	function hideOtherFamilyMembersAffectedDetailsOpt(){
		$("#otherFamilyMembersAffectedDetailsOption").hide();
		$("#otherFamilyMembersAffectedDetails").val("");
	}

	consanguinityEvidenceDetailsOpt();
	function consanguinityEvidenceDetailsOpt(){
		var consanguinityEvidence = $("#consanguinityEvidence").val();
//		var otherEthnicityOption = $("#otherEthnicityOption").val();
		if (consanguinityEvidence == ${rdmdt.Consanguinity.findByConsanguinityEvidence('Yes')?.id}){
			$("#consanguinityEvidenceDetailsOption").show();
		}else{
			$("#consanguinityEvidenceDetailsOption").hide();
			$("#consanguinityEvidenceDetails").val("");
		}
	}

	penetranceDetailsOpt();
	function penetranceDetailsOpt(){
		var penetrance = $("#penetrance").val();
//		var otherEthnicityOption = $("#otherEthnicityOption").val();
		if (penetrance == ${rdmdt.Penetrance.findByPenetranceName('Yes')?.id}){
			$("#penetranceDetailsOption").show();
		}else{
			$("#penetranceDetailsOption").hide();
			$("#penetranceDetails").val("");
		}
	}

	function showIsAnySampleFromDeceasedIndividualsDetailsOpt(){
		$("#isAnySampleFromDeceasedIndividualsDetailsOption").show();
	}

	hideIsAnySampleFromDeceasedIndividualsDetailsOpt();
	function hideIsAnySampleFromDeceasedIndividualsDetailsOpt(){
		$("#isAnySampleFromDeceasedIndividualsDetailsOption").hide();
		$("#isAnySampleFromDeceasedIndividualsDetails").val("");
	}

	function showAnyIndividualsForSeqOutOfAreaDetailsOpt(){
		$("#anyIndividualsForSeqOutOfAreaDetailsOption").show();
	}

	hideAnyIndividualsForSeqOutOfAreaDetailsOpt();
	function hideAnyIndividualsForSeqOutOfAreaDetailsOpt(){
		$("#anyIndividualsForSeqOutOfAreaDetailsOption").hide();
		$("#anyIndividualsForSeqOutOfAreaDetails").val("");
	}

	eligibilityDetailsOpt();
	function eligibilityDetailsOpt(){
		var eligibility = $("#eligibility").val();
		if (eligibility == ${rdmdt.EligibilityType.findByEligibilityTypeName('No')?.id} || eligibility == ${rdmdt.EligibilityType.findByEligibilityTypeName('Unknown')?.id}){
			$("#eligibilityDetailsOption").show();
		}else{
			$("#eligibilityDetailsOption").hide();
			$("#eligibilityDetails").val("");
		}
	}

	statusDetailsOpt();
	function statusDetailsOpt(){
		var referralStatus = $("#referralStatus").val();
		if (referralStatus == ${rdmdt.ReferralStatus.findByReferralStatusName('Conditional Approval')?.id}){
			$("#conditionalApprovalDetailsOption").show();
			$("#approvalDetailsOption").hide();
			$("#notApprovedDetailsOption").hide();
		}else if (referralStatus == ${rdmdt.ReferralStatus.findByReferralStatusName('Approval')?.id}){
			$("#conditionalApprovalDetailsOption").hide();
			$("#approvalDetailsOption").show();
			$("#notApprovedDetailsOption").hide();
		}else if (referralStatus == ${rdmdt.ReferralStatus.findByReferralStatusName('Not Approved')?.id}){
			$("#conditionalApprovalDetailsOption").hide();
			$("#approvalDetailsOption").hide();
			$("#notApprovedDetailsOption").show();
		}else {
			$("#conditionalApprovalDetailsOption").hide();
			$("#approvalDetailsOption").hide();
			$("#notApprovedDetailsOption").hide();
		}
	}

</script>
