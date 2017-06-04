<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%	
	 class Authentication extends Authenticator{  
	  String username=null;  
	  String password=null;  
	  
	  public Authentication(){  
	  }  
	  public Authentication(String username, String password) {  
	  this.username = username;  
	  this.password = password;  
	  }  
	  protected PasswordAuthentication getPasswordAuthentication(){
	  PasswordAuthentication pa = new PasswordAuthentication(username, password);
	  return pa;
	  }  
	}  
class SendMail {  
	  // 发送邮件的服务器的IP和端口  
	  private String mailServerHost;  
	  private String mailServerPort = "25";  
	  private String fromAddress;  
	  private String toAddress;  
	  private String userName;  
	  private String password;  
	  private boolean validate = false;  
	  private String subject;  
	  private String content;  
	  private String[] attachFileNames;  
	  /**  
	  * 获得邮件会话属性  
	  */  
	  public Properties getProperties(){  
	  Properties p = new Properties();  
	  p.put("mail.smtp.host", this.mailServerHost);  
	  p.put("mail.smtp.port", this.mailServerPort);  
	  p.put("mail.smtp.auth", validate ? "true" : "false");  
	  return p;  
	  }  
	  public String getMailServerHost() {  
	  return mailServerHost;  
	  }  
	  public void setMailServerHost(String mailServerHost) {  
	  this.mailServerHost = mailServerHost;  
	  }  
	  public String getMailServerPort() {  
	  return mailServerPort;  
	  }  
	  public void setMailServerPort(String mailServerPort) {  
	  this.mailServerPort = mailServerPort;  
	  }  
	  public boolean isValidate() {  
	  return validate;  
	  }  
	  public void setValidate(boolean validate) {  
	  this.validate = validate;  
	  }  
	  public String[] getAttachFileNames() {  
	  return attachFileNames;  
	  }  
	  public void setAttachFileNames(String[] fileNames) {  
	  this.attachFileNames = fileNames;  
	  }  
	  public String getFromAddress() {  
	  return fromAddress;  
	  }  
	  public void setFromAddress(String fromAddress) {  
	  this.fromAddress = fromAddress;  
	  }  
	  public String getPassword() {  
	  return password;  
	  }  
	  public void setPassword(String password) {  
	  this.password = password;  
	  }  
	  public String getToAddress() {  
	  return toAddress;  
	  }  
	  public void setToAddress(String toAddress) {  
	  this.toAddress = toAddress;  
	  }  
	  public String getUserName() {  
	  return userName;  
	  }  
	  public void setUserName(String userName) {  
	  this.userName = userName;  
	  }  
	  public String getSubject() {  
	  return subject;  
	  }  
	  public void setSubject(String subject) {  
	  this.subject = subject;  
	  }  
	  public String getContent() {  
	  return content;  
	  }  
	  public void setContent(String textContent) {  
	  this.content = textContent;  
	  }  
	}
