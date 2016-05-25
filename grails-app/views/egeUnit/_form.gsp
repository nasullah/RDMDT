<%@ page import="rdmdt.EgeUnit" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: egeUnitInstance, field: 'egeUnitName', 'error')} ">
						<label for="egeUnitName" class="control-label"><g:message code="egeUnit.egeUnitName.label" default="Age Unit Name" /></label>
						<div>
							<g:textField class="form-control" name="egeUnitName" value="${egeUnitInstance?.egeUnitName}"/>
							<span class="help-inline">${hasErrors(bean: egeUnitInstance, field: 'egeUnitName', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

