<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%> 
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.services.TMUser"%> 
<%@page import="com.example.demo.services.TarefaService"%> 
<%@page import="com.example.demo.entities.Tarefa"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="../scripts/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../scripts/core.js"></script>

<script type="text/javascript" src="../scripts/fullcalendar/lib/main.js"></script>
<meta charset="ISO-8859-1">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	TMUser dash = ApplicationContextProvider.getApplicationContext().getBean(TMUser.class);
	UserEntity user = dash.getUser(request);
	pageContext.setAttribute("util", user);
	
	TarefaService tass = ApplicationContextProvider.getApplicationContext().getBean(TarefaService.class);
 	List<Tarefa> listaToDo = tass.getToDos(user.getUserId());
	pageContext.setAttribute("todos", listaToDo);
	
 	List<Tarefa> listaMissed = tass.getMissed(user.getUserId());
	pageContext.setAttribute("missed", listaMissed);
	
 	List<Tarefa> listaDone = tass.getDone(user.getUserId());
	pageContext.setAttribute("done", listaDone);
	
	
%>
<title>Tarefas</title>
<script>

	
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });

</script>
</head>

<body>

	<div id="myModal" class="modalBox" style="display: none;">
    
  	</div>

	<div id="main-container" style="margin: 23px">		
		<div id='calendar'></div>
	</div> 
</body>
</html>