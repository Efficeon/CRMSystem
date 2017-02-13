
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
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <br>
</head>


<body>
<form:form id="dealform" method="POST" modelAttribute="deal">
  <form class="form-inline">
    <div class="form-group">
      <c:if test="${!empty deal.budget}">
        <spring:bind path="id">
          <form:input  type="text" path="id" class="form-group" readonly="true"
                       disabled="true" placeholder='ID${id}'></form:input>
        </spring:bind>
      </c:if>
      <spring:bind path="budget">
        <form:input  type="text" path="budget" class="form-group"
                     placeholder='Budget${budget}' autofocus="true"></form:input>
      </spring:bind>

      <spring:bind path="created">
        <form:input  type="text" path="created" class="form-group"
                     placeholder='Created${created}' autofocus="true"></form:input>
      </spring:bind>

      <spring:bind path="updated">
        <form:input  type="text" path="updated" class="form-group"
                     placeholder='Updated${updated}' autofocus="true"></form:input>
      </spring:bind>

      <spring:bind path="responsibleUser">
        <form:input  type="text" path="responsibleUser" class="form-group"
                     placeholder='ResponsibleUser${responsibleUser}' autofocus="true"></form:input>
      </spring:bind>

        <spring:bind path="dealStatus">
            <form:input  type="text" path="dealStatus" class="form-group"
                         placeholder='dealStatus${dealStatus}' autofocus="true"></form:input>
        </spring:bind>

      <button type="submit" id="dealform">
        <spring:message text="Add"/>
      </button>
    </div>
  </form>
    </form:form>

</body>
</html>
