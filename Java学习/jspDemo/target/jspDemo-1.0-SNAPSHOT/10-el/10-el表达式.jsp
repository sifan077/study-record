<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>el表达式</title>
</head>
<body>
<%
    request.setAttribute("key1","value1");
    session.setAttribute("key2","value2");
    application.setAttribute("key3","value3");


    request.setAttribute("key6","value6");
    session.setAttribute("key6","value7");
    application.setAttribute("key6","value8");

%>

<%--通过作用域获取对象数据--%>
<h1>通过作用域对象获取</h1>
<h1><%=request.getAttribute("key1")%></h1>
<h1><%=session.getAttribute("key2")%></h1>
<h1><%=application.getAttribute("key3")%></h1>
<hr/>

<%--el表达式获取--%>
<h1>el表达式获取</h1>
<h1>${requestScope.key1}</h1>
<h1>${sessionScope.key2}</h1>
<h1>${applicationScope.key3}</h1>
<hr/>
<%--el表达式遍历查找--%>
<h1>el表达式遍历获取</h1>
<h1>${key1}</h1>
<h1>${key2}</h1>
<h1>${key3}</h1>
<hr/>

<h1>遍历寻找只能找到最前面的那个</h1>
<h1>${key6}</h1>
<h1>${key6}</h1>
<h1>${key6}</h1>


</body>
</html>
