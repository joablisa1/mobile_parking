<%@page import="com.model.Student"%>
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
	Student student=new Student();
	String name=request.getParameter("name");
	String stream=request.getParameter("stream");
	String formString=request.getParameter("forms");
	String adm=request.getParameter("adm");
	String gender=request.getParameter("sex");
	DateFormat dsf=new SimpleDateFormat("dd.MM.YYYY");
	String date=dsf.format(new Date());
	student.setName(name);
	student.setStream(stream);
	student.setForms(formString);
	student.setAdm(adm);
	student.setSex(gender);
	student.setDate(date);
	Connection conn=null;
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	String sql="select studentname,adm from student where studentname='"+name+"'and adm='"+adm+"'";
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		if(name.equals(rs.getString(1))){
			request.setAttribute("reg_msg","Sorry! The information do exist try new record again ..");
			%>
			<jsp:forward page="student.jsp"></jsp:forward>
			<%
		 }else{
			 if(adm.equals(rs.getString(2))){
				 request.setAttribute("reg_msg","Sorry!The Adm do exist try new..");
				 %>
				 <jsp:forward page="student.jsp"></jsp:forward>
				 <% 
			 }
		 }
	}else{
		String sql2="insert into student values(null,?,?,?,?,?,?)";
		ps=conn.prepareStatement(sql2);
		ps.setString(1, student.getName());
		ps.setString(2, student.getForms());
		ps.setString(3, student.getStream());
		ps.setString(4, student.getAdm());
		ps.setString(5,student.getSex());
		ps.setString(6, student.getDate());
		int s=ps.executeUpdate();
		int count=1;
		System.out.println(s);
		if(s>0){
			request.setAttribute("reg_msg","You have Successfully saved  \t"  +name+"\t to our system thank you" );
			%>
			<jsp:forward page="student.jsp"></jsp:forward> 
			<% 
		}else{
			request.setAttribute("reg_msg","Sorry! some errors occured,try again..");
			%>
			<jsp:forward page="find_student1.jsp"></jsp:forward>
			<% 
		}
	}
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("reg_msg","Sorry! the record your trying to enter do exist,try entering new record???");
	  %>
	<jsp:forward page="student.jsp"></jsp:forward>
	<%
}
%>

</body>
</html>
