
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

    <title>Deals</title>

</head>

<body>

<jsp:include page="../menuPices/navbarLeft.jsp"/>

<h1>Deal list</h1>

<br>
<a href="<c:url value='/deal/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create deal</a>
<br>

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
        <td>${deal.budget}.${deal.budget%100}</td>
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

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
