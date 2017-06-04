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
<%request.getSession().setAttribute("sessionstate","unlogined"); %>
<%request.getSession().setAttribute("sessionname",null); %>
<%request.getSession().setAttribute("sessionidentity",null); %>
<%request.getSession().setAttribute("sessionpwd",null);     //用Session保存用户名  %>
<%request.getSession().setAttribute("sessiontimeframe",null);     //用Session保存用户名  %>
<%request.getSession().setAttribute("sessionmaxhold",null);     //用Session保存用户名%>
<%request.getSession().setAttribute("sessionexcuse",null);     //用Session保存用户名%>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container">
    <div class="navbar-header">
        <a class="navbar-brand" href="dao0.jsp">Home</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <%if(request.getSession().getAttribute("sessionstate")!="logined") {%>
            <li class="active"><a href="dao2.jsp">Login</a></li>
            <%} %>
            <%if(request.getSession().getAttribute("sessionstate")=="logined") {%>
            <li ><a href="dao3.jsp">Appointment</a></li>
            <%} %>
            <li ><a href="dao4.jsp">About</a></li>
            <li ><a href="register.jsp">Register</a></li>
            <%if ( request.getSession().getAttribute("sessionstate")=="logined" && (String)request.getSession().getAttribute("sessionidentity")=="manager") {%>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    About <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="dao4.jsp">help</a></li>
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
	
	<form id="form1" name="form1" method="post" action="hong1_mysql_select.jsp" onsubmit="return check()">
	<div align="center" class="STYLE3">
	  <p align="center">
		  <span class="btn btn-large btn-success" > 账号</span>
		  <abbr title="请输入8位账号">
		  <input name="id" type="text" class="STYLE3" size="12" style="border-radius:5px;" />
		  </abbr>
	  </p>
	  <p align="center">
		  <span class="btn btn-large btn-success"> 密码</span>
		  <abbr title="请输入密码">
		  <input name="pwd" type="password" class="STYLE3" size="12" style="border-radius:5px;"/></abbr>
		  
	  </p>
	  <a href="sendmail.jsp" class="btn btn-xs btn-danger">forget password?</a>
	  <label></label>
	  <p>
		  <label>
		  <input type="radio" name="identity" value="student" checked="checked" />
		  <span class="btn btn-primary btn-large">学生</span></label>
		  <label>
		  <input type="radio" name="identity" value="teacher" />
		  <span class="btn btn-primary btn-large">教师</span></label>
		  <label>
		  <input type="radio"  name="identity" value="manager" />
		  <span class="btn btn-primary btn-large">管理员</span><br />
	  </label>
	  <label>
		  <input type="radio"  name="identity" value="systemmanager" />
		  <span class="btn btn-primary btn-large">系统管理员</span><br />
	  </label>
	  <br />
	  <label></label>
	  <label></label>
	  <input name="Submit"  class="btn btn-large btn-success" type="submit"  value="登录"/>
	  
	  <%-- <label>
		  <input type="button" class="btn btn-large btn-success" onclick="window.location.href='daohang.jsp'" name="注册" value="注册" />
	  </label>
	  --%>
	 <%--onclick="javascript:window.location.href='http://www.baidu.com'" value="登录"  --%>
	  <br />
	  </p>
	</form>
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