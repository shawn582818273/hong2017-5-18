<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--hong1.jsp --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>教室预约系统</title>
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
	<div align="center">
	  <p class="STYLE2 STYLE9">教室预约系统</p>
	  <p>&nbsp;  </p>
	</div>
	<%--hong1_mysql_select.jsp --%>
	<%--mysql_select.jsp --%>
	
	<form id="form1" name="form1" method="post" action="hong1_mysql_select.jsp" onsubmit="return check()">
	<div align="center" class="STYLE3">
	  <p align="center">
		  <span class="STYLE5"> 账号</span>
		  <abbr title="请输入8位账号">
		  <input name="id" type="text" class="STYLE3" size="12" />
		  </abbr>
	  </p>
	  <p align="center">
		  <span class="STYLE11"> 密码</span>
		  <abbr title="请输入密码">
		  <input name="pwd" type="password" class="STYLE3" size="12" /></abbr>
	  </p>
	  <label></label>
	  <p>
		  <label>
		  <input type="radio" name="identity" value="student" checked="checked" />
		  <span class="STYLE6">学生</span></label>
		  <label>
		  <input type="radio" name="identity" value="teacher" />
		  <span class="STYLE8">教师</span></label>
		  <input type="radio" name="identity" value="manager" />
		  <span class="STYLE8">管理员</span><br />
	  <label></label>
	  <br />
	  <label></label>
	  <label></label>
	  <input name="Submit" type="submit" class="STYLE3" onclick="javascript:window.location.href='http://www.baidu.com'" value="登录"  />
	  <br />
	  </p>
	</form>
	  <p align="center">&nbsp;</p>
	</div>
</body>
</html>
