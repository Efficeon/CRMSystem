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
<br>
<br>
<a href="/task/">All tasks</a>
<br>
<a href="/company/">All companies</a>
<br>
<br>
<a href="/">Back to start page</a>
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
            <td class="text-center">${user.id}</td>
            <td class="text-center">${user.username}</td>
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
