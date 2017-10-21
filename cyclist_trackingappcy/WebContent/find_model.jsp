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
<h1>Search filters </h1>
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

<form action="model_search.jsp" method="get" name="form1">
<table cellpadding="0" cellspacing="40%" border="0">
<tr><th colspan="2"><h1>Search for any bicycle model they are all found here..</h1> </th></tr>
<tr><th colspan="2"></th></tr>
<tr><td> <p>From this form you can make several searches ranging from model,color,serial number if any all the information is provided on this page. Once you have entered the model type you want to find press the search button and you will be able to view a detailed record  </p></td> </tr>
<tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Search for any model color.<input type="text" name="search" value="" id="search" size="70"><input type="submit" value="search" id="submit"></td></tr>
<tr><td></td>     </tr>
<tr><td></td>     </tr>
<tr><td></td>     </tr>
</table>
</form>
<br><br><br>
*Required...*
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>



</body>
</html>