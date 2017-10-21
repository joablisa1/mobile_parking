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
<title></title>
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
	String sql="update bicycle set model='"+model+"',serials='"+serial+"',color='"+color+"',amount='"+amount+"',date='"+date+"' where ID='"+id+"'";
	ps=conn.prepareStatement(sql);
	int s=ps.executeUpdate();
	if(s>0){
		System.out.println(s);
		session.setAttribute("save_msg", "edited sucessfully .");
		 %>
		 <jsp:forward page="adminhome.jsp"></jsp:forward>
		 <%
		 }else{
			 System.out.println(s);
			 session.setAttribute("save_msg", "Sorry! not edited. try again");
			 %>
			 <jsp:forward page="editmodel.jsp"></jsp:forward>
			 <%
	}
}catch(Exception e){
	
}
%>
</body>
</html>