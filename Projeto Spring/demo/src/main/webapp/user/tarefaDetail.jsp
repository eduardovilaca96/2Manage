<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%>
<%@page import="com.example.demo.services.ProjetoService"%>
<%@page import="com.example.demo.services.TMUser"%>
<%@page import="com.example.demo.services.TarefaService"%>
<%@page import="com.example.demo.entities.Projeto"%>
<%@page import="com.example.demo.entities.Tarefa"%>
<%@page import="com.example.demo.entities.Membro"%>
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="java.lang.Integer"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<%

	TMUser dash = ApplicationContextProvider.getApplicationContext().getBean(TMUser.class);
	UserEntity user = dash.getUser(request);
	pageContext.setAttribute("util", user);

	MembroService memsrv = ApplicationContextProvider.getApplicationContext().getBean(MembroService.class);
	Membro mem = memsrv.getMembroByUserId(user.getUserId());
	pageContext.setAttribute("membro", mem);
	
	ProjetoService projsrv = ApplicationContextProvider.getApplicationContext().getBean(ProjetoService.class);
	List<Projeto> listaProj = projsrv.getAllProjetos();
	pageContext.setAttribute("listaProjetos", listaProj);
	
	TarefaService tasksrv = ApplicationContextProvider.getApplicationContext().getBean(TarefaService.class);
	
	
%>
<meta charset="ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

	
</script>
</head>
<body>
	<div class="modalContent">
      <span id="closeTarefa" class="closeTarefa"><button id="closeTarefa" title="Fechar" onclick="localStorage.removeItem('id');document.getElementById('myModal').style.display = 'none';document.getElementById('myModal').innerHTML  = '';" style="overflow:hidden;padding:0px; color:#a3adc2;" class="btn fa fa-close"></button></span>    	
		
		<div id="criaTarefa" style="display:none !important;">
		<h2>Nova Tarefa</h2>
        <form onsubmit="javascript:criaTarefa();return false;" method="post" id="novaTarefa">
        <table id="tableForm">
        <tr>
        	<td>Titulo </td>
        	<td><input name="designacao" id="designacao" class="form" type="text" style="text-transform:uppercase;" required><br></td></tr>
        	<tr>
        	<td>Projeto</td>
			<td>
			<select name="iDprojeto" id="iDprojeto" class="form" id="projeto">
				<option value="">Interno</option>
    			<c:forEach var="projeto" items="${listaProjetos}">
    				<option value="${projeto.idProjeto}">${projeto.designacao}</option>
    			</c:forEach>
 			</select>
			</td>
			</tr>
			<tr>
			<td>Realizar Até</td>
			<td><input name="dataFim" id="dataFim" class="form" type="datetime-local" style="text-align: center; "required><br></td>
			</tr>
			<tr>
			<td>Importancia</td>
			<td>
			<select class="form" id="tipo" name="tipo">
				<option value="3">Baixa</option>
				<option value="2">Média</option>
				<option value="1">Alta</option>
 			</select>
			</td> 
			</tr>
			<tr>
			<td>Progresso</td>
			<td><input id="progresso" name="progresso" class="form" type="range" value="0" min="0" max="100" oninput="this.nextElementSibling.value = this.value"><output>0</output>%<br></td>
			</tr>
			<tr>
			<td>Descrição</td>
			<td><textarea id="descricao" name="descricao" class="form" style="width:600px;height: 130px;resize: none;"></textarea></td>
			</tr>
        </table>
        	<input type="hidden" id="idStatus" name="idStatus" value="1">
        	<input type="hidden" id="idMembro" name="idMembro" value="${membro.idMembro}">
       		<input type="submit" class="btn" style="color:#a3adc2;float:right; margin-top:140px;" value="Criar Tarefa">
       		
        </form>
        
       </div>
       
        <div id="formEdita" style="display:none !important;">
		<h2>Tarefa #<span id="showId"></span></h2>
		
     	<form id="editaTarefa" onsubmit="javascript:alteraTarefa();return false;" method="post">
		
        <table id="tableForm">
        <tr>
		
        	<td>Titulo </td>
        	<td>
        		<input id="tarefaId2" name="tarefaId2"type="text" style="display:none !important" class="form" >
        		<input name="designacao2" id="designacao2" class="form" type="text" style="text-transform:uppercase;" required>
        	<br></td></tr>
        	<tr><td>Projeto</td><td>
				<select name="iDprojeto2" id="iDprojeto2" class="form">
					<option value="">Interno</option>
    				<c:forEach var="projeto" items="${listaProjetos}">
    					<option value="${projeto.idProjeto}">${projeto.designacao}</option>
    				</c:forEach>
 				</select>
			</td></tr>
			<tr><td>Data de Criação</td><td>
				<span id="dataCriacao2" class="" style="margin:5px; margin-left:20px;"></span><br></td>
			</tr>
			<tr><td>Realizar até</td><td>
				<input name="dataFim2" id="dataFim2" class="form" type="datetime-local" style="text-align: center; "required><br></td>
			</tr>
			<tr><td>Importancia</td><td>
				<select class="form" id="tipo2" name="tipo2">
					<option value="3">Baixa</option>
					<option value="2">Média</option>
					<option value="1">Alta</option>
 				</select>
			</td> </tr><tr> <td>Progresso</td>
				<td><input id="progresso2" name="progresso2" class="form" type="range" min="0" max="100" required oninput="this.nextElementSibling.value = this.value"><output id="progressoNum">0</output>%<br></td>
			</tr><tr><td>Descrição</td><td>
				<textarea id="descricao2" name="descricao2" class="form" style="width:600px;height: 130px;resize: none;"></textarea></td>
			</tr>
			<tr>
			<td>
			<input type="text" id="idStatus2" name="idStatus2" class="form" style="display:none !important" value="">
       		</td></tr>
        </table>
       		<input type="submit" id="alterar" class="btn" style="color:#a3adc2;float:right; margin-top:110px;" value="Alterar Tarefa">
       		<input type="button" id="eliminar" onclick="javascript:eliminaTarefa();return false;" class="btn" style="color:#a3adc2;float:right; margin-top:110px;" value="Eliminar">
        </form>
    </div>
	</div>
