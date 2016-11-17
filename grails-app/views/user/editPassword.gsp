<sec:ifAnyGranted roles="ROLE_ADMIN">
<html>
<%@ page import="org.codehaus.groovy.grails.plugins.PluginManagerHolder" %>

<sec:ifNotSwitched>
    <sec:ifAllGranted roles='ROLE_SWITCH_USER'>
        <g:if test='${user.username}'>
            <g:set var='canRunAs' value='${true}'/>
        </g:if>
    </sec:ifAllGranted>
</sec:ifNotSwitched>

<head>
    <meta name='layout' content='springSecurityUI'/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style>

    #navbar {
        max-width: 1150px;
        margin: 0 auto;
    }

    #editUser {
        max-width: 500px;
        margin: 0 auto;
    }

    </style>
</head>

<body>

<center><h3 style="font-size: xx-large">Reset Your Password</h3></center>


<div  id="editUser">
    <g:form action="update" name='userEditForm' class="button-style">
        <g:hiddenField name="id" value="${user?.id}"/>
        <g:hiddenField name="version" value="${user?.version}"/>

        <%
            def tabData = []
            tabData << [name: 'userinfo', icon: 'icon_user', messageCode: 'spring.security.ui.user.info']
            tabData << [name: 'roles',    icon: 'icon_role', messageCode: 'spring.security.ui.user.roles']
            boolean isOpenId = PluginManagerHolder.pluginManager.hasGrailsPlugin('springSecurityOpenid')
            if (isOpenId) {
                tabData << [name: 'openIds', icon: 'icon_role', messageCode: 'spring.security.ui.user.openIds']
            }
        %>

        <s2ui:tabs elementId='tabs' height='50' data="${tabData}">

            <s2ui:tab name='userinfo' height='50'>
                <table>
                    <tbody>

                    <s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${user}"
                                           labelCodeDefault='Password' value="${user?.password}"/>

                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                            <s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${user}"
                                               labelCodeDefault='Username' value="${user?.username}"/>

                            <s2ui:checkboxRow name='enabled' labelCode='user.enabled.label' bean="${user}"
                                              labelCodeDefault='Enabled' value="${user?.enabled}"/>

                            <s2ui:checkboxRow name='accountExpired' labelCode='user.accountExpired.label' bean="${user}"
                                              labelCodeDefault='Account Expired' value="${user?.accountExpired}"/>

                            <s2ui:checkboxRow name='accountLocked' labelCode='user.accountLocked.label' bean="${user}"
                                              labelCodeDefault='Account Locked' value="${user?.accountLocked}"/>

                            <s2ui:checkboxRow name='passwordExpired' labelCode='user.passwordExpired.label' bean="${user}"
                                              labelCodeDefault='Password Expired' value="${user?.passwordExpired}"/>
                    </sec:ifAllGranted>

                    </tbody>
                </table>
            </s2ui:tab>

            <s2ui:tab id="roles" name='roles' height='50'>
                <div>
                    <g:checkBox name="ROLE_USER" value="${true}"/>
                    <a>ROLE_USER</a>
                </div>
            </s2ui:tab>


            <g:if test='${isOpenId}'>
                <s2ui:tab name='openIds' height='275'>
                    <g:if test='${user?.openIds}'>
                        <ul>
                            <g:each var="openId" in="${user.openIds}">
                                <li>${openId.url}</li>
                            </g:each>
                        </ul>
                    </g:if>
                    <g:else>
                        No OpenIDs registered
                    </g:else>
                </s2ui:tab>
            </g:if>

        </s2ui:tabs>

        <div style='float:left; margin-top: 10px;'>
            <s2ui:submitButton elementId='update' form='userEditForm' messageCode='default.button.update.label'/>

            <sec:ifAllGranted roles='ROLE_ADMIN'>
                <g:if test='${user}'>
                    <s2ui:deleteButton />
                </g:if>
            </sec:ifAllGranted>

            <g:if test='${canRunAs}'>
                <a id="runAsButton">${message(code:'spring.security.ui.runas.submit')}</a>
            </g:if>

        </div>

    </g:form>

</div>
<g:if test='${user}'>
    <s2ui:deleteButtonForm instanceId='${user.id}'/>
</g:if>

<g:if test='${canRunAs}'>
    <form name='runAsForm' action='${request.contextPath}/j_spring_security_switch_user' method='POST'>
        <g:hiddenField name='j_username' value="${user.username}"/>
        <input type='submit' class='s2ui_hidden_button' />
    </form>
</g:if>

<script>
    $(document).ready(function() {
        $('#username').focus();

        <s2ui:initCheckboxes/>
        $("#runAsButton").button();
        $('#runAsButton').bind('click', function() {
            document.forms.runAsForm.submit();
        });
    });
</script>

</body>
</html>
</sec:ifAnyGranted>