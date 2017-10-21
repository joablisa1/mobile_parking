<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/adminscreen.css" rel="stylesheet" type="text/css">

<title>home</title>
</head>
<body>
<div class="nav-search">
<form action="">
<input type="text" name="search" value="" size="25" style="background-color: red;"><input type="submit" value="Search">
</form>
</div>
<div class="container">
<div class="top">
 <br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>New Member Entry Form</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>&nbsp;&nbsp;&nbsp;&nbsp;<br>
<br>
<form action="member_preocess.jsp" method="post" name="form1" id="regifrom" onsubmit="return required();">
<table border="0"cellpadding="6"cellspacing="5" align="center">
<tr><th colspan="2"><u> New Member Registration.. </u> </th></tr>
<tr><th colspan="2"></th>   </tr>
<tr><td colspan="2" align="center"> <% 
if(request.getAttribute("reg_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("reg_msg")+"</font>");
}%></td>     </tr>
<tr><td>User Name<font color = "#FF0000">*</font> <br>  <input type="text" name="username" id="username" size="45"></td></tr>
<tr><td>Email Address<font color = "#FF0000">*</font><br> <input type="text" name="email" id="email" size="45"></td></tr>
<tr><td>Password<font color = "#FF0000">*</font><br> <input type="password" name="userpass" id="userpass" size="45"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="New_Member" id="submit" size="45"></td></tr>
</table>
</form>
<br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>



</body>
</html>