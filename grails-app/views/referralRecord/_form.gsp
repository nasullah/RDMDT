<%@ page import="rdmdt.EligibilityType; rdmdt.Penetrance; rdmdt.Consanguinity; rdmdt.Ethnicity; rdmdt.Gender; rdmdt.AgeUnit; rdmdt.ReferralStatus; rdmdt.Program; rdmdt.Patient; rdmdt.AttachedEvidenceType; rdmdt.RelationshipType; rdmdt.Clinician; rdmdt.ReferralRecord" %>


		<h2>Applicant Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'clinician', 'error')} required">
					<g:if test="${referralRecordInstance?.clinician?.id}">
						<label for="clinician" class="control-label"><g:message code="referralRecord.clinician.label" default="Applicant" /><span class="required-indicator">*</span></label>
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

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Responsible consultant if different (enter name)</label>
					<richui:autoComplete class="form-control"  name="consultantName" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.correspondingClinician}" onItemSelect="callCorrespondingClinician(id)"  />
					<g:hiddenField id ="correspondingClinician" name ="correspondingClinician" value="${referralRecordInstance?.clinician?.id}"/>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="addCoapplicantDetailsButton">
					<label class="control-label">Add Co-applicant</label>
					<div>
						<button type="button" id="addCoapplicantButton" class="btn btn-primary btn" value="add" onClick= 'addCoApplicants()'><span class="glyphicon glyphicon-plus"></span> Add</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="coapplicantDetails1">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Co-applicant (enter name)</label>
					<richui:autoComplete class="form-control"  name="coapplicantName1" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.coApplicants?.getAt(0)}" onItemSelect="callCoApplicant1(id)"  />
					<g:hiddenField id ="coapplicant1" name ="coapplicant1" value="${referralRecordInstance?.coApplicants?.getAt(0)?.id}"/>
				</div>
			</div>
		</div>

		<div class="row" id="coapplicantDetails2">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Co-applicant (enter name)</label>
					<richui:autoComplete class="form-control"  name="coapplicantName2" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.coApplicants?.getAt(1)}" onItemSelect="callCoApplicant2(id)"  />
					<g:hiddenField id ="coapplicant2" name ="coapplicant2" value="${referralRecordInstance?.coApplicants?.getAt(1)?.id}"/>
				</div>
			</div>
		</div>

		<div class="row" id="coapplicantDetails3">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Co-applicant (enter name)</label>
					<richui:autoComplete class="form-control"  name="coapplicantName3" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.coApplicants?.getAt(3)}" onItemSelect="callCoApplicant3(id)"  />
					<g:hiddenField id ="coapplicant3" name ="coapplicant3" value="${referralRecordInstance?.coApplicants?.getAt(2)?.id}"/>
				</div>
			</div>
		</div>

		<div class="row" id="coapplicantDetails4">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Co-applicant (enter name)</label>
					<richui:autoComplete class="form-control"  name="coapplicantName4" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.coApplicants?.getAt(3)}" onItemSelect="callCoApplicant4(id)"  />
					<g:hiddenField id ="coapplicant4" name ="coapplicant4" value="${referralRecordInstance?.coApplicants?.getAt(3)?.id}"/>
				</div>
			</div>
		</div>

		<div class="row" id="coapplicantDetails5">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Co-applicant (enter name)</label>
					<richui:autoComplete class="form-control"  name="coapplicantName4" action="${createLinkTo('dir': 'clinician/findClinician')}" value="${referralRecordInstance?.coApplicants?.getAt(4)}" onItemSelect="callCoApplicant5(id)"  />
					<g:hiddenField id ="coapplicant5" name ="coapplicant5" value="${referralRecordInstance?.coApplicants?.getAt(4)?.id}"/>
				</div>
			</div>
		</div>

		<hr/>

		<h2>About The Proband</h2>

		<div class="row">

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'givenName', 'error')} ">
					<label for="givenName" class="control-label"><g:message code="patient.givenName.label" default="Forename" /></label>
					<div>
						<g:textField class="form-control" name="givenName" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.givenName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'familyName', 'error')} ">
					<label for="familyName" class="control-label"><g:message code="patient.familyName.label" default="Surname" /></label>
					<div>
						<g:textField class="form-control" name="familyName" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.familyName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'uniqueRef', 'error')} ">
					<label for="uniqueRef" class="control-label"><g:message code="referralRecord.uniqueRef.label" default="Unique Ref (case number or other local identifier)" /></label>
					<div>
						<g:textField class="form-control" name="uniqueRef" value="${referralRecordInstance?.uniqueRef}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'uniqueRef', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'nhsNumber', 'error')} ">
					<label for="nhsNumberProband" class="control-label">NHS number of the proband<span class="required-indicator">*</span></label>
					<div>
						<g:textField class="form-control" name="nhsNumberProband" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.nhsNumber}" required=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'gender', 'error')} ">
					<label for="genderProband" class="control-label"><g:message code="patient.gender.label" default="Gender" /></label>
					<div>
						%{--<g:select class="form-control" id="genderProband" name="genderProband" from="${rdmdt.Gender.list()}" optionKey="id" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.gender?.id}" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance.patients?.find{p -> p.isProband}?.gender?.id}">
							<g:set var="genderProband" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.gender?.id}" />
						</g:if>
						<g:else>
							<g:set var="genderProband" value="" />
						</g:else>
						<g:radioGroup name="genderProband"
									  values="[Gender.findByGenderName('Male')?.id, Gender.findByGenderName('Female')?.id, Gender.findByGenderName('Not specified')?.id, Gender.findByGenderName('Not known')?.id, '']"
									  labels="[Gender.findByGenderName('Male')?.genderName, Gender.findByGenderName('Female')?.genderName, Gender.findByGenderName('Not specified')?.genderName, Gender.findByGenderName('Not known')?.genderName, 'Not entered']"
									  value="${genderProband}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'gender', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'ethnicity', 'error')} ">
					<label for="ethnicityProband" class="control-label">Ethnicity</label>
					<div>
						<g:select class="form-control" id="ethnicityProband" name="ethnicityProband" from="${Ethnicity.list()}" onchange="otherEthnicityProbandOpt()" optionKey="id" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.ethnicity?.id}" noSelection="['':'- Choose -']" />
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'ethnicity', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6" id="otherEthnicityOption">
				<div class="${hasErrors(bean: patientInstance, field: 'otherEthnicity', 'error')} ">
					<label for="otherEthnicityProband" class="control-label">Please specify</label>
					<div>
						<g:textField class="form-control" id="otherEthnicityProband" name="otherEthnicityProband" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.otherEthnicity}"/>
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
						<g:field class="form-control" name="ageProband" type="number" min="1" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.age}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div>
					<label for="egeUnitProband" class="control-label">Age unit</label>
					<div>
						%{--<g:select class="form-control" id="egeUnitProband" name="egeUnitProband" from="${AgeUnit.findAllByAgeUnitNameNotEqualAndAgeUnitNameNotEqual('Congenital', 'Prenatal')}" optionKey="id"  value="${referralRecordInstance.patients?.find{p -> p.isProband}?.ageUnit?.id}" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance.patients?.find{p -> p.isProband}?.ageUnit?.id}">
							<g:set var="egeUnitProband" value="${referralRecordInstance.patients?.find{p -> p.isProband}?.ageUnit?.id}" />
						</g:if>
						<g:else>
							<g:set var="egeUnitProband" value="" />
						</g:else>
						<g:radioGroup name="egeUnitProband"
									  values="[AgeUnit.findByAgeUnitName('Days')?.id, AgeUnit.findByAgeUnitName('Weeks')?.id, AgeUnit.findByAgeUnitName('Months')?.id, AgeUnit.findByAgeUnitName('Years')?.id, '']"
									  labels="['Days', 'Weeks', 'Months', 'Years', 'Not entered']"
									  value="${egeUnitProband}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
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
						<g:field class="form-control" name="ageOfSymptoms" type="number" min="0" value="${referralRecordInstance.ageOfSymptoms}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'ageOfSymptoms', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div>
					<label class="control-label">Unit</label>
					<div>
						%{--<g:select class="form-control" id="symptomEgeUnit" name="symptomEgeUnit.id" from="${rdmdt.AgeUnit.list()}" optionKey="id"  value="" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance?.symptomEgeUnit?.id}">
							<g:set var="symptomEgeUnit" value="${referralRecordInstance?.symptomEgeUnit?.id}" />
						</g:if>
						<g:else>
							<g:set var="symptomEgeUnit" value="" />
						</g:else>
						<g:radioGroup name="symptomEgeUnit.id"
									  values="[AgeUnit.findByAgeUnitName('Days')?.id, AgeUnit.findByAgeUnitName('Weeks')?.id, AgeUnit.findByAgeUnitName('Months')?.id, AgeUnit.findByAgeUnitName('Years')?.id, AgeUnit.findByAgeUnitName('Congenital')?.id, AgeUnit.findByAgeUnitName('Prenatal')?.id, '']"
									  labels="['Days', 'Weeks', 'Months', 'Years', 'Congenital', 'Prenatal', 'Not entered']"
									  value="${symptomEgeUnit}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div id="clinicalDetails0">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails0" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(0)?.clinicalDetailsName}"/>
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
						<g:field class="form-control" name="cDetails1" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(1)?.clinicalDetailsName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails2">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails2" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(2)?.clinicalDetailsName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails3">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails3" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(3)?.clinicalDetailsName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails4">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails4" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(4)?.clinicalDetailsName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails5">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails5" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(5)?.clinicalDetailsName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="clinicalDetails6">
					<label class="control-label">Clinical details</label>
					<div>
						<g:field class="form-control" name="cDetails6" type="text" value="${referralRecordInstance?.clinicalDetails?.getAt(6)?.clinicalDetailsName}"/>
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
					<label for="otherTestingOnProband" class="control-label">Other testing on proband (metabolic, nerve conduction, muscle/skin biopsy, etc.)</label>
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
					<label class="control-label">Is there evidence of consanguinity?</label>
					<div>
						%{--<g:select class="form-control" id="consanguinityEvidence" name="consanguinityEvidence.id" from="${rdmdt.Consanguinity.list()}" optionKey="id" onchange="consanguinityEvidenceDetailsOpt()" value="${referralRecordInstance?.consanguinityEvidence?.id}" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance?.consanguinityEvidence?.id}">
							<g:set var="consanguinityEvidence" value="${referralRecordInstance?.consanguinityEvidence?.id}" />
						</g:if>
						<g:else>
							<g:set var="consanguinityEvidence" value="" />
						</g:else>
						<g:radioGroup name="consanguinityEvidence.id"
									  values="[Consanguinity.findByConsanguinityEvidence('Yes')?.id, Consanguinity.findByConsanguinityEvidence('No')?.id, Consanguinity.findByConsanguinityEvidence('Unknown')?.id, '']"
									  labels="['Yes', 'No', 'Unknown', 'Not entered']"
									  value="${consanguinityEvidence}"
									  id="consanguinityEvidence"
									  onclick="consanguinityEvidenceDetailsOpt()">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
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
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'penetrance', 'error')} required">
					<label class="control-label">Is there evidence of reduced penetrance?</label>
					<div>
						%{--<g:select class="form-control" id="penetrance" name="penetrance.id" from="${rdmdt.Penetrance.list()}" optionKey="id" onchange="penetranceDetailsOpt()" value="${referralRecordInstance?.penetrance?.id}" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance?.penetrance?.id}">
							<g:set var="penetrance" value="${referralRecordInstance?.penetrance?.id}" />
						</g:if>
						<g:else>
							<g:set var="penetrance" value="" />
						</g:else>
						<g:radioGroup name="penetrance.id"
									  values="[Penetrance.findByPenetranceName('Yes')?.id, Penetrance.findByPenetranceName('No')?.id, Penetrance.findByPenetranceName('Unknown')?.id, '']"
									  labels="['Yes', 'No', 'Unknown', 'Not entered']"
									  value="${penetrance}"
									  id="penetrance"
									  onclick="penetranceDetailsOpt()">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
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
						<g:if test="${referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer}">
							<g:set var="breastAndOrOvarianCancerPaternal" value="${referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer}" />
						</g:if>
						<g:else>
							<g:set var="breastAndOrOvarianCancerPaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="breastAndOrOvarianCancerPaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${breastAndOrOvarianCancerPaternal}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Colorectal Cancer</label>
					<div>
						<g:if test="${referralRecordInstance?.paternal?.first()?.colorectalCancer}">
							<g:set var="colorectalCancerPaternal" value="${referralRecordInstance?.paternal?.first()?.colorectalCancer}" />
						</g:if>
						<g:else>
							<g:set var="colorectalCancerPaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="colorectalCancerPaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${colorectalCancerPaternal}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ischaemic Heart Disease Or Stroke</label>
					<div>
						<g:if test="${referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke}">
							<g:set var="ischaemicHeartDiseaseOrStrokePaternal" value="${referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke}" />
						</g:if>
						<g:else>
							<g:set var="ischaemicHeartDiseaseOrStrokePaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="ischaemicHeartDiseaseOrStrokePaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${ischaemicHeartDiseaseOrStrokePaternal}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Endocrine Tumours</label>
					<div>
						<g:if test="${referralRecordInstance?.paternal?.first()?.endocrineTumours}">
							<g:set var="endocrineTumoursPaternal" value="${referralRecordInstance?.paternal?.first()?.endocrineTumours}" />
						</g:if>
						<g:else>
							<g:set var="endocrineTumoursPaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="endocrineTumoursPaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${endocrineTumoursPaternal}">
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
						<g:if test="${referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer}">
							<g:set var="breastAndOrOvarianCancerMaternal" value="${referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer}" />
						</g:if>
						<g:else>
							<g:set var="breastAndOrOvarianCancerMaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="breastAndOrOvarianCancerMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${breastAndOrOvarianCancerMaternal}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Colorectal Cancer</label>
					<div>
						<g:if test="${referralRecordInstance?.maternal?.first()?.colorectalCancer}">
							<g:set var="colorectalCancerMaternal" value="${referralRecordInstance?.maternal?.first()?.colorectalCancer}" />
						</g:if>
						<g:else>
							<g:set var="colorectalCancerMaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="colorectalCancerMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${colorectalCancerMaternal}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ischaemic Heart Disease Or Stroke</label>
					<div>
						<g:if test="${referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke}">
							<g:set var="ischaemicHeartDiseaseOrStrokeMaternal" value="${referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke}" />
						</g:if>
						<g:else>
							<g:set var="ischaemicHeartDiseaseOrStrokeMaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="ischaemicHeartDiseaseOrStrokeMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${ischaemicHeartDiseaseOrStrokeMaternal}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Endocrine Tumours</label>
					<div>
						<g:if test="${referralRecordInstance?.maternal?.first()?.endocrineTumours}">
							<g:set var="endocrineTumoursMaternal" value="${referralRecordInstance?.maternal?.first()?.endocrineTumours}" />
						</g:if>
						<g:else>
							<g:set var="endocrineTumoursMaternal" value="${false}" />
						</g:else>
						<g:radioGroup name="endocrineTumoursMaternal"
									  values="[true, false]"
									  labels="['Yes', 'No']"
									  value="${endocrineTumoursMaternal}">
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
						<g:select class="form-control" id="ethnicityMother" name="ethnicityMother" from="${Ethnicity.list()}" optionKey="id" value="${referralRecordInstance?.patients?.find{p -> p?.relatedFrom?.relationshipType == RelationshipType.findByRelationshipTypeName('Mother')}?.ethnicity?.id}" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Father</label>
					<div>
						<g:select class="form-control" id="ethnicityFather" name="ethnicityFather" from="${Ethnicity.list()}" optionKey="id" value="${referralRecordInstance?.patients?.find{p -> p?.relatedFrom?.relationshipType == RelationshipType.findByRelationshipTypeName('Father')}?.ethnicity?.id}" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h3>Number and identity of family members proposed for sequencing</h3>

		<div class="row">
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
				<div class="${hasErrors(bean: referralRecordInstance, field: 'identityOfFamilyMembersSamplesForSeq', 'error')} ">
					<label for="identityOfFamilyMembersSamplesForSeq" class="control-label"><g:message code="referralRecord.identityOfFamilyMembersSamplesForSeq.label" default="Identity of family members (e.g. proband and both parents)"/></label>
					<div>
						<g:field class="form-control" name="identityOfFamilyMembersSamplesForSeq" type="text" value="${referralRecordInstance.identityOfFamilyMembersSamplesForSeq}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'identityOfFamilyMembersSamplesForSeq', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividuals', 'error')} ">
					<label class="control-label"><g:message code="referralRecord.isAnySampleFromDeceasedIndividuals.label" default="Are any of the samples are taken from deceased individuals?" /></label>
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
					<label class="control-label"><g:message code="referralRecord.anyIndividualsForSeqOutOfArea.label" default="Are any individuals proposed for sequencing out of area?" /></label>
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

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'samplesForSeqDetails', 'error')} ">
					<label for="samplesForSeqDetails" class="control-label">Record any further information about sample availability in the box below</label>
					<div>
						<g:textArea class="form-control" name="samplesForSeqDetails" value="${referralRecordInstance?.samplesForSeqDetails}" rows="4" cols="40"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'samplesForSeqDetails', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h4>The default programme for whole genome sequencing is the national 100,000 Genomes Project, but other local providers may be available. Please add any supporting information or comments regarding this, especially if you have a preference. If this case has been discussed through the Clinical Genetics Consultants Meeting, please also indicate here, including the date of the meeting and the selected recruitment category.</h4>

		<div class="row">
			<div class="col-lg-9">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'program', 'error')} ">
					<label class="control-label">Program</label>
					<div>
						%{--<g:select class="form-control" id="program" name="program.id" from="${Program.list()}" optionKey="id" value="${referralRecordInstance?.program?.id}" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance.program?.id}">
							<g:set var="program" value="${referralRecordInstance.program?.id}" />
						</g:if>
						<g:else>
							<g:set var="program" value="" />
						</g:else>
						<g:radioGroup name="program.id"
									  values="[Program.findByName('100,000 Genomes Project')?.id, Program.findByName('HICF2 Whole Genome Sequencing Programme')?.id, Program.findByName('Other')?.id, '']"
									  labels="['100,000 Genomes Project', 'HICF2 Whole Genome Sequencing Programme', 'Other', 'Not entered']"
									  value="${program}">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'program', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<div class="row">
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
				<label class="control-label">Target 100,000 Genomes Project Rare Disease category (enter key word)</label>
				<richui:autoComplete class="form-control" name="targetCategoryName" action="${createLinkTo('dir': 'referralRecord/searchRareDiseaseCondition')}" value="${referralRecordInstance?.targetCategory}" onItemSelect="callCategory(id)"  maxResultsDisplayed="20" minQueryLength="2"/>
				<g:hiddenField id ="targetCategory" name ="targetCategory" value="${referralRecordInstance?.targetCategory?.id}"/>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'eligibility', 'error')} required">
					<label for="eligibility" class="control-label">Is this patient/family eligible?</label>
					<div>
						%{--<g:select class="form-control" id="eligibility" name="eligibility.id" from="${EligibilityType.list()}" optionKey="id" onchange="eligibilityDetailsOpt()" value="${referralRecordInstance?.eligibility?.id}" noSelection="['':'- Choose -']"/>--}%
						<g:if test="${referralRecordInstance?.eligibility?.id}">
							<g:set var="eligibility" value="${referralRecordInstance?.eligibility?.id}" />
						</g:if>
						<g:else>
							<g:set var="eligibility" value="" />
						</g:else>
						<g:radioGroup name="eligibility.id"
									  values="[EligibilityType.findByEligibilityTypeName('Yes')?.id, EligibilityType.findByEligibilityTypeName('No')?.id, EligibilityType.findByEligibilityTypeName('Unknown')?.id, '']"
									  labels="['Yes', 'No', 'Unknown', 'Not entered']"
									  value="${eligibility}"
									  id="eligibility"
									  onclick="eligibilityDetailsOpt()">
							${it.label}  ${it.radio} &nbsp;
						</g:radioGroup>
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

		<h2>Attach evidence</h2>

		<h4>Use this feature to add test reports, images, or other supporting evidence.  This information is retained within the NHS firewall</h4>

		<div class="row">
			<div class="col-lg-6">
				<div>
					<label class="control-label">Type</label>
					<div>
						<g:select class="form-control" id="attachedEvidenceType" name="attachedEvidenceType" from="${AttachedEvidenceType.list()}" optionKey="id"  noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label  class="control-label">File</label>
					<div>
						<input type="file" id="attachedEvidenceFile" name="attachedEvidenceFile" />
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<div class="row">
			<sec:ifAnyGranted roles="ROLE_ADMIN">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: referralRecordInstance, field: 'assignedTo', 'error')} ">
						<label for="assignedTo" class="control-label"><g:message code="referralRecord.assignedTo.label" default="Assigned To" /></label>
						<div>
							<g:select class="form-control" id="assignedTo" name="assignedTo.id" from="${rdmdt.Clinician.list()}" optionKey="id" value="${referralRecordInstance?.assignedTo?.id}"  noSelection="['':'- Choose -']"/>
							<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'assignedTo', 'error')}</span>
						</div>
					</div>
				</div>
			</sec:ifAnyGranted>

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
						<g:field class="form-control" name="extraTestsRequested" type="text" value="${referralRecordInstance?.extraTests?.getAt(0)?.testName}"/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Requested Date</label>
					<div>
						<bs:datePicker name="requestedDate" precision="day"  value="${referralRecordInstance?.extraTests?.getAt(0)?.requestedDate}" default="none" noSelection="['': '']" />
					</div>
				</div>
			</div>
		</div>

		<sec:ifAnyGranted roles="ROLE_ADMIN">
			<hr/>

			<h2><mark>Admin Section</mark></h2>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: referralRecordInstance, field: 'referralStatus', 'error')} required">
						<label for="referralStatus" class="control-label"><g:message code="referralRecord.referralStatus.label" default="Application Status" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="referralStatus" name="referralStatus.id" from="${rdmdt.ReferralStatus.list().sort{it.id}}" optionKey="id" onchange="statusDetailsOpt()" value="${referralRecordInstance?.referralStatus?.id}" noSelection="['':'- Choose -']"/>
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

			<div class="row" id="approvedProgramDetails">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: referralRecordInstance, field: 'approvedProgram', 'error')} ">
						<label for="approvedProgram" class="control-label">Approved Program</label>
						<div>
							<g:select class="form-control" id="approvedProgram" name="approvedProgram.id" from="${Program.list()}" optionKey="id" value="${referralRecordInstance?.approvedProgram?.id}" noSelection="['':'- Choose -']"/>
							<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'approvedProgram', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<label class="control-label">Approved Target 100,000 Genomes Project Rare Disease category (enter key word)</label>
					<richui:autoComplete class="form-control" name="approvedTargetCategoryName" action="${createLinkTo('dir': 'referralRecord/searchRareDiseaseCondition')}" value="${referralRecordInstance?.approvedTargetCategory}" onItemSelect="callApprovedTargetCategory(id)"  maxResultsDisplayed="20" minQueryLength="2"/>
					<g:hiddenField id ="approvedTargetCategory" name ="approvedTargetCategory" value="${referralRecordInstance?.approvedTargetCategory?.id}"/>
				</div>
			</div>

			<hr/>

		</sec:ifAnyGranted>

