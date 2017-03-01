<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Create deal</title>

    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js" ></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
</head>

<body>

<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
<h1>Deal add</h1>
<form:form id="dealform" method="POST" modelAttribute="deal" >

<table>
    <tr>
        <td>
               Budget
              <spring:bind path="budget">
                <form:input  type="text" path="budget" class="form-group"
                             placeholder='Budget${budget}' autofocus="true"></form:input>
              </spring:bind>
                Name
              <spring:bind path="name">
                 <form:input  type="text" path="name" class="form-group"
                                 placeholder='Name${name}' autofocus="true"></form:input>
               </spring:bind>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <form:select path="responsibleUser.id">
                <form:options items="${userList}" itemValue="id" itemLabel="firstName"/>
            </form:select>

            <form:select path="dealStatus.id">
                <form:options items="${dealStatusList}" itemValue="id" itemLabel="name"/>
            </form:select>

        </td>
    </tr>
</table>

    <button type="submit" id="dealform">
        <spring:message text="Add"/>
    </button>

</form:form>
    <c:if test="${empty contact.id}">
    <h4 style="color: red">Add associated contacts after adding deal</h4>
    </c:if>
    <!--add Contacts -->
    <div class="clearfix">
        <div class="clearfix">
            <div class="clearfix" style="float: left; margin: 0px 10px 0px 0px;">
                <h5>All contacts</h5>
                <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
                    <c:if test="${!empty contactsList}">
                        <c:forEach items="${contactsList}" var="contact">
                            <c:if test="${!deal.associatedContact.contains(contact)}">
                                <table class="table table-hover table-condensed">
                                    <c:if test="${!empty deal.id}">
                                        <td disabled="true"><a href="<c:url value='/associatedContact/add/${contact.id}/${deal.id}/' />"
                                                               style="text-decoration: none" />${contact.name}</td>
                                    </c:if>
                                </table>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <!--remove associated contact -->
            <div class="clearfix" style="float: left; margin: 0px 10px 0px 0px;">
                <h5>Associated Contacts</h5>
                <div class="panel panel-default" style="height: 100px; width: 300px; overflow: auto">
                    <c:if test="${!empty deal.associatedContact}">
                        <c:forEach items="${deal.associatedContact}" var="contact">
                            <table class="table table-hover table-condensed">
                                <td><a href="<c:url value='/associatedContact/remove/${contact.id}/${deal.id}/' />"
                                       style="text-decoration: none"/>${contact.name} </td>
                            </table>
                        </c:forEach>
                    </c:if>
                </div>
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            </div>
        </div>
</div>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>

