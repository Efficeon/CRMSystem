<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<script src="${contextPath}/resources/js/main.js"></script>
<div id="main-wrapper"/>
    <div class="left-sidebar">
        <div class="navbar-toggle"><i class="fa fa-bars"></i></div>
        <div class="nav-block">
            <div class="menu-content">
                <div class="content">
                    <div class="sidebar-logo">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
        </div>
        <script src="${contextPath}/resources/js/main.js"></script>


        <ul id="menu-main" class="left-navigation">
            <li class="active" >
            <a href="index.html"><i class="glyphicon glyphicon-home"></i><span>Main Page</span></a></li>
            <li><a href="<c:url value='/home/' />"><i class="glyphicon glyphicon-user"></i><span>My account</span></a></li>
            <li class="parent"><a href="#"><i class="glyphicon glyphicon-briefcase"></i><span>Company</span></a>
                <ul class="sub-menu"><li><a href="<c:url value='/company/' />"><i class="glyphicon glyphicon-credit-card"></i> All Company</a></li></ul>
                <ul class="sub-menu"><li><a href="<c:url value='/company/add/' />"><i class="glyphicon glyphicon-plus"></i> Create</a></li></ul>
            </li>
        </ul>
    </div>

<nav class="nav" style="background-color: #203745">
    <div class="container-fluid">
        <form class="navbar-form navbar-left">
    <form:form method="GET" id="search1" action="/search/${name}">
            <div class="form-group">
                <input type="text" name="name" id="acInput" class="form-control" placeholder="search..." size="60" maxlength="90" style="width: 400px; height: 30px;"/>
                <button class="button" type="submit" id="search1">
                    <spring:message text="Add"/>
                </button>
            </div>
    </form:form>
        </form>

        <form class="navbar-form navbar-right">
            <div class style="color: #66afe9">
            <a href="<%=request.getContextPath()%>?languageVar=en"><spring:message code="general.EN"/></a>
            <a href="<%=request.getContextPath()%>?languageVar=ru"><spring:message code="general.RU"/></a>
            </div>
        </form>
    </div>
</nav>
