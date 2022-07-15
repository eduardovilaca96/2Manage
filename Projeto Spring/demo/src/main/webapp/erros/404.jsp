<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="../scripts/core.js"></script>
<script type="text/javascript" src="../scripts/jquery-3.6.0.min.js"></script>
<meta charset="ISO-8859-1">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>Página Inicial</title>
<script>
  
 	document.addEventListener("DOMContentLoaded", function(event){
 		document.getElementById("navbar-container") != null ?  document.getElementById("navbar-container").remove() : null;
 		document.getElementById("sidebar-container") != null ?  document.getElementById("sidebar-container").remove() : null;
 	});

	function goHome(){
		if(location.pathname.includes("/2Manage/user")){
			window.location = "/2Manage/user/dashboard.jsp";			
		}else if(location.pathname.includes("/2Manage/admin")){
			window.location = "/2Manage/admin/dashboard.jsp";
		}else{
			window.location = "/2Manage/logout";
		}
	}
	
</script>
</head>

<body class="text-center">
<br><br>
<h1>404</h1>

<p> ${request.user} Parece que te perdeste, a página que procuras não existe :(</p>
<a onclick="javascript:goHome()" href="#">Home</a>

</body>
</html>
