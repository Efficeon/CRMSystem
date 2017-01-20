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
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
    <!--script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.0.js"></script>
    <script src="${contextPath}/resources/dist/bloodhound.js"></script>
    <script src="${contextPath}/resources/dist/typeahead.jquery.js"></script-->
</head>
<br>
<h1>Company add</h1>
<body>
<form:form id="companyform" method="POST" modelAttribute="company">
<form class="form-inline">
    <div class="form-group">
        <c:if test="${!empty company.name}">
            <spring:bind path="id">
                <form:input  type="text" path="id" class="form-group" readonly="true"
                             disabled="true" placeholder='ID${id}'></form:input>
            </spring:bind>
        </c:if>
        <spring:bind path="name">
            <form:input  type="text" path="name" class="form-group"
                         placeholder='Name${name}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="email">
            <form:input  type="text" path="email" class="form-group"
                         placeholder='E-mail${email}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="website">
            <form:input  type="text" path="website" class="form-group"
                         placeholder='Web site${website}' autofocus="true"></form:input>
        </spring:bind>

        <spring:bind path="address">
            <form:input  type="text" path="address" class="form-group"
                         placeholder='Address${address}' autofocus="true"></form:input>
        </spring:bind>

        <button type="submit" id="companyform">
            <spring:message text="Add"/>
        </button>
    </div>
    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
</form>
    <!--add ResponsibleUser -->
    <c:if test="${empty company.id}">
<h4 style="color: red">Add a responsible users and tags after adding Company</h4>
    </c:if>
    <h5>Users</h5>
    <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
        <c:if test="${!empty listUsers}">
            <c:forEach items="${listUsers}" var="user">
                    <table class="table table-hover table-condensed">
                    <c:if test="${!empty company.id}">
                        <td disabled="true"><a href="<c:url value='/addresponsible/${user.id}/${company.id}/' />"
                        style="text-decoration: none" />${user.username}</td>
                    </c:if>
                </table>
            </c:forEach>
        </c:if>
    </div>

    <!--remove ResponsibleUser -->
    <h5>Responsible users</h5>
    <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
     <c:if test="${!empty company.responsibleUser}">
        <c:forEach items="${company.responsibleUser}" var="user">
            <table class="table table-hover table-condensed">
                <td><a href="<c:url value='/removeresponsible/${user.id}/${company.id}/' />"
                        style="text-decoration: none"/>${user.username} </td>
            </table>
        </c:forEach>
    </c:if>
    </div>
    <h5>Tags</h5>
    <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
    <c:if test="${!empty company.tags}">
        <c:forEach items="${company.tags}" var="tag">
            <table class="table table-hover table-condensed">
                <td><a href="<c:url value='/removetag/${tag.id}/${company.id}/' />"
                       style="text-decoration: none"/>${tag.name} </td>
            </table>
        </c:forEach>
    </c:if>
    </div>

</form:form>

<form:form method="POST" modelAttribute="tag" action="/tagCreate/${company.id}/">
    <form class="form-inline">
        <h5>Tags</h5>
        <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
            <c:if test="${!empty company.id}">
            <c:if test="${!empty listTags}">
                <c:forEach items="${listTags}" var="tag">
                    <table class="table table-hover table-condensed">
                        <td>${tag.name}</td>
                    </table>
                </c:forEach>
            </c:if>
            </c:if>
        </div>

        <h5>Tags</h5>
        <div class="form-group">
            <spring:bind path="name" >
                <c:if test="${empty company.id}">
                <form:input  disabled="true" type="text" path="name" class="form-inline"
                             placeholder='Name${name}' autofocus="true"></form:input>
                </c:if>
                <c:if test="${!empty company.id}">
                    <form:input  type="text" path="name" class="form-inline"
                                 placeholder='Name${name}' autofocus="true"></form:input>
                </c:if>
            </spring:bind>
            <button type="submit">
                <spring:message text="Add"/>
            </button>
        </div>
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/></form>
</form:form>

<h5>Tags</h5>
<form:form method="POST" modelAttribute="tag" action="/tagAdd/${company.id}/">
<form>
    <select class="selectpicker" multiple data-max-options="1" data-live-search="true" name="name">
        <c:forEach items="${listTags}" var="tag">
            <option value ="${tag.name}">${tag.name}</option>
        </c:forEach>
    </select>
    <button type="submit">
        <spring:message text="Add"/>
    </button>
    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
</form>
</form:form>

<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<!--script src="${contextPath}/resources/js/bootstrap-typeahead.js"></scrip>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script-->

</body>
</html>
