<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
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
        <a class="navbar-brand" href="dao7.jsp">Home</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <%if(request.getSession().getAttribute("sessionstate")!="logined") {%>
            <li ><a href="dao2.jsp">Login</a></li>
            <%} %>
            <%if(request.getSession().getAttribute("sessionstate")=="logined") {%>
            <li ><a href="dao3.jsp">Appointment</a></li>
            <%} %>
            <li ><a href="dao9.jsp">View Results</a></li>
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
<% String[] b_id1=new String[7];%>
<script type="text/javascript">
<%  //String date1="2017-05-17";
	
String date1 = request.getParameter("date");
	String date2="2017022517";
	if (date1!=null)
		date2 = date1.replace("-","");
%>

<p><%  String timeframe = request.getParameter("timeframe");%></p>
<p><%  String maxhold = request.getParameter("maxhold");%></p>
<p><%
// 解决中文乱码的问题
String excuse = new String((request.getParameter("excuse")).getBytes("ISO-8859-1"),"UTF-8");
%>
<p>
<%
	String SQ = "select * from classroom_state where day ="+date2+" and s_time="+timeframe+" and c_maxhold='"+maxhold
+"' and canbo=1 ";
   String SQ1 = "select * from classroom_state where day ="+date2+" and s_time="+timeframe+" and c_maxhold='"+maxhold
   +"' and canbo=1 union select * from boardroom_state where day ="+date2+" and s_time="+timeframe+" and b_maxhold='"+maxhold+"' and canbo=1";
%>

<%request.getSession().setAttribute("sessiondate2",date2);     //用Session保存用户名  %>
<%request.getSession().setAttribute("sessiontimeframe",timeframe);     //用Session保存用户名  %>
<%request.getSession().setAttribute("sessionmaxhold",maxhold);     //用Session保存用户名%>
<%request.getSession().setAttribute("sessionexcuse",excuse);     //用Session保存用户名%>
</p>
</script>

</p>
  <!--两种注释 --!>
  <%--=identity --%>
  <!--  String SQ = "select * from users where number="+account+" and password="+pwd+" and identity='"+identity+"'"--!>
</p>
<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
<form id="form1" name="form1" method="post" action="dao7.jsp" ">
<%
//try{
String strConn="jdbc:mysql://localhost:3306/hong";  
String strUser="root"; 
String strPassword="123456";
Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn1.createStatement();
//String strSql="SELECT * from users";


ResultSet rs=null;
if(sss.compareTo("teacher")==0)
{ResultSet rs2=stat.executeQuery(SQ1);
rs=rs2;

int i=0;
//String[] b_id1=new String[7];
out.print("<table border='1' class='btn btn-large btn-success'>");
out.print("<tr><td>房间号：</td><td>开始时间:</td><td>结束时间：</td><td>日期：</td><td>房间大小：</td></tr>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString("c_id")+"</td>");
	b_id1[i]=rs.getString("c_id");i++;
	out.print("<td>"+rs.getString("s_time")+"</td>");
	out.print("<td>"+rs.getString("e_time")+"</td>");
	out.print("<td>"+rs.getString("day")+"</td>");
	out.print("<td>"+rs.getString("c_maxhold")+"</td>");
	out.print("</tr>");
}
out.print("</table>");}
else if(sss.compareTo("student")==0)
{ResultSet rs1=stat.executeQuery(SQ);
rs=rs1;
int i=0;
//String[] b_id1=new String[7];
out.print("<table border='1' class='btn btn-large btn-success'>");
out.print("<tr><td>房间号：</td><td>开始时间:</td><td>结束时间：</td><td>日期：</td><td>房间大小：</td></tr>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString("c_id")+"</td>");
	b_id1[i]=rs.getString("c_id");i++;
	out.print("<td>"+rs.getString("s_time")+"</td>");
	out.print("<td>"+rs.getString("e_time")+"</td>");
	out.print("<td>"+rs.getString("day")+"</td>");
	out.print("<td>"+rs.getString("c_maxhold")+"</td>");
	out.print("</tr>");
}
out.print("</table>");}
//关闭连接  
rs.close();  
stat.close();  
conn1.close(); 
//}catch(Exception e){
	//out.print("<script>alert('wrong input');</script>");
	//e.printStackTrace();
//}
%>
<%! int m=0; %>
<label>
      <span class="btn btn-primary btn-large">可选教室</span>
      <select  id="mySelect2" name="select2" class="STYLE3">
      <%for (  m=0; b_id1[m]!=null; m++){ %>
   		<option class="STYLE3" ><%=b_id1[m]%></option>
		<%}%>
		
     
      </select>
</label>
<input class="btn btn-primary btn-large" name="Submit2" type="submit" class="STYLE3" value="提交请求" />
<%=SQ%>
<div id="footer">
      <div align="center" class="container">
        <p  > author: <a href="http://www.fo12974829.icoc.me/?_sc=4">pengfeihong</a> .</p>
</div>
    </div>
<% //}catch(Exception e){
//out.print("<script>alert('wrong input');</script>");
//response.sendRedirect("dao2.jsp");
//e.printStackTrace();
//}%>	
</form>
</body>
</html>