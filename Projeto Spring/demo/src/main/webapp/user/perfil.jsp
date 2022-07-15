<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%> 
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.services.TMUser"%> 
<%@page import="com.example.demo.services.TarefaService"%> 
<%@page import="com.example.demo.entities.Membro"%> 
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="../scripts/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../scripts/core.js"></script>
<script type="text/javascript" src="../scripts/chart.js/dist/chart.min.js"></script>
<meta charset="ISO-8859-1">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	TMUser dash = ApplicationContextProvider.getApplicationContext().getBean(TMUser.class);
	TarefaService tass = ApplicationContextProvider.getApplicationContext().getBean(TarefaService.class);
	UserEntity user = dash.getUser(request);
	pageContext.setAttribute("util", user);
	
	MembroService memsrv = ApplicationContextProvider.getApplicationContext().getBean(MembroService.class);
	Membro mem = memsrv.getMembroByUserId(user.getUserId());
	pageContext.setAttribute("membro", mem);
	
%>
<title>Pagina Inicial</title>
<script>

	$(document).ready(function() {
		
	});
	
	
	
</script>
</head>


<body> 
	<div id="main-container" style="margin:23px;">
		</div>
</body>

</html>