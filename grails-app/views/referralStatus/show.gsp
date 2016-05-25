
<%@ page import="rdmdt.ReferralStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'referralStatus.label', default: 'Referral Status')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-referralStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="referralStatus.referralStatusName.label" default="Referral Status Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: referralStatusInstance, field: "referralStatusName")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
