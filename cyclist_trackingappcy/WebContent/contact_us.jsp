<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/adminscreen.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/valdate.jsp"></script>
<title>home</title>
</head>
<body>
<div class="nav-search">
<form action="">
<input type="text" name="search" value="" size="25" id="search" ><input type="submit" value="Search" id="submit">
</form>
</div>
<div class="container">
<div class="top">
<br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>Contact </h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>&nbsp;&nbsp;&nbsp;&nbsp;<br>
<p>Hello fox here we offer all services that you might need, we are always available Please leave a Message and we shall contact you,We are at your services..</p>
<% 
					if(request.getAttribute("not_reg_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("not_reg_msg"));
					out.print("</font>");
					}
	%>
<br>

<form action="" method="post" onsubmit="">
<table border="0"cellpadding="6"cellspacing="5" align="center" >
<tr><th colspan="2">Write Your Message And we Shall respond to you.</th></tr>
<tr><th colspan="2"></th></tr>
<tr><td>Name<font color = "#FF0000">*</font>:</td><td><input type="text" name="name" id="name" size="45"></td></tr>
<tr><td>Email Address<font color = "#FF0000">*</font>:</td><td><input type="text" name="email" id="email" size="45"></td></tr>
<tr><td>Phone Number<font color = "#FF0000">*</font>: </td><td><input type="text" name="phone" id="phone" size="45">               </td> </tr>
<tr><td>Message<font color = "#FF0000">*</font>:</td><td> <textarea rows="20" cols="55" name="message"> Please enter your message here....</textarea>          </td></tr>

<tr><td colspan="2" align="center"><input type="submit" value="Message" size="45"></tr>
</table>
</form>
<br><br><br>
*Required...*
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>



</body>
</html>