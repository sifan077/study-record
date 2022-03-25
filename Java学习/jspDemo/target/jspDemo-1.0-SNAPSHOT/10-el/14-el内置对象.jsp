<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL内置对象</title>
</head>
<body>
<%
    String path = request.getContextPath();
%>

<%=path%><br>
<a href=<%=path%>/index.jsp> clickMe</a>
<hr/>
<%--El表达式获取上下文--%>
${pageContext.request.contextPath}


</body>
</html>
