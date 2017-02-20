<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<script src="${contextPath}/resources/js/main.js"></script>
<script src="${contextPath}/resources/js/search.js"></script>
<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
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

        <ul class="left-navigation">
            <li class="active" >
            <a href="#"><i class="glyphicon glyphicon-home" style="color: darkorange"></i><span>Main Page</span></a></li>
            <li class="parent"><a href="#"><i class="glyphicon glyphicon-user" style="color: darkgreen"></i><span>Users</span></a>
                <ul class="sub-menu"><li><a href="<c:url value='/users/' />"><i class="glyphicon glyphicon-user" style="color: #ffe170"></i> All Users</a></li></ul>
                <ul class="sub-menu"><li><a href="<c:url value='/home/' />"><i class="glyphicon glyphicon-plus" style="color: #8ec9ff"></i> My account</a></li></ul>
            </li>
            <li class="parent"><a href="#"><i class="glyphicon glyphicon-briefcase" style="color: #354fba"></i><span>Companies</span></a>
                <ul class="sub-menu"><li><a href="<c:url value='/company/' />"><i class="glyphicon glyphicon-credit-card" style="color: #ffa272"></i> All Companies</a></li></ul>
                <ul class="sub-menu"><li><a href="<c:url value='/company/add/' />"><i class="glyphicon glyphicon-plus" style="color: #8ec9ff"></i> Create</a></li></ul>
            </li>
        </ul>
    </div>

<nav class="nav" style="background-color: #203745">
    <div class="container-fluid">

    <form:form class="navbar-form navbar-left">
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <div class="input-group-btn">
                    <input type="search" path="searchLine" name="searchLine" id="acInput" placeholder="search..." class="form-control" size="60" maxlength="90" style="width: 400px; height: 30px;">

                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="height: 30px;">Search <span class="glyphicon glyphicon-search"></span></button>
                        <ul class="dropdown-menu pull-right">
                            <li><a onClick="javascript:companies()"><i class="glyphicon glyphicon-briefcase" style="color: darkblue"></i><span> Search companies</span></a></li>
                            <li><a onClick="javascript:users()"><i class="glyphicon glyphicon-user" style="color: darkgreen"></i><span> Search users</span></a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-pencil" style="color: darkred"></i><span> Search deals</span></a></li>
                            <li class="divider"></li>
                            <li><a onClick="javascript:searchAll()"><i class="glyphicon glyphicon-search" style="color: darkorange"></i><span> Search all</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form:form>

        <form class="navbar-form navbar-right">
            <div class style="color: #66afe9">
            <a href="<%=request.getContextPath()%>?languageVar=en"><spring:message code="general.EN"/></a>
            <a href="<%=request.getContextPath()%>?languageVar=ru"><spring:message code="general.RU"/></a>
            </div>
        </form>
    </div>
</nav>
