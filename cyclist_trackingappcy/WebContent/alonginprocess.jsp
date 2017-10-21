<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator</title>
</head>
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,Register if Youre New Member or Login ");
%>
<jsp:forward page="admin_form.jsp"></jsp:forward>
<%
}
%>
<body>
<%
String email=getServletContext().getInitParameter("email");
String userpass=getServletContext().getInitParameter("userpass");

if(request.getParameter("email").equalsIgnoreCase(email)&& request.getParameter("userpass").equalsIgnoreCase(userpass)){
	session.setAttribute("islogin", "plz sign in first");
	session.setAttribute("email", "Administrator");
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
	<% 
	
}else{
	request.setAttribute("Erorr", "Sorry ! or Password Error");
	session.setAttribute("loginmsg", "plz sign in first");
	%>
	<jsp:forward page="admin_form.jsp"></jsp:forward>
	<% 
}
%>

</body>
</html>