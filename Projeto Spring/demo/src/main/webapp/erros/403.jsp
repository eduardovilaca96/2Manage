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


<title>P�gina Inicial</title>
<script>
  
 	document.addEventListener("DOMContentLoaded", function(event){
 		if(document.getElementById("navbar-container"))
 		document.getElementById("navbar-container").remove();
 	});
	
</script>
</head>

<body class="text-center">
<br><br>
<h1>403</h1>
<p>N�o tens acesso a esta p�gina, podes sempre voltar atr�s ;)</p>
<a onclick="history.back()"href="#">Voltar atr�s</a>
<a href="/2Manage/logout">Voltar ao Inicio</a>

</body>
</html>
