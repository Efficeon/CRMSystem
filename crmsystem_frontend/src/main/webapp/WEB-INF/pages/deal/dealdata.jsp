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
        <textarea name="text" rows="5" path="text" class="form" cols="50" placeholder='Add a comment...${text}' class="text"></textarea><br>
        <button type="submit" id="commentform" style="float: left">
        <spring:message text="Submit"/>
        </button>
        <br><br>
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    </form:form>

    <!---------------Show comments 1st level on the cycle----------------------->
    <c:forEach items="${commentsList}" var="comment1st">
        <c:if test="${comment1st.primaryCommentID == null}">
            <a style="color: red">${comment1st.author.username}</a>
            <fmt:formatDate value="${comment1st.getUpdated()}" pattern="HH:mm:ss, d-MM-yyyy"/><br>
            ${comment1st.text}<br>

            <!---------------Hiding button and field for answering----------------------->
            <a data-toggle="collapse" data-target="#${comment1st.getId()}">Reply</a>
            <div id=${comment1st.getId()} class="collapse">
                <form:form id="replycomment1" method="POST" modelAttribute="comment" action="/replycomment/${deal.id}/${comment1st.id}/${pageContext.request.userPrincipal.name}/${comment1st.author.username}/">
                    <textarea name="text" rows="5" path="text" class="form" cols="50" placeholder='Add a comment...${text}' class="text"></textarea><br>
                    <br>
                    <button type="submit" id="replycomment1" style="float: left">
                        <spring:message text="Submit"/>
                    </button><br>
                    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                </form:form><br>
            </div>

            <!---------------Hiding button and field for change answer----------------------->
            <c:if test="${(pageContext.request.userPrincipal.name).equals(comment1st.author.username)}">
                | <a data-toggle="collapse" data-target="#${comment1st.getId()}${comment1st.getId()}" style="color: green"> Change</a>
                <div id=${comment1st.getId()}${comment1st.getId()} class="collapse">
                    <form:form id="replycomment1" method="POST" modelAttribute="comment"
                               action="/editcomment/${deal.id}/${comment1st.id}">
                        <textarea name="text" rows="5" path="text" class="form" cols="50" placeholder='Add a comment...' class="text">${comment1st.text}</textarea><br>
                        <button type="submit" id="replycomment1" style="float: left">
                            <spring:message text="Submit"/>
                        </button><br>
                        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                    </form:form>
                </div>

                <!---------------Hiding button afor deleting comment----------------------->
                | <a href="/removecomment/${comment1st.id}/${deal.id}" style="color: red"> Delete</a>
            </c:if>
            <hr width=100%" align="right">

            <!---------------Show comments 2nd level on a cycle----------------------->
            <c:forEach items="${commentsList}" var="comment2nd">
                   <c:if test="${(comment2nd.primaryCommentID == comment1st.id)}">
                        <div class="commentblock">
                            <a style="color: red">${comment2nd.author.username}</a>
                            <fmt:formatDate value="${comment2nd.getUpdated()}" pattern="HH:mm:ss, d-MM-yyyy"/>
                            <br>${comment2nd.text}<br>

                            <!---------------Hiding button and field for answering----------------------->
                            <a data-toggle="collapse" data-target="#${comment2nd.getId()}">Reply</a>
                            <div id=${comment2nd.getId()} class="collapse">
                                <form:form id="replycomment2" method="POST" modelAttribute="comment"
                                           action="/replycomment/${deal.id}/${comment1st.id}/${pageContext.request.userPrincipal.name}/${comment2nd.author.username}/">
                                    <textarea name="text" rows="5" path="text" class="form" cols="50" placeholder='Add a comment...' class="text">${comment2nd.author.username}(<fmt:formatDate value="${comment2nd.getUpdated()}" pattern="HH:mm:ss, d-MM-yyyy"/>), </textarea><br>
                                    <button type="submit" id="replycomment2" style="float: left">
                                        <spring:message text="Submit"/>
                                    </button><br>
                                    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                                </form:form>
                            </div>
                            <!---------------Hiding button and field for change answer----------------------->
                            <c:if test="${(pageContext.request.userPrincipal.name).equals(comment2nd.author.username)}">
                            | <a data-toggle="collapse" data-target="#${comment2nd.getId()}${comment1st.getId()}" style="color: green"> Change</a>
                            <div id=${comment2nd.getId()}${comment1st.getId()} class="collapse">
                                <form:form id="replycomment2" method="POST" modelAttribute="comment"
                                           action="/editcomment/${deal.id}/${comment2nd.id}">
                                    <textarea name="text" rows="5" path="text" class="form" cols="50" placeholder='Add a comment...' class="text">${comment2nd.text}</textarea><br>
                                    <button type="submit" id="replycomment2" style="float: left">
                                        <spring:message text="Submit"/>
                                    </button>
                                    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                                </form:form><br>
                            </div>

                            <!---------------Hiding button afor deleting comment----------------------->
                            | <a href="/removecomment/${comment2nd.id}/${deal.id}" style="color: red"> Delete</a>
                            </c:if>
                            <hr width=100%" align="right">
                        </div>
                   </c:if>
            </c:forEach>
        </c:if>
    </c:forEach>

</div>
<script src="/WEB-INF/pages/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
