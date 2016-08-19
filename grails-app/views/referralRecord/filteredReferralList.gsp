
<%@ page import="rdmdt.Patient; rdmdt.ReferralRecord" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Your Application List</title>
</head>

<body>

<g:if test="${referralRecordInstanceList?.empty}">
    <br/>
    <div class="alert alert-danger" role="alert">You have not made any application.</div>
</g:if>
<g:else>
    <section id="index-referralRecord" class="first">

        <table class="table table-bordered margin-top-medium">
            <thead>
            <tr>

                <g:sortableColumn property="yourRef" title="${message(code: 'referralRecord.yourRef.label', default: 'Unique Ref')}" />

                <th>Proband Name</th>

                <th><g:message code="referralRecord.disorderName.label" default="Clinician Name" /></th>

                <g:sortableColumn property="referralDate" title="${message(code: 'referralRecord.referralDate.label', default: 'Application Status')}" />


            </tr>
            </thead>
            <tbody>
            <g:each in="${referralRecordInstanceList}" status="i" var="referralRecordInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${referralRecordInstance.id}">${fieldValue(bean: referralRecordInstance, field: "uniqueRef")}</g:link></td>

                    <td>${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.givenName} ${Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)?.familyName}</td>

                    <td>${fieldValue(bean: referralRecordInstance?.clinician, field: "surname")}</td>

                    <td>${fieldValue(bean: referralRecordInstance, field: "referralStatus")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </section>
</g:else>

</body>

</html>