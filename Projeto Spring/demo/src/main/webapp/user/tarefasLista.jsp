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
 	List<Tarefa> listaToDo = tass.getAllTarefasByUser(user.getUserId());
	pageContext.setAttribute("tarefas", listaToDo);	
	
%>
<title>Tarefas</title>

<style type="text/css">
	
</style>

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

	<div id="main-container midcontainer" class="m-3 row" style="margin: 8px; background-color: rgba(0,0,0,0.4);">
	<h3 style="padding-top: 10px;">Lista de Tarefas<button id="novaTarefas" title="Nova Tarefa" class="btn fa fa-plus-square" style="float:right; color:rgba(255,255,255,.55);padding: 0px">
			</button></h3>
		<table id="tableTask" class="lista">
			<thead>
				<tr style="color:#3263ac;" class="lista">
					<th style=" padding-top:8px" class="lista"><h5>Id</h5></th>
					<th style=" padding-top:8px" class="lista"><h5>Designação</h5></th>
					<th style=" padding-top:8px" class="lista"><h5	>Projeto</h5></th>
					<th style=" padding-top:8px" class="lista"><h5>Importancia</h5></th>
					<th style=" padding-top:8px" class="lista"><h5>Progresso</h5></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tarefa" items="${tarefas}">
					<tr class="clickable-row lista" onclick="javascript:editaModal(${tarefa.idTarefa});">
					<td class="lista">#${tarefa.idTarefa}</td>
					<td class="lista">${tarefa.designacao}</td>
					<td class="lista">
					    <c:if test="${tarefa.projeto == null}">Interno</c:if>
    					<c:if test="${tarefa.projeto != null}">${tarefa.projeto.designacao}</c:if>
					</td>
					<c:if test="${tarefa.tipo == 1}"><td>Alta</td></c:if>
					<c:if test="${tarefa.tipo == 2}"><td>Média</td></c:if>
					<c:if test="${tarefa.tipo == 3}"><td>Baixa</td></c:if>
					<td class="lista">${tarefa.progresso}%</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>

</body>
</html>