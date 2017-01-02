<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>
<div class="container">

    <a href="<%=request.getContextPath()%>?languageVar=en"><spring:message code="general.EN"/></a>
    <a href="<%=request.getContextPath()%>?languageVar=ru"><spring:message code="general.RU"/></a>

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">
            <spring:message code="registration.head"/>
        </h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.username" var="Username"/>
                <form:input type="text" path="username" class="form-control" placeholder='${Username}'
                            autofocus="true"></form:input>

                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="firstName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.firstname" var="Firstname"/>
                <form:input type="text" path="firstName" class="form-control" placeholder='${Firstname}'
                            autofocus="true"></form:input>
                <form:errors path="firstName"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="lastName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.lastname" var="Lastname"/>
                <form:input type="text" path="lastName" class="form-control" placeholder='${Lastname}'
                            autofocus="true"></form:input>
                <form:errors path="lastName"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.password" var="Password"/>
                <form:input type="password" path="password" class="form-control"
                            placeholder='${Password}'></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>


        <spring:bind path="confirmPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.confirmPassword" var="confirmPassword"/>
                <form:input type="password" path="confirmPassword" class="form-control"
                            placeholder='${confirmPassword}'></form:input>
                <form:errors path="confirmPassword"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="userType">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.usertype" var="Usertype"/>
                <form:input type="text" path="userType" class="form-control" placeholder='${Usertype}'
                            autofocus="true"></form:input>
                <form:errors path="userType"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="registration.placeholder.email" var="Email"/>
                <form:input type="text" path="email" class="form-control" placeholder='${Email}'
                            autofocus="true"></form:input>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">
            <spring:message code="registration.buttons.submit"/>
        </button>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
