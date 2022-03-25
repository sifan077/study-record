<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>内置对象</title>
</head>
<body>
<%
    request.setAttribute("username","Tom");
    String aaa = (String) request.getAttribute("username");
%>
<%--                  四大作用域对象           --%>

<%
    String bbb = (String) request.getAttribute("requestScope");
    String ccc = (String) session.getAttribute("sessionScope");
    String ddd = (String) application.getAttribute("servletContextScope");
%>

<h1>pageContextScope:<%=aaa%></h1>
<h1>requestScope:<%=bbb%></h1>
<h1>sessionScope:<%=ccc%></h1>
<h1>servletContextScope:<%=ddd%></h1>
</body>
</html>
