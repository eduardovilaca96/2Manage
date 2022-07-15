<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.ClienteService"%>
<%@page import="com.example.demo.services.ProjetoService"%>
<%@page import="com.example.demo.entities.Projeto"%>
<%@page import="com.example.demo.entities.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<%
	ProjetoService projsrv = ApplicationContextProvider.getApplicationContext().getBean(ProjetoService.class);
	List<Projeto> listaProj = projsrv.getAllProjetos();
	pageContext.setAttribute("listaProjetos", listaProj);
	
	ClienteService clisrv = ApplicationContextProvider.getApplicationContext().getBean(ClienteService.class);
	List<Cliente> listaMem = clisrv.getAllClientes();
	pageContext.setAttribute("listaClientes", listaMem);
	
%>
<meta charset="ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

$(document).ready(function (){
	
	$("#preview").on('change',function (){
		var file = this.files[0];
		const reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = (evt) => {
			var content = evt.target.result.split(',');
			var nicecontent = content[1].replace('"','');
			$("#previewPath").val(nicecontent);
		};
	
	});
	
	$("#preview2").on('change',function (){
		var file = this.files[0];
		const reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = (evt) => {
			var content = evt.target.result.split(',');
			var nicecontent = content[1].replace('"','');
			$("#previewPath2").val(nicecontent);
		};
	
	});
	
	$("#sourcecode").on('change',function (){
		var file = this.files[0];
		const reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = (evt) => {
			var content = evt.target.result.split(',');
			var nicecontent = content[1].replace('"','');
			$("#sourcecodePath").val(nicecontent);
		};
	
	});
	
	$("#sourcecode2").on('change',function (){
		var file = this.files[0];
		const reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = (evt) => {
			var content = evt.target.result.split(',');
			var nicecontent = content[1].replace('"','');
			$("#sourcecodePath2").val(nicecontent);
		};
	
	});
	
}); 
	
</script>
</head>
<body>
	<div class="modalContent">
		<span id="closeProjeto" class="closeProjeto"><button id="closeProjeto" title="Fechar" onclick="localStorage.removeItem('id');document.getElementById('myModal').style.display = 'none';document.getElementById('myModal').innerHTML  = '';" style="float:right;overflow:hidden;padding:0px; color:#a3adc2;" class="btn fa fa-close"></button></span>
		
		<div id="criaProjeto" style="display:none !important;">
		<h2>Novo Projeto</h2>
        <form onsubmit="javascript:criaProjeto();return false;" method="post">
        <table id="tableForm">
        <tr>
			<td>Designacao </td>
        	<td><input name="designacao" id="designacao" class="form" type="text" style="text-transform:uppercase;" required><br></td>
        </tr>
		<tr>
			<td>Versão </td>
        	<td><input name="versao" id="versao" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Link </td>
        	<td><input name="link" id="link" class="form3" type="text" required><br></td>
        </tr>
        
        <tr>
        	<td>Cliente</td>
        	<td>
        	<select name="idCliente" id="idCliente" class="form" required>
				<option value=""></option>
    			<c:forEach var="cliente" items="${listaClientes}">
    				<option value="${cliente.idCliente}">${cliente.nome}</option>
    			</c:forEach>
 			</select>
 			</td>
        </tr>
        
        <tr>
        	<td>Source Code</td>
        	<td><input name="sourcecode" id="sourcecode" accept=".zip,.rar,.7zip,.7z" type="file" class="form2"><br><input type="text" name="sourcecodePath" id="sourcecodePath" style="display:none !important;"></td>
        </tr>
        
        <tr>
        	<td>Preview</td>
        	<td><input name="preview" id="preview" accept="image/png, image/gif, image/jpeg" type="file" class="form2"><br><input type="text" name="previewPath" id="previewPath" style="display:none !important;"></td>
        </tr>
        
         <tr>
			<td>Informações</td>
			<td><textarea id="informacoes" name="informacoes" class="form" style="width:600px;height: 130px;resize: none;"required></textarea></td>
        </tr>
        </table>
       		<input type="submit" id="criarProjeto" class="btn" style="color:#a3adc2;float:right; margin-top:70px;" value="Criar Projeto">
        </form>
        </div>

   			
    	<div id="formEdita" style="display:none !important;">
		<h2><span id="showId"></span></h2>
     	<form id="editaProjeto" onsubmit="javascript:alteraProjeto();return false;" method="post">
		
        <table id="tableForm">
		<tr>
        	<td>
        	<input id="projetoId2" name="projetoId2" type="number" style="display:none !important" >
        	<input id="designacao2" name="designacao2" type="text" style="display:none !important" >
        	</td>
        </tr>
		<tr>
        	<td>Cliente</td>
        	<td>
        	<select name="idCliente2" id="idCliente2" class="form" disabled required>
				<option value=""></option>
    			<c:forEach var="cliente" items="${listaClientes}">
    				<option value="${cliente.idCliente}">${cliente.nome}</option>
    			</c:forEach>
 			</select>
 			</td>
        </tr>
		<tr>
			<td>Versão </td>
        	<td><input name="versao2" id="versao2" class="form3" type="text" required><br></td>
        </tr>
		<tr>
			<td>Link </td>
        	<td><input name="link2" id="link2" class="form3" type="text"  required><br></td>
        </tr>
        <tr>
        	<td>Source Code</td>
        	<td><input name="sourcecode2" id="sourcecode2" accept=".zip,.rar,.7zip,.7z" type="file" class="form2" ><br><input type="text" name="sourcecodePath2" id="sourcecodePath2" style="display:none !important;"></td>
        </tr>
        
        <tr>
        	<td>Preview</td>
        	<td><input name="preview2" id="preview2" accept="image/jpeg"  type="file" class="form2" ><br><input type="text" name="previewPath2" id="previewPath2" style="display:none !important;"></td>
        </tr>
        
         <tr>
			<td>Informações</td>
			<td><textarea id="informacoes2" name="informacoes2" class="form" style="width:600px;height: 130px;resize: none;"required></textarea></td>
        </tr>
        </table>
       		<input type="submit" id="alterar" class="btn" style="color:#a3adc2;float:right; margin-top:100px;" value="Alterar Projeto">
       		<input type="button" id="eliminar" onclick="javascript:eliminaProjeto();return false;" class="btn" style="color:#a3adc2;float:right; margin-top:100px;" value="Eliminar">
        </form>
        </div>
    	</div>
