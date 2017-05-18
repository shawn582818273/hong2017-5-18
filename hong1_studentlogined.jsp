<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%--hong1_studentlogined.jsp --%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>学生</title>
<style type="text/css">
<!--
body {
	background-image: url(1.png);
	background-size: cover;
}
.STYLE3 {
	color: #FF0000;
	font-size: 24px;
}
-->
</style>
</head>

<body onload="opti()">
<div align="center">
  <p>&nbsp;</p>
</div>
<form id="form1" name="form1" method="post"  action="hong1_studentlogined.jsp" >
<% String[] b_id1=new String[7];
	/*	Cookie account1 = null;
	   Cookie[] cookies = null;
	   // 获取cookies的数据,是一个数组
	   cookies = request.getCookies();
	   if( cookies != null ){
	      out.println("<h2> 查找 Cookie 名与值</h2>");
	      for (int k = 0; k < cookies.length; k++){
	         //if(account1.getName( ).compareTo("JSESSIONID") != 0);
	         //else {
	        	 account1 = cookies[k];
	        
	         out.print("参数名 : " + account1.getName());
	         out.print("<br>");
	         out.print("参数值: " + account1.getValue()+" <br>");
	       out.print("------------------------------------<br>");
	      }
	  }else{
	      out.println("<h2>没有发现 Cookie</h2>");
	  }*/
  %>
<script type="text/javascript">
var b_id1 ="<%=b_id1%>";
</script>

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
	<%=date1%>
	<%=timeframe%>
	<%=maxhold%>
	<%=request.getParameter("excuse")%>
	<%=SQ%>
<script type="text/javascript">
   	/*function select2()
	{
		var select2 =document.getElementById("Select2");
		for(j=0;b_id1[j]!=null;j++)
	    select2.options.add(new Option(b_id1[j], b_id1[j]));
	}
	*/
	/* function addOption(){ 
	//根据id查找对象， 
	var obj=document.getElementById('mySelect2'); 
	//添加一个选项 
	obj.add(new Option("文本","值")); //这个只能在IE中有效 
	obj.options.add(new Option("text","value")); //这个兼容IE与firefox 
	} 
	*/
	/*function welcome()
	{
	document.getElementById("currentTime4").innerHTML="WELCOME:";
	}
	setInterval("welcome()", 1000);
	*/
	
	
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
	
	/*document.write("前天："+GetDateStr(-2)); 
	document.write("<br />昨天："+GetDateStr(-1)); 
	document.write("<br />今天："+GetDateStr(0)); 
	document.write("<br />明天："+GetDateStr(1)); 
	document.write("<br />后天："+GetDateStr(2)); 
	document.write("<br />大后天："+GetDateStr(3));
	*/
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
     <div id="currentTime4" class="STYLE3">welcome:</div>
      <br /> 
      登录成功！用户名为：<%=request.getSession().getAttribute("sessionname")%>  
      密码为：<%=request.getSession().getAttribute("sessionpwd")%>  
      身份为：<%=request.getSession().getAttribute("sessionidentity")%>
      状态为：<%=request.getSession().getAttribute("sessionstate")%>
      <br />
      
<%-- <div id="currentTime" class="STYLE3">当前时间：时间载入中......</div>--%>
      <br />
      <br />
      <br />
      <br />
      </span>
   <span class="STYLE3"><br />日期</span>
      <select name="date" class="STYLE3"  >
        <option id="currentTime1" >今天</option>
        <option id="currentTime2" >明天</option>
        <option id="currentTime3">后天</option>
      </select>  
      
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
      
      <span class="STYLE3">可容纳人数</span>
      <select name="maxhold" class="STYLE3">
        <option value="60">60</option>
        <option value="120">120</option>
        <option value="240">240</option>
      </select>
      &nbsp;    
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
	//for (int j=0;b_id1[j]!=null;j++){
	//	out.println(b_id1[j]);}
	
	/*while(rs.next())
	{ out.println( "welcome") ;
	out.println(rs.getString("b_id"));
	out.println(rs.getString("s_time"));
	}*/

	//关闭连接  
	rs.close();  
	stat.close();  
	conn1.close();   
%>   
<%--=account1.getValue() --%>
<%--=account--%>
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
  
<%--<form id="form2" ="form2" method="post" action="hong1_studentlogined.jsp"> --%>
    <p>
 <c:forEach var="i" begin="1" end="5">
   Item <c:out value="${i}"/><p>
</c:forEach>
<%request.getSession().setAttribute("b_id1", b_id1);//把他放到request作用域里面 %>  
<c:forEach var="id" items="${request.getSession().getAttribute(b_id1)}">
<c:out value="${id}"/>
</c:forEach>
<%! int fontSize; %>
<%! int m=0; %>
<%for ( fontSize = 1; fontSize <= 3; fontSize++){ %>
   		<font color="green" size="<%= fontSize %>">
    		菜鸟教程
   		</font><br />
		<%}%> 
      <label>
      <span class="STYLE3">可选教室</span>
      <select  id="mySelect2" name="select2" class="STYLE3">
      <%for (  m=0; b_id1[m]!=null; m++){ %>
   		<option class="STYLE3"  value="b_id1[m]"><%=b_id1[m]%></option>
   		<option class="STYLE3"  value="b_id1[m]">${b_id1[m]}</option>
		<%}%>
	     <c:forEach var="b_id1" items="b_id1">
	      <h3>${fn:length(b_id1)}</h3> 
	     <td >${name}</td>
		<option value="${name}">${name}</option>
		</c:forEach>
        <option value="classroom1">教室1</option>
        <option value="classroom2">教室2</option>
      </select>
      </label>
      <%=b_id1[0] %>
      <%=b_id1[1] %>
      <%=b_id1[0]%>
<script type="text/javascript">
	var b_id1 ="<%=b_id1%>";
  
      function opti()
	{	System.out.println("what");
	   for(var i=0;i<b_id1.length;i++)
	   {   
		   var option=document.createElement("option");
	   document.getElementById("mySelect2").appendChild(option);
	   option.value=i+1;  //每个option的位置
	   option.text=b_id1[i];//每个Option的值
	   }
	}
	setInterval("opti(b_id1)", 1000);
</script> 
      &nbsp;&nbsp;&nbsp;
      <input name="Submit2" type="submit" class="STYLE3" value="提交请求" />
    </p>
   <%--</form> --%> 
    
<%--<form id="form3" ="form3" method="post" action=""> --%>
    <p>
      <label><span class="STYLE3">所借记录</span>
      <input name="Submit3" type="submit" class="STYLE3" value="查询" />
      </label>
    </p>
  </div>
  </label>
  <div align="center"></div>
  <div align="center">&nbsp;&nbsp;  </div>
  <label>
  <div align="center"></div>
  </label>
  <div align="center">&nbsp;</div>
  <label></label>
  <div align="center">&nbsp;&nbsp;</div>
  <label></label>
</form>
</div>
</body>
</html>
