<%@ page import="rdmdt.RelationshipType; rdmdt.Clinician; rdmdt.ReferralRecord" %>


		<hr/>

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
		</div>

		<hr/>

		<h2>Patient Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'uniqueRef', 'error')} ">
					<label for="uniqueRef" class="control-label"><g:message code="referralRecord.uniqueRef.label" default="Unique Ref" /><span class="required-indicator">*</span></label>
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
					<label for="genderProband" class="control-label"><g:message code="patient.gender.label" default="Gender of the proband" /></label>
					<div>
						<g:select class="form-control" id="genderProband" name="genderProband" from="${rdmdt.Gender.list()}" optionKey="id" value="${patientInstance?.gender?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'gender', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'ethnicity', 'error')} ">
					<label for="ethnicityProband" class="control-label"><g:message code="patient.ethnicity.label" default="Ethnicity of the proband" /><span class="required-indicator">*</span></label>
					<div>
						<g:select class="form-control" id="ethnicityProband" name="ethnicityProband" from="${rdmdt.Ethnicity.list()}" required="" optionKey="id" value="${patientInstance?.ethnicity?.id}" noSelection="['':'- Choose -']" />
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'ethnicity', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: patientInstance, field: 'otherEthnicity', 'error')} ">
					<label for="otherEthnicityProband" class="control-label"><g:message code="patient.otherEthnicity.label" default="Other ethnicity of the proband" /></label>
					<div>
						<g:textField class="form-control" name="otherEthnicityProband" value="${patientInstance?.otherEthnicity}"/>
						<span class="help-inline">${hasErrors(bean: patientInstance, field: 'otherEthnicity', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div>
					<label for="ageProband" class="control-label">Age of the proband</label>
					<div>
						<g:field class="form-control" name="ageProband" type="number" value=""/>
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

		<h2>Disease Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'disorderName', 'error')} ">
					<label for="disorderName" class="control-label"><g:message code="referralRecord.disorderName.label" default="Disorder name" /><span class="required-indicator">*</span></label>
					<div>
						<g:textField class="form-control" name="disorderName" value="${referralRecordInstance?.disorderName}" required=""/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'disorderName', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'causativeVariantAffect', 'error')} ">
					<label for="causativeVariantAffect" class="control-label"><g:message code="referralRecord.causativeVariantAffect.label" default="Causative variant affect" /></label>
					<div>
						<g:textField class="form-control" name="causativeVariantAffect" value="${referralRecordInstance?.causativeVariantAffect}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'causativeVariantAffect', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'knownGeneVariant', 'error')} ">
					<label for="knownGeneVariant" class="control-label"><g:message code="referralRecord.knownGeneVariant.label" default="Known gene variant" /></label>
					<div>
						<g:textField class="form-control" name="knownGeneVariant" value="${referralRecordInstance?.knownGeneVariant}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'knownGeneVariant', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'ageOfSymptoms', 'error')} ">
					<label for="ageOfSymptoms" class="control-label"><g:message code="referralRecord.ageOfSymptoms.label" default="Age of onset of symptoms in the proband" /></label>
					<div>
						<g:field class="form-control" name="ageOfSymptoms" type="number" value="${referralRecordInstance.ageOfSymptoms}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'ageOfSymptoms', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div>
					<label for="ageOfSymptomsUnit" class="control-label">Unit</label>
					<div>
						<g:select class="form-control" id="symptomEgeUnit" name="symptomEgeUnit.id" from="${rdmdt.EgeUnit.list()}" optionKey="id"  value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Clinical Information</h2>

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

		<hr/>

		<h2>Unrelated Clinical Feature</h2>

		<div class="row">
			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature0">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature0" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="addUnrelatedClinicalFeatureButton">
					<label class="control-label">Add More Unrelated Clinical Feature</label>
					<div>
						<button type="button" id="unrelatedFeatureButton" class="btn btn-primary btn" value="add" onClick= 'addUnrelatedClinicalFeatures()'><span class="glyphicon glyphicon-plus"></span> Add</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature1">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature1" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature2">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature2" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature3">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature3" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature4">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature4" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature5">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature5" type="text" value=""/>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div id="unrelatedClinicalFeature6">
					<label class="control-label">Unrelated Clinical Feature</label>
					<div>
						<g:field class="form-control" name="unrelatedFeature6" type="text" value=""/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'geneticTestingOnProband', 'error')} ">
					<label for="geneticTestingOnProband" class="control-label"><g:message code="referralRecord.geneticTestingOnProband.label" default="Genetic Testing On Proband" /></label>
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

			<g:if test="${referralRecordInstance?.pedigree == null}">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: referralRecordInstance, field: 'pedigree', 'error')} ">
						<label for="pedigree" class="control-label"><g:message code="referralRecord.pedigree.label" default="Pedigree" /></label>
						<div>
							<input type="file" id="pedigreeFile" name="pedigreeFile" />
							<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'pedigree', 'error')}</span>
						</div>
					</div>
				</div>
			</g:if>
		</div>

		<hr/>

		<h2>Family History</h2>

		<h3>Paternal</h3>

		<div class="row">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Breast And Or Ovarian Cancer</label>
					<div>
						<bs:checkBox name="breastAndOrOvarianCancerPaternal" value="${referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer}" onLabel="Yes" offLabel="No" />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Colorectal Cancer</label>
					<div>
						<bs:checkBox name="colorectalCancerPaternal" value="${referralRecordInstance?.paternal?.first()?.colorectalCancer}" onLabel="Yes" offLabel="No"  />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ischaemic Heart Disease Or Stroke</label>
					<div>
						<bs:checkBox name="ischaemicHeartDiseaseOrStrokePaternal" value="${referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke}" onLabel="Yes" offLabel="No"  />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Endocrine Tumours</label>
					<div>
						<bs:checkBox name="endocrineTumoursPaternal" value="${referralRecordInstance?.paternal?.first()?.endocrineTumours}" onLabel="Yes" offLabel="No" />
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h3>Maternal</h3>

		<div class="row">
			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Breast And Or Ovarian Cancer</label>
					<div>
						<bs:checkBox name="breastAndOrOvarianCancerMaternal" value="${referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer}" onLabel="Yes" offLabel="No" />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Colorectal Cancer</label>
					<div>
						<bs:checkBox name="colorectalCancerMaternal" value="${referralRecordInstance?.maternal?.first()?.colorectalCancer}" onLabel="Yes" offLabel="No"  />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ischaemic Heart Disease Or Stroke</label>
					<div>
						<bs:checkBox name="ischaemicHeartDiseaseOrStrokeMaternal" value="${referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke}" onLabel="Yes" offLabel="No"  />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Endocrine Tumours</label>
					<div>
						<bs:checkBox name="endocrineTumoursMaternal" value="${referralRecordInstance?.maternal?.first()?.endocrineTumours}" onLabel="Yes" offLabel="No" />
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'furtherDetailsOfHistory', 'error')} ">
					<label for="furtherDetailsOfHistory" class="control-label"><g:message code="referralRecord.furtherDetailsOfHistory.label" default="Further Details of History" /></label>
					<div>
						<g:textArea class="form-control" name="furtherDetailsOfHistory" value="${referralRecordInstance?.furtherDetailsOfHistory}" rows="4" cols="40"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'furtherDetailsOfHistory', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Family Members</h2>

		<div class="row">
			<div class="col-lg-4">
				<div class="">
				<label class="control-label">Relationship to Proband</label>
					<div>
						<g:select class="form-control" id="relationshipToProband1" name="relationshipToProband1" from="${RelationshipType.list()}" optionKey="id" value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>

			<div class="col-lg-2">
				<div class="">
					<label  class="control-label">Available For OAR</label>
					<div>
						<bs:checkBox name="availableForOAR1" value="${referralRecordInstance?.patients?.availableForOAR}"  onLabel="Yes" offLabel="No" />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ethnicity if different</label>
					<div>
						<g:select class="form-control" id="ethnicity1" name="ethnicity1" from="${rdmdt.Ethnicity.list()}" optionKey="id" value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="">
					<label class="control-label">Relationship to Proband</label>
					<div>
						<g:select class="form-control" id="relationshipToProband2" name="relationshipToProband2" from="${RelationshipType.list()}" optionKey="id" value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>

			<div class="col-lg-2">
				<div class="">
					<label  class="control-label">Available For OAR</label>
					<div>
						<bs:checkBox name="availableForOAR2" value="${referralRecordInstance?.patients?.availableForOAR}"  onLabel="Yes" offLabel="No" />
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="">
					<label class="control-label">Ethnicity if different</label>
					<div>
						<g:select class="form-control" id="ethnicity2" name="ethnicity2" from="${rdmdt.Ethnicity.list()}" optionKey="id" value="" noSelection="['':'- Choose -']"/>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Sample Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividuals', 'error')} ">
					<label for="isAnySampleFromDeceasedIndividuals" class="control-label"><g:message code="referralRecord.isAnySampleFromDeceasedIndividuals.label" default="Is any of the samples are taken from deceased individuals" /></label>
					<div>
						<bs:checkBox name="isAnySampleFromDeceasedIndividuals" value="${referralRecordInstance?.isAnySampleFromDeceasedIndividuals}" onLabel="Yes" offLabel="No" />
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'isAnySampleFromDeceasedIndividuals', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'numberOfSamplesForSeq', 'error')} ">
					<label for="numberOfSamplesForSeq" class="control-label"><g:message code="referralRecord.numberOfSamplesForSeq.label" default="Number of samples proposed for sequencing" /></label>
					<div>
						<g:field class="form-control" name="numberOfSamplesForSeq" type="number" value="${referralRecordInstance.numberOfSamplesForSeq}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'numberOfSamplesForSeq', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'samplesForSeqDetails', 'error')} ">
					<label for="samplesForSeqDetails" class="control-label"><g:message code="referralRecord.samplesForSeqDetails.label" default="Details of samples proposed for sequencing" /></label>
					<div>
						<g:field class="form-control" name="samplesForSeqDetails" type="text" value="${referralRecordInstance.samplesForSeqDetails}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'samplesForSeqDetails', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'numberOfSampleOtherRel', 'error')} ">
					<label for="numberOfSampleOtherRel" class="control-label"><g:message code="referralRecord.numberOfSampleOtherRel.label" default="Number of Sample Other Relatives" /></label>
					<div>
						<g:field class="form-control" name="numberOfSampleOtherRel" type="number" value="${referralRecordInstance.numberOfSampleOtherRel}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'numberOfSampleOtherRel', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'consanguinityEvidence', 'error')} required">
					<label for="consanguinityEvidence" class="control-label"><g:message code="referralRecord.consanguinityEvidence.label" default="Consanguinity Evidence" /></label>
					<div>
						<g:select class="form-control" id="consanguinityEvidence" name="consanguinityEvidence.id" from="${rdmdt.Consanguinity.list()}" optionKey="id" value="${referralRecordInstance?.consanguinityEvidence?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'consanguinityEvidence', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'penetrance', 'error')} required">
					<label for="penetrance" class="control-label"><g:message code="referralRecord.penetrance.label" default="Penetrance" /></label>
					<div>
						<g:select class="form-control" id="penetrance" name="penetrance.id" from="${rdmdt.Penetrance.list()}" optionKey="id" value="${referralRecordInstance?.penetrance?.id}" noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'penetrance', 'error')}</span>
					</div>
				</div>
			</div>
		</div>

		<hr/>

		<h2>Status Information</h2>

		<div class="row">
			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'referralStatus', 'error')} required">
					<label for="referralStatus" class="control-label"><g:message code="referralRecord.referralStatus.label" default="Referral Status" /><span class="required-indicator">*</span></label>
					<div>
						<g:select class="form-control" id="referralStatus" name="referralStatus.id" from="${rdmdt.ReferralStatus.list().sort{it.id}}" optionKey="id" required="" value="${referralRecordInstance?.referralStatus?.id}"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'referralStatus', 'error')}</span>
					</div>
				</div>
			</div>

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
				<div class="${hasErrors(bean: referralRecordInstance, field: 'assignedTo', 'error')} ">
					<label for="assignedTo" class="control-label"><g:message code="referralRecord.assignedTo.label" default="Assigned To" /></label>
					<div>
						<g:select class="form-control" id="assignedTo" name="assignedTo.id" from="${rdmdt.Clinician.list()}" optionKey="id" value="${referralRecordInstance?.assignedTo?.id}"  noSelection="['':'- Choose -']"/>
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'assignedTo', 'error')}</span>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="${hasErrors(bean: referralRecordInstance, field: 'assignedOn', 'error')} ">
					<label for="assignedOn" class="control-label"><g:message code="referralRecord.assignedOn.label" default="Assigned on" /></label>
					<div>
						<bs:datePicker name="assignedOn" precision="day"  value="${referralRecordInstance?.assignedOn}" default="none" noSelection="['': '']" />
						<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'assignedOn', 'error')}</span>
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

	hideUnrelatedClinicalFeatures();
	var countUnrelated = 1;
	function hideUnrelatedClinicalFeatures(){
		if ($("#unrelatedFeature1").val() == ""){
			$("#unrelatedClinicalFeature1").hide();
		}
		if ($("#unrelatedFeature2").val() == ""){
			$("#unrelatedClinicalFeature2").hide();
		}
		if ($("#unrelatedFeature3").val() == ""){
			$("#unrelatedClinicalFeature3").hide();
		}
		if ($("#unrelatedFeature4").val() == ""){
			$("#unrelatedClinicalFeature4").hide();
		}
		if ($("#unrelatedFeature5").val() == ""){
			$("#unrelatedClinicalFeature5").hide();
		}
		if ($("#unrelatedFeature6").val() == ""){
			$("#unrelatedClinicalFeature6").hide();
		}
	}

	function addUnrelatedClinicalFeatures(){
		$("#unrelatedClinicalFeature"+countUnrelated).show();
		countUnrelated++;
		if (countUnrelated > 6){
			$("#addUnrelatedClinicalFeatureButton").hide();
		}
	}

