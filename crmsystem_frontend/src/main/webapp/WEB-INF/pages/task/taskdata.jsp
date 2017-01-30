<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Task details</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Task details</h1>

<%--Почему нигде нет указания на связь с Model???--%>
<table class="table table-striped">
    <tr>
        <th width="25">ID</th>
        <th width="120">Name</th>
        <th width="200">Description</th>
        <th width="80">Responsible user</th>
        <th width="50">Created</th>
        <th width="50">Updated</th>
        <th width="50">Delete</th>
    </tr>
    <tr>
        <td>${task.id}</td>
        <td>${task.name}</td>
        <td>${task.description}</td>
        <td>${task.responsibleUser}</td>
        <td>${task.created}</td>
        <td>${task.updated}</td>
        <td><a href="<c:url value='/removetask/${task.id}'/>">Delete</a></td>
    </tr>
</table>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
