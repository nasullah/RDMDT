<%@ page import="rdmdt.AttachedEvidence" %>



			<div class="${hasErrors(bean: attachedEvidenceInstance, field: 'referralRecord', 'error')} required">
				<label for="referralRecord" class="control-label"><g:message code="attachedEvidence.referralRecord.label" default="Referral Record" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="referralRecord" name="referralRecord.id" from="${rdmdt.ReferralRecord.list()}" optionKey="id" required="" value="${attachedEvidenceInstance?.referralRecord?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: attachedEvidenceInstance, field: 'referralRecord', 'error')}</span>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: attachedEvidenceInstance, field: 'addedOn', 'error')} ">
						<label for="addedOn" class="control-label"><g:message code="attachedEvidence.addedOn.label" default="Added On" /></label>
						<div>
							<bs:datePicker name="addedOn" precision="day"  value="${attachedEvidenceInstance?.addedOn}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: attachedEvidenceInstance, field: 'addedOn', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: attachedEvidenceInstance, field: 'type', 'error')} required">
						<label for="type" class="control-label"><g:message code="attachedEvidence.type.label" default="Type" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="type" name="type.id" from="${rdmdt.AttachedEvidenceType.list()}" optionKey="id" required="" value="${attachedEvidenceInstance?.type?.id}"/>
							<span class="help-inline">${hasErrors(bean: attachedEvidenceInstance, field: 'type', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: attachedEvidenceInstance, field: 'content', 'error')} ">
						<label for="content" class="control-label"><g:message code="attachedEvidence.content.label" default="Content" /></label>
						<div>
							<g:textField class="form-control" name="content" value="${attachedEvidenceInstance?.content}"/>
							<span class="help-inline">${hasErrors(bean: attachedEvidenceInstance, field: 'content', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

