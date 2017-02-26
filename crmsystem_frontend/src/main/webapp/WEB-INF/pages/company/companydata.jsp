<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Company details</title>
    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
</head>
<body>
<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
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
</div>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
