<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <title>Welcome</title>
</head>
<body>

<div>
    <h2>WELCOME</h2>
    <br>
    <br>
    <a href="<c:url value='/task/'/>">All tasks</a>
    <br>
    <a href="<c:url value='/company/'/>">All companies</a>
    <br>
    <a href="<c:url value='/user/'/>">All users</a>
    <br>
</div>
</body>
</html>