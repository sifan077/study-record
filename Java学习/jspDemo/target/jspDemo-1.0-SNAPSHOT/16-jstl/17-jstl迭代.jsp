<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jspdemo.User" %><%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cc" %>
<html>
<head>
    <title>jstl迭代</title>
</head>
<body>
<%
    List<String> list = new ArrayList<String>();
    list.add("A");
    list.add("B");
    list.add("C");
    list.add("D");
    request.setAttribute("list",list);

    List<User>users = new ArrayList<User>();
    users.add(new User("Tom","123456"));
    users.add(new User("John","123456"));
    users.add(new User("Mike","123456"));
    users.add(new User("NiGer","123456"));
    request.setAttribute("users",users);
%>
<h1>最常见的遍历</h1>
<cc:forEach var = "user" items = "${users}">
    <h1>${user}</h1><br>
    <h1>${user.username}:${user.password}</h1>
</cc:forEach>



<cc:forEach var="s" items = "${list}">
    <h1>${s}</h1>
</cc:forEach>
<hr/>

<cc:forEach var="s" items = "${list}" varStatus="i">
    <h1>${s}</h1>
    <h2>index:${i.index}</h2>
    <h2>count:${i.count}</h2>
    <h2>是否第一个:${i.first}</h2>
    <h2>是否最后一个:${i.last}</h2>
</cc:forEach>
<hr/>

<cc:forEach var="s" items = "${list}" begin = "1" end = "2">
    <h1>${s}</h1>
</cc:forEach>
<hr/>

<cc:forEach var="s" items = "${list}" begin = "0" end = "4" step = "2">
    <h1>${s}</h1>
</cc:forEach>
<hr/>

<%
    for(String s:list){
        out.print(s+" ");
    }
%>

<hr/>














</body>
</html>
