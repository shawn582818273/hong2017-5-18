<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>INSERT ����</title>
</head>
<body>
<!--
JDBC �����������ݿ� URL 
���ݿ���û��������룬��Ҫ�����Լ�������
useUnicode=true&characterEncoding=utf-8 ��ֹ��������
 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/st?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="123456"/>
<!--
��������
 -->
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO websites (name,url,alexa,country) VALUES ('����̳��ƶ�վ', 'http://m.runoob.com', 5093, 'CN');
</sql:update>
<sql:query dataSource="${snapshot}" var="result">
SELECT * from websites;
</sql:query>
<h1>JSP ���ݿ�ʵ�� - ����̳�</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>վ����</th>
   <th>վ���ַ</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.url}"/></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>