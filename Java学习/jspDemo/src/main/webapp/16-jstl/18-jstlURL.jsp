<%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cc" %>
<html>
<head>
    <title>jstlUrl</title>
</head>
<body>
<%
    String newURL = response.encodeURL(request.getContextPath() + "/16-jstl/16-jstl1.jsp");
//    System.out.println(newURL);
%>

<%--<%=newURL%>--%>

<a href="<%=newURL%>>">clickMe</a><br>


<a href="<cc:url context='${pageContext.request.contextPath}' value='/16-jstl/16-jstl1.jsp'>

</cc:url>">clickMe2</a>



</body>
</html>
