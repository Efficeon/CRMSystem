%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Tasks</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

</head>


<%--Displays the list of all tasks with detailed information and editing capability--%>
<%--Отображает список всех задач с детальной информацией и возможностью редактирования--%>

<body>
<h1>Tasks</h1>
<br>
<button>
    <a href="<c:url value='/task/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create task</a>
</button>
<br>
<br>

<c:if test="${!empty }">
    <table class="table table-striped table-condensed">
        <tr>
            <th class="text-center" width="25">ID</th>
            <th class="text-center" width="120">E-mail</th>
            <th class="text-center" width="200">User type</th>
            <th class="text-center" width="80">username</th>
            <th class="text-center" width="50">First name</th>
            <th class="text-center" width="50">Last name</th>
            <th class="text-center" width="50">Registration date</th>
            <th class="text-center" width="50">Birth date</th>
            <th class="text-center" width="50">User's roles</th>
            <th class="text-center" width="50">Bindet tasks</th>
            <th class="text-center" width="50">Edit</th>
            <th class="text-center" width="50">Delete</th>
        </tr>
        <c:forEach items="${listTasks}" var="task">
            <tr>
                <td>${task.id}</td>
                <td>${task.name}</td>
                <td>${task.description}</td>
                <td>${task.responsibleUser}</td>
                <td><fmt:formatDate value="${task.created}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                <td><fmt:formatDate value="${task.updated}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                <td class="text-center"><a href="<c:url value='/taskdata/${task.id}/' />"
                                           span class="glyphicon glyphicon glyphicon-file " style="color: darkblue" /></td>
                <td class="text-center"><a href="<c:url value='/edittask/${task.id}/' />"
                                           span class="glyphicon glyphicon glyphicon-edit" style="color: orange" /></td>
                <td class="text-center"><a href="<c:url value='/removetask/${task.id}/' />"
                                           span class="glyphicon glyphicon-remove" style="color: red" /></td>
            </tr>
            </tr>
        </c:forEach>
    </table>
</c:if>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>