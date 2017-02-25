<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Company</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


</head>
<br>
<h1>Companies</h1>
<br>
<a href="<c:url value='/company/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create company</a>

</br>
</br>
<c:if test="${!empty listCompanies}">
    <table class="table table-striped table-condensed">
        <tr>
            <th class="text-center" width="23">ID</th>
            <th class="text-center" width="120">Name</th>
            <th class="text-center" width="80">Email</th>
            <th class="text-center" width="80">Web site</th>
            <th class="text-center" width="60">Address</th>
            <th class="text-center" width="40">Created</th>
            <th class="text-center" width="40">Updated</th>
            <th class="text-center" width="50">Details</th>
            <th class="text-center" width="50">Edit</th>
            <th class="text-center" width="50">Delete</th>
        </tr>
        <c:forEach items="${listCompanies}" var="company">
            <tr>
                <td>${company.id}</td>
                <td>${company.name}</td>
                <td>${company.email}</td>
                <td>${company.website}</td>
                <td>${company.address}</td>
                <td><fmt:formatDate value="${company.created}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                <td><fmt:formatDate value="${company.updated}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                <td class="text-center"><a href="<c:url value='/companydata/${company.id}/' />"
                    span class="glyphicon glyphicon glyphicon-file " style="color: darkblue" /></td>
                <td class="text-center"><a href="<c:url value='/editcompany/${company.id}/' />"
                    span class="glyphicon glyphicon glyphicon-edit" style="color: orange" /></td>
                <td class="text-center"><a href="<c:url value='/removecompany/${company.id}/' />"
                    span class="glyphicon glyphicon-remove" style="color: red" /></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br>
<a href="<c:url value='/home/'/>" class="btn btn-lg" style="color: green">
    <i class="glyphicon glyphicon-arrow-left"></i> Back to home page</a>
<br>

<body>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
