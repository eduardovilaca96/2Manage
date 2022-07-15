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
	List<Membro> mem = memsrv.getAllMembros();
	pageContext.setAttribute("membros", mem);
	
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
      <span id="closeTarefa" class="closeTarefa"><button id="closeTarefa" title="Fechar" onclick="document.getElementById('myModal').style.display = 'none';document.getElementById('myModal').innerHTML  = '';" style="overflow:hidden;padding:0px; color:#a3adc2;" class="btn fa fa-close"></button></span>    	
		
		<div id="criaTarefa" style="display:none !important;">
		<h2>Nova Tarefa</h2>
        <form onsubmit="javascript:criaTarefa();return false;" method="post" id="novaTarefa">
        <table id="tableForm">
        <tr>
        	<td>Titulo </td>
        	<td><input name="designacao" id="designacao" class="form" type="text" style="text-transform:uppercase;" required><br></td></tr>
        	<tr>
        	<td>Membro</td>
        	<td>
        	<select id="idMembro" name="idMembro"class="form">
        		<option value="todos">Todos</option>
    			<c:forEach var="membro" items="${membros}">
    				<option value="${membro.idMembro}">${membro.nome} ${membro.apelido}</option>
    			</c:forEach>
        	</select>
        	</tr>
        	
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
       		<input type="submit" class="btn" style="color:#a3adc2;float:right; margin-top:105px;" value="Criar Tarefa">
        </form>
       </div>
	</div>
</body>
<script>
	
	$("#criaTarefa").show();
	
	
	function criaTarefa(){ 
		TMcore.post("../api/tarefas/criarovaAmdin", $("#criaTarefa :input").serializeArray()).then(function(resp){
		});
		setTimeout(function(){
			location.reload();
		}, 500); 
	}
	
</script>
</html>