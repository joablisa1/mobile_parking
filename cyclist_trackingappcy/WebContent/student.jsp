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
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,pliz register first ");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<div class="nav-search">
<form action="search_student_by.jsp" method="get">
<input type="text" name="search" value="" size="25" id="search"><input type="submit" id="submit" value="Search">
</form>
</div>
<div class="container">
<div class="top">
<br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>The Entry Form For Student</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>
<p>If by any chance you try to submit data and it won't save ,try to refresh  the page..or the same information do exist </p>
<br><br><br>
<form action="process_student.jsp" method="post" name="form1" id="form1" onsubmit="return student_required();" >
<table border="0"cellpadding="4"cellspacing="1" align="center" >
<tr><th colspan="2">Registration Form </th></tr>
<tr><td colspan="2">
<%
if(request.getAttribute("reg_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("reg_msg")+"</font>");
}%> 
 </td></tr>
<tr><td>Student Name<font color = "#FF0000">*</font>:<br> <input type="text" name="name" size="45" id="name"></td></tr>
<tr><td>Form<font color = "#FF0000">*</font>:<br> <select name="forms" id="forms">
<option >Select form</option>
<option value="1">form 1</option>
<option value="2">form 2</option>
<option value="3">form 3</option>
<option value="4">form 4</option>
</select><br><br>Stream  <br>

<select name="stream" size="1" id="stream">
<option >Select stream</option>
<option value="B">Blue</option>
<option value="R">Red</option>
<option value="G">Green</option>
<option value="Y">Yellow</option>
<option value="V">Violet</option>
</select></td></tr>
<tr><td>ADM<font color = "#FF0000">*</font>:<br>  <input type="text" name="adm" id="adm" size="45"></td></tr>
<tr><td>Gender<font color = "#FF0000">*</font>:<br> <select name="sex" size="1" id="sex">
<option value="M">Male</option>
<option value="F">Female</option>
</select></td></tr>
<tr><td colspan="2"><input type="submit" value="Register" size="45" id="submit"></td></tr>
</table>
<br><br><br><br><br><br><br><br><br>
</form>   
   
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>



</body>
</html>