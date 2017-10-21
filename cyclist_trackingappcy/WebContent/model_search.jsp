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
<title>search</title>
</head>
<body>
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,Register if Youre New Member or Login ");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<div class="nav-search">
<form action="model_search.jsp">
<input type="text" name="search" value="" size="25" placeHolder="Search Key" id="search" ><input type="submit" value="Search" id="submit">
<%
if(request.getAttribute("search_msg")!=null){
	out.print("<font style='color:red' size='15'>"+request.getAttribute("search_msg")+"</font>");
}%>
</form>
</div>
<div class="container">
<div class="top">
<br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content"> 
<h1>Single Record For Student</h1>
<br>
<hr>
<%! 
Connection conn=null;
PreparedStatement ps=null;
%>

<%
try{
	int count=0;
	String id=request.getParameter("search");
	String sql="select  s.ID, s.studentname,s.adm,s.forms,s.stream,b.model,b.serials,b.color, b.amount,b.date,r.serial,r.services_fee,r.serviced_by,r.model_serviced,r.model_serviced,r.serviced_date from student s join bicycle b on s.ID=b.ID join repair r on b.ID=>r.ID  where r.serviced_by or b.model=? or s.studentname=? or s.stream=? or s.adm=? or b.color=? or s.forms=?  order by s.ID, model asc limit 5";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, id);
	ps.setString(3, id);
	ps.setString(4, id);
	ps.setString(5, id);
	ps.setString(6, id);
	ps.setString(6, id);
	ResultSet rs=ps.executeQuery();
	%>
   <table border="0" cellpadding="0"cellspacing="3"  class="table4"  width="60%" align="center">
   <tr><td colspan="2"><p> The information on this  page can be edited by clicking on the link only when it's necessary to edit the record.The record is detailed for all use </p>       </td>                    </tr>
	<% 
	if(rs.next()){
	 %>
	 <tr><td colspan="2"><p>If you feel that information provided is not accurate You can as well modify it from here </p></td> <td> <a href="edit_student_from.jsp?id=<%=rs.getString(1)%>" onclick="">Edit</a></td>    </tr>
	 <tr>  <td colspan="2">Admitted Date:&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<%=rs.getString(10) %></td>  </tr>
	 
	 <tr><td colspan="1" >Full Name:</td><td> <a href="edit_student_from.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2) %> </td></tr>
	 <tr><td>Admission Number:    </td><td><%=rs.getString(3) %>    </td></tr>
	 <tr><td>Admitted Stream/Form:    </td><td><%=rs.getString(5) %><%=rs.getString(4) %>      </td></tr>
	 <tr><td colspan="2"><hr>  </td>  </tr>
	 <tr><th colspan="2">Services Rendered by the management and the amount paid  </th>  </tr>
	 <tr><td colspan="2" align="left"><p>This's the model of the  given to this pupil and the amount given to school.All the student<br> have the duty of taking care of the bicycle while given. </p></td><td><td><a href="editmodel.jsp?id=<%=rs.getString(1) %>">Edit </a></td>    </tr>
	 <tr><td>Bicycle Model   </td><td><a href="editmodel.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(6)%>  </a>   </td></tr>
	 <tr><td>Model Serial Number:<td><%=rs.getString(7) %>   </td></tr>
	 <tr><td>Model Color:  </td><td><%=rs.getString(8) %>    </td></tr>
	 <tr><td>Amount paid: </td><td><%=rs.getString(9) %>    </td></tr>
	 <tr><td colspan="2"><hr>  </td>  </tr>
	 <tr><th colspan="2">Services Rendered on bicycle  </th>  </tr>
	 <tr><td colspan="2"><p>The services rendered to this bicycle by our mechanics and the amount paid for maintenances by the student Remember heavy damages has a different price,for servicing.   </h1></td>      </tr>
	  <tr><td>Serviced Serial Number:</td><td><%=rs.getString(11) %></td> <td></td>     <td> <a href="repair_edit_form.jsp?id=<%=rs.getString(1) %>">Edit </a>       </td> </tr>
	 <tr><td>Service charged:   </td><td><%=rs.getString(12)%>    </td></tr>
	 <tr><td>Serviced By  </td><td><%=rs.getString(13) %>    </td></tr>
	 <tr><td>Model Serviced </td><td><%=rs.getString(14) %>    </td></tr>
	 <tr><td>Date Serviced  </td><td><%=rs.getString(10) %>    </td></tr>
	 
	 
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
</div>  
</div>
<jsp:include page="footers.jsp"></jsp:include>

</body>
</html>