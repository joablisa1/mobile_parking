<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

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
request.setAttribute("not_reg_msg","Sorry,You have not registered...");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<%!
String id,model,serial,color,amount,date;
%>
<%
try{
	
	Connection conn=null;
	PreparedStatement ps=null;
	id=request.getParameter("id");
	model=request.getParameter("model");
	serial=request.getParameter("serial");
	color=request.getParameter("color");
	amount=request.getParameter("amount");
	date=request.getParameter("date");
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	String sql="select * from bicycle where ID="+id;
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		id=rs.getString(1);
		model=rs.getString(2);
		serial=rs.getString(3);
		color=rs.getString(4);
		amount=rs.getString(5);
		date=rs.getString(6);
	}
	
}catch(Exception e){
	
}
%>
<div class="nav-search">
<form action="">
<input type="text" name="search" value="" id="searh" size="25" ><input type="submit" value="Search" id="submit">
</form>
</div>
<div class="container">
<div class="top">
<br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>Edit Bicycle Entry Form</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>&nbsp;&nbsp;&nbsp;&nbsp;<br>
<br><br><br><br>
<form action="update_bicycle.jsp?id=<%=id%>" method="post" name="form1" >
<table border="0"cellpadding="5"cellspacing="5" align="center">
<tr><th colspan="2">Edit Bicycle Models </tr>
<tr><th colspan="2"><input type="hidden" name="id" value="<%=id%>"></th></tr>
<tr><td colspan="1">Model Type<font color = "#FF0000">*</font>:</td><td><input type="text" name="model" value="<%=model%>"  id="model" size="45"></td></tr>
<tr><td>Model Color <font color = "#FF0000">*</font>:</td><td> 
<input type="text" size="45"  name="color" id="color" value="<%=color%>"></td></tr>
<tr><td>Serial Number<font color = "#FF0000">*</font>:</td><td><input type="text" name="serial" value="<%=serial%>" size="45" id="serial"></td></tr>
<tr><td>price<font color = "#FF0000">*</font>:</td><td><input type="text" name="amount" value="<%=amount %>" size="45" id="amount"></td></tr>
<tr><td><input type="hidden" name="date" value="<%=date %>" size="45" id="date"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Edit&Update" id="submit" size="45"></td></tr>
</table>
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