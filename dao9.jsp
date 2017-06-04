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
<% String sss=request.getSession().getAttribute("sessionidentity").toString();%>
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
            <%if(request.getSession().getAttribute("sessionstate")=="logined" && sss.compareTo("manager")!=0) {%>
            <li ><a href="dao3.jsp">Appointment</a></li>
            <%} %>
            <li class="active"><a href="dao9.jsp">View Results</a></li>
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

<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
	  <p>&nbsp;  </p>
	</div>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
<form id="form13" name="form13" method="post" action="dao10.jsp" onsubmit="return check()">
<%try{
String strConn="jdbc:mysql://localhost:3306/hong";  
String strUser="root"; 
String strPassword="123456";
Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn1.createStatement();
String strSql="SELECT * from classroom_request where borrower="+request.getSession().getAttribute("sessionname")+" order by request_t";  
ResultSet rs = stat.executeQuery(strSql); 
int i=0;

// 解决中文乱码的问题
//String ex = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");

//String[] b_id1=new String[7];
String[] c_id2=new String[10];
String[] day2=new String[10];
String[] s_time2=new String[10];
String[] borrower2=new String[10];
out.print("<div align='center'>");
out.print("<table border='1' class='btn btn-large btn-success'>");
out.print("<tr><td>房间号：</td><td>日期:</td><td>开始时间：</td><td>借用人：</td><td>请求时间：</td><td>是否借成功：</td><td>理由：</td><td>撤销请求</td></tr>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString("c_id")+"</td>");
	//b_id1[i]=rs.getString("c_id");i++;
	c_id2[i]=rs.getString("c_id");
	day2[i]=rs.getString("day");
	s_time2[i]=rs.getString("s_time");
	borrower2[i]=rs.getString("borrower");
	out.print("<td>"+rs.getString("day")+"</td>");
	out.print("<td>"+rs.getString("s_time")+"</td>");
	out.print("<td>"+rs.getString("borrower")+"</td>");
	out.print("<td>"+rs.getString("request_t")+"</td>");
	out.print("<td>"+rs.getString("isborrowed")+"</td>");
	out.print("<td>"+rs.getString("excuse")+"</td>");
	out.print("<td>"+"<input type='checkbox' name='giveup' value="+i+" /></td>");
	out.print("</tr>");i++;
}
out.print("</table>");
out.print("</div>");
request.getSession().setAttribute("sessionc_id2",c_id2);     //用Session保存用户名  
request.getSession().setAttribute("sessionday2",day2);  
request.getSession().setAttribute("sessions_time2",s_time2); 
request.getSession().setAttribute("sessionborrower2",borrower2); 
//关闭连接  
rs.close();  
stat.close();  
conn1.close(); 
}catch(Exception e){
	out.print("<script>alert('wrong input');</script>");
	e.printStackTrace();
}
%>

	  <p align="center">&nbsp;</p>
	  <p align="center">
<input name="Submit"  class="btn btn-large btn-success" type="submit"  value="确定"/></p>
</form>
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