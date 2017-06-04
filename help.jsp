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
            <li class="active"><a href="dao4.jsp">About</a></li>
            <%if ( request.getSession().getAttribute("sessionstate")=="logined" && (sss.compareTo("manager")==0 || sss.compareTo("systemmanager")==0)) {%>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Options <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="manager_examine.jsp">审批请求</a></li>
                    <li><a href="manager_examined.jsp">查看已审批请求</a></li>
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
<% }catch(Exception e){
	out.print("<script>alert('wrong input');</script>");
	response.sendRedirect("dao2.jsp");
	e.printStackTrace();
}%>
<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
	  <p>&nbsp;  </p>
	</div>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
<div class="container">
  
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">第一部分</a></li>
                <li><a href="#section-2">第二部分</a></li>
                <li><a href="#section-3">第三部分</a></li>
                <li><a href="#section-4">第四部分</a></li>
                <li><a href="#section-5">第五部分</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 style="color:green" id="section-1">第一部分</h2>
            
            <p style="color:red">select * from classroom; select curtime();         编码问题show variables like "char%"</p>
            <hr>
            <h2 style="color:green" id="section-2">第二部分</h2>
            
            <p style="color:red">创建表格
			create table classroom(
			classroom_id varchar(24),
			classroom_date date,
			classroom_timeframe varchar(24),
			classroom_maxhold int,
			primary key (classroom_id,classroom_date,classroom_timeframe)
			);
			删除表格
			drop table classroom;</p>
            <hr>
            <h2 style="color:green" id="section-3">第三部分</h2>
            <p style="color:red">插入数据
			insert into classroom
			(classroom_id,classroom_date,classroom_timeframe,classroom_state，classroom_maxhold)
			 values
			("教101",now(),1,"8:00-9:35"),</p>
            <hr>
            <h2 style="color:green" id="section-4">第四部分</h2>
            <p style="color:red">添加字段
			alter table table1 add transactor varchar(10) not Null;
			删除字段
			alter table `user_movement_log` drop column Gatewayid
			
			更改列属性
			 alter table classroom modify classroom_id varchar(24);
			 
			描述表
			describe classroom;</p>
            <hr>
            <h2 style="color:green" id="section-5">第五部分</h2>
            <p style="color:red">更新数据
			update classroom set timeframe="8:00-9:35" where classroom_id="教101";
			update classroom set classroom_date=sysdate() where classroom_id="教102";
			
			笛卡尔积
			select * from boardroom,borrowday,timeframe
			删除表的所有数据
			truncate table xx
			
			删除主键
			alter table classroom_state drop primary key
			增加主键
			ALTER TABLE boardroom_state ADD PRIMARY KEY (day,s_time,e_time,b_id,borrower,canbo);
			重命名表名
			alter table classroom_state rename boardroom_state;</p>
        </div>
    </div>
</div>
	</div>
<div id="footer">
      <div align="center" class="container">
        <p  > author: <a href="http://www.fo12974829.icoc.me/?_sc=4">pengfeihong</a> .</p>
</div>
    </div>	
</body>
</html>