function required(){
	var empt=document.forms["form1"]["username"].value;
	if(empt==""){
		alert("username can't be blank..");
		return false;
	}else {
		var empt =document.forms["form1"]["userpass"].value;
		if(empt==""){
			alert("Password can't be blank..");
			return false;
		}else {
			var empt=document.forms["form1"]["email"].value;
			if(empt==""){
				alert("Please Enter valid Email id");  
				return false;
			}else {
				var email = document.forms["form1"]["email"].value;
				var validemail =/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
				if(!(validemail.test(email))){
					alert("Invalid email address");
					form1.email.focus;
					return false;
					}
				var empt=document.forms["form1"]["name"].value;
				if(empt==""){
					alert("Name can't be blank..");
					return false;
				}else {
					var empt=document.forms["form1"]["stream"].value;
					if(empt==""){
						alert("form can't be blank..");
						return false;
					}
					var empt=document.forms["form1"]["forms"].value;
					if(empt==""){
						alert("stream not selected.");
						return false;
					}
					var empt=document.forms["form1"]["adm"].value;
					if(empt==""){
						alert("adm can't be balnk.");
						return false;
					}
					var gender=document.forms["form1"]["sex"].value;
					if(gender==""){
						alert("gender not selected..");
						return false;
					}
				}
			}
		}
	}
	return true;
}
function required1(){
	var empt=document.forms["form1"]["username"].value;
	if(empt==""){
		alert("username can't be blank..");
		return false;
	}else {
		var empt =document.forms["form1"]["userpass"].value;
		if(empt==""){
			alert("Password can't be blank..");
			return false;
		}else {
			var empt=document.forms["form1"]["email"].value;
			if(empt==""){
				alert("Please Enter valid Email id");  
				return false;
			}else {
				var email = document.forms["form1"]["email"].value;
				var validemail =/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
				if(!(validemail.test(email))){
					alert("Invalid email address");
					form1.email.focus;
					return false;
					}
				var empt=document.forms["form1"]["name"].value;
				if(empt==""){
					alert("Name can't be blank..");
					return false;
				}
			}
		}
	}
	return true;
}



