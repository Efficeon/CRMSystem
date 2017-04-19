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
<div id="contentMessage4">
    <c:if test="${messageList != null}">
        <c:forEach items="${messageList}" var="message">
            <c:if test="${message.getAuthor().getUsername() != pageContext.request.userPrincipal.name}">
                <div class="messageFrame">
                    <div style="font-weight: bold">
                        <a style="color: #ff5f61; font-size: small;">${message.getAuthor().getUsername()}</a>
                        <fmt:formatDate value="${message.getCreated()}" pattern="HH:mm:ss, d-MM-yyyy"/>
                    </div>
                    <p>${message.getText()}</p>
                </div>
            </c:if>
            <c:if test="${message.getAuthor().getUsername() == pageContext.request.userPrincipal.name}">
            <div class="messageFrame2">
                    <div style="font-weight: bold; font-size: small;">
                        <a style="color: #9e26ff; font-size: small;">${message.getAuthor().getUsername()}</a>
                        <fmt:formatDate value="${message.getCreated()}" pattern="HH:mm:ss, d-MM-yyyy"/>
                    </div>
                    <p>${message.getText()}</p>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
</div>

</body>
