<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <a href="<c:url value='/company/' />" class="btn btn-lg" style="color: green">
        <i class="glyphicon glyphicon-arrow-left"></i> All company</a>
    <title>Create company</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
</head>


<br>
<h1>Company add</h1>
<body>
<form:form method="POST" modelAttribute="tag" action="/tagCreate/">
    <form class="form-inline">
    <h5>Tags</h5>
    <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
        <c:if test="${!empty listTags}">
            <c:forEach items="${listTags}" var="tag">
                <table class="table table-hover table-condensed">
                    <td>${tag.name}</td>
                </table>
            </c:forEach>
        </c:if>
    </div>

    <h5>Tags</h5>
        <div class="form-group">
            <spring:bind path="name">
                <form:input  type="text" path="name" class="form-inline"
                             placeholder='Name${name}' autofocus="true"></form:input>
            </spring:bind>
            <button type="submit">
                <spring:message text="Add"/>
            </button>
        </div>
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/></form>
</form:form>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