</body>
<script>
	
	var id = localStorage.getItem('id');
	
	if(id != null){
		//preenche inputs no detail
		$("#formEdita").show();
		var tarefa = null;
		TMcore.postNoJson("../api/tarefas/tarefaById", id).then(function(resp){
			
			$("#tarefaId2").val(resp.idTarefa);
			$("#showId").html(resp.idTarefa);
			$("#designacao2").attr('value',resp.designacao);
			$("#iDprojeto2").val(resp.projeto == null ? '' : resp.projeto.idProjeto);
			
			let unix_timestamp = resp.dataCriacao;
			var date = new Date(unix_timestamp);
			date.setHours(date.getHours() + 1);
			$("#dataCriacao2").html(date.toISOString().substring(0,10));
			
			
			let unix_timestamp2 = resp.dataFim;
			var date2 = new Date(unix_timestamp2);
			date2.setHours(date2.getHours() + 1);
			$("#dataFim2").val(date2.toISOString().substring(0,16));
			
			
			
			$("#tipo2").val(resp.tipo);
			$("#idStatus2").val(resp.status);
			$("#progresso2").attr('value',resp.progresso);
			$("#progressoNum").html(resp.progresso);
			$("#descricao2").html(resp.descricao);
			
			if(resp.status === 1){
				$("#alterar").after('<input type="button" onclick="javascript:aConcluirTarefa();return false;" id="concluir"class="btn" style="color:#a3adc2;float:left; margin-top:108px;" value="Marcar como Completada">')
				
			}else if(resp.status === 3){
				
				$("#editaTarefa :input").attr("readonly", true);
				$("#editaTarefa :input").addClass("text-muted");
				$("#iDprojeto2").attr("disabled", true);
				$("#progresso2").attr("disabled", true);
				$("#tipo2").attr("disabled", true);
				$("#eliminar").attr("readonly", false);
				$("#eliminar").removeClass("text-muted");
				$("#alterar").prop('disabled', true);
				$("#alterar").after('<input type="button" onclick="javascript:aFazerTarefa();return false;" id="afazer" class="btn" style="color:#a3adc2;float:left; margin-top:108px;" value="Marcar como A Fazer">')
				
			}
			
		})
		
	} else{
		//mostrar nova tarefa
		$("#criaTarefa").show();
	}
	
	function aFazerTarefa(){ 
		TMcore.post("../api/tarefas/aFazer", $("#formEdita :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}

	function aConcluirTarefa(){ 
		TMcore.post("../api/tarefas/concluir", $("#formEdita :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
	
	function criaTarefa(){ 
		TMcore.post("../api/tarefas/criarova", $("#criaTarefa :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
	
	function alteraTarefa(){
		TMcore.post("../api/tarefas/altera", $("#formEdita :input").serializeArray()).then(function(resp){
			location.reload();
		});
	}
	
	function eliminaTarefa(){
		TMcore.postNoJson("../api/tarefas/eliminar", $("#tarefaId2").val()).then(function(resp){
		});
		setTimeout(function(){
			location.reload();
		}, 400); 
	}
	
	
</script>
</html>