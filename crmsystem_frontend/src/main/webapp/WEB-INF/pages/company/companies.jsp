<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Company</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Companies</h1>
<br>
<button><a href="<c:url value='/company/add' />">Company add</a></button>
</br>
</br>
<c:if test="${!empty listCompanies}">
    <table class="table table-striped">
        <tr>
            <th width="23">ID</th>
            <th width="120">Name</th>
            <th width="80">Email</th>
            <th width="80">Web site</th>
            <th width="60">Address</th>
            <th width="40">Created</th>
            <th width="40">Updated</th>
            <th width="50">Delete</th>
        </tr>
        <c:forEach items="${listCompanies}" var="company">
            <tr>
                <td>${company.id}</td>
                <td><a href="<c:url value='/companydata/${company.id}' />" target="_blank">${company.name}</a></td>
                <td>${company.email}</td>
                <td>${company.website}</td>
                <td>${company.address}</td>
                <td>${company.created}</td>
                <td>${company.updated}</td>
                <td><a href="<c:url value='removecompany/${company.id}' />">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

    <script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>


</body>
</html>
