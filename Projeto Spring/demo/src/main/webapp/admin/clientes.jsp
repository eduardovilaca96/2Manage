<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%>
<%@page import="com.example.demo.services.ClienteService"%>
<%@page import="com.example.demo.services.UserService"%>
<%@page import="com.example.demo.entities.Membro"%>
<%@page import="com.example.demo.entities.Cliente"%>
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
	List<Cliente> listaCli = clisrv.getAllClientes();
	pageContext.setAttribute("listaClientes", listaCli);
%>

<title>Modo Administrador</title>
<script> 
$(document).ready(function() {
	
	var modal = $("#myModal");
	$("#novoCliente").click(function (){
		$("#myModal").load("./clienteDetail.jsp")
		modal.show();
	});
	
});

function editaModal(id){
	localStorage.setItem('id',id);
	$('#myModal').load('./clienteDetail.jsp?');$('#myModal').show();

}
</script>
</head>

<body>
<div id="myModal" class="modalBox" style="display: none;">
    
</div>
<div id="main-container" class="container2">

<h3 id="greeting">Clientes<button id="novoCliente" title="Novo Cliente" class="btn fa fa-plus-square" style="float:right; color:rgba(255,255,255,.55);padding: 0px">
			</button></h3>

<ul>
	<li class="table-header">
      <div class="col col-3">Nome Completo</div>
      <div class="col col-1">Email</div>
      <div class="col col-3">Contacto</div>
      <div class="col col-2">Since</div>
    </li>
    <div id="projLi">
    <c:forEach var="cliente" items="${listaClientes}">
    <li class="table-row clickable-row lista2" onclick="javascript:editaModal(${cliente.idCliente});">
    	 <div class="col col-3">${cliente.nome} ${cliente.apelido }</div>
    	 <div class="col col-1">${cliente.email}</div>
    	 <div class="col col-3">${cliente.contacto}</div>
    	 <div class="col col-2">${cliente.data_contrato}</div>
    </li>
    
    </c:forEach>
	</div>

</ul>

</div>
</body>
</html>
