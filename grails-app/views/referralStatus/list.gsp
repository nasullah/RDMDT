
<%@ page import="rdmdt.ReferralStatus" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'referralStatus.label', default: 'Referral Status')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-referralStatus" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="referralStatusName" title="${message(code: 'referralStatus.referralStatusName.label', default: 'Referral Status Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${referralStatusInstanceList}" status="i" var="referralStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${referralStatusInstance.id}">${fieldValue(bean: referralStatusInstance, field: "referralStatusName")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${referralStatusInstanceCount}" />
	</div>
</section>

</body>

</html>
