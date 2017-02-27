<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<br>

<form:form id="userform" method="POST" modelAttribute="user">
    <form class="form-inline">
        <div class="form-group">
            <br>
            <%--<form:input  type="text" path="name" class="form-group"--%>
                         <%--placeholder='Name${name}' autofocus="true"/>--%>
            <br>
            <form:input  path="userType" class="form-group"
                         placeholder='The type of user${type}' />
            <br>
            <form:select path="associatedCompany.id" required="true">
                <%--<form:option value="${implementer.getId()}" label="Which one?" disabled="true" />--%>
                <form:options items="${setCompanies}" itemValue="name" itemLabel="name"/>
            </form:select>
            <br>
            <form:select path="tasks.id" required="true">
                <%--<form:option value="${implementer.getId()}" label="Which one?" disabled="true" />--%>
                <form:options items="${listTasks}" itemValue="id" itemLabel="name"/>
            </form:select>
            <br>
            <form:select path="roles.id" required="true">
                <%--<form:option value="${implementer.getId()}" label="Which one?" disabled="true" />--%>
                <form:options items="${listRoles}" itemValue="id" itemLabel="name"/>
            </form:select>
            <br>
            <br>
            <button type="submit" id="taskform" style="color: orangered">
                <spring:message text="Edit this user"/>
            </button>
        </div>

        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form>
</form:form>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<br>
<a href="/user/" class="btn btn-lg" style="color: firebrick">All users</a>
<br>
<a href="/home/" class="btn btn-lg" style="color: royalblue">Back to home page</a>
<br>

</body>
</html>
