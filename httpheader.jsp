<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>
<h2>HTTP 头部请求实例</h2>
<table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th>Header Name</th><th>Header Value(s)</th>
</tr>
<%
   Enumeration headerNames = request.getHeaderNames();
   while(headerNames.hasMoreElements()) {
      String paramName = (String)headerNames.nextElement();
      out.print("<tr><td>" + paramName + "</td>\n");
      String paramValue = request.getHeader(paramName);
      out.println("<td> " + paramValue + "</td></tr>\n");}
 %>
  </table>
 <table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th>peng</th><th>feihong</th>
</tr>
<%
   String protocol = request.getProtocol();
   out.print("<tr><td>" + protocol + "</td>\n");  
%>
</table>
<table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th>peng</th><th>feihong</th>
</tr>
<%
   String method = request.getMethod();
   out.print("<tr><td>" + method + "</td>\n");  
%>
</table>
</body>
</html>