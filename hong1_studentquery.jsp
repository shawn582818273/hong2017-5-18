<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>SELECT ����</title>
</head>
<body>
<script type="text/javascript">
<p><% String date = request.getParameter("date");%></p>
<p><% String date1 = date.replace("-","");%></p>
<p><%  String timeframe = request.getParameter("timeframe");%></p>
<p><%  String maxhold = request.getParameter("maxhold");%></p>
<p><%
// ����������������
String excuse = new String((request.getParameter("excuse")).getBytes("ISO-8859-1"),"UTF-8");
%>
<p>
<%
   String SQ = "select * from boardroom_state where day ="+date1+" and s_time="+timeframe+" and b_maxhold='"+maxhold+"'";
%>
   <%=SQ%>
</p>
</script>
  <%=SQ%>
 <%=date%>
  <%=date1%>
 <%=timeframe%>
 <%=maxhold%>
 <%=request.getParameter("excuse")%>
 <script type="text/javascript">
 function GetDateStr(AddDayCount) { 
var dd = new Date(); 
dd.setDate(dd.getDate()+AddDayCount);//��ȡAddDayCount�������� 
var y = dd.getFullYear(); 
var m = dd.getMonth()+1;//��ȡ��ǰ�·ݵ����� 
var d = dd.getDate(); 
return y+"-"+m+"-"+d; 
} 
 </script>
 <c:set var="yuju" value="${SQ}" />
</p>
  <!--����ע�� --!>
  <%--=identity --%>
  <!--  String SQ = "select * from users where number="+account+" and password="+pwd+" and identity='"+identity+"'"--!>
</p>
<!--
JDBC �����������ݿ� URL 
���ݿ���û��������룬��Ҫ�����Լ�������
useUnicode=true&characterEncoding=utf-8 ��ֹ��������
 -->
<%
String strConn="jdbc:mysql://localhost:3306/hong";  
String strUser="root"; 
String strPassword="123456";
Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn1.createStatement();
String strSql="SELECT * from users";  
ResultSet rs=stat.executeQuery(SQ);   
while(rs.next())
{ out.println( "welcome") ;
out.println(rs.getString("b_id"));
out.println(rs.getString("s_time"));

}
//�ر�����  
rs.close();  
stat.close();  
conn1.close();   
%>

</body>
</html>