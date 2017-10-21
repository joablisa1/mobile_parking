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
<title>search</title>
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
<form action="find_student1.jsp" method="get">
<input type="text" name="search" value="" size="25" id="search"><input type="submit" value="Search" id="submit">
</form>
</div>
	<div class="container">
	<div class="top">
<br><br><br><br><br><br><br><br><br><br>
</div>
	<jsp:include page="adminmenubar.jsp"></jsp:include>
<div class="content">
<%! 
Connection conn=null;
PreparedStatement ps=null;
%>
<%
try{
	
	session.setAttribute("search_msg", "Found result.." );
	String sql="select  * from student  order by ID,stream asc limit 10";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	%>
	<table border="0" cellpadding="3"cellspacing="0" width="95%" class="table2" >
	<tr><th colspan="3">student list</th></tr>
	<tr><td colspan="2" ></td></tr>
	<tr><th>NAME </th><th>STREAM </th><th>FORM </th><th> ADM</th><th> GENDER</th><th> DATE</th>  </tr>
	<%
	while(rs.next()){
	 %>
	 <tr>&nbsp;&nbsp;<td>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="model_search.jsp?search=<%=rs.getString(2)%>"><%=rs.getString(2) %></a> </td><td>&nbsp;&nbsp; &nbsp;&nbsp;<a href="single_student.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(3) %></a> </td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(4) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(5) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(6) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(7) %></td> </tr>
	 <%  
	}
	%>
		</table>
	<%	

	
}catch(Exception e){
}

%>
</div>
</div>
<jsp:include page="footers.jsp"></jsp:include>
</body>
</html>