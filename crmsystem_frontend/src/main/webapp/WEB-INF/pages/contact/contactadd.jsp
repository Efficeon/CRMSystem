<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
    <c:if test="${empty contact.id}">
    <h1>Contact add</h1>
    </c:if>
    <c:if test="${!empty contact.id}">
    <h1>Contact edit</h1>
    </c:if>

    <form:form id="contactform" method="POST" modelAttribute="contact" action="/contact/add/${contact.id}">
    <form class="form-inline">
        <div class="form-group">
            <c:if test="${!empty contact.id}">
                <spring:bind path="id">
                    <form:input  type="text" path="id" class="form-group" readonly="true"
                                 disabled="true" placeholder='ID${id}'></form:input>
                </spring:bind>
            </c:if>
            <spring:bind path="name">
                <form:input  type="text" path="name" class="form-group"
                             placeholder='Name${name}' autofocus="true"></form:input>
            </spring:bind>

            <spring:bind path="website">
                <form:input  type="text" path="website" class="form-group"
                             placeholder='Web site${website}' autofocus="true"></form:input>
            </spring:bind>

            <spring:bind path="skype">
                <form:input   type="text" path="skype" class="form-group"
                             placeholder='Skype${skype}' autofocus="true"></form:input>
            </spring:bind>

            <spring:bind path="phoneNumber">
                <form:input  type="text" path="phoneNumber" class="form-group"
                             placeholder='Phone number${phoneNumber}' autofocus="true"></form:input>
            </spring:bind>

            <form:select path="responsibleUser.id"  style="width: 80px; height: 27px;">
                <form:option value="" label="${pageContext.request.userPrincipal.name}"/>
                <form:options items="${listUsers}" itemValue="id" itemLabel="username"/>
            </form:select>

            <button type="submit" id="dealform" >
                <spring:message text="Add"/>
            </button>
        </div>
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form>

        <!--add associated company -->
        <c:if test="${empty contact.id}">
            <h4 style="color: red">Add associated companies after adding contact</h4>
        </c:if>

        <div class="clearfix">
            <div class="clearfix" style="float: left; margin: 0px 10px 0px 0px;">
                <h5>All companies</h5>
                <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
                    <c:if test="${!empty listCompanies}">
                        <c:forEach items="${listCompanies}" var="company">
                            <c:if test="${!contact.associatedCompany.equals(company)}">
                                <table class="table table-hover table-condensed">
                                    <c:if test="${!empty contact.id}">
                                        <td disabled="true"><a href="<c:url value='/addAssociatedCompany/${company.id}/${contact.id}/' />"
                                                               style="text-decoration: none" />${company.name}</td>
                                    </c:if>
                                </table>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <!--remove associated company -->
            <div class="clearfix" style="float: left; margin: 0px 0px 0px 10px;">
                <h5>Associated company</h5>
                <div class="panel panel-default clearfix" style="float: left; height: 44px; width: 300px; overflow: auto">
                    <c:if test="${!empty contact.associatedCompany}">
                        <table class="table table-hover table-condensed">
                            <td><a href="<c:url value='/associatedCompany/remove/${contact.id}/' />"
                                   style="text-decoration: none"/>${contact.associatedCompany.name} </td>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </form:form>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>