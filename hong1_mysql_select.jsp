<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%--hong1_mysql_select.jsp --%>

<html>
<head>
<title>hong1_mysql_select.jsp</title>
</head>
<body>
	<p><%String account = request.getParameter("id");%></p>
	<p><%String pwd = request.getParameter("pwd");%></p>
	<p><%
	// 解决中文乱码的问题
	//String identity = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");
	String identity=request.getParameter("identity");
	%>
	<p><%  String SQ = "select * from users where number="+account+" and password="+pwd+" and identity='"+identity+"'";
	%>
	</p>
	<!--两种注释 --!>
	<%--=identity --%>
	<!--  String SQ = "select * from users where number="+account+" and password="+pwd+" and identity='"+identity+"'"--!>
	<!--
	JDBC 驱动名及数据库 URL 
	数据库的用户名与密码，需要根据自己的设置
	useUnicode=true&characterEncoding=utf-8 防止中文乱码
	 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/hong?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="123456"/>

<sql:query dataSource="${snapshot}" var="result">
select now();
</sql:query>

<%
String strConn="jdbc:mysql://localhost:3306/hong"; 
String strUser="root"; 
String strPassword="123456";
Connection conn=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn.createStatement();
String strSql="SELECT * from users";  
ResultSet rs=stat.executeQuery(SQ);   
if(rs.next())
{ 	if(identity.compareTo("manager")==0)
	response.sendRedirect("dao0.jsp");
	if(identity.compareTo("teacher")==0)
	response.sendRedirect("dao0.jsp");
	if(identity.compareTo("student")==0)
	response.sendRedirect("dao0.jsp");
	if(identity.compareTo("systemmanager")==0)
	response.sendRedirect("dao0.jsp");
	/*response.sendRedirect("http://www.baidu.com");
	response.sendRedirect("http://www.163.com");
	out.println(identity.length()) ;
	out.println(identity.compareTo("manager")) ;
	out.println(rs.getString("number")); 
	*/
	request.getSession().setAttribute("sessionname",account);     //用Session保存用户名  
	request.getSession().setAttribute("sessionpwd",pwd);  
	request.getSession().setAttribute("sessionidentity",identity); 
	request.getSession().setAttribute("sessionstate","logined"); 
	//保存密码  
	// 重定向到新地址
	/*String site1 = new String("dao1.jsp");
   	String site3 = new String("dao3.jsp");
   	String site8 = new String("dao8.jsp");
   	response.setStatus(response.SC_MOVED_TEMPORARILY);
   	if(identity=="manager")
   	{out.println("succuess") ;
    response.sendRedirect("http://www.baidu.com");}
   	else if(identity=="teacher")
   	{response.setStatus(response.SC_MOVED_TEMPORARILY);
   	response.setHeader("Location", site8); }
   	else if(identity=="student")
   	{response.setStatus(response.SC_MOVED_TEMPORARILY);
   	response.setHeader("Location", site3); }
   	*/
%>
<%-- 
<jsp:forward page="hong1_studentlogined.jsp">
   <jsp:param name="account" value="<%=account%>"/>
</jsp:forward>
--%>
<%
}
else{
%>
	<script type="text/javascript" language="javascript">
		alert('用户名或密码错误！');                                           // 弹出错误信息
		window.location='dao2.jsp' ;                            // 跳转到登录界面
	</script>	
<%
}
	/* while(rs.next())  
	{  
	    //依据数据库中的字段名打印数据  
	    out.println(rs.getString("number"));  
	    out.println(rs.getString("password"));  
	    out.println(rs.getString("identity"));  
	}*/
//关闭连接  
rs.close();  
stat.close();  
conn.close();   
%>

</body>
</html>