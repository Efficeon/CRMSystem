
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

<h1>Deal add</h1>
<br>
<br>
<table>
  <tr>
    <td>
<%--<form:form>--%>
<form:form id="dealform" method="POST" modelAttribute="deal">


      <c:if test="${!empty deal.budget}">
        <spring:bind path="id">
          <form:input  type="text" path="id" class="form-group" readonly="true"
                       disabled="true" placeholder='ID${id}'></form:input>
        </spring:bind>
      </c:if>
      Budget
      <spring:bind path="budget">
        <form:input  type="text" path="budget" class="form-group"
                     placeholder='Budget${budget}' autofocus="true"></form:input>
      </spring:bind>


      <button type="submit" id="dealform">
        <spring:message text="Add"/>
      </button>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form:form>

<br>
Please select responsible user
<form:form modelAttribute="selectedUser" method="post" action="/deal/addUser/">
<form:select path="username">
  <form:option value="NONE" label="--- Select ---"/>
  <c:forEach var="theUser" items="${userList}">
    <form:option value="${theUser}"><c:out value="${theUser.username}"/> </form:option>
  </c:forEach>
  <input type="submit" value="addUser">
  <%--<form:options items="${userList}" itemLabel="username" itemValue="username" />--%>
</form:select>
</form:form>

    <br>
Please select deal status
<form:form modelAttribute="selectedDealStatus" method="post" action="/deal/addUser/">
  <%--<input type="submit" value="addDealStatus">--%>
<form:select path="name">
  <form:option value="NONE" label="--- Select ---"/>
  <c:forEach var="theDealStatus" items="${dealStatus}">
    <form:option value="${theDealStatus}"><c:out value="${theDealStatus.name}"/> </form:option>
  </c:forEach>
  <input type="submit" value="Submit">
</form:select>
</form:form>

</body>
</html>