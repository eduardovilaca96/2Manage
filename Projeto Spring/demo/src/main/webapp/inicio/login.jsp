<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http:/www.thymeleaf.org">

<head>
<script type="text/javascript" src="../scripts/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../scripts/core.js"></script>
<meta charset="ISO-8859-1">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>Página Inicial</title>
<script>

	function erroCardenciais(){
		var url = window.location.href;
		if(url.includes('?error')){
			$('#inicioDiv').after("<div><p>Utilizador ou Password Incorreto!</p></div>");
		}else if(url.includes('?logout')){
			$('#inicioDiv').after("<div><p>Sessão terminada com sucesso!</p></div>");
		}else if(url.includes('?registado')){
			$('#inicioDiv').after("<div><p>Registo concluido com sucesso!</p></div><div><p>Utilizador aguarda ativação</p></div>");
		}
	}
	$(document).ready(function() {
		erroCardenciais();
		
		$('#registar').click(function(){
			window.location = "./registo.jsp";
		});

		function checkSubmit(e) {
			   if(e && e.keyCode == 13) {
			      document.forms[0].submit();
			   }
			}
	});
	

	
</script>
</head>

<body class="text-center">
<div class="container">
<main class="form-signin">
   <form th:action="@{/login}" method="post" style="max-width: 400px; margin: 0 auto;">
  <br>
    <img class="mb-4" src="../imagens/2M.png" alt="" width="250" height="67">
    <h1 id="inicioDiv"class="h3 mb-3 fw-normal text-muted">Iniciar Sessão</h1>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="username" name="username" placeholder=" " required autofocus>
      <label for="floatingInput">Username</label>
      <br>
    </div>

    <div class="form-floating">
      <input type="password" class="form-control" id="password" name="password" placeholder=" " required>
      <label for="floatingInput">Password</label>
      <br>
    </div>

	<br> 
	<button class="w-100 btn btn-outline-secondary" type="submit">Entrar</button><br><br>
	<input type="button" class="btn btn-outline-secondary" id="registar" value="Regista-te" >
    <p class="mt-5 mb-3 text-muted">© 2Manage 2022 All Rights Reserved.</p>
  </form>
</main>

    <ul class="nav col-md-4 list-unstyled d-flex">
      <li class="ms-3 text-muted"><a href="https://aesas.pt/cursos/tecnicoa-de-gestao-e-programacao-de-sistemas-informatico/" target="_blank"><img src="../imagens/esas_logo.png" width="70" height="35"class="bi"></a></li>
    </ul>
 </div>
</body> 

</html>