class MailSender  {  
/**  
  * 以文本格式发送邮件  
  */  
  public boolean sendTextMail(SendMail mailInfo) {  
  // 判断是否需要身份认证  
  Authentication authenticator = null;  
  Properties pro = mailInfo.getProperties();  
  if (mailInfo.isValidate()) {  
  // 如果需要身份认证，则创建一个密码验证器  
  authenticator = new Authentication(mailInfo.getUserName(), mailInfo.getPassword());  
  }  
  // 根据邮件会话属性和密码验证器构造一个发送邮件的session  
  Session sendMailSession = Session.getInstance(pro,authenticator);  
  try {
  Message mailMessage = new MimeMessage(sendMailSession);
  Address from = new InternetAddress(mailInfo.getFromAddress());
  mailMessage.setFrom(from);
  Address to = new InternetAddress(mailInfo.getToAddress());  
  mailMessage.setRecipient(Message.RecipientType.TO,to);
  mailMessage.setSubject(mailInfo.getSubject());
  mailMessage.setSentDate(new java.util.Date());
  String mailContent = mailInfo.getContent();  
  mailMessage.setText(mailContent);
  Transport.send(mailMessage);  
  return true;  
  } catch (MessagingException ex) {  
  ex.printStackTrace();  
  }  
  return false;  
  }
  /**  
  * 以HTML格式发送邮件  
  */  
  public boolean sendHtmlMail(SendMail mailInfo){  
  // 判断是否需要身份认证  
  Authentication authenticator = null;  
  Properties pro = mailInfo.getProperties();
  //if (mailInfo.isValidate()) {  
  authenticator = new Authentication(mailInfo.getUserName(), mailInfo.getPassword());  
  //}  
  // 根据邮件会话属性和密码验证器构造一个发送邮件的session  
  Session sendMailSession = Session.getInstance(pro,authenticator);  
  try {  
  // 根据session创建一个邮件消息  
  Message mailMessage = new MimeMessage(sendMailSession);
  Address from = new InternetAddress(mailInfo.getFromAddress());
  mailMessage.setFrom(from);
  Address to = new InternetAddress(mailInfo.getToAddress());  
  // Message.RecipientType.TO属性表示接收者的类型为TO  
  mailMessage.setRecipient(Message.RecipientType.TO,to);
  mailMessage.setSubject(mailInfo.getSubject());
  mailMessage.setSentDate(new java.util.Date());
  Multipart mainPart = new MimeMultipart();
  BodyPart html = new MimeBodyPart();
  html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");  
  mainPart.addBodyPart(html);
  mailMessage.setContent(mainPart);
  Transport.send(mailMessage);  
  return true;  
  } catch (MessagingException ex) {  
  ex.printStackTrace();  
  }  
  return false;  
  }  
}
%>
<%-- 
	  //设置邮件参数  
	  SendMail mail = new SendMail();  
	  mail.setMailServerHost("smtp.163.com"); //这里填发送者的邮箱服务器，我以qq举个例子  
	  mail.setMailServerPort("25");  
	  mail.setValidate(true);  
	  mail.setUserName("register_validate@163.com");  
	  mail.setPassword("registervalidate");
	  mail.setFromAddress("register_validate@163.com");  
	  mail.setToAddress("582818273@qq.com");  
	  mail.setSubject("标题");
	  mail.setContent("内容:发送成功");  
	  //发送邮件  
	  MailSender sms = new MailSender();  
	  //sms.sendTextMail(mail);//发送文体格式  
	  sms.sendHtmlMail(mail);//发送html格式  
	  --%>
	  <%-- 
		   
  String result;
   // 收件人的电子邮件
   String to = "582818273@qq.com";

   // 发件人的电子邮件
   String from = "register_validate@163.com";

   // 假设你是从本地主机发送电子邮件
   String host = "smtp.163.com";

   // 获取系统属性对象
   Properties properties = System.getProperties();

   // 设置邮件服务器
   properties.setProperty("mail.smtp.host", host);
   properties.setProperty("mail.user", "register_validate@163.com");
   properties.setProperty("mail.password", "registervalidate");
   properties.put("mail.smtp.password", "registervalidate");
   properties.put("mail.smtp.auth", "true");
   //properties.list(System.out);
   // 获取默认的Session对象。
   Session mailSession = Session.getDefaultInstance(properties);

   //try{
      // 创建一个默认的MimeMessage对象。
      MimeMessage message = new MimeMessage(mailSession);
      // 设置 From: 头部的header字段
      message.setFrom(new InternetAddress(from));
      // 设置 To: 头部的header字段
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // 设置 Subject: header字段
      message.setSubject("This is the Subject Line!");
     
      // 设置 HTML消息
      message.setContent("<h1>This is actual message</h1>",
                            "text/html" );
      // 发送消息
      Transport.send(message);
      result = "Sent message successfully....";
  // }catch (MessagingException mex) {
      //mex.printStackTrace();
      //result = "Error: unable to send message....";
   //}
        
--%>
<%String smtpServer ="smtp.163.com";  
String protocol = "smtp";  
String username = "register_validate@163.com";  
String password = "shawn582818273";  
  
String from ="register_validate@163.com";  

//String to     = "582818273@qq.com";  
String account = request.getParameter("account");
String to = request.getParameter("email");
String SQ = "select * from users where number="+account+" and email='"+to+"'";
String strConn="jdbc:mysql://localhost:3306/hong";  
String strUser="root"; 
String strPassword="123456";
Connection conn1=DriverManager.getConnection(strConn,strUser,strPassword);
Statement stat=conn1.createStatement();
ResultSet rs=stat.executeQuery(SQ);
String psw=null;
if(rs.next())
{
	 psw=rs.getString("password");	

stat.close();  
conn1.close();
String subject = "找回密码邮件，如发送错误，勿回";  
String body = "您的密码是："+psw+"，请尽快修改密码";  
  
Properties props = new Properties();  
props.setProperty("mail.transport.protocol", protocol);  
props.setProperty("mail.host", smtpServer);  
props.setProperty("mail.smtp.auth", "true");  
Authentication authentication = new Authentication(username, password);  
Session session2 = Session.getInstance(props, authentication);  
session2.setDebug(true);  
  
//创建代表邮件的MimeMessage对象  
Message message = new MimeMessage(session2);  
message.setFrom(new InternetAddress(from));  
message.addRecipient(Message.RecipientType.TO,
        new InternetAddress(to));  
message.setSentDate(new java.util.Date());  
message.setSubject(subject);  
message.setText(body);  
//保存并且生成邮件对象  
message.saveChanges();  
  
//建立发送邮件的对象  
//Transport sender = session.getTransport();  
Transport.send(message); 
out.print("<script>alert('发送成功，请前往邮箱查看密码');</script>");
//response.sendRedirect("dao2.jsp");
}%>
<html>
<meta http-equiv="Refresh" content="1; url=dao2.jsp" />
<head>
<title>find password</title>
</head>
<body>
<center>
<h1>send success</h1>
</center>
<p align="center">
<% 
   //out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>