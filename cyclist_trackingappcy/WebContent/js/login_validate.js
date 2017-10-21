function required(){
	var empt=document.forms["form1"]["email"].value;
	if(empt==""){
		alert("Please enter valid email address");
		return false;
	}
	var empt=document.forms["form1"]["userpass"].value;
	if(empt==""){
		alert("Please enter valid password..");
		return false;
	}

	return true;
}
function student_required() {
	var empt=document.forms["form1"]["name"].value;
	if(empt==""){
		alert("Your name can't be blank..");
		return false;
	}
	var empt=document.forms["form1"]["stream"].value;
	if(empt==""){
		alert("stream not selected");
		return false;
	}
	var empt=document.forms["form1"]["forms"].value;
	if(empt==""){
		alert("form not selected");
		return false;
	}
	var empt=document.forms["form1"]["stream"].value;
	if(empt==""){
		alert("stream not selected");
		return false;
	}
	var empt=document.forms["form1"]["adm"].value;
	if(empt==""){
		alert("adminision  can't be blank..");
		return false;
	}
	var empt=document.forms["form1"]["sex"].value;
	if(empt==""){
		alert("gender not selected");
		return false;
	}
	return true;
}
function bicycle_required() {
	var empt=document.forms["form1"]["model"].value;
	if(empt==""){
		alert("model name can't be blank..");
		return false;
	}
	var empt=document.forms["form1"]["serial"].value;
	if(empt==""){
		alert("serial can't be blank.");
		return false;
	}
	var empt=document.forms["form1"]["color"].value;
	if(empt==""){
		alert("color not selected");
		return false;
	}
	var empt=document.forms["form1"]["amount"].value;
	if(empt==""){
		alert("amount Can't blank");
		return false;
	}
	return true;
}
function penalty_required() {
	var empt=document.forms["form1"]["lost_by"].value;
	if(empt==""){
		alert("name can't be blank..");
		return false;
	}
	var empt=document.forms["form1"]["penalty"].value;
	if(empt==""){
		alert("penalty  can't be blank.");
		return false;
	}
	var empt=document.forms["form1"]["serial"].value;
	if(empt==""){
		alert("serial can't be blank");
		return false;
	}
	var empt=document.forms["form1"]["model"].value;
	if(empt==""){
		alert("model Can't blank");
		return false;
	}
	return true;
}
function repair_required() {
	var empt=document.forms["form1"]["serial"].value;
	if(empt==""){
		alert("serial field  can't be blank.");
		return false;
	}
	var empt=document.forms["form1"]["charged_fee"].value;
	if(empt==""){
		alert("charged fees field can't be blank");
		return false;
	}
	var empt=document.forms["form1"]["serviced_by"].value;
	if(empt==""){
		alert("service field Can't blank");
		return false;
	}
	var empt=document.forms["form1"]["model"].value;
	if(empt==""){
		alert("model field  can't be blank.");
		return false;
	}
	return true;
}
function search_value(){
	
	var saerchreach= document.forms["form1"]["saerch"].value;
	if(saerchreach==""){
		window.location.href="saerch_form.jsp";
	}
}