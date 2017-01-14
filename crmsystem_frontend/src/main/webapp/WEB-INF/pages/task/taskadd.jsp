<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Task add</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<br>
<h1>Task add</h1>
<body>
<form:form method="POST" modelAttribute="task">
<form class="form-inline">
    <div class="form-group">
        <spring:bind path="name">
            <form:input  type="text" path="name" class="form-group"
                         placeholder='Name${name}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="description">
            <form:input  type="text" path="description" class="form-group"
                         placeholder='Description${description}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="responsibleUser">
            <form:input  type="text" path="responsibleUser" class="form-group"
                         placeholder='Responsible user${responsibleUser}' autofocus="true"></form:input>
        </spring:bind>

        <button type="submit">
            <spring:message text="Add"/>
        </button>
    </div>
    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
</form>

</form:form>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
