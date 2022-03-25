<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/8
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>声明脚本的内容</title>
</head>
<body>
<%!
    int b = 20;

    public void play() {
        System.out.println("play......");
    }

    public int getInt() {
        return 100;
    }

%>

<%
    out.println(b);
    play();
%>

<%= getInt()%>


<%="今天天气真好"%>
</body>
</html>
