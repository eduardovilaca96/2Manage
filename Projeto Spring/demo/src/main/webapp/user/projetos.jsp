<%@page import="com.example.demo.services.ProjetoService"%>
<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%> 
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.services.TMUser"%>
<%@page import="com.example.demo.services.ProjetoService"%> 
<%@page import="com.example.demo.services.TarefaService"%> 
<%@page import="com.example.demo.entities.Membro"%> 
<%@page import="com.example.demo.entities.Tarefa"%> 
<%@page import="com.example.demo.entities.Projeto"%> 
<%@page import="org.springframework.web.context.WebApplicationContext"%>
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
	pageContext.setAttribute("welcome", user);
	
	ProjetoService projss = ApplicationContextProvider.getApplicationContext().getBean(ProjetoService.class);
	List<Projeto> listaProj = projss.getAllProjetos();
	pageContext.setAttribute("projetos", listaProj);
	
	TarefaService taskss = ApplicationContextProvider.getApplicationContext().getBean(TarefaService.class);
	List<Tarefa> listaTask = taskss.getAllTarefas();
	pageContext.setAttribute("tarefas", listaTask);
	
	
	
%>
<title>Projetos</title>
<script>
	$(document).ready(function() {

		 
	});
</script>
</head>


<body> 
	<div id="main-container">
	<c:if test="${projetos.size() == 0}"><div class="midcontainer2 m-2 row "><p style="color:#3263ac;">Sem projetos para mostrar :(</p></div></c:if>
		<c:forEach var="projeto" items="${projetos}" varStatus="i">
		<div class="midcontainer2 m-2 row ">
		<h3 style="margin-bottom:10px;color:#3263ac;">${projeto.designacao}</h3>
				<p>${projeto.informacoes}</p> 
			
			<div id="projeto${i.count}" class="col-xl-6">
				<img style="height:400px;border-radius:3px;position:relative;max-width: 700px;" src="data:image/png;base64,${projeto.getFileContent(projeto.preview)}">
			</div> 
			 
			<div class="col-xl-5" style="height:400px;width:640px; overflow: auto; border-radius: 3px; background-color: rgba(0,0,0,0.4);margin-left:25px;"> 
				<table class="tab-2">
				<c:forEach var="tarefa" items="${tarefas}">
				
				<c:if test="${tarefa.projeto.idProjeto == projeto.idProjeto}">
				<tr class="table-row4" style="width:550px;">
						<td class="tab-6">#${tarefa.idTarefa}</td>
						<td class="tab-6">${tarefa.membro.nome}</td>
    	 				<td class="tab-6">${tarefa.designacao}</td> 
    					<td class="tab-6" >
    					<c:if test="${tarefa.tipo == 1}">Alta</c:if>
    					<c:if test="${tarefa.tipo == 2}">Média</c:if>
    					<c:if test="${tarefa.tipo == 3}">Baixa</c:if>
    					</td>
    					<td class="tab-6">${tarefa.progresso}%</td>
				</tr>		
				</c:if>
				</c:forEach>
				</table>	 
				
			</div>
			<br><br>
				<div class="col-lg-9" style="width: absolute;margin-top:5px;">
					<table style="margin-top:5px;">
					<tr>
						<td><button class="btn" onclick="downloadSource(${projeto.idProjeto},'${projeto.designacao}');return false;" style="color:#a3adc2;padding-left:0px">Source Code <i class="fa fa-download" style="font-size:20px"></i></button></td>
						<td><a class="btn" style="color:#a3adc2" href="${projeto.link}" target="_blank">Link <i class="fa fa-link" style="font-size:20px"></i></a></td>
						<td style="padding:6px 12px;">Since: ${projeto.dataCriacao}</td>
						<td>Version: ${projeto.versao}</td>
					</tr>
					</table>
				</div> 
			</div>
		</c:forEach>
	</div>
</body>
<script>
function downloadSource(id,name){
	TMcore.get("../api/projetos/sourcecode/"+id).then(function(resp){
		TMcore.downloadZip(resp,name);
	});
}
</script>
</html>