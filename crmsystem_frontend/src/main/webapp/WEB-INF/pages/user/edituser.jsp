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
<form:form id="userform" method="POST" modelAttribute="user">
    <form class="form-inline">
        <div class="form-group">
            <br>
            <form:input type="text" path="username" class="form-group"
                        placeholder='username${user.username}' autofocus="true"/>
            <br>
            <form:input type="text" path="email" class="form-group"
                        placeholder='email${user.email}'/>
            <br>
            <form:input type="text" path="firstName" class="form-group"
                        placeholder='first name${user.firstName}'/>
            <br>
            <form:input type="text" path="lastName" class="form-group"
                        placeholder='last name${user.lastName}'/>

                <%--<form:input  path="userType" class="form-group"--%>
                <%--placeholder='The type of user${userType}' autofocus="true" />--%>
            <br>
            <form:select path="companies" required="true" multiple="true">
                <form:option value="0" label="Select one or more" disabled="true"/>
                <form:options items="${companyList}" itemValue="id" itemLabel="name"/>
            </form:select>
            <br>
            <br>
            <form:select path="tasks" required="true" multiple="true">
                <form:option value="0" label="Select one or more" disabled="true"/>
                <form:options items="${taskList}" itemValue="id" itemLabel="name"/>
            </form:select>
            <br>
            <br>
            <form:select path="roles" required="true" multiple="true">
                <form:option value="0" label="Select one or more" disabled="true"/>
                <form:options items="${roleList}" itemValue="id" itemLabel="name"/>
            </form:select>
            <br>
            <br>
            <button type="submit" id="userform" style="color: orangered">
                <spring:message text="Edit this user"/>
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
