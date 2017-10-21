<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/adminscreen.css" rel="stylesheet" type="text/css">
<title>Home..</title>
</head>
<body>
<%session.invalidate(); %>
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
<div class="nav-search">
<form action="search_student_by.jsp">
<input type="text" name="search" value="" size="25" id="search"><input type="submit" value="Search" id="submit">
</form>
</div>
<div class="container">
<div class="top">
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="adminmenubar.jsp"/>
<jsp:include page="menubar.jsp"/>
<div class="content">
<br><br><br>
<h1><u>Welcome to Our Site</u> </h1>
<p>In our site we offer all service for all student, So we shall introduce other services for exams where all student we check their midterm exams online using there admission number.It's not only for student but parent will also view how their student perfom using our system.In this part of the module we are consernd with 
tracking bicycle for know but in the near future We will have all the module fully functioning for all.<pre>Please to work with as you have to register Click on this link  <a href="login.jsp">Register</a>  </pre>   </p>
<h1>About this application</h1>
<p>Welcome to the tracking system.The tracking is all about keeping and make sure that all student information about the bicycle they are given is tracked and kept save for use, in the institution,The bicycle are not for sale but to help our student access to there home in a more timely possible.  </p>
<hr>
		<p> Our school is young and with a population of 1130 student, we have 2 streams from form one 1 to form four 4. we participate in both sports and academics.We have well discipline student,well organized in there work.<a href=""> read more</a>   </p>
		<p>We have developed this application with one thing in mind to make the storage of our bicycle tracking easy for our student in  our school.Since our school is a day school our pupils come from far away to this school.<span>So by tracking all the bicycle we ensure that they are all Safe</span> <a href="#">read more</a>          </p>
         <h1>Service Tracking</h1>
         <p>We capture  all the information using this application from the school once  we notice that a student has lost one of the bicycle from the school we store all the information in our database for reviewing and evidence once the bicycle can't be found,we shall retrieve all data and the student who's registred with bicycle.<img alt="" src="image/8.jpg"><a href="#">read more</a></p>
         <h1>Penalty Fees</h1>
         <hr>
         <ol>
         <li>When we notice that your bicycle has been stolen you will have to pay 25000/= for as to buy a new one.</li>
         <li>When you damage the bicycle you will have to pay 300/= for maintenance of the bicycle</li>
         <li>For steeling the bicycle from school you will pay double the price of buying one.And you we be send home.  </li>
         </ol>
         <hr>
         <h1>Maintenance</h1>
         <p> Once they have been used they have to be maintained from the school. in these case student have to pay 200/= which is fixed charge for servicing the bicycle.For this bicycle they are not ordinary bicycle they are unique in their own way,So we have the mechanic in school who always maintain the once they are damaged.</p>
         <div>
         
         </div>
</div>
</div>
<jsp:include page="footers.jsp"/>
</body>
</html>