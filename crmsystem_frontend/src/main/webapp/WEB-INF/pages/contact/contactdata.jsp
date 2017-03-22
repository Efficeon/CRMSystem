<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
    <title>Contact details</title>
    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
</head>
<body>
<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
<h1>Contact details</h1>

<table class="table table-striped table-condensed">
    <tr>
        <th class="text-center" width="23">ID</th>
        <th class="text-center" width="120">Name</th>
        <th class="text-center" width="80">Web site</th>
        <th class="text-center" width="60">Skype</th>
        <th class="text-center" width="40">Phone number</th>
        <th class="text-center" width="40">Associated company</th>
        <th class="text-center" width="40">Responsible user</th>
        <th class="text-center" width="40">Created</th>
        <th class="text-center" width="40">Updated</th>
        <th class="text-center" width="50">Edit</th>
        <th class="text-center" width="50">Delete</th>
    </tr>
    <tr>
        <td>${contact.id}</td>
        <td>${contact.name}</td>
        <td>${contact.website}</td>
        <td>${contact.skype}</td>
        <td>${contact.phoneNumber}</td>
        <c:if test="${!(contact.associatedCompanies==null)}">
            <td><c:forEach items="${contact.associatedCompanies}" var="contact">
                <table>
                    <td>${contact.name}</td>
                </table>
            </c:forEach></td>
        </c:if>
        <c:if test="${(contact.associatedCompanies==null)}">
            <td></td>
        </c:if>
        <c:if test="${!(contact.responsibleUser==null)}">
            <td>${contact.responsibleUser.username}</td>
        </c:if>
        <c:if test="${(contact.responsibleUser==null)}">
            <td></td>
        </c:if>
        <td><fmt:formatDate value="${contact.createDate}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
        <td><fmt:formatDate value="${contact.updateDate}" pattern="d-MM-yyyy, HH:mm:ss"/></td>

        <td class="text-center"><a href="<c:url value='/editcontact/${contact.id}/' />"
                                   span class="glyphicon glyphicon glyphicon-edit"
                                   style="color: orange"></a></td>
        <td class="text-center"><a href="<c:url value='/removecontact/${contact.id}/' />"
                                   span class="glyphicon glyphicon-remove" style="color: red"></a></td>
    </tr>
</table>
</div>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
