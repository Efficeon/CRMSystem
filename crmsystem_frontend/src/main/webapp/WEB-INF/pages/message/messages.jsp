<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">

    <link rel="stylesheet/less" type="text/css" href="${contextPath}/resources/css/style.less"/>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${contextPath}/resources/js/users.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js" ></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <title>Message</title>
</head>
<body>
<jsp:include page="../menuPices/navbarLeft.jsp"/>

<div class="block-left" style="color: #1b6d85">
     <div id="contentMessage1">
         <!--Insert block "fragmentUsers"-->
     </div>
</div>

<div class="block-right">
    <div id="contentMessage0">
        <h3 style="color: red; margin: 10px;">  To send a message, select the user </h3>
    </div>
</div>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
