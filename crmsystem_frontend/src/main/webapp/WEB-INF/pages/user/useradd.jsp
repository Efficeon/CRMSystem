<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <a href="<c:url value='/task/' />" class="btn btn-lg" style="color: green">
        <i class="glyphicon glyphicon-arrow-left"></i> All tasks</a>
    <title>Create company</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h1>Add new user</h1>
<br>
<br>
<form:form method="POST" modelAttribute="user">
    <form class="form-inline">
        <div class="form-group">

            <form:input type="text" path="username" class="form-group"
                        placeholder='username${username}' autofocus="true"/>
            <br>
            <form:input type="text" path="password" class="form-group"
                        placeholder='password${password}' />
            <br>
            <%--<form:input type="text" path="confirmPassword" class="form-group"--%>
                        <%--placeholder='confirmPassword${confirmPassword}' />--%>
            <%--<br>--%>
            <form:input type="text" path="email" class="form-group"
                        placeholder='email${email}'/>
            <br>
            <form:input type="text" path="firstName" class="form-group"
                        placeholder='first name${firstName}'/>
            <br>
            <form:input type="text" path="lastName" class="form-group"
                        placeholder='last name${lastName}'/>
            <br>
            <%--<form:input type="text" path="type" class="form-group"--%>
                        <%--placeholder='user type${type}'/>--%>


                <%--<form:select path="responsiblePerson">--%>
                <%--<form:option value="0" label="Select only one"/>--%>
                <%--<form:options items="${listUsers}" itemValue="user.id" itemLabel="username" />--%>
                <%--</form:select>--%>

            <br>
            <button type="submit">
                <spring:message text="Add"/>
            </button>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
<br>
</body>
</html>
