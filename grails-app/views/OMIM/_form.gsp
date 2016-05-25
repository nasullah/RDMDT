<%@ page import="rdmdt.OMIM" %>



			<div class="row">
				<div class="col-lg-6">
					<div class="${hasErrors(bean: OMIMInstance, field: 'term', 'error')} ">
						<label for="term" class="control-label"><g:message code="OMIM.term.label" default="Term" /></label>
						<div>
							<g:textField class="form-control" name="term" value="${OMIMInstance?.term}"/>
							<span class="help-inline">${hasErrors(bean: OMIMInstance, field: 'term', 'error')}</span>
						</div>
					</div>
				</div>
			</div>

