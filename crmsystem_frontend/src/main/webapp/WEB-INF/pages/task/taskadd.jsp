<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <a href="<c:url value='/task/'/>" class="btn btn-lg" style="color: green">
        <i class="glyphicon glyphicon-arrow-left"></i> All tasks</a>
    <title>Create company</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h1>Add or Edit Task</h1>
<br>
<br>

<form:form id="taskform" method="POST" modelAttribute="task">
    <form class="form-inline">
        <div class="form-group">

            <c:if test="${!empty task.id}">
                <%--<spring:bind path="id">--%>
                    <%--<form:input  type="text" path="id" class="form-group" readonly="true"--%>
                                 <%--disabled="true" placeholder='ID${id}'/>--%>
                <%--</spring:bind>--%>
            </c:if>
                <spring:bind path="name">
            <form:input  type="text" path="name" class="form-group"
                             placeholder='Name${name}' autofocus="true"/>
                </spring:bind>
            <br>
                <spring:bind path="description">
                <form:input  type="text" path="description" class="form-group"
                             placeholder='Description${description}' autofocus="true"/>
                </spring:bind>
            <br>

                <spring:bind path="implementer">
                <form:select path="implementer">
                    <form:option value="0" label="Select only one"/>
                    <form:options items="${listUsers}" itemValue="id" itemLabel="username" />
                </form:select>
                </spring:bind>
            <br>
            <br>
            <button type="submit" id="taskform">
                <spring:message text="Add"/>
            </button>
        </div>

        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form>

    <br>
    <br>
    <button type="button">
        <a href="<c:url value='/task/'/>">Complete</a>
    </button>
</form:form>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</br>

</body>
</html>
