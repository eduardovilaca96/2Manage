<nav id="navbar" class="navbar navbar-expand-lg navbar-dark rounded header_1">
	<div class="container-fluid">
		<img src="../imagens/2M.png" height="50" width="190" >
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav">
				<a href="./dashboard.jsp" id="dashNav" class="nav-item nav-link" style="padding: 20px 20px">Dashboard</a> 
				<div class="dropdown"> 
					<a href="#"	id="taskNav" class="dropdown-toogle nav-link" style="padding: 20px 20px">Tarefas</a> 
				<div class="dropdown-menu" style="background-color:rgba(38,32,53);box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.4); " aria-labelledby="dropdownMenuButton">
					<h6 class="dropdown-header" style="color:#3263ac;">Vista</h6>
				    <a class="dropdown-item" href="./tarefasQuadrado.jsp" style="font-size:15px;color:#6c757d"><i class="fa fa-square" style='font-size:15px'></i>&nbsp;Quadrados</a>
				    <a class="dropdown-item" href="./tarefasLista.jsp" style="font-size:15px;color:#6c757d"><i class="fa fa-bars" style='font-size:15px'></i>&nbsp;Lista</a>
				</div>
				</div>
				<a href="./projetos.jsp" id="projNav" class="nav-item nav-link" style="padding: 20px 20px">Projetos</a>
			</div> 
			<div class="navbar-nav ms-auto">
			<button onclick="javascript:window.location = '/2Manage/logout'"
			class="nav-item nav-link btn fa fa-sign-out" style='font-size:18px'>
			</button>

			</div>
		</div>
	</div>
</nav>

<script type="text/javascript">
	if(location.pathname.includes('dashboard')){
		$("#dashNav").addClass("active");
	}else if(location.pathname.includes('tarefas')){
		$("#taskNav").addClass("active");
	}else if(location.pathname.includes('projetos')){
		$("#projNav").addClass("active");
	}else if(location.pathname.includes('equipa')){
		$("#teamNav").addClass("active");
	}
</script>

