 <%@ page contentType="text/html;charset=GB2312"%>
 <%
 if(request.getParameter("uid").equals("sky2098")&&request.getParameter("upwd").equals("sky2098"))
 {
 session.setAttribute("login","ok");
 session.setMaxInactiveInterval(-1);
 %>
 <jsp:forward page="afterLogin2.jsp"/>
 <%
 }
 else
 {
 out.println("用户名或密码输入错误！");

}
%> 