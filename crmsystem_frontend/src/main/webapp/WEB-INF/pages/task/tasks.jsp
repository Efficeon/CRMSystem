<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>All tasks list</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

</head>

<body>
    <h2>All tasks list</h2>
    <a href="<c:url value='/home/' />" class="btn btn-lg" style="color: royalblue">Back to home page</a>
    <a href="<c:url value='/user/'/>" class="btn btn-lg" style="color: firebrick">All users</a>
    <a href="<c:url value='/company/'/>" class="btn btn-lg" style="color: grey">All companies</a>
<br>
<br>
<button>
    <a href="<c:url value='/task/add/'/>" class="btn btn-lg" style="color: green">
        <i class="fa fa-plus"></i> Create task</a>
</button>
<br>
<br>
<c:if test="${!empty listTasks}">
    <table class="table table-striped table-condensed">
        <tr>
            <th class="text-center" width="25">ID</th>
            <th class="text-center" width="120">Name</th>
            <th class="text-center" width="200">Description</th>
            <th class="text-center" width="80">Responsible person</th>
            <th class="text-center" width="50">Created</th>
            <th class="text-center" width="50">Updated</th>

            <th class="text-center" width="50">Details</th>
            <th class="text-center" width="50">Edit</th>
            <th class="text-center" width="50">Delete</th>
        </tr>

        <c:forEach items="${listTasks}" var="task">
            <tr>
                <td>${task.id}</td>
                <td>${task.name}</td>
                <td>${task.description}</td>
                <td>${task.implementer.getFirstName()}</td>
                <%--task.responsiblePerson !!! was replaced by task.implementer--%>
                <td><fmt:formatDate value="${task.created}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                <td><fmt:formatDate value="${task.updated}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                <td class="text-center"><a href="<c:url value='/taskdata/${task.id}/'/>"
                                           span class="glyphicon glyphicon glyphicon-file " style="color: darkblue"></a></td>
                <td class="text-center"><a href="<c:url value='/edittask/${task.id}/'/>"
                                           span class="glyphicon glyphicon glyphicon-edit" style="color: orange"></a></td>
                <td class="text-center"><a href="<c:url value='/removetask/${task.id}/' />"
                                           span class="glyphicon glyphicon-remove" style="color: red"></a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<a href="<c:url value='/home/' />" class="btn btn-lg" style="color: royalblue">Back to home page</a>
<br>
<br>
<br>

    <script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
