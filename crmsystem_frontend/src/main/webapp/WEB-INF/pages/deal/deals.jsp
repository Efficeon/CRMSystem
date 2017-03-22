<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>

  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js" ></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <title>Deals</title>

</head>

<body>

<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
<h3>Deal list</h3>
<br>
<a href="<c:url value='/deal/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create deal</a>
<a href="<c:url value='/dealsChart/' />" class="btn btn-lg" style="color: #787dff"><i class="glyphicon glyphicon-signal"></i> Deals chart</a>
<br>

<c:if test="${!empty listDeals}">
  <table class="table table-striped table-condensed">
    <tr>
      <th class="text-center" width="120">Name</th>
      <th class="text-center" width="60">Budget</th>
      <th class="text-center" width="120">Associated contact</th>
      <th class="text-center" width="120">Responsible user</th>
      <th class="text-center" width="120">Created</th>
      <th class="text-center" width="120">Updated</th>
      <th class="text-center" width="80">Deal status</th>
      <th class="text-center" width="120">Edit</th>
      <th class="text-center" width="120">Delete</th>
    </tr>
    <c:forEach items="${listDeals}" var="deal">
      <tr align="center">
        <td>${deal.name}</td>
        <td>${deal.budget}</td>
        <td><c:forEach items="${deal.associatedContact}" var="contact">
          <table>
            <td>${contact.name}</td>
          </table>
        </c:forEach></td>
        <td>${deal.responsibleUser.firstName}</td>
        <td><fmt:formatDate value="${deal.created}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
        <td><fmt:formatDate value="${deal.updated}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
        <td>${deal.dealStatus.name}</td>
        <td class="text-center"><a href="<c:url value='/editdeal/${deal.id}/'/>"
                                   span class="glyphicon glyphicon-edit" style="color: orange"/></td>
        <td class="text-center"><a href="<c:url value='/removedeal/${deal.id}/' />"
                                   span class="glyphicon glyphicon-remove"
                                   style="color: red"/></td>
      </tr>
    </c:forEach>
  </table>
</c:if>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</div>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
