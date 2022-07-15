<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%>
<%@page import="com.example.demo.services.UserService"%>
<%@page import="com.example.demo.entities.Membro"%>
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.entities.UserEntity"%>
<%@page import="com.example.demo.entities.Sessao"%>
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
	MembroService memserv = ApplicationContextProvider.getApplicationContext().getBean(MembroService.class);
 	List<Membro> membros = memserv.getAllMembros();
	pageContext.setAttribute("listaMembros", membros);
	
	UserService usserv = ApplicationContextProvider.getApplicationContext().getBean(UserService.class);
 	List<Sessao> sessoes = usserv.getAllSessoes();
	pageContext.setAttribute("listaSess", sessoes);
%>

<title>Modo Administrador</title>
<script> 
	$(document).ready(function() {
		
		$("#limpaSessao").click(function (){
			
			var a = confirm("A sua sessão será terminada");
			if(a == true){
			TMcore.get("../api/sessao/limpar").then(function(){
				location.reload();
			});
			} else{
				return false;
			}
		});
	});


</script>
</head>

<body>
<div id="main-container" class="container2">
<h3 id="greeting">SESSÕES<button id="limpaSessao" class="btn" style="float:right;color:#a3adc2;" >Limpar Sessões</button></h3>

<ul>
	<li class="table-header">
      <div class="col col-3">ID</div>
      <div class="col col-2">Username</div>
      <div class="col col-2">Estado</div>
      <div class="col col-2">Ultima vez visto</div>  
    </li>
    <c:forEach var="sessao" items="${listaSess}">
    <li class="table-row">
    	 <div class="col col-3" >${sessao.idSessao}</div>
    	 <div class="col col-2" ><c:if test="${sessao.util != null}"> ${sessao.util}</c:if><c:if test="${sessao.util == null}"> Sem Utilizador</c:if></div>
    	 <div class="col col-2" ><c:if test="${sessao.util != null}"> Online</c:if><c:if test="${sessao.util == null}">-----</c:if></div>
    	 <div class="col col-2" >${sessao.getDataAcesso()}</div>
    </li>
    
    </c:forEach>


</ul>

</div>
</body>
</html>
