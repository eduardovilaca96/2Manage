<%@page import="com.example.demo.services.TarefaService"%>
<%@page import="com.example.demo.services.ClienteService"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.ClienteService"%>
<%@page import="com.example.demo.services.UserService"%>
<%@page import="com.example.demo.services.ProjetoService"%>
<%@page import="com.example.demo.entities.Membro"%>
<%@page import="com.example.demo.entities.Cliente"%>
<%@page import="com.example.demo.entities.Tarefa"%>
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.entities.Projeto"%>
<%@page import="com.example.demo.entities.Sessao"%>
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
	ClienteService clisrv = ApplicationContextProvider.getApplicationContext().getBean(ClienteService.class);
 	List<Cliente> clientes = clisrv.getAllClientes();
	pageContext.setAttribute("listaClientes", clientes.size());
	
	UserService usserv = ApplicationContextProvider.getApplicationContext().getBean(UserService.class);
 	List<UserEntity> users = usserv.getAllUsers();
	pageContext.setAttribute("listaUsers", users.size());
	
	ProjetoService projsrv = ApplicationContextProvider.getApplicationContext().getBean(ProjetoService.class);
 	List<Projeto> projetos = projsrv.getAllProjetos();
	pageContext.setAttribute("listaProjetos", projetos.size());
	
	TarefaService tasksrv = ApplicationContextProvider.getApplicationContext().getBean(TarefaService.class);
 	List<Tarefa> tarefas = tasksrv.getAllTarefas();
	pageContext.setAttribute("listaTarefas", tarefas);
	
	
%>

<title>Modo Administrador</title>
<script> 
$(document).ready(function() {
	
	var modal = $("#myModal");
	$("#novaTarefa").click(function (){
		$("#myModal").load("./tarefaNew.jsp")
		modal.show();
	});

});
</script>
</head>

<body>
	<div id="myModal" class="modalBox" style="display: none;">
    
  	</div>

<div id="main-container" class="container2">
<h3 id="greeting">DASHBOARD</h3>

	<div class="container">
  <div class="row">
    <div class="col-sm-2 minicontainer" style="margin-right:60px;">
      <h2>${listaUsers}</h2>
      <span>Utilizadores</span>
    </div>
    <div class="col-sm-2 minicontainer" >
      <h2>${listaProjetos}</h2>
      <span>Projetos</span>
    </div>
    <div class="col-sm-2 minicontainer">
      <h2>${listaClientes}</h2>
      <span>Clientes</span>
    </div>
        <div class="col-sm-2 minicontainer" >
      <h2><button id="novaTarefa" title="Nova Tarefa" class="btn fa fa-plus-square" style="color:#a3adc2"></button></h2>
      <span>Atribuir Tarefa</span>
    </div>
  </div>
	</div>
	<h3 id="greeting" style="margin-top:20px">TAREFAS</h3>
			<div class="col-lg-12 midcontainer" style="height:500px; overflow: auto; margin-top: 5px; margin-right: 5px;" id="toDos">
			<div id="tarefasToDo"> 
				<c:if test="${listaTarefas.size() == 0}">
					<p style="color:#3263ac;">Sem tarefas para mostrar :(</p>
				</c:if>
				<table>
				<c:forEach var="tarefa" items="${listaTarefas}">
					<tr class="table-row2" style="cursor:default !important">
    					<td class="tab-5" style="width:5%">${tarefa.membro.nome}</td>
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
</div>
</body>
</html>
