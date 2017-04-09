<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User verifier</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/search.js"></script>
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <a href="<%=request.getContextPath()%>?languageVar=en"><spring:message code="general.EN"/></a>
    <a href="<%=request.getContextPath()%>?languageVar=ru"><spring:message code="general.RU"/></a>

    <h3>User verifier</h3>

    <input type="text" id="input" class="form-control" placeholder="Enter the verification code..."autofocus="true">

    <button class="btn btn-lg btn-primary btn-block" type="submit" onClick="javascript:userid()">
        <spring:message code="registration.buttons.submit"/>
    </button>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
