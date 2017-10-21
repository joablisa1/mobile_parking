<%@page import="java.sql.*"%>

<%!
String charged_fee,serial_number,serviced_by,model,dates,id;
%>
<%
 try{
	id=request.getParameter("id");
	charged_fee=request.getParameter("charged_fee");
	serial_number=request.getParameter("serial");
	serviced_by=request.getParameter("serviced_by");
	model=request.getParameter("model");
	dates=request.getParameter("dates");
	Connection conn=null;
	String sql="update repair set serial='"+ serial_number+"', charges='"+ charged_fee+"', serviced_by='"+serviced_by+"', model_serviced='"+ model+"', date='"+dates+"' where ID='"+id+"'";
	ResultSet rs=null;
	PreparedStatement ps=conn.prepareStatement(sql);
   int s=ps.executeUpdate();
	if(s>0){
		session.setAttribute("save_msg", "edited sucessfully .");
		 %>
		 <jsp:forward page="model_search.jsp"></jsp:forward>
		 <%
		 }else{
			 session.setAttribute("save_msg", "Sorry! not edited. try again");
			 %>
			 <jsp:forward page="adminhome.jsp"></jsp:forward>
			 <%
	}
 }catch(Exception e){
	 
 }
%>
<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("not_reg_msg","Sorry,You have not registered...");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
<% 
if(request.getAttribute("reg_msg")!=null){
	out.print("<font style='color:red'>"+request.getAttribute("reg_msg")+"</font>");
}%>