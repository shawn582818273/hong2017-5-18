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
<% //try{
	//String sss=request.getSession().getAttribute("sessionidentity").toString();%>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container">
    <div class="navbar-header">
        <a class="navbar-brand" href="dao0.jsp">Home</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <%//if(request.getSession().getAttribute("sessionstate")!="logined") {%>
            <li ><a href="dao2.jsp">Login</a></li>
            <%//} %>
                  
            <li class="active"><a href="dao4.jsp">About</a></li>
            
             
            
          
            
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <%if(request.getSession().getAttribute("sessionstate")=="logined") {%>
            <li><a href="dao2.jsp">Logout</a></li>
            </ul>
            <%} %>
    </div>
	</div>
</nav>
<% //}catch(Exception e){
	//out.print("<script>alert('wrong input');</script>");
	//response.sendRedirect("dao2.jsp");
	//e.printStackTrace();
//}%>
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
            
            <p style="color:red">本产品是教室预约系统，可供学生和教师借教室和会议室，如未注册，请前往注册页面注册，待管理员审核通过后方可登录。</p>
            <hr>
            <h2 style="color:green" id="section-2">第二部分</h2>
            
            <p style="color:red">学生可借容量为60，120，240的教室，教师可借容量为20，40，60的会议室和容量为60，120，240的教室，所有请求都需要管理员审批。</p>
            <hr>
            <h2 style="color:green" id="section-3">第三部分</h2>
            <p style="color:red">本系统作者：彭飞鸿。 北京科技大学学生，QQ：582818273.  邮箱：582818273@qq.com
            如有问题请联系我。</p>
            <hr>
            <h2 style="color:green" id="section-4">第四部分</h2>
            <p style="color:red">2017年5月制作</p>
            <hr>
            <h2 style="color:green" id="section-5">第五部分</h2>
            <p style="color:red">Sed vitae lobortis diam, id molestie magna. Aliquam consequat ipsum quis est 
            dictum ultrices. Aenean nibh velit, fringilla in diam id, blandit hendrerit lacus. 
            Donec vehicula rutrum tellus eget fermentum. Pellentesque ac erat et arcu ornare 
            tincidunt. Aliquam erat volutpat. Vivamus lobortis urna quis gravida semper. 
            In condimentum, est a faucibus luctus, mi dolor cursus mi, id vehicula arcu risus a 
            nibh. Pellentesque blandit sapien lacus, vel vehicula nunc feugiat sit amet.</p>
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