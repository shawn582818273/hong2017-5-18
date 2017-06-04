<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>教室预约系统</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="./bootstrap/js/bootstrap.min.js"></script>
	<style type="text/css">
	<!--
	body {
		background-image: url(girl.png);
	}
	.STYLE2 {font-size: 36px}
	.STYLE3 {font-size: 24px}
	.STYLE5 {color: #FF0000; font-size: 24px; }
	.STYLE6 {color: #00FF33}
	.STYLE8 {color: #33FF00}
	.STYLE9 {color: #66FFCC}
	.STYLE11 {font-size: 24px; color: #CC0000; }
	-->
	</style>
	 <script type="text/javascript">  
	        function check() {  
	            if (form1.id.value == "") {  
	                alert("请输入用户名!"); form1.id.focus; return false;  
	            }  
	            if (form1.pwd.value == "") {  
	                alert("请输入密码!"); form1.pwd.focus; return false;  
	            }  
	        }   
	</script>  
</head>
<body>
<% try{
if(request.getSession().getAttribute("sessionstate")!="logined") {
//	String sss=request.getSession().getAttribute("sessionidentity").toString();%>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="dao0.jsp">Home</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <%if(request.getSession().getAttribute("sessionstate")!="logined") {%>
            <li ><a href="dao2.jsp">Login</a></li>
            <%} %> 
                 
            <li ><a href="dao4.jsp">About</a></li>
          
        </ul>
    </div>
	</div>
</nav>

<form action="">
<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
		<%String account=request.getParameter("account");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String identity=request.getParameter("identity");
		String SQ = "insert into user_register (account,password,identity,email) values ("+account+","+password+",'"+identity+"','"+email+"')";
		String strConn="jdbc:mysql://localhost:3306/hong";  
		String strUser="root"; 
		String strPassword="123456";
		Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
		Statement stat=conn1.createStatement();
		stat.executeUpdate(SQ);
		stat.close();  
		conn1.close();
		%>
      <p align="center">&nbsp;</p>
	<%//=SQ %>
     <p class="btn btn-large btn-success">提交成功，请等待管理员审核成功后再进行登录</p>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
	
</form>
<%}}catch(Exception e){
	out.print("<script>alert('wrong input');</script>");
	response.sendRedirect("dao2.jsp");
	e.printStackTrace();
}%>
	  <p align="center">&nbsp;</p>
	</div>
	<p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="footer">
      <div align="center" class="container">
        <p  > author: <a href="http://www.fo12974829.icoc.me/?_sc=4">pengfeihong</a> .</p>
</div>
    </div>	
</body>
</html>