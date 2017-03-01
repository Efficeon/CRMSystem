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
<br>
<h3 class="text-center" style="color: darkgreen">You have edited user with the following parameters:</h3>
<br>
<br>
<table>
    <tr>
        <td class="text-left"><b>ID:</b></td>
        <td class="text-right" style="color: darkgreen">${user.id}</td>
    </tr>
    <tr>
        <td class="text-left"><b>username:</b></td>
        <td class="text-right" style="color: darkgreen">${user.username}</td>
    </tr>
    <tr>
        <td class="text-left"><b>email:</b></td>
        <td class="text-right" style="color: darkgreen">${user.email}</td>
    </tr>
    <tr>
        <td class="text-left"><b>First name:</b></td>
        <td class="text-right" style="color: darkgreen">${user.firstName}</td>
    </tr>
    <tr>
        <td class="text-left"><b>Last name:</b></td>
        <td class="text-right" style="color: darkgreen">${user.lastName}</td>
    </tr>
    <%--<tr>--%>
        <%--<td><b>Associated companies:</b></td>--%>
        <%--<td>--%>
            <%--<table>--%>
                <%--<c:forEach items="${user.companies}" var="company">--%>
                    <%--<tr>--%>
                        <%--<td class="text-center">${company.name}</td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
            <%--</table>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td><b>Tasks:</b></td>--%>
        <%--<td>--%>
            <%--<table>--%>
                <%--<c:forEach items="${user.tasks}" var="task">--%>
                    <%--<tr>--%>
                        <%--<td class="text-center">${task.name}</td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
            <%--</table>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td><b>Roles:</b></td>--%>
        <%--<td>--%>
            <%--<table>--%>
                <%--<c:forEach items="${user.roles}" var="role">--%>
                    <%--<tr>--%>
                        <%--<td class="text-center">${role.name}</td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
            <%--</table>--%>
        <%--</td>--%>
    <%--</tr>--%>


</table>
<br>
<br>
<a href="/user/" class="btn btn-lg" style="color: firebrick">All users</a>
<br>
<a href="/home/" class="btn btn-lg" style="color: royalblue">Back to home page</a>

</body>
</html>
