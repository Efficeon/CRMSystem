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
    <title>Create task</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h2>Add or edit Task</h2>
<br>
<br>


<form:form id="taskform" method="POST" modelAttribute="task">
    <form class="form-inline">
        <div class="form-group">

            <%--<c:if test="${!empty task.id}">--%>
                    <%--<form:input  type="text" path="id" class="form-group" readonly="true"--%>
                                 <%--disabled="true" placeholder='ID${task.id}'/>--%>
            <%--</c:if>--%>

            <form:input type="hidden" path="id" id="id"/>


            <form:input  type="text" path="name" class="form-group"
                             placeholder='Name${task.name}' autofocus="true"/>
            <br>
                <form:input  type="text" path="description" class="form-group"
                             placeholder='Description${task.description}' autofocus="true"/>
            <br>
                <form:select path="implementer">
                    <form:option value="0" label="Select only one"/>
                    <form:options items="${listUsers}" itemValue="id" itemLabel="firstName" />
                </form:select>

            <%----%>
                <%--<form:input  type="text" path="implementer" class="form-group"--%>
                <%--placeholder='Implementer${task.implementer}' autofocus="true"/>--%>
            <br>
            <br>
            <button type="submit" id="taskform">
                <spring:message text="Add task"/>
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
<a href="<c:url value='/'/>">Back to start page</a>
<br>

</body>
</html>
