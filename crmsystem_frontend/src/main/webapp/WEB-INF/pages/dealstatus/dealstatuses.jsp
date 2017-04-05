
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Deal Statuses</title>
  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: Arial, sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #fff;
    }

    .tg th {
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #f0f0f0;
    }

    .tg .tg-4eph {
      background-color: #f9f9f9
    }
  </style>

  <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js" ></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
</head>
<body>

<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
<h1>List of Deal Statuses</h1>

<br>
  <div id="buttonNoPrint">
<a href="<c:url value='/dealstatus/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create dealStatus</a>
  </div>
<br>
<br>

<c:if test="${!empty listDealStatuses}">
  <table class="tg">
    <tr>
      <th class="text-center" width="80">ID</th>
      <th class="text-center" width="120">Name</th>
      <th class="text-center" width="50">Edit</th>
      <th class="text-center" width="50">Delete</th>

    </tr>
    <c:forEach items="${listDealStatuses}" var="dealStatus">
      <tr>
        <td class="text-center">${dealStatus.id}</td>
        <td class="text-center">${dealStatus.name}</td>
        <td class="text-center"><a href='<c:url value="/editdealstatus/${dealStatus.id}/" />'/>Edit</td>
        <td class="text-center"><a href="<c:url value='/removedealstatus/${dealStatus.id}/' />"/>Remove</td>
      </tr>
    </c:forEach>
  </table>
</c:if>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
