<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Company details</title>
    <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
    <link rel="stylesheet" href="http://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css" />
    <link rel="stylesheet" href="http://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/styleForComment.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

</head>
<body>
<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
    <h1>Deal details</h1>

        <table class="table table-striped table-condensed">
            <tr>
                <th class="text-center" width="120">Name</th>
                <th class="text-center" width="60">Budget</th>
                <th class="text-center" width="120">Associated contact</th>
                <th class="text-center" width="120">Responsible user</th>
                <th class="text-center" width="120">Created</th>
                <th class="text-center" width="120">Updated</th>
                <th class="text-center" width="80">Deal status</th>
                <th class="text-center" width="120">Edit</th>
                <th class="text-center" width="120">Delete</th>
            </tr>
                <tr align="center">
                    <td>${deal.name}</td>
                    <td>${deal.budget}</td>
                    <td><c:forEach items="${deal.associatedContact}" var="contact">
                        <table>
                            <td>${contact.name}</td>
                        </table>
                    </c:forEach></td>
                    <td>${deal.responsibleUser.firstName}</td>
                    <td><fmt:formatDate value="${deal.created}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${deal.updated}" pattern="d-MM-yyyy, HH:mm:ss"/></td>
                    <td>${deal.dealStatus.name}</td>
                    <td class="text-center"><a href="<c:url value='/editdeal/${deal.id}/'/>"
                                               span class="glyphicon glyphicon-edit" style="color: orange"/></td>
                    <td class="text-center"><a href="<c:url value='/removedeal/${deal.id}/' />"
                                               span class="glyphicon glyphicon-remove"
                                               style="color: red"/></td>
                </tr>
        </table>

    <!---------------create new comment----------------------->
<form:form id="commentform" method="POST" modelAttribute="comment" action="/commentadd/${deal.id}/${pageContext.request.userPrincipal.name}" >
    <spring:bind path="text" >
        <form:input type="textarea" path="text" class="form" size="137%" rows="4" placeholder='Add a comment...${text}' autofocus="true"/>
    </spring:bind>
    <br>
    <button type="submit" id="commentform" style="float: right">
        <spring:message text="Submit"/>
    </button>
    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
</form:form>

    <!---------------Show comments 1st level on the cycle----------------------->

<c:forEach items="${commentsList}" var="comment1st">
<c:if test="${comment1st.primaryCommentID == null}">
        <a style="color: red">${comment1st.author.username}</a>
        <fmt:formatDate value="${comment1st.getUpdated()}" pattern="d-MM-yyyy, HH:mm:ss"/><br>
        ${comment1st.text}

        <!---------------Hiding button and field for answering----------------------->
        <button class="show" data-toggle="collapse" data-target="#hide-me">Reply 1st</button>
        <hr width=100%" align="right" style="color: red">
        <div id="hide-me" class="collapse">
            <form:form id="replycomment1" method="POST" modelAttribute="comment" action="/replycomment/${deal.id}/${comment1st.id}/${pageContext.request.userPrincipal.name}/${comment1st.author.username}/">
                <spring:bind path="text" >
                    <form:input type="textarea" path="text" class="form" size="137%" rows="4" placeholder='Add a comment...${text}'/>
                </spring:bind>

                <button type="submit" id="replycomment1" style="float: left">
                    <spring:message text="Submit"/>
                </button><br>
                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
            </form:form>
        </div>

        <!---------------Show comments 2nd level on a cycle----------------------->
        <c:forEach items="${commentsList}" var="comment2nd">
            <table><tr><td>
            <c:if test="${comment2nd.primaryCommentID == comment1st.id}">
                <div class="form-group" style="float: left; margin: 10px 0px 10px 50px;">
                    <a style="color: red">${comment2nd.author.username}</a>
                    <fmt:formatDate value="${comment2nd.getUpdated()}" pattern="HH:mm:ss, d-MM-yyyy"/>
                    <a style="color: #787dff">to ${comment1st.author.username}</a>
                    <fmt:formatDate value="${comment1st.getUpdated()}" pattern="HH:mm:ss, d-MM-yyyy"/>
                    <br>${comment2nd.text}<br>

                    <!---------------Hiding button and field for answering----------------------->
                    <button class="show" data-toggle="collapse" data-target="#hide-me">Reply2</button>
                    <hr width=100%" align="right" style="color: red">
                    <div id="hide-me" class="collapse">
                        <form:form id="replycomment2" method="POST" modelAttribute="comment"
                                   action="/replycomment/${deal.id}/${comment2nd.id}/${pageContext.request.userPrincipal.name}/${comment2nd.author.username}/">
                            <spring:bind path="text" >
                                <form:input type="textarea" path="text" class="form" size="137%" rows="4" placeholder='Add a comment...${text}' autofocus="true"/>
                            </spring:bind>

                            <button type="submit" id="replycomment2" style="float: right">
                                <spring:message text="Submit"/>
                            </button>
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                        </form:form>
                    </div>
                </div>
               </c:if>
            </td></tr></table>
        </c:forEach>
</c:if>
</c:forEach>

</div>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/comments.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
