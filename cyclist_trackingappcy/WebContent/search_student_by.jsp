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
<title>search</title>
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
<div class="nav-search">
<form action="search_student_by.jsp">
<input type="text" name="search" value="" size="25" placeHolder="Search Key" id="search" ><input type="submit" value="Search" id="submit">
<%
if(request.getAttribute("search_msg")!=null){
	out.print("<font style='color:red' size='15'>"+request.getAttribute("search_msg")+"</font>");
}%>
</form>
</div>
<div class="container">
<div class="top">
<br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content"><br>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <h1 align="center">Found Record</h1>
<%! 
Connection conn=null;
PreparedStatement ps=null;
%>
<%
String id=request.getParameter("search");
try{
	session.setAttribute("search_msg", "Found result.." );
	String sql="select  * from student where ID=? or studentname=? or forms=? or stream =? or adm=? order by ID,stream asc limit 25";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, id);
	ps.setString(3, id);
	ps.setString(4, id);
	ps.setString(5, id);
	ResultSet rs=ps.executeQuery();
	%>
 <p> The information found here can be view and search by the search box above to have access to all student you can find in this system, We hope that everything will be ok.  </p>
	<br><br>
	<table border="0" cellpadding="0"cellspacing="0"  class="table3" >
	<%
	if(rs.next()){
	 %>
	 <tr><th align="center" colspan="2"> Record Searched and found</th><td></td>    </tr>
	 <tr><td>  </td><td colspan="2"><a href="model_search.jsp?search=<%=rs.getString(1)%>">View</a> </td>       </tr>
	 <tr><td>Your Full Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(2) %>  </td>  </tr>
	 <tr><td>Admitted in Form:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs.getString(3) %>  </td>  </tr>
	 <tr><td>Stream  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs.getString(4) %>  </td>  </tr>
	 <tr><td>Admission Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(5) %>   </td>  </tr>
	 <tr><td>Gender:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(6) %> </td>  </tr>
	 <tr><td>Admitted Date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(7) %></td>  </tr>

	 <%  
	}
	%>
		</table>
	<%	
}catch(Exception e){
}
%>

<%
if(request.getAttribute("not_reg_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("not_reg_msg")+"</font>");
}%>  
</div>  
</div>
<jsp:include page="footers.jsp"></jsp:include>



</body>
</html>