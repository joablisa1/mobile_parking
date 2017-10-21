<%@page import="java.sql.*"%>
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
<%!
String charged_fee,serial_number,serviced_by,model,date,id;
%>
<%
 try{
	id=request.getParameter("id");
	charged_fee=request.getParameter("charged_fee");
	serial_number=request.getParameter("serial");
	serviced_by=request.getParameter("serviced_by");
	model=request.getParameter("model");
	date=request.getParameter("date");
	Connection conn=null;
	String sql="select * from repair where ID=?"+id;
	ResultSet rs=null;
	PreparedStatement ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next()){
		id=rs.getString(1);
		charged_fee=rs.getString(2);
		serial_number=rs.getString(3);
		serviced_by=rs.getString(4);
		model=rs.getString(5);
		date=rs.getString(6);
	}	
 }catch(Exception e){
	 
 }

%>
<body>
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,You have not registered...");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<div class="nav-search">
<form action="">
<input type="text" name="search" value="" size="25" style="background-color: red;"><input type="submit" value="Search">
</form>
</div>
<div class="container">
<div class="top">
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>Maintenance Form</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>&nbsp;&nbsp;&nbsp;&nbsp;<br>
<input type="hidden" name="id" value="<%=id%>">

<form action="edit_repair_processed.jsp?id=<%=id%>" method="post"  name="form1" ">
<table border="0"cellpadding="6"cellspacing="5" align="center">
<tr><th colspan="2">Service Form</th></tr>
<tr><th colspan="2"></th></tr>
<tr><td>Enter  Model<font color = "#FF0000">*</font>:</td><td><input type="text" name="model" value="<%=model %>" id="model" size="45"></td></tr>
<tr><td>Enter  Serial Number<font color = "#FF0000">*</font>:</td><td><input type="text" name="serial" value="<%=serial_number %>" id="serial" size="45"></td></tr>
<tr><td>Enter repair fees<font color = "#FF0000">*</font>:</td><td><input type="text" name="charged_fee" value="<%=charged_fee %>" id="charged_fee" size="45"></td></tr>
<tr><td>Service by:</td><td><input type="text" name="serviced_by" id="serviced_by" value="<%=serviced_by %>" size="45"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="services" id="submit" size="45"></td></tr>
</table>
<input type="hidden" value="<%=date%>">
</form>
<br><br><br><br>
<% 
if(request.getAttribute("reg_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("reg_msg")+"</font>");
}%>
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>
</body>
</html>