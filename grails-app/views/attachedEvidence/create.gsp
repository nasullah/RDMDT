<%@ page import="rdmdt.AttachedEvidence" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'attachedEvidence.label', default: 'Attached Evidence')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-attachedEvidence" class="first">

		<g:hasErrors bean="${attachedEvidenceInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${attachedEvidenceInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:uploadForm action="save" class="form-horizontal" role="form" >
			<g:render template="form"/>

			<div class="form-actions margin-top-medium">
				<g:submitButton name="create" class="btn btn-primary" value="Save" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:uploadForm>

	</section>

<hr/>

</body>

</html>
