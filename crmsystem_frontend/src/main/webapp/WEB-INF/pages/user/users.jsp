<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js" ></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

</head>

<body>
<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
    <h1>Users</h1>

    </br>
    <c:if test="${!empty listUsers}">
        <table class="table table-striped table-condensed">
            <tr>
                <th class="text-center" width="23">ID</th>
                <th class="text-center" width="120">Name</th>
                <th class="text-center" width="60">First name</th>
                <th class="text-center" width="40">Last name</th>
                <th class="text-center" width="80">User type</th>
                <th class="text-center" width="80">Email</th>
                <th class="text-center" width="40">Birthday</th>
                <th class="text-center" width="50">Registration date</th>
            </tr>
            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.userType}</td>
                    <td>${user.email}</td>
                    <td>${user.birthDate}</td>
                    <td>${user.registrationDate}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
