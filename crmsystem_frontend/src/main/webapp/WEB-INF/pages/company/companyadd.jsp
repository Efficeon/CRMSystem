<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Company add</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<br>
<h1>Company add</h1>
<body>
<form:form method="POST" modelAttribute="company">
<form class="form-inline">
    <div class="form-group">
        <spring:bind path="name">
            <form:input  type="text" path="name" class="form-group"
                         placeholder='Name${name}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="email">
            <form:input  type="text" path="email" class="form-group"
                         placeholder='E-mail${email}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="website">
            <form:input  type="text" path="website" class="form-group"
                         placeholder='Web site${website}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="address">
            <form:input  type="text" path="address" class="form-group"
                         placeholder='Address${address}' autofocus="true"></form:input>
        </spring:bind>

        <button type="submit">
            <spring:message text="Add"/>
        </button>
    </div>
</form>

</form:form>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
