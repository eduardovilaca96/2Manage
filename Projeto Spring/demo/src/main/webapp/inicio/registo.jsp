<%@page import="org.springframework.web.context.WebApplicationContext"%>
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


<title>Registo</title>
<script>
	$(document).ready(function() {
		
		$('#login').click(function(){
			window.location = "./login.jsp";
		});
		
	});
	
	function Login(){
		event.preventDefault();
		if($("#password").val() != $("#rpassword").val()){
			alert("Palavras Passe Distintas");
			return false;
		} 
		
		else {
			var resp = null;
			TMcore.post("../api/registo/regista", $("#MyForm").serializeArray()).then(function(resp){
			});
			setTimeout(function(){
				window.location = "../user/dashboard.jsp";
			}, 2000); 
		}
	}
	
</script>
</head>

<body class="text-center">

<main class="form-signin form-center" style="max-width: 400px; margin: 0 auto;">
<form id="MyForm" onsubmit="javascript:Login();return false;" method="post">
  <br>
    <img class="mb-4" src="../imagens/2M.png" alt="2Manage Logo" width="250" height="70">
    <h1 class="h3 mb-3 fw-normal text-muted">Registo</h1>

    <div id="emailReg" class="form-floating" >
      <input type="email" class="form-control" id="email" name="email" required placeholder=" ">
      <label for="floatingInput">Email</label>
      <br>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="user" name="user" required placeholder=" ">
      <label for="floatingInput">Username</label>
      <br>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="nome" name="nome" required placeholder=" ">
      <label for="floatingInput">Nome</label>
      <br>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="apelido" name="apelido" required placeholder=" ">
      <label for="floatingInput">Apelido</label>
      <br>
    </div>
    
     <div class="form-floating">
      <input type="text" class="form-control" id="tel" name="tel" required placeholder=" ">
      <label for="floatingInput">Contacto</label>
      <br>
    </div>

    <div class="form-floating">
      <input type="password" class="form-control" id="password" name="password" required placeholder=" ">
      <label for="floatingInput">Password</label>
      <br>
    </div>

    <div id="registo" class="form-floating">
      <input type="password" class="form-control invalid" id="rpassword" name="rpassword" required placeholder=" ">
      <label for="floatingPassword">Confirmar Password</label>
    </div>
	<br> 
	<input type="submit" class="w-100 btn btn-outline-secondary" id="entrar" value="Registar"><br><br>
	<input type="button" class="btn btn-outline-secondary" id="login" value="Já tens conta?" >
    <p class="mt-5 mb-3 text-muted">© 2Manage 2022 All Rights Reserved.</p>
</form>
</main>  
<footer>

</footer>
</body>
</html>
