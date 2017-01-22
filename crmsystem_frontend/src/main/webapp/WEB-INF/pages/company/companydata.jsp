<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <a href="<c:url value='/company/' />" class="btn btn-lg" style="color: green">
        <i class="glyphicon glyphicon-arrow-left"></i> All company</a>
    <title>Company details</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>
<body>
<h1>Company details</h1>

<table class="table table-striped table-condensed">
    <tr>
        <th width="23">ID</th>
        <th width="120">Name</th>
        <th width="80">Email</th>
        <th width="80">Web site</th>
        <th width="100">Address</th>
        <th width="130">Created</th>
        <th width="50">Updated</th>
        <th width="50">Tags</th>
        <th width="60">Responsible User</th>
        <th width="50">Edit</th>
        <th width="50">Delete</th>
    </tr>
    <tr>
        <td>${company.id}</td>
        <td>${company.name}</td>
        <td>${company.email}</td>
        <td>${company.website}</td>
        <td>${company.address}</td>
        <td>${company.created}</td>
        <td>${company.updated}</td>
        <td><c:forEach items="${company.tags}" var="tag">
            <table>
                <td>${tag.name}</td>
            </table>
        </c:forEach></td>
        <td><c:forEach items="${company.responsibleUser}" var="user">
            <table>
                <td>${user.username}</td>
            </table>
        </c:forEach></td>
        <td class="text-center"><a href="<c:url value='/editcompany/${company.id}/' />"
                                   span class="glyphicon glyphicon glyphicon-edit" style="color: orange" /></td>
        <td class="text-center"><a href="<c:url value='/removecompany/${company.id}/' />"
                                   span class="glyphicon glyphicon-remove" style="color: red" /></td>
    </tr>
</table>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
