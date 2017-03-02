<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Edit user</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h2>Edit the user</h2>
<br>
<a href="/home/" class="btn btn-lg" style="color: royalblue">Back to home page</a>
<a href="/user/" class="btn btn-lg" style="color: firebrick">All users</a>
<br>
<br>
<form:form id="userform" method="POST" modelAttribute="user">
    <form class="form-inline">
        <div class="form-group">
            <table>
                <tr>
                    <td class="text-left" width="150"><b>username:</b></td>
                    <td><form:input type="text" path="username" class="form-group"
                                                                  placeholder='username${user.username}'
                                                                  autofocus="true"/></td>
                </tr>
                <tr>
                    <td class="text-left" width="150"><b>email:</b></td>
                    <td><form:input type="text" path="email" class="form-group"
                                                                  placeholder='email${user.email}'/></td>
                </tr>
                <tr>
                    <td class="text-left" width="150"><b>First name:</b></td>
                    <td><form:input type="text" path="firstName" class="form-group"
                                                                  placeholder='first name${user.firstName}'/></td>
                </tr>
                <tr>
                    <td class="text-left" width="150"><b>Last name:</b></td>
                    <td><form:input type="text" path="lastName" class="form-group"
                                                                  placeholder='last name${user.lastName}'/></td>
                </tr>
                <tr>
                    <td class="text-left" width="150"><b>New password:</b></td>
                    <td><form:input type="text" path="password" class="form-group"
                                    placeholder='0'/></td>
                </tr>
                <tr>
                    <td class="text-left" width="150"><b>Confirm password:</b></td>
                    <td><form:input type="text" path="confirmPassword" class="form-group"
                                    placeholder='confirm'/></td>
                </tr>
                <%--<tr>--%>
                    <%--<td class="text-left" width="150"><b>User type:</b></td>--%>
                    <%--<td><form:input path="userType" class="form-group"--%>
                                    <%--placeholder='The type of user${user.userType}'/></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td class="text-left" width="150"><b>Companies:</b></td>--%>
                    <%--<td><form:select path="companies" required="true" multiple="true" items="${companyList}" itemValue="id" itemLabel="name" class="form-control input-sm" />--%>
                        <%--&lt;%&ndash;<form:select path="companies" required="true" multiple="true">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<form:option value="0" label="--Select one or more--" disabled="true"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<form:options items="${companyList}" itemValue="id" itemLabel="name"/>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</form:select></td>&ndash;%&gt;--%>
                    <%--<td class="text-center" style="color: grey"><i>Select one or more items</i>--%>
                        <%--<br><i>Please, scroll</i></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td class="text-left" width="150"><b>Tasks:</b></td>--%>
                    <%--<td><form:select path="tasks" required="true" multiple="true" items="${taskList}" itemValue="id" itemLabel="name" class="form-control input-sm" />--%>
                        <%--&lt;%&ndash;<form:select path="tasks" required="true" multiple="true">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<form:option value="0" label="--Select one or more--" disabled="true"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<form:options items="${taskList}" itemValue="id" itemLabel="name"/>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</form:select>&ndash;%&gt;--%>
                    <%--</td>--%>
                    <%--<td class="text-center" style="color: grey"><i>Select one or more items</i>--%>
                        <%--<br><i>Please, scroll</i></td>--%>
                <%--</tr>--%>
                <%--<tr></tr>--%>
                <%--<tr>--%>
                    <%--<td class="text-left" width="150"><b>Roles:</b></td>--%>
                    <%--<td><form:select path="roles" required="true" multiple="true" items="${roleList}" itemValue="id" itemLabel="name" class="form-control input-sm" />--%>
                            <%--&lt;%&ndash;<form:select path="roles" required="true" multiple="true">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:option value="0" label="--Select one or more--" disabled="true"/>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<form:options items="${roleList}" itemValue="id" itemLabel="name"/>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</form:select>&ndash;%&gt;--%>
                    <%--</td>--%>
                    <%--<td class="text-center" style="color: grey"><i>Select one or more items</i>--%>
                        <%--<br><i>Please, scroll</i></td>--%>
                <%--</tr>--%>
                </table>
                <br>
                <button type="submit" id="userform" style="color: green">
                    <spring:message text="Edit this user" />
                </button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</form:form>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>


</body>
</html>
