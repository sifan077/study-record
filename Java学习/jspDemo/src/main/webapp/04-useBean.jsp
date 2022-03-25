<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/8
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>useBean</title>
</head>
<body>
<%--id = 对象的名 ， class = 全限定名--%>
<jsp:useBean id="user" class="com.example.jspdemo.User"/>
<jsp:setProperty name="user" property="username" value="思凡"/>
<jsp:setProperty name="user" property="password" value="123456" />
<jsp:getProperty name="user" property="username"/>
<jsp:getProperty name="user" property="password"/>

</body>
</html>
