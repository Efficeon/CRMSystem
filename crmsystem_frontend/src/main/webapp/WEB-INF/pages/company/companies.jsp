<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Company</title>
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
            <h1>Companies</h1>
             <a href="<c:url value='/company/add/' />" class="btn btn-lg"><i class="fa fa-plus"></i>
                Create company</a>

            </br>
            </br>
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
        </div>

<br>
<a href="<c:url value='/'/>">Back to start page</a>
<br>

<body>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
