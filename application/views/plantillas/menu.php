<!-- Id de sesión de usuario -->
<?php $id_usuario = $this->session->userdata('Pk_Id_Usuario'); ?>

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
	<!-- Opciones del menú -->
	<ul class="nav navbar-nav">
		<!-- Si es administrador, puede ver los afiliados -->
		<?php if($this->session->userdata('Tipo') == '1'){ ?>
			<!-- Listado de usuarios -->
			<li><a href="<?php echo site_url('usuario/afiliados'); ?>"><span class="glyphicon glyphicon-user"></span> Usuarios</a></li>
		<?php } ?>

		<li><a href="<?php echo site_url('registro'); ?>"><span class="glyphicon glyphicon-hand-up"></span> Afiliarse</a></li>

		<!-- Si se ha logueado -->
		<?php if($id_usuario){ ?>
			<!-- Invitar un amigo -->
			<li><a href="<?php echo site_url('usuario/invitaciones'); ?>"><span class="glyphicon glyphicon-user"></span> Mis invitaciones</a></li>

			<!-- Cerrar Sesión -->
			<li><a href="<?php echo site_url('usuario/finalizar') ?>"><span class="glyphicon glyphicon-remove"></span> Cerrar sesión (<?php echo substr($this->session->userdata('Nombre'), 0, 15); ?>)</a></li>
		<?php } ?>

	</ul><!-- Opciones del menú -->
	
	<!-- Si no se ha logueado -->
	<?php if(!$id_usuario){ ?>
		<!-- Inicio de sesión -->
		<form id="form_sesion" class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" id="codigo_afiliacion" placeholder="Código de Afiliación" class="form-control" autofocus>
			</div>
			<div class="form-group">
				<input type="password" id="password" placeholder="Contraseña" class="form-control">
			</div>
			<button type="submit" class="btn btn-success">Entrar</button>
		</form><!-- Inicio de sesión -->
	<?php } ?>
</div><!--/.navbar-collapse -->

<script type="text/javascript">
	// Cuando el documento esté listo
	$(document).ready(function(){
		//Tomo los valores
		var codigo_afiliacion = $("#codigo_afiliacion");
		var password = $("#password");

		// Iniciar sesión
		$("#form_sesion").on("submit", function(){
			//Debe ingresar los dos datos
			if($.trim(codigo_afiliacion.val()) == '' || password.val() == ''){
				//Mensaje de advertencia
            	mostrar_info($("#mensajes"), "Digite un código de afiliación y una contraseña por favor.");

            	// Se detiene
            	return false;
			}else{
				//Array con los datos
				datos_sesion = {
					'Codigo_Afiliacion': codigo_afiliacion.val(),
					'Password': password.val()
				};
				// console.log(datos_sesion);
				 
				// Se valida que exista el usuario
				existe_usuario = ajax("<?php echo site_url('usuario/validar'); ?>", {'datos': datos_sesion}, 'HTML');

				//Si el usuario se encuentra
				if (existe_usuario != "false") {
					//Redirección
					location.href = "<?php echo site_url(''); ?>";
				}else{
					//Mensaje de error
            		mostrar_error($("#mensajes"), "No existe en nuestra base de datos el código de afiliación y contraseña que usted está indicando. Por favor verifique nuevamente.");

            		//Se detiene
            		return false;
				} // if usuario encontrado
			} // if

			// Se detiene
        	return false;
		}); // iniciar sesión
	}); // Document.ready
</script>