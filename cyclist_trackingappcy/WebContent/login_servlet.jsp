<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin process</title>
</head>
<body>

</body>
</html>
<%
try{
	boolean status=false;
	Connection conn=null;
	PreparedStatement ps=null;
	String email=request.getParameter("email");
	String userpass=request.getParameter("userpass");
	String sql="select * from supervisor where email=? or username=? and userpass=?";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ps.setString(1, email);
	ps.setString(2, email);
	ps.setString(3, userpass);
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	if(status){
		System.out.print("hi");
		String username=rs.getString(2);
		email=rs.getString(3);
		session.setAttribute("email", email);
		session.setAttribute("username",username);
		session.setAttribute("islogin","plz sign in first");
		%>
		<jsp:forward page="adminhome.jsp"></jsp:forward>
		<%
	}else{
		System.out.print("hi");
		request.setAttribute("Error","Sorry! Username or Password Error.");
		session.setAttribute("Loginmsg","plz sign in first...");
		%>
		<jsp:forward page="admin_form.jsp"></jsp:forward>
		<%
	}	
}catch(Exception e){
	e.printStackTrace();
}

%>