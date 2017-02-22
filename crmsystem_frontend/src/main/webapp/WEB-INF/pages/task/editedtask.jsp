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

<h3>* SUCCESSFUL EDIT *</h3>
<br>

<h4>You have edited a task with the following parameters:</h4>
<br>
<h4>id: </h4>${task.id}
<br>
<h4>name: </h4>${task.name}
<br>
<h4>name: </h4>${task.description}
<br>
<h4>at: </h4>${task.updated}

<br>
<br>
<br>

<a href="<c:url value='/task/'/>">All tasks</a>
<br>
<a href="<c:url value='/user/'/>">All users</a>
<br>
<a href="<c:url value='/company/'/>">All companies</a>

</body>
</html>
