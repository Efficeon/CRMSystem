<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<h1>Add or Edit Task</h1>
<br>
<br>

<form:form method="POST" modelAttribute="task">
    <form class="form-inline">
        <div class="form-group">

            <c:if test="${!empty task.id}">

                    <form:input  type="text" path="id" class="form-group" readonly="true"
                                 disabled="true" placeholder='ID${id}'></form:input>
            </c:if>
                <form:input  type="text" path="name" class="form-group"
                             placeholder='Name${name}' autofocus="true"></form:input>

                <form:input  type="text" path="description" class="form-group"
                             placeholder='Description${description}' autofocus="true"></form:input>

                <form:select path="implementer">
                    <form:option value="0" label="Select only one"/>
<%--server получит user.id, client увидит username--%>
                    <form:options items="${listUsers}" itemValue="user.id" itemLabel="username" />
                </form:select>

<%--кнопка подтверждения команды на внесение/изменение данных по задаче--%>
            <%--можно заменить следующим кодом:
            <tr>
                <td colspan="2">
                    <input type="submit" value="Save Changes"/>
                </td>
            </tr>--%>
            <button type="submit">
                <spring:message text="Add"/>
            </button>
        </div>

        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form>

<%--кнопка перехода на страницу "tasks.jsp" - отображение актуального списка всех задач  --%>
    <button type="button">
        <a href="<c:url value='/task/' />">Complete</a>
    </button>
</form:form>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</br>

</body>
</html>
