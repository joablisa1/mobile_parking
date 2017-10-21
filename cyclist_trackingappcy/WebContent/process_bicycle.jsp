<%@page import="com.model.Bicycle"%>
<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>bicycle</title>
</head>
<body>
<%
try{
	Bicycle bicycle=new Bicycle();
	Connection conn=null;
	PreparedStatement ps=null;
	String model=request.getParameter("model");
	String serial=request.getParameter("serial");
	String color=request.getParameter("color");
	String amount=request.getParameter("amount");
	String dates=null;
	DateFormat dfm=new SimpleDateFormat("dd:MM:YYYY");
	dates=dfm.format(new Date());
	bicycle.setModel(model);
	bicycle.setSerial(serial);
	bicycle.setColor(color);
	bicycle.setAmount(amount);
	bicycle.setDates(dates);
	
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	String sql="select model,serials from bicycle where model='"+model+"' and serials='"+serial+"'";
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		if(model.equals(rs.getString(1))){
			request.setAttribute("reg_msg","Sorry! The model Already Exists in the system.");
			%>
			<jsp:forward page="new_bicycle.jsp"></jsp:forward>
			<%
		}else{
			if(serial.equals(rs.getString(2))){
				request.setAttribute("reg_msg", "Sorry! The serial Already Exists in the system.");
				%>
				<jsp:forward page="new_bicycle.jsp"></jsp:forward>
				<%
			}
		}
	}else{
		String sql2="insert into bicycle values(null,?,?,?,?,?)";
		ps=conn.prepareStatement(sql2);
		ps.setString(1, bicycle.getModel());
		ps.setString(2, bicycle.getSerial());
		ps.setString(3, bicycle.getColor());
		ps.setString(4, bicycle.getAmount());
		ps.setString(5, bicycle.getDates());
		int s=ps.executeUpdate();
		System.out.println(s+"\tSuccessfully saved..");
		if(s>0){
			request.setAttribute("reg_msg", "Successfully saved..");
			%>
			<jsp:forward page="new_bicycle.jsp"></jsp:forward>
			<% 
		}else{
			request.setAttribute("reg_msg", "Sorry! some error occured with the model or it Already exist.");
			%>
			<jsp:forward page="index.jsp"></jsp:forward>
			<%
		}
	}
}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("reg_msg","Sorry! some errors occur,Please Fill Correct Detail");
	  %>
	<jsp:forward page="new_bicycle.jsp"></jsp:forward>
	<%
}
%>
</body>
</html>