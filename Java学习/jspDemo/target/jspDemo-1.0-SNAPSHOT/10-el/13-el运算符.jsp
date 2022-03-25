<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL运算符</title>
</head>
<body>
<%
    request.setAttribute("nums", 1234);
    request.setAttribute("num","");
%>
<h1>算数运算符</h1>

${nums + 5}<br>
${nums - 5}<br>
${nums * 5}<br>
${nums / 5}<br>
<%--等价于  ${nums div 5}--%>
${nums % 5}<br>
<%--等价于  ${nums mod 5}--%>
<hr/>
<h1>关系运算符</h1>

${nums > 5}<br>
${nums >= 5}<br>
${nums < 5}<br>
${nums <= 5}<br>
${nums == 5}<br>
<hr/>

<h1>测试是否为空</h1>
${empty nums}<br>
${empty num}<br>


<h1>或且非同Java + Python</h1>
</body>
</html>


