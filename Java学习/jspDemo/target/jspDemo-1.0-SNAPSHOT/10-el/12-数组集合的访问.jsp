<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: 思凡
  Date: 2022/1/9
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数组集合的访问</title>
</head>
<body>
<%
    int[] array = {1, 2, 3, 4, 5};
    request.setAttribute("array", array);

    ArrayList<String> nums = new ArrayList<>();
    nums.add("A");
    nums.add("B");
    nums.add("C");
    request.setAttribute("nums",nums);

    Map<String,String>maps = new HashMap<>();
    maps.put("CN","中国");
    maps.put("US","美国");
    maps.put("UK","英国");
    request.setAttribute("maps",maps);

%>

<%--EL访问数组--%>
${array}<br>
${array[0]}<br>
${array[1]}<br>
<hr/>

<%--EL访问集合--%>
${nums}<br>

${nums.get(1)}<br>

${nums[0]}<br>
${nums[1]}<br>
${nums[2]}<br>
<hr/>

<%--EL访问Map集合--%>

${maps["CN"]}<br>
${maps["US"]}<br>

${maps.CN}





</body>
</html>
