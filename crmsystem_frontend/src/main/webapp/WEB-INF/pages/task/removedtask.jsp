<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <title>Deleted user</title>
</head>
<body>
<br>
<h3 class="text-center" style="color: red">You have deleted selected task successfully</h3>
<br>
<br>
<br>
<br>
<a href="/task/" class="btn btn-lg" style="color: firebrick">All tasks</a>
<br>
<a href="/home/" class="btn btn-lg" style="color: royalblue">Back to home page</a>

</body>
</html>
