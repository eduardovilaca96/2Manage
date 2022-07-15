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

	$(document).ready(function (){
		
		var modal = $("#myModal");
		$("#novaTarefas").click(function (){
			$("#myModal").load("./tarefaDetail.jsp")
			modal.show();
		});
		
	}); 

	function editaModal(id){
		localStorage.setItem('id',id);
		$('#myModal').load('./tarefaDetail.jsp?');$('#myModal').show();
	
	}
	
</script>
</head>

<body>

	<div id="myModal" class="modalBox" style="display: none;">
    
  	</div>

	<div id="main-container" class="row" style="margin: 8px">		 
		<div class="col-lg-7 midcontainer" style="height:500px; overflow: auto; margin-top: 5px; margin-right: 5px;" id="toDos">
			<h3>A fazer<button id="novaTarefas" title="Nova Tarefa" class="btn fa fa-plus-square" style="float:right; color:rgba(255,255,255,.55);padding: 0px">
			</button></h3>
			<div id="tarefasToDo"> 
				<c:if test="${todos.size() == 0}">
					<p style="color:#3263ac;">Sem tarefas para mostrar :(</p>
				</c:if>
				<table>
				<c:forEach var="tarefa" items="${todos}">
					<tr onclick="javascript:editaModal(${tarefa.idTarefa});" class="table-row2 clickable-row">
    	 				<td class="tab-5" style="width:30%">${tarefa.designacao}</td>
    					<td class="tab-5" style="width:20%">
    					<c:if test="${tarefa.projeto != null}">${tarefa.projeto.designacao}</c:if>
    					<c:if test="${tarefa.projeto == null}">Interno</c:if>
    					</td>
    					<td class="tab-5" style="width:20%">${tarefa.getDataFormatada(tarefa.dataFim)}</td>
    					<td class="tab-5" style="width:5%">${tarefa.progresso}%</td>
					</tr>
				
				</c:forEach> 
				</table>
				
			</div>
		</div>		 
 
		<div class="col-lg-4 midcontainer" style="height:500px; overflow: auto; margin-top: 5px;" id="missed">
			<h3>Falhadas</h3>
			<div id="tarefasMissed">
				<c:if test="${missed.size() == 0}">
					<p style="color:#3263ac;">Sem tarefas para mostrar :(</p>
				</c:if>
				<table>
				<c:forEach var="tarefa" items="${missed}">
				 <tr onclick="javascript:editaModal(${tarefa.idTarefa});" class="table-row2 clickable-row">
    	 				<td class="tab-5 " style="width:30%">${tarefa.designacao}</td>
    					<td class="tab-5" style="width:20%">${tarefa.getDataFormatada(tarefa.dataFim)}</td>
					</tr>
				</c:forEach>
				</table>
			</div>
			
		</div>
		
		<div class="col-lg-11 midcontainer" style="height:500px; overflow: auto; margin-top: 5px;" id="done">
			<h3>Completadas</h3>
			<div id="tarefasDone">
				<c:if test="${done.size() == 0}"> 
					<p style="color:#3263ac;">Sem tarefas para mostrar :(</p>
				</c:if>
				<table>
				<c:forEach var="tarefa" items="${done}"> 
						<tr  onclick="javascript:editaModal(${tarefa.idTarefa});" class="table-row2 clickable-row"> 
						<td class="tab-5" style="width:10%">Tarefa #${tarefa.idTarefa}</td>
    	 				<td class="tab-5" style="width:30%">${tarefa.designacao}</td>
    	 				
    					<td class="tab-5" style="width:20%">
    						<c:if test="${tarefa.projeto == null}">Interno</c:if>
    						<c:if test="${tarefa.projeto != null}">${tarefa.projeto.designacao}</c:if>
    					</td>
    					
    					<td class="tab-5" style="width:20%">Fechado a: ${tarefa.getDataFormatada(tarefa.dataConclusao)}</td>
    					<td class="tab-5" style="width:10%;">
    						<c:if test="${tarefa.tipo == 1}">Alta</c:if>
    						<c:if test="${tarefa.tipo == 2}">Média</c:if>
    						<c:if test="${tarefa.tipo == 3}">Baixa</c:if>
    					</td>
					</tr>
				</c:forEach> 			
				</table>
			</div>
		</div>
		
	</div> 
</body>
</html>