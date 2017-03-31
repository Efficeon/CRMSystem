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
        <th class="text-center" width="200">ID</th>
        <th class="text-center" width="50">Name</th>
        <th class="text-center" width="150">Description</th>
        <th class="text-center" width="150">Responsible person</th>
        <th class="text-center" width="30">Created</th>
        <th class="text-center" width="30">Updated</th>
        <th class="text-center" width="50">Edit</th>
        <th class="text-center" width="50">Delete</th>
    </tr>
    <tr>
        <td class="text-left">${task.id}</td>
        <td class="text-center">${task.name}</td>
        <td class="text-left">${task.description}</td>
        <td class="text-left">${task.implementer.firstName} ${task.implementer.lastName}</td>
        <td class="text-center">${task.created}</td>
        <td class="text-center">${task.updated}</td>
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
