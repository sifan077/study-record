<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.jspdemo.User" %>
<html>
<head>
    <title>el获取对象</title>
</head>
<body>
<%
    User user = new User("思凡","123456");
    request.setAttribute("user",user);
%>

<%
    User user1 = (User) request.getAttribute("user");
    out.println(user.getUsername());
    out.println("<br>");
    out.println(user.getPassword());
%>

<hr/>

${user}<br>
${user.username}<br>
${user.password}<br>

</body>
</html>
