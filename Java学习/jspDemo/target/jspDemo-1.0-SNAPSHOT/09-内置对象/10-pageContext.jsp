<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pageContext对象的作用</title>
</head>
<body>
<%--              获取其他8个内置对象       --%>
<%
    pageContext.getRequest();
    pageContext.getResponse();
    pageContext.getSession();
    pageContext.getServletContext();
    pageContext.getOut();
    pageContext.getException();
    pageContext.getPage();
    pageContext.getServletConfig();

%>

<%--pageContext操作其他作用域--%>
<%
    pageContext.setAttribute("page","123");
    pageContext.setAttribute("req","aaa", PageContext.REQUEST_SCOPE);
    pageContext.setAttribute("ses","bbb", PageContext.SESSION_SCOPE);
    pageContext.setAttribute("app","ccc", PageContext.APPLICATION_SCOPE);
    String req = (String) request.getAttribute("req");
    String ses = (String) session.getAttribute("ses");
    String app = (String)application.getAttribute("app");
    // 第二种获取方法

    String req2 = (String) pageContext.getAttribute("req",PageContext.REQUEST_SCOPE);

    //第三种获取方法

    String req3 = (String) pageContext.findAttribute("req");

%>

<h1>request:<%=req%></h1>
<h1>request2:<%=req2%></h1>
<h1>request3:<%=req3%></h1>
<h1>session:<%=ses%></h1>
<h1>application:<%=app%></h1>
</body>
</html>
