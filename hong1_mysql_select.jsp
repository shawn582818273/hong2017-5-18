<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
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
	// ����������������
	String identity = new String((request.getParameter("identity")).getBytes("ISO-8859-1"),"UTF-8");
	%>
	<p><%  String SQ = "select * from users where number="+account+" and password="+pwd+" and identity='"+identity+"'";
	%>
	</p>
	 <%=SQ%>
	 <%=account%>
	 <%=pwd%>
	 <%=identity%>
	 <%=request.getParameter("id")%>
	<!--����ע�� --!>
	<%--=identity --%>
	<!--  String SQ = "select * from users where number="+account+" and password="+pwd+" and identity='"+identity+"'"--!>
	<!--
	JDBC �����������ݿ� URL 
	���ݿ���û��������룬��Ҫ�����Լ�������
	useUnicode=true&characterEncoding=utf-8 ��ֹ��������
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
{ out.println( "welcome") ;
out.println(rs.getString("number"));  
%>
<%
	request.getSession().setAttribute("sessionname",account);     //��Session�����û���  
	request.getSession().setAttribute("sessionpwd",pwd);  
	request.getSession().setAttribute("sessionidentity",identity); 
	request.getSession().setAttribute("sessionstate","logined"); 
	//��������  
	// �ض����µ�ַ
   	String site = new String("hong1_studentlogined.jsp");
   	response.setStatus(response.SC_MOVED_TEMPORARILY);
   	response.setHeader("Location", site); 
   
%>
<jsp:forward page="hong1_studentlogined.jsp">
   <jsp:param name="account" value="<%=account%>"/>
</jsp:forward>

<%
}
else{
%>
	<script type="text/javascript" language="javascript">
		alert('�û������������');                                           // ����������Ϣ
		window.location='hong1.jsp' ;                            // ��ת����¼����
	</script>	
<%
}
	/* while(rs.next())  
	{  
	    //�������ݿ��е��ֶ�����ӡ����  
	    out.println(rs.getString("number"));  
	    out.println(rs.getString("password"));  
	    out.println(rs.getString("identity"));  
	}*/
//�ر�����  
rs.close();  
stat.close();  
conn.close();   
%>

</body>
</html>