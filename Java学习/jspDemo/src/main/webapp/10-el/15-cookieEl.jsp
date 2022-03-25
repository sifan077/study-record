<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>获取cookie的el</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    String username = "";
    String password = "";

    if(cookies!=null){
        for (Cookie cookie:cookies){
            if(cookie.getName().equals("username")){
                username = cookie.getValue();
            }
            if(cookie.getName().equals("password")){
                password = cookie.getValue();
            }
        }
    }
%>

<%=username%><br>
<%=password%><br>
<hr/>

${cookie.username}<br>
${cookie.username.value}<br>
${cookie.password}<br>
${cookie.password.value}<br>


username:<input type="text" name="username" value="<%=username%>"><br>
password:<input type="text" name="password" value="<%=password%>"><br>



<%--EL表达式做法--%>
username:<input type="text" name="username" value="${cookie.username.value}"><br>
password:<input type="text" name="password" value="${cookie.password.value}"><br>





</body>
</html>
