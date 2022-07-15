<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.ClienteService"%>
<%@page import="com.example.demo.entities.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<%
	ClienteService clisrv = ApplicationContextProvider.getApplicationContext().getBean(ClienteService.class);
	List<Cliente> listaMem = clisrv.getAllClientes();
	pageContext.setAttribute("listaClientes", listaMem);
	
%>
<meta charset="ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

	$(document).ready(function (){
	
	});
	
}); 
	
</script>
</head>
<body>
	<div class="modalContent">
		<span id="closeCliente" class="closeCliente"><button id="closeCliente" title="Fechar" onclick="localStorage.removeItem('id');document.getElementById('myModal').style.display = 'none';document.getElementById('myModal').innerHTML  = '';" style="float:right;overflow:hidden;padding:0px; color:#a3adc2;" class="btn fa fa-close"></button></span>
		
		<div id="criaCliente" style="display:none !important;">
		<h2>Novo Cliente</h2>
        <form onsubmit="javascript:criaCliente();return false;" method="post">
        <table id="tableForm">
        <tr>
			<td>Nome </td>
        	<td><input name="nome" id="nome" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Apelido </td>
        	<td><input name="apelido" id="apelido" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Email </td>
        	<td><input name="email" id="email" class="form3" type="text" required><br></td>
        </tr>
        <tr>
			<td>Contacto </td>
        	<td><input name="contacto" id="contacto" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Data de Contrato </td>
        	<td><input name="contrato" id="contrato" class="form3" style="text-align: center;" type="date" required><br></td>
        </tr>
         <tr>
			<td>Descricao</td>
			<td><textarea id="descricao" name="descricao" class="form" style="width:600px;height: 130px;resize: none;"required></textarea></td>
        </tr>

        </table>
       		<input type="submit" id="criarCliente" class="btn" style="color:#a3adc2;float:right; margin-top:105px;" value="Criar Cliente">
        </form>
        </div>

   			
    	<div id="formEdita" style="display:none !important;">
		<h2>Cliente #<span id="showId"></span></h2>
     	<form id="editaProjeto" onsubmit="javascript:alteraCliente();return false;" method="post">
		
        <table id="tableForm">
		<tr>
        	<td>
        	<input id="clienteId2" name="clienteId2" type="number" style="display:none !important" >
        	</td>
        </tr>
		<tr>
			<td>Nome </td>
        	<td><input name="nome2" id="nome2" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Apelido </td>
        	<td><input name="apelido2" id="apelido2" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Email </td>
        	<td><input name="email2" id="email2" class="form3" type="text" required><br></td>
        </tr>
        <tr>
			<td>Contacto </td>
        	<td><input name="contacto2" id="contacto2" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Data de Contrato </td>
        	<td><input name="contrato2" id="contrato2" class="form3" type="date" style="text-align: center;" required ><br></td>
        </tr>
         <tr>
			<td>Descricao</td>
			<td><textarea id="descricao2" name="descricao2" class="form" style="width:600px;height: 130px;resize: none;"required></textarea></td>
        </tr>
        </table>
       		<input type="submit" id="alterar" class="btn" style="color:#a3adc2;float:right; margin-top:105px;" value="Alterar Cliente">
       		<input type="button" id="eliminar" onclick="javascript:eliminaCliente();return false;" class="btn" style="color:#a3adc2;float:right; margin-top:105px;" value="Eliminar">
        </form>
        </div>
    	</div>
</body>
<script>
	
	var id = localStorage.getItem('id');
	
	if(id != null){
		//preenche inputs no detail
		TMcore.postNoJson("../api/clientes/clienteById", id).then(function(resp){
			$("#formEdita").show();
			$("#clienteId2").val(resp.idCliente);
			$("#showId").html(resp.idCliente);
			$("#nome2").val(resp.nome);
			$("#apelido2").val(resp.apelido);
			$("#email2").val(resp.email);
			$("#contacto2").val(resp.contacto);
			$("#contrato2").val(resp.data_contrato);
			$("#descricao2").val(resp.descricao);
					
		})
		
	} else{
		$("#criaCliente").show();
	}
	
	function criaCliente(){ 
		TMcore.post("../api/clientes/criarnovo", $("#criaCliente :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
		
	function alteraCliente(){
		TMcore.post("../api/clientes/altera", $("#formEdita :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
	
	function eliminaCliente(){
		var a = confirm("Todos os projetos associados a este Cliente serão eliminados!");
		if(a == true){
			TMcore.postNoJson("../api/clientes/eliminar",$("#clienteId2").val()).then(function(resp){
				
			});
			setTimeout(function(){
				location.reload();
			}, 600); 
		} else{
			return false;
		}
	}
	
</script>
</html>