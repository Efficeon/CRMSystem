<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>User details</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"/>" rel="stylesheet">
</head>

<body>
<h2>* The user details *</h2>
<br>
<a href="<c:url value='/user/'/>">All users</a>
<br>
<br>
<table class="table table-striped table-condensed">
    <tr>
        <th class="text-center" width="25">ID</th>
        <th class="text-center" width="50">username</th>
        <th class="text-center" width="50">e-mail</th>
        <th class="text-center" width="50">First Name</th>
        <th class="text-center" width="50">Last Name</th>
        <%--<th class="text-center" width="50">Birth date</th>--%>
        <%--<th class="text-center" width="50">User type</th>--%>
        <th class="text-center" width="50">Registration date</th>

        <th class="text-center" width="50">Roles</th>
        <th class="text-center" width="50">Associated companies</th>
        <th class="text-center" width="50">Related tasks</th>

        <th class="text-center" width="40">Edit</th>
        <th class="text-center" width="40">Delete</th>
    </tr>

    <c:forEach items="${userList}" var="user">
        <tr>
            <td class="text-center">${user.id}</td>
            <td class="text-center">${user.username}</td>
            <td class="text-center">${user.email}</td>
            <td class="text-center">${user.firstName}</td>
            <td class="text-center">${user.lastName}</td>
                <%--<td>${user.birthDate}</td>--%>
            <td class="text-center">${user.registrationDate}</td>

            <td class="text-center">
                <table>
                    <c:forEach items="${user.roles}" var="role">
                        <tr>
                            <td class="text-center">${role.name}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>


            <td class="text-center">
                <table>
                    <c:forEach items="${compamyList}" var="company">
                        <tr>
                            <td><a href="/companydata/${company.id}"/>${company.name}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>

                <%--<td class="text-center">--%>
                <%--<table>--%>
                <%--<c:forEach items="${user.tasks}" var="task">--%>
                <%--<tr>--%>
                <%--<td class="text-center" <a href="/taskdata/${task.id}"> ${task.name}</a></td>--%>
                <%--</tr>--%>
                <%--</c:forEach>--%>
                <%--</table>--%>
                <%--</td>--%>

            <td class="text-center">
                <table>
                    <c:forEach items="${user.tasks}" var="task">
                        <tr>
                            <td class="text-center" <a href="/taskdata/?id=<c:out value='${task.id}'/>">${task.name}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </td>

            <td class="text-center"><a href="<c:url value='/edituser/${user.id}/' />"
                                       class="glyphicon glyphicon glyphicon-edit" style="color: orange">Edit</a>
            </td>

            <td class="text-center"><a href="<c:url value='/remove_user/${user.id}/'/>"
                                       class="glyphicon glyphicon-remove" style="color: red">Delete</a>
            </td>
        </tr>
    </c:forEach>

</table>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>

