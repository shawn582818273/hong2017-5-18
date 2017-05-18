<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>SELECT 操作</title>
</head>
<body>
<p>
<%
   String account = request.getParameter("id");
%>
   
</p>
<p>
<%
   String pwd = request.getParameter("pwd");
%>
   
</p>
<p>
<%
// 解决中文乱码的问题
String identity = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");

%>
<p>
<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/hong?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="123456"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from boardroom_state;
</sql:query>
<h1>JSP 数据库实例 - 菜鸟教程</h1>
<table border="1" width="100%">
<tr>
   <th>房间号</th>
   <th>日期</th>
   <th>开始时间</th>
   <th>结束时间</th>
   <th>最大容量</th>
   <th>能否被借</th>
   <th>借用人</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.b_id}"/></td>
   <td><c:out value="${row.day}"/></td>
   <td><c:out value="${row.s_time}"/></td>
   <td><c:out value="${row.e_time}"/></td>
   <td><c:out value="${row.b_maxhold}"/></td>
   <td><c:out value="${row.canbo}"/></td>
   <td><c:out value="${row.borrower}"/></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>