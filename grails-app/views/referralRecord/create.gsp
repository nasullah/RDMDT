<%@ page import="rdmdt.ReferralRecord" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>Create Application</title>
	<resource:autoComplete skin="default" />
</head>

<body>

	<section id="create-referralRecord" class="first">

		<g:hasErrors bean="${referralRecordInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${referralRecordInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:uploadForm action="save" class="form-horizontal" role="form" onkeypress="return event.keyCode != 13;" >
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
