<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/adminscreen.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/login_validate.js"></script>
<title>home</title>
</head>
<body>
<%session.invalidate(); %>
<div class="nav-search">
<form action="">
<input type="text" name="search" value="" size="25" id="search"><input type="submit" value="Search" id="submit">
</form>
</div>
<div class="container">
<div class="top">
 <br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>Login</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>&nbsp;&nbsp;&nbsp;&nbsp;<br>

<br>
<form action="LoginProcess" method="post" name="form1" id="regifrom" onsubmit="return required()">
<table border="0"cellpadding="6"cellspacing="5" align="center">
<tr><th colspan="2"><u>Member Login </u>    </th></tr>
<tr><th colspan="2"></th>   </tr>
<tr><td colspan="2">
<% 
					if(request.getAttribute("not_reg_msg")!=null){
					out.print("<font size='4' color='green'>");
					out.print(request.getAttribute("not_reg_msg"));
					out.print("</font>");
				}
	%>
	<% 
					if(request.getAttribute("Loginmsg")!=null){
					out.print("<font size='4' color='green' >");
					out.print(request.getAttribute("Loginmsg"));
					out.print("</font>");
					}
	%>
</td>   </tr>
<tr><td>Email<font color = "#FF0000">*</font><br> <input type="text" name="email" id="email" size="45"></td></tr>
<tr><td>Password<font color = "#FF0000">*</font><br> <input type="password" name="userpass" id="userpass" size="45"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Log_on" id="submit" size="45"></td></tr>
<tr><td colspan="2">                       
<a href="member.jsp">New Member</a>|<br>
<a href="admin_form.jsp">Administrator Login</a>|<br>
<a href="">Forgotten userName or password</a>
</td>     </tr>
</table>
</form>
<br><br><br><br><br><br><br><br><br><br><br>
<%
if(request.getAttribute("not_reg_msg")!=null){
	out.print("<font style='color:green'>"+request.getAttribute("not_reg_msg")+"</font>");
}%>
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>
<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red'>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
	%>
</body>
</html>