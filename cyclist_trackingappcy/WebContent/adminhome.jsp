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
<script type="text/javascript">
ar request;
function sendInfo()
{
var v=document.form1.findName.value;
var url="adminsearch.jsp?val="+v;;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);

request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('location').innerHTML=val;
}
}

</script>
<title>Processing  all required record.......</title>
</head>
<% 
					if(request.getAttribute("not_reg_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("not_reg_msg"));
					out.print("</font>");
					}
	%>
	<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
	%>
	<% 
					if(request.getAttribute("Loginmsg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Loginmsg"));
					out.print("</font>");
				}
	%>
<%
if(request.getAttribute("reg_msg")!=null){
	out.print("<font style='color:green'>"+request.getAttribute("reg_msg")+"</font>");
}%> 
<% 
					if(request.getAttribute("save_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("save_msg"));
					out.print("</font>");
					}
	%>
<body>
<div class="nav-search">
</div>
<div class="container">
<div class="top">
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<div class="content">
<br><br><br><br>
<h1>Welcome to the Administrator Page</h1>
<form  action="model_search.jsp" name="form1">
Search By ID or Admission Number:<input type="text" name="search" id="search" PlaseHolder="Search by ID" onkeyup="sendInfo()"><input type="submit" value="find_by ID">
</form>
<hr>
<%! 
Connection conn=null;
PreparedStatement ps=null;
%>
<%
try{
	session.setAttribute("search_msg", "Found result.." );
	String sql="select * from student  order by ID,stream asc limit 1";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	%>
	<table border="0" cellpadding="4"cellspacing="5" width="50%" class="table2">
	<tr><th colspan="3">For any kind of information can be achieved here by administrator</th></tr>
	<tr><td colspan="2" ></td></tr>
	<%
	while(rs.next()){
	 %>
	 <tr><td><a href="model_search.jsp?search=<%=rs.getString(1) %>" style=" text-decoration:none;">click here</a>  </td><td>    </td> <td> <a href="find_student1.jsp">view list</a>    </td>           </tr> 
	 <tr><td>Name </td><td> <a href="model_search.jsp?search=<%=rs.getString(2)%>"><%=rs.getString(2) %></a>   </td> <td>     </td>           </tr>
	  <tr><td>Form/Stream </td><td> <%=rs.getString(3) %><%=rs.getString(4) %>     </td> <td>     </td>  </tr>
	   <tr><td>Admission Number: </td><td><%=rs.getString(5) %>     </td>           </tr>
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
<h1>for review of the bicycle we have this model  </h1>
<% 
try{
	String sqls="select * from bicycle  order by ID,model asc limit 1";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sqls);
	ResultSet rs1=ps.executeQuery();
	%>
   <table border="0" cellpadding="4"cellspacing="5" width="50%" class="table2"  >
	<% 
	while(rs1.next()){
	 %>
	 <tr><td>Model Types:</td><td><a href="model_search.jsp?search=<%=rs1.getString(2) %>"> <%=rs1.getString(2) %></a></td></tr>
	 <tr><td>Serial Number:     </td><td><a href="model_search.jsp?search=<%=rs1.getString(3) %>"> <%=rs1.getString(3) %></a>     </td></tr>
	 <tr><td>Model Color:</td><td> <a href="model_search.jsp?search=<%=rs1.getString(4) %>"> <%=rs1.getString(4) %></a>    </td></tr>
	 <tr><td>Amount Paid On </td><td><a href="model_search.jsp?search=<%=rs1.getString(5) %>"> <%=rs1.getString(5) %></a>     </td></tr>
	 <tr><td></td>
	 	
	 <%
	}
	%>
	 </table>
	<%	

}catch(Exception e){
}
%>
<hr>
<% 
try{   
	String sql2="select * from repair order by ID,serial asc limit 1";
	conn=ConnectionJDBCFactory.getInstance().getConnection();
	ps=conn.prepareStatement(sql2);
	ResultSet rs3=ps.executeQuery();
	%>
   <table border="0" cellpadding="4"cellspacing="5" width="50%" class="table2" >
	<% 
	while(rs3.next()){
	 %>
	   <tr><td>Serial </td><td><%=rs3.getString(2) %>  </td> </tr>
	   <tr><td>Maintenance fee</td><td><%=rs3.getString(3) %></td> </tr>
	 <tr><td>Serviced Model.</td><td><%=rs3.getString(4) %></td> </tr>
	   <tr><td>Date serviced.</td><td><%=rs3.getString(5) %></td> </tr>
	 	
	 <%
	}
	%>
	 </table>
	<%	

}catch(Exception e){
}
%>
</div>
</div>
<div id="location" align="justify"></div>
<jsp:include page="footers.jsp"></jsp:include>

</body>
</html>