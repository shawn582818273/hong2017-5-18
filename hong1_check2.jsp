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
<p>
<%
   String account = request.getParameter("id");
%>
   
</p>
<p>
<%
   String password = request.getParameter("pwd");
%>
   
</p>
<p>
<%
// 解决中文乱码的问题
String identity = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");
%>
   
</p>


</ul>
</body>
</html>