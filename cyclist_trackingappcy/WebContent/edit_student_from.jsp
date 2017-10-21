<%@page import="database.utility.ConnectionJDBCFactory"%>
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
<body>

<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,Register if Youre New Member or Login ");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<%!
String nameString,streamString,formString,admString,genderstString,date;
String id;
%>
<%
try{
	id=request.getParameter("id");
	nameString=request.getParameter("name");
	streamString=request.getParameter("stream");
	formString=request.getParameter("forms");
	admString=request.getParameter("adm");
	genderstString=request.getParameter("sex");
	Connection conn=null;
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	String sql="select * from student where ID="+id;
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		id=rs.getString(1);
		nameString=rs.getString(2);
		streamString=rs.getString(3);
		formString=rs.getString(4);
		admString=rs.getString(5);
		genderstString=rs.getString(6);
		date=rs.getString(7);
		
	}
}catch(Exception e){
	
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
<h1>Edit Student</h1>
<hr>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.Please enter the student information or details Remember only the administrator should use this application thank.</p>
<p>If by any chance you try to submit data and it won't save ,try to refresh  the page..or the same information do exist </p>
<br><br><br>
<form action="edit_student_process.jsp?id=<%=id %>" method="post" name="form1" id="form1"  >
<table border="0"cellpadding="4"cellspacing="1" align="center" >
<tr><th colspan="2">Edit Student Form </th></tr>
<tr><th colspan="2"> </th></tr>
<tr><td>Student Name<font color = "#FF0000">*</font>:<br> <input type="text" name="name" value="<%=nameString %>" size="45" id="name"></td></tr>
<tr><td>Stream<font color = "#FF0000">*</font>:<br> <input type="text" name="stream" id="stream" value="<%=streamString %>"><br> forms <font color = "#FF0000">*</font><br> <input type="text" name="forms" id="forms" value="<%=formString%>"></td></tr>
<tr><td>ADM<font color = "#FF0000">*</font>:<br>  <input type="text" name="adm" id="adm" size="45" value="<%=admString %>"></td></tr>
<tr><td>Gender<font color = "#FF0000">*</font>:<br> <input type="text" name="sex" size="45" id="sex" value="<%=genderstString%>"></td></tr>
<tr><td><input type="hidden" name="date" size="45" id="date" value="<%=date%>"></td></tr>
<tr><td colspan="2"><input type="submit" value="Update_" size="45" id="submit"></td><td><a href="single_student.jsp">Back to Search</a>  </td>          </tr>
</table>
<br><br><br><br><br><br><br><br><br>
</form>   
<%
if(request.getAttribute("save_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("save_msg")+"</font>");
}%>  
<%
if(request.getAttribute("Error")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("Error")+"</font>");
}%>    
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>


<input type="hidden" name="id" value="<%=id %>"/>
</body>
</html>