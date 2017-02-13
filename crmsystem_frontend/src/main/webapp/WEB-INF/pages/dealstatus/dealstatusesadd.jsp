
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>

  <a href="<c:url value='/dealstatus/' />" class="btn btn-lg" style="color: green">
    <i class="glyphicon glyphicon-arrow-left"></i> All Deal Statuses</a>
  <title>Create Deal Status</title>
</head>

<body>
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


</body>
</html>
