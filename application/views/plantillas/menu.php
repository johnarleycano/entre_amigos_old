<?php //$id_usuario = $this->session->userdata('Pk_Id_Usuario'); ?>

<!--Menú-->
<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="<?php echo site_url(); ?>"><span class="glyphicon glyphicon-home"></span></a>
</div>

<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav">
		<li><a href="<?php echo site_url('usuario/afiliados'); ?>"><span class="glyphicon glyphicon-user"></span> Usuarios</a></li>
		<li><a href="<?php echo site_url('registro'); ?>"><span class="glyphicon glyphicon-hand-up"></span> Afiliarse</a></li>
	</ul>
</div><!--/.navbar-collapse -->