</body>
<script>
	
	var id = localStorage.getItem('id');
	
	if(id != null){
		//preenche inputs no detail
		TMcore.postNoJson("../api/projetos/projetoById", id).then(function(resp){
			$("#formEdita").show();
			$("#projetoId2").val(resp.idProjeto);
			$("#showId").html(resp.designacao);
			$("#designacao2").val(resp.designacao);
			$("#idCliente2").val(resp.cliente.idCliente);
			$("#previewPath2").val("");
			$("#sourceCode2").val("");
			$("#versao2").val(resp.versao);
			$("#link2").val(resp.link);
			if(resp.preview != null){
				$("#alterar").after('<input type="button" onclick="downloadPreview();return false;" class="btn footer-btn" value="Transferir Imagem">');
			}
			if(resp.sourceCode != null){
				$("#alterar").after('<input type="button" onclick="downloadSource();return false;"  class="btn footer-btn" value="Transferir Source Code">');
			}
			$("#informacoes2").val(resp.informacoes);
			
			
			
		})
		
	} else{
		$("#criaProjeto").show();
	}
	
	function criaProjeto(){ 
		TMcore.post("../api/projetos/criarnovo", $("#criaProjeto :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
	
	function downloadPreview(){
		TMcore.get("../api/projetos/preview/"+$('#projetoId2').val()).then(function(resp){
			TMcore.downloadImage(resp, $("#designacao2").val());
		});
	}
	
	function downloadSource(name){
		TMcore.get("../api/projetos/sourcecode/"+$('#projetoId2').val()).then(function(resp){
			TMcore.downloadZip(resp, $("#designacao2").val());
		});
	}
	
	function alteraProjeto(){
		TMcore.post("../api/projetos/altera", $("#formEdita :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
	
	function eliminaProjeto(){
		var a = confirm("Todos as Tarefas associadas ao Projeto serão eliminadas!");
		if(a == true){
			TMcore.postNoJson("../api/projetos/eliminar",$("#projetoId2").val()).then(function(resp){
			});
			setTimeout(function(){
				location.reload();
			}, 800); 
			
		}else{
			return false;
		}
	}
	
	
</script>
</html>