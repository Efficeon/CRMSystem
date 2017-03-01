<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Contact</title>
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
    <h1>Contacts</h1>
    <a href="<c:url value='/contact/add/' />" class="btn btn-lg"><i class="fa fa-plus"></i>
        Create contact</a>

    </br>
    </br>
    <c:if test="${!empty listContacts}">
        <table class="table table-striped table-condensed">
            <tr>
                <th class="text-center" width="23">ID</th>
                <th class="text-center" width="120">Name</th>
                <th class="text-center" width="80">Web site</th>
                <th class="text-center" width="60">Skype</th>
                <th class="text-center" width="40">Phone number</th>
                <th class="text-center" width="40">Associated company</th>
                <th class="text-center" width="40">Associated deal</th>
                <th class="text-center" width="40">Responsible user</th>
                <th class="text-center" width="40">Created</th>
                <th class="text-center" width="40">Updated</th>
                <th class="text-center" width="50">Details</th>
                <th class="text-center" width="50">Edit</th>
                <th class="text-center" width="50">Delete</th>
            </tr>
            <c:forEach items="${listContacts}" var="contact">
                <tr>
                    <td>${contact.id}</td>
                    <td>${contact.name}</td>
                    <td>${contact.website}</td>
                    <td>${contact.skype}</td>
                    <td>${contact.phoneNumber}</td>
                    <td><c:forEach items="${contact.associatedCompanies}" var="company">
                        <table>
                            <td>${company.name}</td>
                        </table>
                    </c:forEach></td>
                    <td><c:forEach items="${contact.associatedDeal}" var="deal">
                        <table>
                            <td>${deal.name}</td>
                        </table>
                    </c:forEach></td>
                    <c:if test="${!(contact.responsibleUser==null)}">
                    <td>${contact.responsibleUser.username}</td>
                    </c:if>
                    <c:if test="${(contact.responsibleUser==null)}">
                     <td></td>
                    </c:if>
                    <td><fmt:formatDate value="${contact.createDate}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${contact.updateDate}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                    <td class="text-center"><a href="<c:url value='/contactdata/${contact.id}/' />"
                                               span class="glyphicon glyphicon glyphicon-file "
                                               style="color: darkblue"/></td>
                    <td class="text-center"><a href="<c:url value='/editcontact/${contact.id}/' />"
                                               span class="glyphicon glyphicon glyphicon-edit"
                                               style="color: orange"/></td>
                    <td class="text-center"><a href="<c:url value='/removecontact/${contact.id}/' />"
                                               span class="glyphicon glyphicon-remove" style="color: red"/></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
