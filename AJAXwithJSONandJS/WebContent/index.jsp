<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
function ajaxAsyncRequest(){
	
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}
	else{
		
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", "AJAXServlet", true);
	xmlhttp.onreadystatechange=function(){
		
		if(xmlhttp.readyState==4){
			if(xmlhttp.status==200){
				var jsonObj = JSON.parse(xmlhttp.responseText);
				
				document.getElementById("result1").innerHTML=jsonObj[0].x;
			
			}
			else{
				
				alert("Something is wrong");
			}
			}
		
		
	};
	xmlhttp.send(null)
}
</script>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--<link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
$('#cmd').click(function(){
    $('#content').append('<br>a datepicker <input class="datepicker_recurring_start"/>');
});
$('body').on('focus',".datepicker_recurring_start", function(){
    $(this).datepicker();
});
});
</script>
</head>
<body>
Name:<input type="text" id="fullName"/>

<input type="button" value="Send" id="bttHello" onclick="javascript: ajaxAsyncRequest();">
<span id="result1"></span>

<div id="content">
    a datepicker <input class="datepicker_recurring_start"/>
</div>
<button id="cmd">add a datepicker</button>
</body>
</html>