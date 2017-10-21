<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>log out</title>
</head>
<body>
<%session.invalidate(); %>
<% 
					if(request.getAttribute("not_reg_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("not_reg_msg"));
					out.print("</font>");
					}
	%>

 <jsp:forward page="login.jsp"></jsp:forward>
</body>
</html>