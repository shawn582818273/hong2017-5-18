<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<% try{String sss=request.getSession().getAttribute("sessionidentity").toString();%>
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
<form id="form1" name="form1" method="post" action="manager_executeUpdate2.jsp" onsubmit="return check()">
<label for="textarea" class="STYLE3 STYLE8">sql:</label>
<textarea name="update" id="textarea" style="margin: 0px;border-radius:5px; width: 800px; height: 40px;">select * from classroom</textarea>
<p><input name="Submit" type="submit" class="btn btn-large btn-success" value="executeUpdate" /></p>
</form>
<textarea  name="" cols="" rows="" readonly="readonly" style= "background:transparent;border-style:none;color:red;margin: 0px; width: 800px; height: 360px; ">
如果要插入教室xxx，yyy(容量)，请依次执行：1：insert into classroom (c_id,c_maxhold) values ('xxx',yyy)
2.insert into classroom_temp(c_id,c_maxhold) values ('xxx',yyy)
3.CREATE TABLE classroom_state_temp SELECT * FROM borrowday,timeframe,classroom_temp,state
4.alter table classroom_state_temp add borrower varchar(24) default 0;
5.INSERT INTO classroom_state SELECT * FROM classroom_state_temp;
6.truncate table classroom_temp;
7.drop table classroom_state_temp;
如果要插入会议室xxx，yyy(容量)，请依次执行：1：insert into boardroom (b_id,b_maxhold) values ('xxx',yyy)
2.insert into boardroom_temp(b_id,b_maxhold) values ('xxx',yyy)
3.CREATE TABLE boardroom_state_temp SELECT * FROM borrowday,timeframe,boardroom_temp,state
4.alter table boardroom_state_temp add borrower varchar(24) default 0
5.INSERT INTO boardroom_state SELECT * FROM boardroom_state_temp
6.truncate table boardroom_temp
7.drop table boardroom_state_temp
如果要删除教室x,请依次执行:1.delete from classroom where c_id='x'
2.delete from classroom_state where c_id='x'
如果要删除会议室x,请依次执行:1.delete from boardroom where b_id='x'
2.delete from boardroom_state where b_id='x'
如果要插入用户x,y(密码)，z(身份:student,teacher,manager,systemmanager)，请输入:insert into users(number,password,identity) values ('x',y,'z')
如果要修改用户信息,例如x 的密码为y，请输入：update users set password=y where number='x'
如果要删除用户x,请输入:delete from users where number='x'
如需更改密码请输入：update users set password=41455024 where number=41455024
更多操作，请查阅help
</textarea>
	  <p align="center">&nbsp;</p>
	</div>
	<p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p><p align="center">&nbsp;</p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% }catch(Exception e){
out.print("<script>alert('wrong input');</script>");
response.sendRedirect("dao0.jsp");
e.printStackTrace();
}%>
<div id="footer">
      <div align="center" class="container">
        <p  > author: <a href="http://www.fo12974829.icoc.me/?_sc=4">pengfeihong</a> .</p>
</div>
    </div>	
</body>
</html>