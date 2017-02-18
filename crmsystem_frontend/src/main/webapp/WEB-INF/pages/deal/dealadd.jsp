
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



<form:form id="dealform" method="POST" modelAttribute="deal" >

<table>
    <tr>
        <td>
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

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

<br>

            <form:select path="responsibleUser.id">
                <form:option value="NONE" label="Select responsible user"/>
                <form:options items="${userList}" itemValue="id" itemLabel="firstName"/>
            </form:select>

            <form:select path="dealStatus.id">
                <%--<form:option value="NONE" label="Deal Status"/>--%>
                <form:options items="${dealStatusList}" itemValue="id" itemLabel="name"/>
            </form:select>
        </td>
    </tr>
</table>

    <button type="submit" id="dealform">
        <spring:message text="Add"/>
    </button>

</form:form>



</body>
</html>

<%--<td>--%>
<%--<form:select  path="dealStatus"><!-- action="/{selectedDealStatusId}/"><!--modelAttribute="selectedDealStatus"-->--%>
<%--<form:option value="NONE" label="Select deal status"/>--%>
<%--<c:forEach var="selectedDealStatus" items="${dealStatus}">--%>
<%--<form:option value="${selectedDealStatus.id}"><c:out value="${selectedDealStatus.name}"/> </form:option>--%>
<%--</c:forEach>--%>
<%--</form:select>--%>
<%--</td>--%>