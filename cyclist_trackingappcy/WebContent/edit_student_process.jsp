<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
</body>
</html>
<%
String name,stream,forms,adm,sex ,date;
String id;
%>
<%
try{
	id=request.getParameter("id");
	name=request.getParameter("name");
	stream=request.getParameter("stream");
	forms=request.getParameter("forms");
	adm=request.getParameter("adm");
	sex=request.getParameter("sex");
	date=request.getParameter("date");
	Connection conn=null;
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	String sql="update student set studentname='"+name+"',stream='"+stream+"',forms='"+forms+"',adm='"+adm+"',gender='"+sex+"',dates='"+date+"' where ID='"+id+"'";
	PreparedStatement ps=conn.prepareStatement(sql);
	 int s=ps.executeUpdate();
	 System.out.println(s);
	 if(s>0){
	 session.setAttribute("save_msg", "edited sucessfully .");
	 %>
	 <jsp:forward page="find_student1.jsp"></jsp:forward>
	 <%
	 }else{
		 session.setAttribute("save_msg", "Sorry! not edited. try again");
		 %>
		 <jsp:forward page="single_student.jsp"></jsp:forward>
		 <%
	 }
	 
}catch(Exception e){
	 session.setAttribute("Error", "Sorry! You have a problem editting this record check again..");
	 %>
	 <jsp:forward page="adminhome.jsp"></jsp:forward>
	 <%
}

%>