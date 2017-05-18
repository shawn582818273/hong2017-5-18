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
    <title>Bootstrap 实例 - 倒置的导航栏</title>
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
	<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">Home</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li ><a href="#">Login</a></li>
            <li class="active"><a href="dao3.jsp">Appointment</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    About <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">help</a></li>
                    <li><a href="#">EJB</a></li>
                    <li><a href="#">Jasper Report</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">另一个分离的链接</a></li>
                </ul>
            </li>
        </ul>
    </div>
	</div>
</nav>
<div align="center">
  <p>&nbsp;</p>
</div>
<form id="form1" name="form1" method="post"  action="hong1_studentlogined.jsp" >
<% String[] b_id1=new String[7];%>
<p>
   	<%  //String date1="2017-05-17";
   		
    	String date1 = request.getParameter("date");
   		String date2="2017022517";
   		if (date1!=null)
   			date2 = date1.replace("-","");
   	%>
   	</p>
	<p><%--  String account = request.getParameter("account");--%></p>
	<p><%  String timeframe = request.getParameter("timeframe");%></p>
	<p><%  String maxhold = request.getParameter("maxhold");%></p>
	<p><% String excuse = request.getParameter("excuse");%></p>
	<p><%-- String date2 = date1.replace("-",""); --%></p>
	<p><% String SQ = "select * from boardroom_state where day ="+date2+" and s_time="+timeframe+" and b_maxhold='"+maxhold+"'";%></p>
	<script type="text/javascript">
	function timer()
	{
	document.getElementById("currentTime1").innerHTML=GetDateStr(0);
	}
	setInterval("timer()", 1000);
	function timer2()
	{
	document.getElementById("currentTime2").innerHTML=GetDateStr(1);
	}
	setInterval("timer2()", 1000);
	function timer3()
	{
	document.getElementById("currentTime3").innerHTML=GetDateStr(2);
	}
	setInterval("timer3()", 1000);
	
	function GetDateStr(AddDayCount)
	{ 
	var dd = new Date(); 
	var formatedMonth = ("0" + (dd.getMonth() + 1)).slice(-2);
	dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
	var y = dd.getFullYear(); 
	var m = formatedMonth;//获取当前月份的日期 
	var d = dd.getDate(); 
	return y+"-"+m+"-"+d; 
	} 
	</script>
	<div align="center">
  <label>
 <div align="center">
    <p><span class="STYLE5"><br />
      <br />
      <br />
      <br />
      </span>
      <span class="STYLE3">  
     <div align="center" id="currentTime4" class="STYLE3">welcome:</div>
      <br /> 
    
      登录成功！用户名为：<%=request.getSession().getAttribute("sessionname")%>  
      密码为：<%=request.getSession().getAttribute("sessionpwd")%>  
      身份为：<%=request.getSession().getAttribute("sessionidentity")%>
      状态为：<%=request.getSession().getAttribute("sessionstate")%>
      <br />
      </span>
      <span class="STYLE3"><br />日期</span>
      <select name="date" class="STYLE3"  >
        <option id="currentTime1" >今天</option>
        <option id="currentTime2" >明天</option>
        <option id="currentTime3">后天</option>
      </select>  
      </p>
      <p> 
      <span class="STYLE3">时间段</span>
      <select name="timeframe" class="STYLE3">
        <option value="080000">8:00-9:35</option>
        <option value="095500">9:55-11:30</option>
        <option value="133000">13:30-15:05</option>
        <option value="152000">15:20-16:55</option>
        <option value="171000">17:10-18:45</option>
        <option value="193000">19：30-21：05</option>
        <option value="213000">21：30-23：05</option>
      </select>
      </p>
      <p> 
      <span class="STYLE3">可容纳人数</span>
      <select name="maxhold" class="STYLE3">
        <option value="60">60</option>
        <option value="120">120</option>
        <option value="240">240</option>
      </select>
      </p>
      <p> 
      <label for="textarea" class="STYLE3">理由</label>
      <textarea ="excuse" id="textarea"></textarea>
      <input name="Submit" type="submit" class="STYLE3" value="查询可用教室" />
    </p>
   hello
<%--</form> --%>
<%
	String strConn="jdbc:mysql://localhost:3306/hong"; 
	String strUser="root"; 
	String strPassword="123456";
	Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
	Statement stat=conn1.createStatement();
	String strSql="SELECT * from users";  
	ResultSet rs=stat.executeQuery(SQ);
	//ResultSet rs=result;
	//ResultSet rs2=result;
	int i=0;
	//String[] b_id1=new String[7];
	out.print("<table border='1'>");
	out.print("<tr><td>房间号：</td><td>开始时间:</td><td>结束时间：</td><td>日期：</td><td>房间大小：</td></tr>");
	while(rs.next())
	{
		out.print("<tr>");
		out.print("<td>"+rs.getString("b_id")+"</td>");
		b_id1[i]=rs.getString("b_id");i++;
		out.print("<td>"+rs.getString("s_time")+"</td>");
		out.print("<td>"+rs.getString("e_time")+"</td>");
		out.print("<td>"+rs.getString("day")+"</td>");
		out.print("<td>"+rs.getString("b_maxhold")+"</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	//关闭连接  
		rs.close();  
		stat.close();  
		conn1.close();   
	%>   
	<%=date1%>
 <%=b_id1%>
 <%=timeframe%>
 <%=maxhold%>
 <%=request.getParameter("excuse")%>
 <%=SQ%>
 <% out.print("<table border='1'>");
	out.print("<tr><td>可借教室</td></tr>");
	for (int j=0;b_id1[j]!=null;j++)
	{
		out.print("<tr>");
		out.print("<td>"+b_id1[j]+"</td>");
		out.print("</tr>");
	}
	out.print("</table>");
%>
<%! int m=0; %>
<label>
      <span class="btn btn-primary btn-large">可选教室</span>
      <select  id="mySelect2" name="select2" class="STYLE3">
      <%for (  m=0; b_id1[m]!=null; m++){ %>
   		<option class="STYLE3"  value="b_id1[m]"><%=b_id1[m]%></option>
   		<option class="STYLE3"  value="b_id1[m]">${b_id1[m]}</option>
		<%}%>
        <option value="classroom1">教室1</option>
        <option value="classroom2">教室2</option>
      </select>
</label>
      <%=b_id1[0] %>
      <%=b_id1[1] %>
      <%=b_id1[0]%>
 &nbsp;&nbsp;&nbsp;
      <input name="Submit2" type="submit" class="STYLE3" value="提交请求" />
    <p>
      <label>
      <div align="center">
      <span class="STYLE3">所借记录</span>
      <input name="Submit3" type="submit" class="STYLE3" value="查询" />
      </div>
      </label>
    </p>
  
  <div align="center"></div>
  <div align="center">&nbsp;&nbsp;  </div>
  <div align="center">&nbsp;</div>
  <div align="center">&nbsp;&nbsp;</div>
</form>
<div id="footer">
      <div align="center" class="container">
        <p  > author: <a href="http://martinbean.co.uk">pengfeihong</a> .</p>
</div>
    </div>	
</body>
</html>