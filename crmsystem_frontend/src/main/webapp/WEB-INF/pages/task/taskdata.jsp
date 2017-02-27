<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>

<head>
    <title>Task details</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

</head>

<body>
<h2>The task details</h2>
<br>
<a href="<c:url value='/task/'/>" class="btn btn-lg" style="color: firebrick">* All tasks</a>
<br>
<br>
<table class="table table-striped">
    <tr>
        <th width="25">ID</th>
        <th width="120">Name</th>
        <th width="200">Description</th>
        <th width="80">Responsible person</th>
        <th width="50">Created</th>
        <th width="50">Updated</th>
        <th width="50">Edit</th>
        <th width="50">Delete</th>
    </tr>
    <tr>
        <td>${task.id}</td>
        <td>${task.name}</td>
        <td>${task.description}</td>
        <td>${task.implementer.firstName} ${task.implementer.lastName}</td>
        <td>${task.created}</td>
        <td>${task.updated}</td>
        <td class="text-center"><a href="<c:url value='/edittask/${task.id}/'/>"
                                   class="glyphicon glyphicon glyphicon-edit" style="color: orange"> Edit</a></td>
        <td class="text-center"><a href="<c:url value='/remove/${task.id}/' />"
                                   class="glyphicon glyphicon-remove" style="color: red"> Delete</a></td>
    </tr>
</table>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>

</html>
