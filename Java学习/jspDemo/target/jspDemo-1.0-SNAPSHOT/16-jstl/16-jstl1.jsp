<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cc" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("username", "tom1");
    request.setAttribute("age", 18);
%>

${username}

<cc:if test="${username == 'tom'}">
    <h1>欢迎您,${username}</h1>
</cc:if>

<cc:if test="${username != 'tom'}">
    <h1>请您重新登陆</h1>
</cc:if>

<hr/>

<cc:choose>
    <cc:when test="${age >= 18}"><h1>成年</h1></cc:when>
    <cc:when test="${age <= 18}"><h1>未成年</h1>></cc:when>
    <cc:otherwise><h1>不知道年纪</h1></cc:otherwise>
</cc:choose>


</body>
</html>
