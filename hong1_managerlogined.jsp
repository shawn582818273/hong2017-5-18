<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>welcome</title>
</head>
<body>
<p>

<%
// 解决中文乱码的问题
String identity = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");
%>

welcome manager <%=request.getParameter("id")%>
</p>
</body>
</html>