<div id="sidebar-container d-flex flex-column flex-shrink-0 p-3" class="sidebar" style="postion:fixed;">
	<nav>
		<center>
			<img src="../imagens/2MLogo.png" height="100" width="110">
		</center>
		<span class="text-muted px-3">Gestão</span>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="./dashboard.jsp" id="dashNav" class="nav-link text-white"
				>Dashboard</a></li>
			<li class="nav-item"><a href="./utilizadores.jsp" id="utilNav" class="nav-link text-white"
				>Utilizadores</a></li>
			<li class="nav-item"><a href="./sessoes.jsp" id="sessNav" class="nav-link text-white"
				>Sessões</a></li>
			<li class="nav-item"><a href="./projetos.jsp" id="projNav" class="nav-link text-white"
				>Projetos</a></li>
			<li class="nav-item"><a href="./clientes.jsp" id="clieNav" class="nav-link text-white"
				>Clientes</a></li>
		<span class="text-muted px-3">Recursos</span>
			<li class="nav-item"><a href="./suporte.jsp" id="helpNav"class="nav-link text-white"
				>Suporte</a></li>
				<hr>
				
			<a href="/2Manage/logout" class="active"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
		</ul>
</nav> 
</div> 

<script type="text/javascript">
	if(location.pathname.includes('dashboard')){
		$("#dashNav").addClass("active");
	}else if(location.pathname.includes('utilizadores')){
		$("#utilNav").addClass("active");
	}else if(location.pathname.includes('sessoes')){
		$("#sessNav").addClass("active"); 
	}else if(location.pathname.includes('projetos')){
		$("#projNav").addClass("active");
	}else if(location.pathname.includes('clientes')){
		$("#clieNav").addClass("active");
	}else if(location.pathname.includes('suporte')){
		$("#teamNav").addClass("active");
	}else if(location.pathname.includes('estatistica')){
		$("#statNav").addClass("active");
	}
</script>
