<%@ page import="rdmdt.Clinician" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>Edit Your Profile</title>
</head>

<body>

	<section id="edit-clinician" class="first">

		<g:hasErrors bean="${clinicianInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${clinicianInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form method="post" class="form-horizontal" role="form" >
			<g:hiddenField name="id" value="${clinicianInstance?.id}" />
			<g:hiddenField name="version" value="${clinicianInstance?.version}" />
			<g:hiddenField name="_method" value="PUT" />
			
			<g:render template="form"/>
			
			<div class="form-actions margin-top-medium">
				<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
			</div>
		</g:form>

	</section>

</body>

</html>
