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
</head>
<body>

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
            <%if(request.getSession().getAttribute("sessionstate")=="logined") {%>
            <li ><a href="dao3.jsp">Appointment</a></li>
            <%} %>
            <li ><a href="dao4.jsp">About</a></li>
            <%if ( request.getSession().getAttribute("sessionstate")=="logined" && request.getSession().getAttribute("sessionidentity")=="manager") {%>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    About <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li class="active"><a href="dao4.jsp">help</a></li>
                    <li><a href="#">EJB</a></li>
                    <li><a href="#">Jasper Report</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">另一个分离的链接</a></li>
                </ul>
            </li>
            <%} %>
            
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <%if(request.getSession().getAttribute("sessionstate")=="logined") {%>
            <li><a href="dao2.jsp">Logout</a></li>
            </ul>
            <%} %>
    </div>
	</div>
</nav>
<script type="text/javascript">
function timer()
{	
	var ddd = new Date();
}
setInterval("timer()", 1000);
</script> 
<%String c_id=request.getParameter("select2"); %>
<%--=request.getSession().getAttribute("sessiondate2")--%>
<%--=request.getSession().getAttribute("sessiontimeframe")--%>
<%--=request.getSession().getAttribute("sessionmaxhold")--%>
<%--=request.getSession().getAttribute("sessionexcuse")--%>
<%String SQ="insert into classroom_request"+
"(c_id,day,s_time,borrower,request_t,isborrowed,excuse) values ('"
+c_id+"',"+request.getSession().getAttribute("sessiondate2")+","
+request.getSession().getAttribute("sessiontimeframe")+","
+request.getSession().getAttribute("sessionname")+",current_timestamp,"
+0+",'"+request.getSession().getAttribute("sessionexcuse")+"')";%>
<%--=SQ --%>
<%try{
String strConn="jdbc:mysql://localhost:3306/hong";  
String strUser="root"; 
String strPassword="123456";
Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn1.createStatement();
String strSql="SELECT * from classroom_request where borrower="+request.getSession().getAttribute("sessionname")+" order by request_t";  
stat.executeUpdate(SQ);
response.sendRedirect("dao9.jsp");
//关闭连接    
stat.close();  
conn1.close(); 
}catch(Exception e){
	out.print("<script>alert('wrong input');</script>");
	e.printStackTrace();
	response.sendRedirect("dao9.jsp");
}
%>
<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
	  <p>&nbsp;  </p>
	</div>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
	

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