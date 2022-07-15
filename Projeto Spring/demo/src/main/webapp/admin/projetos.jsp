<%@page import="com.example.demo.services.ProjetoService"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%>
<%@page import="com.example.demo.services.UserService"%>
<%@page import="com.example.demo.entities.Membro"%>
<%@page import="com.example.demo.entities.Projeto"%>
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
	ProjetoService projsrv = ApplicationContextProvider.getApplicationContext().getBean(ProjetoService.class);
 	List<Projeto> projetos = projsrv.getAllProjetos();
	pageContext.setAttribute("listaProjetos", projetos);
%>

<title>Modo Administrador</title>
<script> 
$(document).ready(function() {
	
	var modal = $("#myModal");
	$("#novoProjeto").click(function (){
		$("#myModal").load("./projetoDetail.jsp")
		modal.show();
	});
	
});

function editaModal(id){
	localStorage.setItem('id',id);
	$('#myModal').load('./projetoDetail.jsp?');$('#myModal').show();

}
</script>
</head>

<body>
	<div id="myModal" class="modalBox" style="display: none;">
    
  	</div>
<div id="main-container" class="container2">

<h3 id="greeting">PROJETOS<button id="novoProjeto" title="Novo Projeto" class="btn fa fa-plus-square" style="float:right; color:rgba(255,255,255,.55);padding: 0px">
			</button></h3>

<ul>
	<li class="table-header">
      <div class="col col-3">Designação</div>
      <div class="col col-1">Cliente</div>
      <div class="col col-3">Since</div>
      <div class="col col-2">Versão</div>
    </li>
    <div id="projLi">
    <c:forEach var="projeto" items="${listaProjetos}">
    <li class="table-row clickable-row lista2" onclick="javascript:editaModal(${projeto.idProjeto});">
    	 <div class="col col-3">${projeto.designacao}</div>
    	 <div class="col col-1">${projeto.cliente.nome}</div>
    	 <div class="col col-3">${projeto.dataCriacao}</div>
    	 <div class="col col-2">${projeto.versao}</div>
    </li>
    
    </c:forEach>
	</div>

</ul>

</div>
</body>
</html>
