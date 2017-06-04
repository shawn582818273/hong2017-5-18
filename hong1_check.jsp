<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录判断</title>
</head>
<body>
<h1>登录判断</h1>
<ul>
<li><p><b>账号:</b>
<%
// 解决中文乱码的问题
//String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
%>
   <%=request.getParameter("id")%>
</p></li>
<li><p><b>密码:</b>
   <%= request.getParameter("pwd")%>
</p></li>
<li><p><b>身份:</b>
<%
// 解决中文乱码的问题
String identity = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");
%>
   <%=identity%>
</p></li>
</ul>
</body>
</html>