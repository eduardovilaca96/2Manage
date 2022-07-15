<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%> 
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.services.TMUser"%> 
<%@page import="com.example.demo.services.TarefaService"%> 
<%@page import="com.example.demo.services.ProjetoService"%> 
<%@page import="com.example.demo.entities.Membro"%> 
<%@page import="com.example.demo.entities.Projeto"%>
<%@page import="com.example.demo.entities.Tarefa"%>
<%@page import="com.example.demo.entities.Sessao"%> 
<%@page import="java.util.List" %>
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
	UserEntity user = dash.getUser(request);
	pageContext.setAttribute("util", user);
	
	MembroService mmsrv = ApplicationContextProvider.getApplicationContext().getBean(MembroService.class);
	List<Membro> listaMembros = mmsrv.getAllMembros();
	pageContext.setAttribute("listaMembros", listaMembros);
	
	List<String> usersAtivos = mmsrv.getAllUsernames();
	pageContext.setAttribute("ativos", usersAtivos);
	
	ProjetoService projsrv = ApplicationContextProvider.getApplicationContext().getBean(ProjetoService.class);
	List<Projeto> projetos = projsrv.getAllProjetos();
	pageContext.setAttribute("total", projetos.size());
	
	TarefaService tass = ApplicationContextProvider.getApplicationContext().getBean(TarefaService.class);
 	List<Tarefa> listaToDo = tass.getToDos(user.getUserId());
	pageContext.setAttribute("todos", listaToDo.size());
	
 	List<Tarefa> listaAll = tass.getAllTarefasByUser(user.getUserId());
	pageContext.setAttribute("allTask", listaAll.size());

	
%>
<title>Pagina Inicial</title>
<script>

	$(document).ready(function() {
		
		$("#greeting").prepend(TMcore.greeting());
		
		$("#membro").click(function(){
			TMcore.postNoJson("../api/tarefas/ola", '${util.userId}').then(function(resp){
				$("#membro").append(resp.nome);
			})
			
		});
		
				

		TMcore.postNoJson("../api/tarefas/tarefasUser", '${util.userId}').then(function(resp){
		const ctx = $('#tarefasChart');
		Chart.defaults.color ="#a3adc2";
		const myChart = new Chart(ctx, {
			type:'pie',
			data: {
				  labels: [
					    'A fazer',
					    'Falhadas',
					    'Completadas'
					  ],
					  datasets: [{
					    data: resp,
					    backgroundColor: [
					      'rgb(240,230,140)',
					      'rgb(220,20,60)',
					      'rgb(60,179,113)'
					    ],
					    hoverOffset: 4,
					    borderWidth: 0
					  }]
					},
			  options: {
				    responsive: true,
				    maintainAspectRatio: false,
				    
				    plugins: {
				    legend: {
				        position: 'bottom',
		                labels: {
		                    font: {
		                        family: 'M2Font',
		                        size: 13
		                    }
		                }
				    },
				    title: {
				     	display: true,
				        text: 'Tarefas',
	                    font: {
	                        family: 'M2Font',
	                        size: 18,
	                    }
				      }     
				    }, 
				  }
			
		});
		});
	});
	
	
	
</script>
</head>


<body> 
	<div id="main-container" class="row" style="margin:8px;">
		<h3 id="greeting">${util.userName}</h3>
	<div class="col-xl-4">
	<table>
		<c:forEach var="membro" items="${listaMembros}" varStatus="count">
		<c:if test="${membro.user.userId == util.userId}">
			<tr class="table-row7">
		</c:if>
		<c:if test="${membro.user.userId != util.userId}">
			<tr class="table-row4">
		</c:if>
				<td class="col col-1" style="padding-left:0px !important">${membro.nome} ${membro.apelido}</td>
				<td class="col col-1" ><a href="mailto:${membro.email}">${membro.email}</a>
				<br style="height:0px;"/><span style="padding-left: 20px;padding-right: 20px;">${membro.contacto}</span></td>
				<td class="col col-1">
				<c:if test="${ativos.contains(membro.user.userName)}">
				Online 
				</c:if>
				<c:if test="${!ativos.contains(membro.user.userName)}">
				Offline 
				</c:if>
				</td>
			</tr>

		</c:forEach>
	</table>
	</div>

	<div class="col-xl-4 smallcontainer" style="margin-right:15px;"> 
		<canvas id="tarefasChart" width="300px !important" height="300px !important"></canvas>
	</div>
	
		<div class="col-xl-3 smallcontainer" style="float:right;">
		<p style="text-align: center;">Estatistica</p>
		<p>Este mes:<span style="margin-left:5px;">${allTask} Tarefas</span></p><br>
		<p>Tarefas Atribuidas:<span style="margin-left:5px;">${todos} Tarefas</span></p><br>
		<p>Projetos Atribuidos:<span style="margin-left:5px;">${total} Projetos</span></p><br>
	</div>

	</div>
</body>

</html>