<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Search</title>
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

    <h1>Companies</h1>
    <c:if test="${!empty listCompanies}">
        <table class="table table-striped table-condensed">
            <tr>
                <th class="text-center" width="23">ID</th>
                <th class="text-center" width="120">Name</th>
                <th class="text-center" width="80">Email</th>
                <th class="text-center" width="80">Web site</th>
                <th class="text-center" width="60">Address</th>
                <th class="text-center" width="40">Created</th>
                <th class="text-center" width="40">Updated</th>
                <th class="text-center" width="50">Details</th>
                <th class="text-center" width="50">Edit</th>
                <th class="text-center" width="50">Delete</th>
            </tr>
            <c:forEach items="${listCompanies}" var="company">
                <tr>
                    <td>${company.id}</td>
                    <td>${company.name}</td>
                    <td>${company.email}</td>
                    <td>${company.website}</td>
                    <td>${company.address}</td>
                    <td><fmt:formatDate value="${company.created}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${company.updated}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                    <td class="text-center"><a href="<c:url value='/companydata/${company.id}/' />"
                                               span class="glyphicon glyphicon glyphicon-file "
                                               style="color: darkblue"/></td>
                    <td class="text-center"><a href="<c:url value='/editcompany/${company.id}/' />"
                                               span class="glyphicon glyphicon glyphicon-edit"
                                               style="color: orange"/></td>
                    <td class="text-center"><a href="<c:url value='/removecompany/${company.id}/' />"
                                               span class="glyphicon glyphicon-remove" style="color: red"/></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <h1>Deal list</h1>
    <c:if test="${!empty listDeals}">
        <table>
            <tr>
                <th width="80">ID</th>
                <th width="120">NAME</th>
                <th width="120">BUDGET</th>
                <th width="120">CREATED</th>
                <th width="120">UPDATED</th>
                <th width="120">USER ID</th>
                <th width="120">DEAL STATUS</th>
                <th width="120">DELETE</th>
                <th width="120">EDIT</th>
            </tr>
            <c:forEach items="${listDeals}" var="deal">
                <tr align="center">
                    <td>${deal.id}</td>
                    <td>${deal.name}</td>
                    <td>${deal.budget}</td>
                    <td>${deal.created}</td>
                    <td>${deal.updated}</td>
                    <td>${deal.responsibleUser.firstName}</td>
                    <td>${deal.dealStatus.name}</td>
                    <td><a href="<c:url value='/removedeal/${deal.id}/'/>">Delete</a></td>

                    <td><a href="<c:url value='/editdeal/${deal.id}/'/>">Edit</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>