<g:javascript plugin="jquery" library="jquery" />
<script>
	function callClinician(clinician){
		document.getElementById('clinician').value = clinician;
	}

	function callCorrespondingClinician(correspondingClinician){
		document.getElementById('correspondingClinician').value = correspondingClinician;
	}

	function callCoApplicant1(coapplican){
		document.getElementById('coapplicant1').value = coapplican;
	}

	function callCoApplicant2(coapplican){
		document.getElementById('coapplicant2').value = coapplican;
	}

	function callCoApplicant3(coapplican){
		document.getElementById('coapplicant3').value = coapplican;
	}

	function callCoApplicant4(coapplican){
		document.getElementById('coapplicant4').value = coapplican;
	}

	function callCoApplicant5(coapplican){
		document.getElementById('coapplicant5').value = coapplican;
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

	hideCoApplicants();
	var countCoApplicants = 1;
	function hideCoApplicants(){
		if ($("#coapplicant1").val() == ""){
			$("#coapplicantDetails1").hide();
		}
		if ($("#coapplicant2").val() == ""){
			$("#coapplicantDetails2").hide();
		}
		if ($("#coapplicant3").val() == ""){
			$("#coapplicantDetails3").hide();
		}
		if ($("#coapplicant4").val() == ""){
			$("#coapplicantDetails4").hide();
		}
		if ($("#coapplicant5").val() == ""){
			$("#coapplicantDetails5").hide();
		}
	}

	function addCoApplicants(){
		$("#coapplicantDetails"+countCoApplicants).show();
		countCoApplicants++;
		if (countCoApplicants > 5){
			$("#addCoapplicantDetailsButton").hide();
		}
	}

	function callCategory(targetCategory){
		document.getElementById('targetCategory').value = targetCategory;
	}

	function callApprovedTargetCategory(approvedTargetCategory){
		document.getElementById('approvedTargetCategory').value = approvedTargetCategory;
	}

	otherEthnicityProbandOpt();
	function otherEthnicityProbandOpt(){
		var ethnicityProband = $("#ethnicityProband").val();
//		var otherEthnicityOption = $("#otherEthnicityOption").val();
		if (ethnicityProband == ${Ethnicity.findByEthnicityName('Other')?.id}){
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
		if ($('input:radio[name=arrayCGH]:checked').val() != 'true'){
			$("#arrayCGHDetailsOption").hide();
			$("#arrayCGHDetails").val("");
		}
	}

	function showOtherFamilyMembersAffectedDetailsOpt(){
		$("#otherFamilyMembersAffectedDetailsOption").show();
	}

	hideOtherFamilyMembersAffectedDetailsOpt();
	function hideOtherFamilyMembersAffectedDetailsOpt(){
		if ($('input:radio[name=otherFamilyMembersAffected]:checked').val() != 'true'){
			$("#otherFamilyMembersAffectedDetailsOption").hide();
			$("#otherFamilyMembersAffectedDetails").val("");
		}
	}

	consanguinityEvidenceDetailsOpt();
	function consanguinityEvidenceDetailsOpt(){
		var consanguinityEvidence = $('input:radio[id=consanguinityEvidence]:checked').val();
		if (consanguinityEvidence == ${Consanguinity.findByConsanguinityEvidence('Yes')?.id}){
			$("#consanguinityEvidenceDetailsOption").show();
		}else{
			$("#consanguinityEvidenceDetailsOption").hide();
			$("#consanguinityEvidenceDetails").val("");
		}
	}

	penetranceDetailsOpt();
	function penetranceDetailsOpt(){
		var penetrance = $('input:radio[id=penetrance]:checked').val();
		if (penetrance == ${Penetrance.findByPenetranceName('Yes')?.id}){
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
		if ($('input:radio[name=isAnySampleFromDeceasedIndividuals]:checked').val() != 'true'){
			$("#isAnySampleFromDeceasedIndividualsDetailsOption").hide();
			$("#isAnySampleFromDeceasedIndividualsDetails").val("");
		}
	}

	function showAnyIndividualsForSeqOutOfAreaDetailsOpt(){
		$("#anyIndividualsForSeqOutOfAreaDetailsOption").show();
	}

	hideAnyIndividualsForSeqOutOfAreaDetailsOpt();
	function hideAnyIndividualsForSeqOutOfAreaDetailsOpt(){
		if ($('input:radio[name=anyIndividualsForSeqOutOfArea]:checked').val() != 'true'){
			$("#anyIndividualsForSeqOutOfAreaDetailsOption").hide();
			$("#anyIndividualsForSeqOutOfAreaDetails").val("");
		}
	}

	eligibilityDetailsOpt();
	function eligibilityDetailsOpt(){
		var eligibility = $('input:radio[id=eligibility]:checked').val();
		if (eligibility == ${EligibilityType.findByEligibilityTypeName('No')?.id} || eligibility == ${EligibilityType.findByEligibilityTypeName('Unknown')?.id}){
			$("#eligibilityDetailsOption").show();
		}else{
			$("#eligibilityDetailsOption").hide();
			$("#eligibilityDetails").val("");
		}
	}

	statusDetailsOpt();
	function statusDetailsOpt(){
		var referralStatus = $("#referralStatus").val();
		if (referralStatus == ${ReferralStatus.findByReferralStatusName('Conditional Approval')?.id}){
			$("#conditionalApprovalDetailsOption").show();
			$("#approvedProgramDetails").show();
			$("#approvalDetailsOption").hide();
			$("#approvalDetails").val("");
			$("#notApprovedDetailsOption").hide();
			$("#notApprovedDetails").val("");
		}else if (referralStatus == ${ReferralStatus.findByReferralStatusName('Approval')?.id}){
			$("#conditionalApprovalDetailsOption").hide();
			$("#conditionalApprovalDetails").val("");
			$("#approvalDetailsOption").show();
			$("#approvedProgramDetails").show();
			$("#notApprovedDetailsOption").hide();
			$("#notApprovedDetails").val("");
		}else if (referralStatus == ${ReferralStatus.findByReferralStatusName('Not Approved')?.id}){
			$("#conditionalApprovalDetailsOption").hide();
			$("#conditionalApprovalDetails").val("");
			$("#approvalDetailsOption").hide();
			$("#approvalDetails").val("");
			$("#approvedProgramDetails").hide();
			$("#approvedProgram").val("");
			$("#approvedTargetCategory").val("");
			$("#approvedTargetCategoryName").val("");
			$("#notApprovedDetailsOption").show();
		}else {
			$("#conditionalApprovalDetailsOption").hide();
			$("#conditionalApprovalDetails").val("");
			$("#approvalDetailsOption").hide();
			$("#approvalDetails").val("");
			$("#notApprovedDetailsOption").hide();
			$("#notApprovedDetails").val("");
			$("#approvedProgram").val("");
			$("#approvedTargetCategory").val("");
			$("#approvedTargetCategoryName").val("");
			$("#approvedProgramDetails").hide();
		}
	}

</script>
