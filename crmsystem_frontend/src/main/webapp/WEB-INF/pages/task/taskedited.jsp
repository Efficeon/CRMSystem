<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <title>Edited task</title>
</head>
<body>

<h2>Edited task</h2>

<p>You have edited a task with id ${id} at <%= new java.util.Date() %></p>

<br>
<a href="<c:url value='/task/'/>">All tasks</a>
<br>
<a href="<c:url value='/company/'/>">All companies</a>
<br>
<a href="<c:url value='/user/'/>">All users</a>

</body>
</html>
