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
<title>profile</title>
</head>
<body>
<% 
					if(request.getAttribute("not_reg_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("not_reg_msg"));
					out.print("</font>");
					}
	%>
	<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
	%>
	<% 
					if(request.getAttribute("Loginmsg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Loginmsg"));
					out.print("</font>");
					}
%><div class="nav-search">
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
<br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<h1>Student Profile</h1>

<br><br>
<hr>
<%! 
Connection conn=null;
PreparedStatement ps=null;
%>
<%

try{
	session.setAttribute("search_msg", "Found result.." );
	String sql="select * from student  order by ID,stream asc limit 1";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	%>
	<table border="0" cellpadding="4"cellspacing="5" width="60%" class="table2" >
	<tr><td colspan="2" ></td></tr>
	<tr><td></td></tr>
	<%
	while(rs.next()){
	 %>
	 <tr><td colspan="2"><h1><u>Personal Details</u></h1></td> <td></td> <td></td><td colspan="2"><a href="edit_student_from.jsp?id=<%=rs.getString(1)%>">Edit/Update</a>  </td>  </tr>
	 <tr><td></td></tr>
	 <tr><td width="20%"> Student Name  </td> <td width="25%"><%=rs.getString(2) %>      </td>    </tr>
	 <tr><td>Stream/Form   </td><td><%=rs.getString(3) %>  <%=rs.getString(4) %>      </td>    </tr>
	 <tr><td>Admission Number:   </td><td><%=rs.getString(5) %> </td>    </tr>
	 <tr><td>Gender:   </td><td> <%=rs.getString(6) %> </td>    </tr>
	  <tr><td>Date Registered</td> <td><%=rs.getString(7) %>     </td>     </tr>
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
<% 
try{
    
	String sqls="select * from bicycle  order by ID,model asc limit 1";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sqls);
	ResultSet rs1=ps.executeQuery();
	%>
   <table border="0" cellpadding="4"cellspacing="5" width="60%" class="table2"  >
	 <tr><td colspan="2"><p>Other details of the bicycle and the payment made by student in school</p></td>  </tr>
	<% 
	while(rs1.next()){
	 %>
	 <tr><td>Model Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs1.getString(2) %></td><td><a href="editmodel.jsp?id=<%=rs1.getString(1)%>">Edit/Update</a> </td>   </tr>
	 <tr> <td>Serial Number: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString(3) %>     </td>    </tr>
	 <tr><td>Model Color:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString(4) %>    </td> </tr>
	 <tr><td>Amount Paid: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString(5) %></td></tr>
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