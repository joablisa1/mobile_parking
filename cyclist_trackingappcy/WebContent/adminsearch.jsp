<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! 
Connection conn=null;
PreparedStatement ps=null;
%>
<%
String n=request.getParameter("search");

try{
	
	session.setAttribute("search_msg", "Found result.." );
	String sql="select  * from student  order by ID,stream asc limit 8 ";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	%>
	<table border="0" cellpadding="3"cellspacing="0" width="95%" class="table2" bgcolor="tan">
	<tr><th colspan="3">Student detailed List You can navigate  around the page</th></tr>
	<tr><td colspan="2" ></td></tr>
	<tr><th>CLASS ID </th><th>NAME </th><th>STREAM </th><th>FORM </th><th> ADM</th><th> GENDER</th><th> DATE</th><th><select name="id">
	<option value="" > select choice...</option>                
	<option value="" ><a href="delete_student"> Delete</a></option> 
	
	</select>     </th>  </tr>
	<%
	while(rs.next()){
	 %>
	 <tr><td><a href="model_search.jsp?search=<%=rs.getString(1) %>" style=" text-decoration:none;">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;   <%=rs.getString(1) %></a></td><td>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="model_search.jsp?search=<%=rs.getString(2)%>"><%=rs.getString(2) %></a> </td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(3) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(4) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(5) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(6) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp; <%=rs.getString(7) %></td><td>&nbsp;&nbsp; &nbsp;&nbsp;<a href="delete_student.jsp">Delete</a>   </td>  </tr>
	 <%  
	}
	%>
		</table>
	<%	
	
	
}catch(Exception e){
}

%>

</body>
</html>