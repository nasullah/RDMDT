<%@ page import="rdmdt.Program" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: programInstance, field: 'name', 'error')} ">
						<label for="name" class="control-label"><g:message code="program.name.label" default="Name" /><span class="required-indicator">*</span></label>
						<div>
							<g:textField class="form-control" name="name" value="${programInstance?.name}" required=""/>
							<span class="help-inline">${hasErrors(bean: programInstance, field: 'name', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: programInstance, field: 'email', 'error')} ">
						<label for="email" class="control-label"><g:message code="program.email.label" default="Email" /></label>
						<div>
							<g:textField class="form-control" name="email" value="${programInstance?.email}"/>
							<span class="help-inline">${hasErrors(bean: programInstance, field: 'email', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: programInstance, field: 'telephone', 'error')} ">
						<label for="telephone" class="control-label"><g:message code="program.telephone.label" default="Telephone" /></label>
						<div>
							<g:textField class="form-control" name="telephone" value="${programInstance?.telephone}"/>
							<span class="help-inline">${hasErrors(bean: programInstance, field: 'telephone', 'error')}</span>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="${hasErrors(bean: programInstance, field: 'description', 'error')} ">
						<label for="description" class="control-label"><g:message code="program.description.label" default="Description" /></label>
						<div>
							<g:textField class="form-control" name="description" value="${programInstance?.description}"/>
							<span class="help-inline">${hasErrors(bean: programInstance, field: 'description', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

