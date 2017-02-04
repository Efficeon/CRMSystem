<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>User details</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>User ${user.username} details</h1>

<table class="table table-striped">
    <tr>
        <th width="25">ID</th>
        <%--<th width="50">User type</th>--%>
        <th width="50">Registered username"</th>
        <th width="50">User e-mail</th>
        <th width="100">First name</th>
        <th width="100">Last name</th>
        <th width="50">Birth date</th>
        <th width="50">Registration date </th>
        <th width="80">Roles</th>
        <th width="80">Associated company</th>
        <th width="80">Implementing tasks</th>
        <th width="50">Delete</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <%--<td>${user.userType}</td>--%>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.birthDate}</td>
        <td>${user.registrationDate}</td>
        <td>${user.roles}</td>
        <td>${user.associatedCompany}</td>
        <td>${user.tasks}</td>
        <td><a href="<c:url value='/remove_user/${user.id}'/>">Delete</a></td>
    </tr>
</table>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
