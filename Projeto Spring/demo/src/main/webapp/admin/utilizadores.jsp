<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.example.demo.config.ApplicationContextProvider"%>
<%@page import="com.example.demo.services.MembroService"%>
<%@page import="com.example.demo.services.UserService"%>
<%@page import="com.example.demo.entities.Membro"%>
<%@page import="com.example.demo.entities.UserEntity"%>
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
 	List<UserEntity> users = usserv.getAllUsers();
	pageContext.setAttribute("listaUsers", users);
%>

<title>Modo Administrador</title>
<script> 
$(document).ready(function() {
	
});

function desativar(userId){
	if(confirm("Pertende alterar o estado do utilizador "+userId+"?") == true){
		TMcore.postNoJson('../api/users/desativar','{"userId":'+userId+'}').then(function(resp){
			location.reload();
		});
	} else{
		return false; 
	}		
}

function editaModal(id){
	localStorage.setItem('id',id);
	$('#myModal').load('./passwordDetail.jsp?');
	$('#myModal').show();

}

</script>
</head>

<body>
	<div id="myModal" class="modalBox" style="display: none;">
    
  	</div>

<div id="main-container" class="container2">
<h3 id="greeting">UTILIZADORES</h3>

<ul>
	<li class="table-header">
      <div class="col col-3">Username</div>
      <div class="col col-3">Password</div>
      <div class="col col-2">Role</div>
      <div class="col col-1">Ativado</div>
    </li>
    <c:forEach var="user" items="${listaUsers}">
    <li class="table-row">
    	 <div class="col col-3">${user.userName}</div>
    	 <div class="col col-3 text-muted">hidden 
    	 <c:if test="${user.role.contains('ADMIN') == false}">
    	 <button onclick="editaModal(${user.userId});return false;" class="btn" ><i class="fa fa-pencil" style='font-size:15px;color:#a3adc2;'></i></button>
    	 </c:if>
    	 </div>
    	 <div class="col col-2" >${user.role}</div>
    	 <div class="col col-1 form-check form-switch">
		<c:if test="${user.role.contains('ADMIN') == false}">
 		<input type="checkbox" class="form-check-input" onclick="javascript:desativar(${user.userId});return false;" <c:if test="${user.enabled == 1}">checked</c:if>
    	 <c:if test="${user.enabled == 0} "></c:if>>
    	 </c:if>
    	 </div>
    </li>
    
    </c:forEach>


</ul>

</div>
</body>
</html>
