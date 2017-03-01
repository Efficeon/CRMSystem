<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <title>Edited task</title>
</head>
<body>
<br>
<h3 class="text-center" style="color: darkgreen">You have edited task with the following parameters:</h3>
<br>
<br>
<table>
    <tr>
        <td class="text-left"><b>ID:</b></td>
        <td class="text-right" style="color: darkgreen">${task.id}</td>
    </tr>
    <tr>
        <td class="text-left"><b>Task name:</b></td>
        <td class="text-right" style="color: darkgreen">${task.name}</td>
    </tr>
    <tr>
        <td class="text-left"><b>Description:</b></td>
        <td class="text-right" style="color: darkgreen">${task.description}</td>
    </tr>
    <tr>
        <td class="text-left"><b>Updated:</b></td>
        <td class="text-right" style="color: darkgreen">${task.updated}</td>
    </tr>
    <tr>
        <td class="text-left"><b>Responsible user:</b></td>
        <td class="text-right" style="color: darkgreen">${task.implementer.lastName}</td>
    </tr>
</table>
<br>
<br>
<br>
<a href="/task/" class="btn btn-lg" style="color: firebrick">All tasks</a>
<br>
<a href="/home/" class="btn btn-lg" style="color: royalblue">Back to home page</a>


</body>
</html>
