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
<% //try{
	String sss=request.getSession().getAttribute("sessionidentity").toString();%>
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
            <%if(request.getSession().getAttribute("sessionstate")=="logined" && sss.compareTo("manager")!=0 && sss.compareTo("systemmanager")!=0) {%>
            <li ><a href="dao3.jsp">Appointment</a></li>
            <%} %>        
            <li ><a href="dao4.jsp">About</a></li>
            <%if ( request.getSession().getAttribute("sessionstate")=="logined" && (sss.compareTo("manager")==0 || sss.compareTo("systemmanager")==0)) {%>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Options <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="manager_examine.jsp">审批请求</a></li>
                    <li><a href="manager_examined.jsp">查看已审批请求</a></li>
                    <li><a href="register_examine.jsp">审批注册</a></li>
                    <%if ( request.getSession().getAttribute("sessionstate")=="logined" &&  sss.compareTo("systemmanager")==0) {%>
                    <%-- <li><a href="#">查看用户</a></li>
                    <li><a href="#">增加用户</a></li>--%>
                    <li><a href="manager_executeQuery.jsp">executeQuery</a></li>
                    <li><a href="manager_executeUpdate.jsp">executeUpdate</a></li>
                    <%--<li><a href="#">查看教室信息</a></li>
                    <li><a href="#">编辑教室信息</a></li>
                    <li><a href="#">编辑教室信息</a></li>--%>
                    
                    <li class="divider"></li>
                    <li><a href="help.jsp">help</a></li>
                    <%} %>
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

<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
	  <p class="STYLE3 STYLE8">WELCOME <%=request.getSession().getAttribute("sessionidentity")%>:<%=request.getSession().getAttribute("sessionname")%></p>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
	  <p align="center">&nbsp;</p>
	</div>
<form id="form10" name="form10" method="post" action="register_examine2.jsp" onsubmit="return check()">
<%
String strConn="jdbc:mysql://localhost:3306/hong";  
String strUser="root"; 
String strPassword="123456";
Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn1.createStatement();
String strSql="SELECT * from user_register where isreg=0 ";  
ResultSet rs = stat.executeQuery(strSql); 
int i=0;

// 解决中文乱码的问题
//String ex = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");

String[] reg_a=new String[10];
String[] reg_p=new String[10];
String[] reg_e=new String[10];
String[] reg_i=new String[10];
out.print("<div align='center'>");
out.print("<table border='1' class='btn btn-large btn-success'>");
out.print("<tr><td>账号：</td><td>密码:</td><td>email:</td><td>身份：</td><td>是否注册成功：</td><td>同意请求</td></tr>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString("account")+"</td>");
	reg_a[i]=rs.getString("account");
	reg_p[i]=rs.getString("password");
	reg_e[i]=rs.getString("email");
	reg_i[i]=rs.getString("identity");
	
	out.print("<td>"+rs.getString("password")+"</td>");
	out.print("<td>"+rs.getString("email")+"</td>");
	
	out.print("<td>"+rs.getString("identity")+"</td>");
	out.print("<td>"+rs.getString("isreg")+"</td>");
	out.print("<td>"+"<input type='checkbox' name='register' value="+i+" /></td>");
	out.print("</tr>");i++;
}
out.print("</table>");
out.print("</div>");
for ( i=0;reg_a[i]!=null;i++) { 
    out.println(reg_a[i]); //逐个输出数组元素的值 
    out.println(reg_p[i]);
    out.println(reg_i[i]);
 
}  
request.getSession().setAttribute("sessionreg_a",reg_a);     //用Session保存用户名  
request.getSession().setAttribute("sessionreg_p",reg_p);  
request.getSession().setAttribute("sessionreg_e",reg_e);
request.getSession().setAttribute("sessionreg_i",reg_i); 
//request.getSession().setAttribute("sessionborrower1",borrower1); 
//关闭连接  
rs.close();  
stat.close();  
conn1.close(); 
//}catch(Exception e){
	//out.print("<script>alert('wrong input');</script>");
	//response.sendRedirect("dao2.jsp");
	//e.printStackTrace();
//}%>

<p align="center">&nbsp;</p>
<p align="center">
<input name="Submit"  class="btn btn-large btn-success" type="submit"  value="确定"/></p>
</form>
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