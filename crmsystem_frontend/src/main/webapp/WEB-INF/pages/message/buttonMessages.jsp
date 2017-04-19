<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
</head>
<body>
<c:if test="${messageList.size() == 0}">
    <a href="/messages"><i class="glyphicon glyphicon-envelope" style="color: #6eff6d"></i><span class="">Messages</span></a>
</c:if>
<c:if test="${messageList.size() != 0}">
    <a href="/messages"><i class="glyphicon glyphicon-envelope mess-anim" style="color: #ff442a"></i><span>Messages</span></a>
</c:if>
</body>
