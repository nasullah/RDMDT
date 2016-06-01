
<%@ page import="rdmdt.ReferralRecord" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Your Referred Patients List</title>
</head>

<body>

<g:if test="${referralRecordInstanceList.empty}">
    <br/>
    <div class="alert alert-danger" role="alert">You have not made any referral</div>
</g:if>
<g:else>
    <section id="index-referralRecord" class="first">

        <table class="table table-bordered margin-top-medium">
            <thead>
            <tr>

                <th><g:message code="referralRecord.disorderName.label" default="Disorder Name" /></th>

                <g:sortableColumn property="referralDate" title="${message(code: 'referralRecord.referralDate.label', default: 'Referral Status')}" />

                <g:sortableColumn property="yourRef" title="${message(code: 'referralRecord.yourRef.label', default: 'Unique Ref')}" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${referralRecordInstanceList}" status="i" var="referralRecordInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${referralRecordInstance.id}">${fieldValue(bean: referralRecordInstance, field: "disorderName")}</g:link></td>

                    <td>${fieldValue(bean: referralRecordInstance, field: "referralStatus")}</td>

                    <td>${fieldValue(bean: referralRecordInstance, field: "uniqueRef")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </section>
</g:else>

</body>

</html>