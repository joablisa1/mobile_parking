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
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,You have not registered...");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<body>
<div class="nav-search">
<form action="">
<input type="text" name="search" value="" size="25" style="background-color: red;"><input type="submit" value="Search">
</form>
</div>
<div class="container">
<div class="top">
 <br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>Penalty Form</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>&nbsp;&nbsp;&nbsp;&nbsp;<br>

<form action="penalty_process.jsp" method="post" name="form1" onsubmit="return penalty_required()" >
<br><br><br><br><br><br>
<table border="0"cellpadding="6"cellspacing="5" align="center">
<tr><th colspan="2">New Penalty </th></tr>
<tr><th colspan="2"></th></tr>
<tr><td>Student Name:</td><td><input type="text" name="lost_by" id="lost_by" size="45">
</td></tr>
<tr><td>Penalty Fees:</td><td><input type="text" name=" fine_paid" id="penalty_fee" size="45">
</td></tr>
<tr><td>Serial Number:</td><td><input type="text" name="serial" id="serial" size="45">
</td></tr>
<tr><td>Model Type:</td><td><input type="text" name="model" id="model" size="45">
</td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Add_Penalty" size="45" id="submit" > </td></tr>
</table>
</form>
<br><br><br><br><br><br><br><br><br><br><br>
<% 
if(request.getAttribute("reg_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("reg_msg")+"</font>");
}%>
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>
</body>
</html>