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

	
%>
<meta charset="ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

function change(){
	if($("#password").val() != $("#rpassword").val()){
		alert("Palavras Passe Distintas");
		return false;
	}else{
		$("#userId").val(localStorage.getItem('id'));
		
		TMcore.post("../api/users/chng", $("#changePsw").serializeArray()).then(function(resp){
			location.reload();
		});
	}
}
	
</script>
</head>
<body>
	<div class="modalContent2">
      <span id="closeTarefa" class="closeTarefa"><button id="closeTarefa" title="Fechar" onclick="localStorage.removeItem('id');document.getElementById('myModal').style.display = 'none';document.getElementById('myModal').innerHTML  = '';" style="overflow:hidden;padding:0px; color:#a3adc2;" class="btn fa fa-close"></button></span>    	
		<h2>Alteração de Password</h2>
		<form onsubmit="javascript:change();return false;" method="post" id="changePsw">
		<table>
		<tr>
		<td>Nova Password:</td>
		<td><input id="password" name="password"  type="password" class="form" required></td></tr>
		
		<tr><td>Re-introduzir Password:</td>
		<td><input id="rpassword" name="rpassword" type="password" class="form" required><td></td>
		</table>
		<input type="submit" id="alteraPassword" style="color:#a3adc2;float:right" class="btn" value="Alterar Password">
		<input type="hidden" id="userId" name="userId">
		</form>
	</div>
</body>
<script>
	

	
</script>
</html>