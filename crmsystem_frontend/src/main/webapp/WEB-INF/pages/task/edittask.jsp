<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Edit task</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h2>Edit the task</h2>
<br>
<a href="/home/" class="btn btn-lg" style="color: royalblue">Back to home page</a>
<a href="/task/" class="btn btn-lg" style="color: firebrick">All tasks</a>
<br>
<form:form id="taskform" method="POST" modelAttribute="task">
    <form class="form-inline">
        <div class="form-group">
            <br>
            <form:input type="text" path="name" class="form-group"
                        placeholder='Name${name}' autofocus="true"/>
            <br>
            <form:input type="textarea" path="description" class="form-group"
                        placeholder='Description${description}'/>
            <br>
            <form:select path="implementer.id" required="true">
                <%--<form:option value="${implementer.getId()}" label="Which one?" disabled="true" />--%>
                <form:options items="${listUsers}" itemValue="id" itemLabel="username"/>
            </form:select>
            <br>
            <br>
            <button type="submit" id="taskform" style="color: orangered">
                <spring:message text="Edit this task"/>
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
