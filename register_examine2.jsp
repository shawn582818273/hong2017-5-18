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
<%//request.getParameter("approval") %>
<% 
String[] register=(String[])request.getParameterValues("register");
String[] sessionreg_a=(String[])request.getSession().getAttribute("sessionreg_a");
String[] sessionreg_p=(String[])request.getSession().getAttribute("sessionreg_p");
String[] sessionreg_e=(String[])request.getSession().getAttribute("sessionreg_e");
String[] sessionreg_i=(String[])request.getSession().getAttribute("sessionreg_i");
//String[] sessionborrower1=(String[])request.getSession().getAttribute("sessionborrower1");
for (int i=0;i<register.length;i++) { 
    out.println(register[i]); //逐个输出数组元素的值 
    out.println(sessionreg_a[Integer.parseInt(register[i])]); 
    out.println(sessionreg_p[Integer.parseInt(register[i])]); 
    out.println(sessionreg_i[Integer.parseInt(register[i])]);
    //out.println(sessionborrower1[Integer.parseInt(register[i])]); %>
    <p></p>
    <% 
    String strConn="jdbc:mysql://localhost:3306/hong";  
	String strUser="root"; 
	String strPassword="123456";
	
	String SQ="UPDATE user_register SET isreg = 1 WHERE account="+sessionreg_a[Integer.parseInt(register[i])]
	+" and password="+sessionreg_p[Integer.parseInt(register[i])]
			+" and email="+sessionreg_e[Integer.parseInt(register[i])]
			+" and identity='"+sessionreg_i[Integer.parseInt(register[i])]+"'";
	//更新user_register;
	
	String SQ1="insert into users(number,password,email,identity) values ("+sessionreg_a[Integer.parseInt(register[i])]
			+","+sessionreg_p[Integer.parseInt(register[i])]
					+","+sessionreg_e[Integer.parseInt(register[i])]
							+",'"+sessionreg_i[Integer.parseInt(register[i])]+"')";
	
			
	Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
	Statement stat=conn1.createStatement();
	stat.executeUpdate(SQ);
	stat.executeUpdate(SQ1);

	//关闭连接    
	stat.close();  
	conn1.close();
	%>
	<%=SQ %>
	<%=SQ1 %>
  	<% } %>
    <%//response.sendRedirect("manager_examined.jsp"); %>
 


<%-- 
<table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th>参数名</th><th>参数值</th>
</tr>
<%	
   Enumeration paramNames = request.getParameterNames();

   while(paramNames.hasMoreElements()) {
      String paramName = (String)paramNames.nextElement();
      out.print("<tr><td>" + paramName + "</td>\n");
      String paramValue = request.getParameter(paramName);
      out.println("<td> " + paramValue + "</td></tr>\n");
   }
%>
</table>
--%>
<%//}catch(Exception e){
	//out.print("<script>alert('wrong input');</script>");
	//response.sendRedirect("dao2.jsp");
	//e.printStackTrace();
//}%>	

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