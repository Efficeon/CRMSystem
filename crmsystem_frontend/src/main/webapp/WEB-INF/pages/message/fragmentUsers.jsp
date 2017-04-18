<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <script>
        var block = document.getElementById("contentMessage4");
        block.scrollTop = block.scrollHeight;
    </script>

</head>
<body>

    <c:forEach items="${newMessageUsers}" var="user">
          <a href="/message/personalMessages/${pageContext.request.userPrincipal.name}/${user.getUsername()}" style="color: #9e26ff; font-weight: bold"> ${user.getUsername()}</a><br>
    </c:forEach>
    <hr style="margin: 1px; border-color: #bcacff">
    <c:forEach items="${listUsers}" var="user">
        <a href="/message/personalMessages/${pageContext.request.userPrincipal.name}/${user.getUsername()}" style="text-decoration: none"> ${user.getUsername()}</a><br>
    </c:forEach>


</body>
