<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table  id="tabId"width="900" border="1" cellspacing="0">
	<tr>
	       <td>学号</td>
	       <td>姓名</td>
	       <td>性别</td>
	       <td>年龄</td>
	       <td>操作</td>
	   </tr>
    <tr>
        <td>110</td>
        <td>张三</td>
        <td>女</td>
        <td>20</td>
        <td><input type="button" value="弹" onclick="getRowValue(this)"/></td>
    </tr>
    <tr>
        <td>112
        </td>
        <td>里斯</td>
        <td>男</td>
        <td>19</td>
        <td><input type="button" value="弹" onclick="getRowValue(this)"/></td>
    </tr>
    <tr>
        <td>113
        </td>
        <td>王五</td>
        <td>男</td>
        <td>30</td>
        <td><input type="button" value="弹"onclick="getRowValue(this)"/></td>
    </tr>
</table>
	<div id="divId" align="center" style="width:580px;height:160px;display:none;border:1px solid  black ;" title="提升度阈值">
			<table >
			   <tr>
					<td>学号:</td>
					<td>
						<input type="text" id="id"  style="width:160px"></input>
					</td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td>
						<input type="text" id="name"  style="width:160px"></input>
					</td>
				</tr>
				<tr>
					<td>性别:</td>
					<td   >
						<input type="text" id="sex" style="width:160px"></input>
					</td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td>
						<input type="text" id="age"  style="width:160px"></input>
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
			   <input type="button" value="关闭" onclick="closeDiv()">
			</div>
	</div>
</body>
</html>
<script type="text/javascript">
    //上面穿的this值得就是input
    function getRowValue(element){
   	
    	//设置div显示
    	 document.getElementById("divId").style.display="";
    	//this做为参数传过来是方法中的element,parentNode就是获取父节点，获取了连个父节点，就相当于获取了tr
    	var node = element.parentNode.parentNode;
    	//给每一个input框赋值，node.children[0].innerHTML,node就是tr，tr的子类有多个【0】根据下标取值
    	document.getElementById("id").value=node.children[0].innerHTML;
    	 document.getElementById("name").value=node.children[1].innerHTML;
    	 document.getElementById("sex").value=node.children[2].innerHTML
    	 document.getElementById("age").value=node.children[3].innerHTML;
   	
    }
    
    function closeDiv(){
    	//设置div关闭
    	document.getElementById("divId").style.display="none";
    }
</script>