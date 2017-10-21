<%@page import="com.model.Service_Model"%>
<%@page import="database.utility.ConnectionJDBCFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>repaired</title>
</head>
<body>
</body>
</html>
<%
try{
	Service_Model repair=new Service_Model();
	String charged_fee=request.getParameter("charged_fee");
	String serial_number=request.getParameter("serial");
	String serviced_by=request.getParameter("serviced_by");
	String model=request.getParameter("model");
	String dates;
	DateFormat dsf=new SimpleDateFormat("dd:MM:YYYY HH:mm:ss");
	dates=dsf.format(new Date());
	repair.setCharged_fee(charged_fee);
	repair.setSerial_number(serial_number);
	repair.setServiced_by(serviced_by);
	repair.setModel(model);
	repair.setDates(dates);
	Connection conn=null;
	PreparedStatement ps=null;
	String sql="select * from repair where serial='"+serial_number+"' and serviced_by='"+serviced_by+"'";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		if(serial_number.equals(rs.getString(1))){
			request.setAttribute("reg_msg", "Sorry!Record Already exists. ");
			%>
			<jsp:forward page="repair_form.jsp"></jsp:forward>
			<%
		}else{
			if(serial_number.equals(rs.getString(2))){
			request.setAttribute("reg_msg", "Sorry Record Already Exists.");
			%>
			<jsp:forward page="repair_form.jsp"></jsp:forward>
			<%
			}
		}
	}else{
		String sqls ="insert into repair values(null,?,?,?,?,?)";
		ps=conn.prepareStatement(sqls);
		ps.setString(1,repair.getSerial_number());
		ps.setString(2,repair.getCharged_fee());
		ps.setString(3,repair.getServiced_by());
		ps.setString(4, repair.getModel());
		ps.setString(5,repair.getDates());
		int s=ps.executeUpdate();
		System.out.println(s+"Successfully..");
		if(s>0){
			request.setAttribute("reg_msg", "Successfully saved");
			%>
			<jsp:forward page="repair_form.jsp"></jsp:forward>
			<%
		}else{
			request.setAttribute("s", "Sorry! try again wth new record..");
			%>
			<jsp:forward page="repaired_form.jsp"></jsp:forward>
			<%
		}	
	}	
}catch(Exception e){
	e.printStackTrace();
  request.setAttribute("reg_msg", "Sorry! some errors occured try again...");
		  %>
		  <jsp:forward page="repaired_form.jsp"></jsp:forward>
		  <%
}
%>