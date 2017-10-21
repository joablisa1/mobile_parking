<%@page import="com.model.Penalty"%>
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
<title>penalty</title>
</head>
<body>
</body>
</html>
<%
try{
	Penalty pan=new Penalty();

	String fine_paid=request.getParameter("fine_paid");
	String serial=request.getParameter("serial");
	String lost_by=request.getParameter("lost_by");
	String model=request.getParameter("model");
	String dates;
	DateFormat dsf=new SimpleDateFormat("dd:MM:YYYY HH:mm:ss");
	dates=dsf.format(new Date());
	// object to hold and set the reguested parameters from the page
	pan.setPanalty_fee(fine_paid);
	pan.setSerial(serial);
	pan.setLost_by(lost_by);
	pan.setModel(model);
	pan.setDates(dates);
	// This is the end of the object creation 
	
	Connection conn=null;
	PreparedStatement ps=null;
	String sql="select serial_number,student,date_reg from penalty where serial_number='"+serial+"' and student='"+lost_by+"'";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		if(serial.equals(rs.getString(1))){
			request.setAttribute("reg_msg", "Sorry!Record Already exists. ");
			%>
			<jsp:forward page="penalty_form.jsp"></jsp:forward>
			<%
		}else{
			if(lost_by.equals(rs.getString(2))){
			request.setAttribute("reg_msg", "Sorry Record Already Exists.");
			%>
			<jsp:forward page="penalty_form.jsp"></jsp:forward>
			<%
			}
			if(dates.equals(rs.getString(3))){
				request.setAttribute("reg_msg", "Sorry Date Already Exists.");
				%>
				<jsp:forward page="penalty_form.jsp"></jsp:forward>
				<%
			}
		}
	}else{
		String sqls ="insert into penalty values(null,?,?,?,?,?)";
		ps=conn.prepareStatement(sqls);
		ps.setString(1,pan.getModel());
		ps.setString(2,pan.getPanalty_fee());
		ps.setString(3,pan.getSerial());
     	ps.setString(4,pan.getModel());
        ps.setString(5,pan.getDates());
		int s=ps.executeUpdate();
		System.out.println(s+"Successfully..");
		if(s>0){
			request.setAttribute("reg_msg", "Successfully saved");
			%>
			<jsp:forward page="penalty_form.jsp"></jsp:forward>
			<%
		}else{
			request.setAttribute("reg_msg", "Sorry! try again wth new record..");
			%>
			<jsp:forward page="penalty_form.jsp"></jsp:forward>
			<%
		}	
	}
}catch(Exception e){
	e.printStackTrace();
  request.setAttribute("reg_msg", "Sorry! some errors occured try again...");
		  %>
		  <jsp:forward page="penalty_form.jsp"></jsp:forward>
		  <%
}
%>