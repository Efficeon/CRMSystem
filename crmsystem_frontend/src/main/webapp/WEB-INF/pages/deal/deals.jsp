
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

    <title>Deals</title>

  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Deal list</h1>

<c:if test="${!empty listDeals}">
  <table>
    <tr>
      <th width="80">ID</th>
      <th width="120">BUDGET</th>
      <th width="120">CREATED</th>
      <th width="120">UPDATED</th>
      <th width="120">USER ID</th>
      <th width="120">Delete></th>
    </tr>
    <c:forEach items="listDeals" var="deal">
      <tr>
        <td>${deal.id}</td>
        <td>${deal.budget/100}${deal.budget%100}</td>
        <td>${deal.created}</td>
        <td>${deal.updated}</td>
        <td>${deal.responsibleUser.id}</td>
        <td><a href="<c:url value='/remove/${deal}'/>">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>

<h1>Add a Deal</h1>

<c:url var="addAction" value="/deals/addDeal"/>

  <form:form action="${addAction}" commandName="deal">
    <table>
        <tr>
          <td>
            <form:label path="id">
              <spring:message text="ID"/>
            </form:label>
          </td>
          <td>
            <form:input path="id" readonly="true" size="8" disabled="true"/>
            <form:hidden path="id"/>
          </td>
        </tr>

      <tr>
        <td>
          <form:label path="budget">
            <spring:message text="Budget"/>
          </form:label>
        </td>
        <td>
          <form:input path="budget"/>
        </td>
      </tr>

      <tr>
        <td>
          <form:label path="responsibleUser">
            <spring:message text="responsibleUser"/>
          </form:label>
        </td>
        <td>
          <form:input path="userId"/>
        </td>
      </tr>

      <tr>
        <td colspan="2">
          <c:if test="${!empty deal.budget}">
            <input type="submit"
                   value="<spring:message text="addDeal"/>"/>
          </c:if>
        </td>
      </tr>
    </table>
  </form:form>

</body>
</html>
