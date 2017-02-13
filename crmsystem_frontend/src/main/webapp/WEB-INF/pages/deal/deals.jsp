
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

    <title>Deals</title>

  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<br>
Add deal
<a href="<c:url value='/deal/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create deal</a>

</br>



<h1>Deal list</h1>

<c:if test="${!empty listDeals}">
  <table>
    <tr>
      <th width="80">ID</th>
      <th width="120">BUDGET</th>
      <th width="120">CREATED</th>
      <th width="120">UPDATED</th>
      <th width="120">USER ID</th>
      <th width="120">DEAL STATUS</th>
      <th width="120">Delete></th>
    </tr>
    <c:forEach items="listDeals" var="deal">
      <tr>
        <td>${deal.id}</td>
        <td>${deal.budget/100}${deal.budget%100}</td>
        <td>${deal.created}</td>
        <td>${deal.updated}</td>
        <td>${deal.responsibleUser.id}</td>
        <td>${deal.dealStatus.id}</td>
        <td><a href="<c:url value='deals/remove/${deal}'/>">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>

</body>
</html>