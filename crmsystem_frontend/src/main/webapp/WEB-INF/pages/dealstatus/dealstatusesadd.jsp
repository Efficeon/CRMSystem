
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
  <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js" ></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

  <title>Create Deal Status</title>

</head>

<body>
  <jsp:include page="../menuPices/navbarLeft.jsp"/>
  <div class="main-content">
  <form:form id="dealStatusForm" method="POST" modelAttribute="dealstatus">
  <form class="form-inline">
    <div class="form-group">
      <c:if test="${!empty dealStatus.name}">
        <spring:bind path="id">
          <form:input  type="text" path="id" class="form-group" readonly="true"
                       disabled="true" placeholder='ID${id}'></form:input>
        </spring:bind>
      </c:if>
      <spring:bind path="id">
        <form:input  type="text" path="name" class="form-group"
                     placeholder='Name${name}' autofocus="true"></form:input>
      </spring:bind>

      <button type="submit" id="dealStatusForm">
        <spring:message text="Add"/>
      </button>
    </div>

    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>

  </form>
  </form:form>
</div>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
