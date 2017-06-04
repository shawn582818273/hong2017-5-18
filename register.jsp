<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
//if(request.getSession().getAttribute("sessionstate")!="logined") {
//	String sss=request.getSession().getAttribute("sessionidentity").toString();%>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container">
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
<% }catch(Exception e){
	out.print("<script>alert('wrong input');</script>");
	response.sendRedirect("dao2.jsp");
	e.printStackTrace();
}%>
<form action="register2.jsp">
<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
	  <input type="text" name="account" placeholder="账号" class="form-control" style= "color:red;margin: 0px; width: 200px; height: 40px; ">
	  <p></p>
	  <input type="password" name="password" placeholder="密码" class="form-control" style= "color:red;margin: 0px; width: 200px; height: 40px; ">
	  <p></p>
	  <input type="email" name="email" placeholder="email" class="form-control" style= "color:red;margin: 0px; width: 200px; height: 40px; ">
	  <p></p>
	  <select  name="identity" class="form-control" style= "color:red;margin: 0px; width: 200px; height: 40px; ">
	  <p></p>
   		<option value="student" class="form-control" >学生</option>
   		<option  value="teacher" class="form-control" >教师</option>
   
      </select>
      <p align="center">&nbsp;</p>
	
      <input name="register"  class="btn btn-large btn-success" type="submit"  value="register"/>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
	
</form>
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