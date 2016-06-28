<%@ page import="rdmdt.Centre; rdmdt.Clinician" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: clinicianInstance, field: 'name', 'error')} ">
						<label for="name" class="control-label"><g:message code="clinician.name.label" default="Name" /><span class="required-indicator">*</span></label>
						<div>
							<g:textField class="form-control" name="name" value="${clinicianInstance?.name}" required=""/>
							<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'name', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: clinicianInstance, field: 'email', 'error')} ">
						<label for="email" class="control-label"><g:message code="clinician.email.label" default="Email" /></label>
						<div>
							<g:textField class="form-control" name="email" value="${clinicianInstance?.email}"/>
							<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'email', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: clinicianInstance, field: 'telephone', 'error')} ">
						<label for="telephone" class="control-label"><g:message code="clinician.telephone.label" default="Telephone" /></label>
						<div>
							<g:textField class="form-control" name="telephone" value="${clinicianInstance?.telephone}"/>
							<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'telephone', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: clinicianInstance, field: 'centre', 'error')} required">
						<label for="centre" class="control-label"><g:message code="clinician.centre.label" default="Centre" /><span class="required-indicator">*</span></label>
						<div>
							<g:select class="form-control" id="centre" name="centre.id" from="${Centre.list()}" optionKey="id" required="" value="${clinicianInstance?.centre?.id}" />
							<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'centre', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: clinicianInstance, field: 'departmentName', 'error')} ">
						<label for="departmentName" class="control-label"><g:message code="clinician.departmentName.label" default="Department Name" /><span class="required-indicator">*</span></label>
						<div>
							<g:textField class="form-control" name="departmentName" value="${clinicianInstance?.departmentName}" required=""/>
							<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'departmentName', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: clinicianInstance, field: 'speciality', 'error')} ">
						<label for="speciality" class="control-label"><g:message code="clinician.speciality.label" default="Speciality" /><span class="required-indicator">*</span></label>
						<div>
							<g:textField class="form-control" name="speciality" value="${clinicianInstance?.speciality}" required=""/>
							<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'speciality', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

			%{--<div class="${hasErrors(bean: clinicianInstance, field: 'actingClinician', 'error')} ">--}%
				%{--<label for="actingClinician" class="control-label"><g:message code="clinician.actingClinician.label" default="Acting Clinician" /></label>--}%
				%{--<div>--}%
					%{--<g:select class="form-control" id="actingClinician" name="actingClinician.id" from="${rdmdt.ActingClinician.list()}" optionKey="id" value="${clinicianInstance?.actingClinician?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
					%{--<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'actingClinician', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: clinicianInstance, field: 'membership', 'error')} ">--}%
				%{--<label for="membership" class="control-label"><g:message code="clinician.membership.label" default="Membership" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${clinicianInstance?.membership?}" var="m">--}%
    %{--<li><g:link controller="membership" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="membership" action="create" params="['clinician.id': clinicianInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'membership.label', default: 'Membership')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'membership', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

			%{--<div class="${hasErrors(bean: clinicianInstance, field: 'referralRecords', 'error')} ">--}%
				%{--<label for="referralRecords" class="control-label"><g:message code="clinician.referralRecords.label" default="Referral Records" /></label>--}%
				%{--<div>--}%
					%{----}%
%{--<ul class="one-to-many">--}%
%{--<g:each in="${clinicianInstance?.referralRecords?}" var="r">--}%
    %{--<li><g:link controller="referralRecord" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--<li class="add">--}%
%{--<g:link controller="referralRecord" action="create" params="['clinician.id': clinicianInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'referralRecord.label', default: 'ReferralRecord')])}</g:link>--}%
%{--</li>--}%
%{--</ul>--}%

					%{--<span class="help-inline">${hasErrors(bean: clinicianInstance, field: 'referralRecords', 'error')}</span>--}%
				%{--</div>--}%
			%{--</div>--}%