</script>

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'attachedEvidence', 'error')} ">--}%
				%{--<label for="attachedEvidence" class="control-label"><g:message code="referralRecord.attachedEvidence.label" default="Attached Evidence" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${referralRecordInstance?.attachedEvidence?}" var="a">--}%
    %{--<li><g:link controller="attachedEvidence" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="attachedEvidence" action="create" params="['referralRecord.id': referralRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attachedEvidence.label', default: 'AttachedEvidence')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'attachedEvidence', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'clinicalDetails', 'error')} ">--}%
				%{--<label for="clinicalDetails" class="control-label"><g:message code="referralRecord.clinicalDetails.label" default="Clinical Details" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${referralRecordInstance?.clinicalDetails?}" var="c">--}%
    %{--<li><g:link controller="clinicalDetails" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="clinicalDetails" action="create" params="['referralRecord.id': referralRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clinicalDetails.label', default: 'ClinicalDetails')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'clinicalDetails', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'extraTests', 'error')} required">--}%
				%{--<label for="extraTests" class="control-label"><g:message code="referralRecord.extraTests.label" default="Extra Tests" /><span class="required-indicator">*</span></label>--}%
				%{--<div>--}%
					%{--<g:select class="form-control" id="extraTests" name="extraTests.id" from="${rdmdt.ExtraTests.list()}" optionKey="id" required="" value="${referralRecordInstance?.extraTests?.id}" class="many-to-one"/>--}%
					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'extraTests', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'maternal', 'error')} ">--}%
				%{--<label for="maternal" class="control-label"><g:message code="referralRecord.maternal.label" default="Maternal" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${referralRecordInstance?.maternal?}" var="m">--}%
    %{--<li><g:link controller="maternal" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="maternal" action="create" params="['referralRecord.id': referralRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'maternal.label', default: 'Maternal')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'maternal', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'paternal', 'error')} ">--}%
				%{--<label for="paternal" class="control-label"><g:message code="referralRecord.paternal.label" default="Paternal" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${referralRecordInstance?.paternal?}" var="p">--}%
    %{--<li><g:link controller="paternal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="paternal" action="create" params="['referralRecord.id': referralRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'paternal.label', default: 'Paternal')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'paternal', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'patients', 'error')} ">--}%
				%{--<label for="patients" class="control-label"><g:message code="referralRecord.patients.label" default="Patients" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${referralRecordInstance?.patients?}" var="p">--}%
    %{--<li><g:link controller="patient" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="patient" action="create" params="['referralRecord.id': referralRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'patient.label', default: 'Patient')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'patients', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: referralRecordInstance, field: 'unrelatedClinicalFeatures', 'error')} ">--}%
				%{--<label for="unrelatedClinicalFeatures" class="control-label"><g:message code="referralRecord.unrelatedClinicalFeatures.label" default="Unrelated Clinical Features" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${referralRecordInstance?.unrelatedClinicalFeatures?}" var="u">--}%
    %{--<li><g:link controller="unrelatedClinicalFeatures" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="unrelatedClinicalFeatures" action="create" params="['referralRecord.id': referralRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unrelatedClinicalFeatures.label', default: 'UnrelatedClinicalFeatures')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: referralRecordInstance, field: 'unrelatedClinicalFeatures', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

