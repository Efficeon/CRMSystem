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
<div style="margin: 10px 10px 10px 10px;">
    <c:if test="${empty contact.id}">
    <h1>Contact add</h1>
    </c:if>
    <c:if test="${!empty contact.id}">
    <h1>Contact edit</h1>
    </c:if>
    <form:form id="contactform" method="POST" modelAttribute="contact">
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
                <form:input  type="text" path="skype" class="form-group"
                             placeholder='Skype${skype}' autofocus="true"></form:input>
            </spring:bind>

            <spring:bind path="phoneNumber">
                <form:input  type="text" path="phoneNumber" class="form-group"
                             placeholder='Phone number${phoneNumber}' autofocus="true"></form:input>
            </spring:bind>

            <form:select path="responsibleUser.id" style="width: 80px; height: 26px;">
                <form:options items="${listUsers}" itemValue="id" itemLabel="username"/>
            </form:select>

            <button type="submit" id="contactform">
                <spring:message text="Add"/>
            </button>
        </div>
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form>
</form:form>
</div>

<div style="margin: 10px 10px 10px 10px;">
    <c:if test="${empty contact.id}">
        <h4 style="color: red">Add company after adding Cotact</h4>
    </c:if>
    <form:form method="POST" modelAttribute="contact" action="/editcontact1/${contact.id}">
        <form class="form-inline">
            <h5>Select a company</h5>
            <div class="form-group">
                <select class="s-example-basic-single" name="company">
                    <c:forEach items="${listCompanies}" var="company">
                        <option value="${company.id}">
                                ${company.name}
                        </option>
                    </c:forEach>
                </select>

                <button class="selectpicker" style="height: 30px;" type="submit">
                        <spring:message text="Add"/>
                </button>
            </div>
            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            </form>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".js-example-basic-single").select2();
            });
        </script>

        <select class="js-example-basic-single">
            <option value="AL">Alabama</option>
            <option value="WY">Wyoming</option>
            <c:forEach items="${listCompanies}" var="company">
                <option value="${company.id}">
                        ${company.name}
                </option>
            </c:forEach>
        </select>
    </form:form>
    <form action="/editcontact1/${contact.id}/${company.id}" method="post">
        <p> <select class="js-example-basic-single">
            <option value="AL">Alabama</option>
            <option value="WY">Wyoming</option>
            <c:forEach items="${listCompanies}" var="company">
                <option value="${company.id}">
                        ${company.name}
                </option>
            </c:forEach>
        </select></p>
        <p><input type="submit" value="Отправить"></p>
    </form>
</div>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>