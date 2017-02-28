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

<h3>* SUCCESSFUL ADDING *</h3>
<br>

<h4>You have added an user with the following parameters:</h4>
<br>
<h4>id: </h4>${user.id}
<br>
<h4>name: </h4>${user.username}
<br>
<h4>email: </h4>${user.email}
<br>
<h4>first name: </h4>${user.firstName}
<br>
<h4>last name: </h4>${user.lastName}
<br>
<h4>user type: </h4>${user.userType}
<br>
<h4>user roles: </h4>${user.roles}
<br>
<h4>associated companies: </h4>${user.companies}
<br>
<h4>related tasks: </h4>${user.tasks}
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
