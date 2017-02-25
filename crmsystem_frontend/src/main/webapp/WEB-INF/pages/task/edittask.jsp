<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <%--<a href="<c:url value='/task/'/>" class="btn btn-lg" style="color: green">--%>
    <%--<i class="glyphicon glyphicon-arrow-left"></i>--%>
    <%--</a>--%>
    <title>Edit task</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h2>Edit the task</h2>
<br>
<br>

<%--<c:url var="saveUrl" value="/krams/main/persons/edit?id=${personAttribute.id}" />--%>
<%--<form:form modelAttribute="personAttribute" method="POST" action="${saveUrl}">--%>
    <%--<table>--%>
    <%--<tr>--%>
    <%--<td><form:label path="id">Id:</form:label></td>--%>
    <%--<td><form:input path="id" disabled="true"/></td>--%>
    <%--</tr>--%>

<form:form id="taskform" method="POST" modelAttribute="task">
    <form class="form-inline">
        <div class="form-group">

                <%--&lt;%&ndash;<c:if test="${!empty task.id}">&ndash;%&gt;--%>
                <%--<form:input  path="id" class="form-group" readonly="true"--%>
                <%--disabled="true" placeholder='ID${task.id}'/>--%>
                <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>

                <%--<form:input type="hidden" path="id" placeholder='ID${task.id}' id="task.id"/>--%>

                <%--<td>--%>
                    <%--<form:label path="task.id">Id:</form:label>--%>
                    <%--<form:input path="task.id" disabled="true"/>--%>
            <%--</td>--%>
                <%--</tr>--%>
            <br>

            <form:input  type="text" path="name" class="form-group"
                         placeholder='Name${name}' autofocus="true"/>
            <br>

            <form:input  type="textarea" path="description" class="form-group"
                         placeholder='Description${description}' />
            <br>


                    <form:select path="implementer.id" required="true">
                <%--<form:option value="${implementer.getId()}" label="Which one?" disabled="true" />--%>
                <form:options items="${listUsers}" itemValue="id" itemLabel="firstName"/>
            </form:select>
            <br>
            <br>
            <button type="submit" id="taskform">
                <spring:message text="Edit this task"/>
            </button>
        </div>

        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form>

    <br>
    <br>
    <button type="button">
        <a href="<c:url value='/task/'/>">All tasks list</a>
    </button>

</form:form>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<br>
<a href="<c:url value='/home/'/>">Back to home page</a>
<br>

</body>
</html>
