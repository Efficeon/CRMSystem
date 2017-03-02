<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<html><head> <title>Users</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
</head>

<body>
<h2>The list of users</h2>
<a href="<c:url value='/home/' />" class="btn btn-lg" style="color: royalblue">Back to home page</a>
<a href="<c:url value='/task/'/>" class="btn btn-lg" style="color: firebrick">All tasks</a>
<a href="<c:url value='/company/'/>" class="btn btn-lg" style="color: grey">All companies</a>
<br>
<br>
<button>
<a href="<c:url value='/user/add/'/>" class="btn btn-lg" style="color: green">
    <i class="fa fa-plus"></i> Create new user</a>
</button>
<br>
<br>
<table class="table table-striped table-condensed">
    <tr>
        <th class="text-center" width="25">ID</th>
        <th class="text-center" width="50">username</th>
        <th class="text-center" width="50">E-mail</th>
        <th class="text-center" width="50">User role</th>
        <th class="text-center" width="50">Registration date</th>
        <th class="text-center" width="50">User details</th>
    </tr>
    <c:forEach items="${userList}" var="user">
    <tr>
        <td class="text-left">${user.id}</td>
        <td class="text-left">${user.username}</td>
        <td class="text-center">${user.email}</td>
        <td class="text-center">
            <table>
                <c:forEach items="${user.roles}" var="role">
                    <tr>
                        <td>${role.name}</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
        <td class="text-center">${user.registrationDate}</td>
        <td class="text-center">
            <a href="/userdata/${user.id}/"
               span class="glyphicon glyphicon glyphicon-file "
               style="color: darkblue">Details</a>
        </td>
    </tr>
    </c:forEach>
</table>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>

</body>
</html>