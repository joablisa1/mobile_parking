<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<input type="hidden" name="id">
<ul class="coolMenu">
					<li class="coolMenu"><a href="logout.jsp" class="coolMenu">log out</a></li>
					<li class="coolMenu"><a href="#" class="coolMenu">ABOUT US</a></li>
				   <li class="coolMenu"><a href="contact_us.jsp" class="coolMenu">CONTACT US</a></li>
				   <li  class="coolMenu"><a href="#"><span>Penalty Form</span></a>
				 <ul class="coolMenu">
				<li class="coolMenu"><a href="penalty_form.jsp"class="coolMenu">add_penalty</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">view_penalty</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">edit_penalty</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">update_penalty</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">delete</a></li><br>
					</ul>
					</li>		 
				   
				<li  class="coolMenu"><a href="#"><span>Repair form</span></a>
				<ul class="coolMenu">
				<li class="coolMenu"><a href="repair_form.jsp"class="coolMenu">Add_Service</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">edit service</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">service_view </a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">service_update </a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">delete</a></li><br>
					</ul>
					</li>		 
				   
				<li  class="coolMenu"><a href="#"><span>Bicycle</span></a>
				<ul class="coolMenu">
				<li class="coolMenu"><a href="new_bicycle.jsp"class="coolMenu">Add_Bicycle</a></li><br>
				<li class="coolMenu"><a href="editmodel.jsp?id=<%request.getParameter("id"); %>" class="coolMenu">edit bicycle</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">view_bicycle</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">update</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">delete</a></li><br>
					</ul>
					</li>		
	<!-- This is the main menu we work on this to get it right..                   -->				
				<li  class="coolMenu"><a href="#"><span>Student Registration</span></a>
				<ul class="coolMenu">
				<li class="coolMenu"><a href="student.jsp"class="coolMenu">Add_Student</a></li><br>
				<li class="coolMenu"><a href="edit_student_from.jsp" class="coolMenu">edit student</a></li><br>
				<li class="coolMenu"><a href="find_student1.jsp" class="coolMenu">view list</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">update</a></li><br>
				<li class="coolMenu"><a href="#" class="coolMenu">find student</a></li><br>
					</ul>
					</li>		
				   <li class="coolMenu"><a href="index.jsp">HOME</a></li>
				   	
    </ul>

</body>
</html>