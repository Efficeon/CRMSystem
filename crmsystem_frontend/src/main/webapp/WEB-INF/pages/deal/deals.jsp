
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


<div id="pdfReady" class="main-content">
<h1>Deal list</h1>

<br>
  <div id="buttonNoPrint">
<a href="<c:url value='/deal/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create deal</a>
  </div>
<br>

<c:if test="${!empty listDeals}">
  <table>
    <tr>
      <th width="80">ID</th>
      <th width="120">NAME</th>
      <th width="120">BUDGET</th>
      <th width="120">ASSOCIATED CONTACT</th>
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
        <td><c:forEach items="${deal.associatedContact}" var="contact">
          <table>
            <td>${contact.name}</td>
          </table>
        </c:forEach></td>
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
</div>

<div id="buttonNoPrint">
<input type="submit" value="Print" onclick="window.print();" style="margin-left: 23px"/>
</div>





<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
