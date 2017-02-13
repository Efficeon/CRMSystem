
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



<html>
<head>
    <title>Deal details:</title>
</head>
<body>

<table>
  <tr>
    <th width="80">ID</th>
    <th width="120">BUDGET</th>
    <th width="120">CREATED</th>
    <th width="120">UPDATED</th>
    <th width="120">USER ID</th>

  </tr>

    <tr>
      <td>${deal.id}</td>
      <td>${deal.budget/100}${deal.budget%100}</td>
      <td>${deal.created}</td>
      <td>${deal.updated}</td>
      <td>${deal.responsibleUser.id}</td>

    </tr>

</table>

</body>
</html>
