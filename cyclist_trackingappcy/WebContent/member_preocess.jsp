
<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%try{
	boolean status=false;
	String username=request.getParameter("username");
	String userpass=request.getParameter("userpass");
	String email=request.getParameter("email");
	Connection conn=null;
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	String sql="select username,email from supervisor where username='"+username+"'or email='"+email+"'";
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	session.setAttribute("username", username);
	session.setAttribute("email", email);
	session.setAttribute("islogin", "Please register to be a member fist..");
	if(status){
		if(username.equals(rs.getString(1))||email.equals(rs.getString(2))){
			request.setAttribute("reg_msg","Sorry! either your record do exist or you have not registered yet try again");
			%>
			<jsp:forward page="member.jsp"></jsp:forward>
			<%
		 }else{
			 if(email.equals(rs.getString(2))){
				 request.setAttribute("reg_msg","Sorry!Username or Email id Already Exists");
				 %>
				 <jsp:forward page="member.jsp"></jsp:forward>
				 <% 
			 }
		 }
		
	}else{
		DateFormat dsf=new SimpleDateFormat("dd:MM:YYYY");
		String dates=dsf.format(new Date());
		String sql2="insert into supervisor values(null,?,?,?,?)";
		ps=conn.prepareStatement(sql2);
		ps.setString(1, username);
		ps.setString(2, userpass);
		ps.setString(3, email);
		ps.setString(4, dates);
		int s=ps.executeUpdate();
		System.out.println(s);
		if(s>0){
			request.setAttribute("islogin","Successfully Registered,Please Login");
			out.println("Thanks your record is saved succesfully...");
			%>
			<jsp:forward page="login.jsp"></jsp:forward> 
			<% 
		}else{
			request.setAttribute("reg_msg","Sorry! some errors occur,Please follow constraints");
			%>
			<jsp:forward page="member.jsp"></jsp:forward>
			<% 
		}
	}
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("reg_msg","Sorry! some errors occur,Please Fill Correct Detail");
	  %>
	<jsp:forward page="member.jsp"></jsp:forward>
	<%
	
}
%>
</body>
</html>
