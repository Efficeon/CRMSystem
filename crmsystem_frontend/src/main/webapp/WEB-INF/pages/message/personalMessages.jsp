<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${contextPath}/resources/js/messages.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js" ></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <title>Message</title>
    <script>
        var block = document.getElementById("contentMessage2");
        block.scrollTop = block.scrollHeight;
    </script>
</head>
<body>

<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div id="main-content"></div>
<div class="block-left" style="color: #1b6d85">
    <div id="contentMessage1">
        <c:forEach items="${userList}" var="user">
            <a href="/message/personalMessages/${pageContext.request.userPrincipal.name}/${user.username}" style="text-decoration: none"> ${user.username}</a><br>
        </c:forEach>
    </div>
</div>

<div class="block-right">
    <div id="contentMessage2">
        <!--Insert block "fragment"-->
    </div>
    <div id="contentMessage3">
        <form:form id="messageform" method="POST" modelAttribute="message" action="/messageSend/">
            <spring:bind path="text">
                <textarea name="text" type="text" rows="5" path="text" placeholder='Add a message...${text}'
                          autofocus="true" class="form-message"></textarea><br>
            </spring:bind>
            <hr style="margin: 1px; border-color: #bcacff">
            <button type="submit" id="messageform" style="float: left">
                <spring:message text="Submit"/>
            </button>
         </form:form>
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </div>
</div>
<script>
    var block = document.getElementById("contentMessage2");
    block.scrollTop = block.scrollHeight;
</script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>