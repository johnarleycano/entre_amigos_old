<br><br>
<!-- Main jumbotron for a primary marketing message or call to action
<div class="jumbotron">
	<div class="container">
		<h1>Registro</h1>
		<p></p>
		<p>
			<a id="btn_cheque" class="btn btn-primary btn-lg">Regístrese ahora &raquo;</a>
			<a id="" class="btn btn-primary btn-lg">Registro sin cheque &raquo;</a>
		</p>
	</div>
</div> -->

<!-- <script type="text/javascript">
	$(document).ready(function(){
		$("#cheque").on("change", function(){
			if($(this).val() == "1") {
				//Muestra div
				$("#form_cheque").slideDown("slow");
			} else {
				//Oculta div
				$("#form_cheque").slideUp("slow");
			}
		});

		//Recojo todos los campos
		var nombre = $("#input_nombre");	
		var cedula = $("#input_cedula");
		var ciudad = $("#input_ciudad");
		var email = $("#input_email");
		var password1 = $("#input_password1");
		var password2 = $("#input_password2");
		var telefono = $("#input_telefono");
		var direccion = $("#input_direccion");

		//Cheque
		var cheque = $("#cheque");
		var numero_cheque = $("#input_numero_cheque");
		var codigo_cheque = $("#input_codigo_cheque");
		var numero_consignacion = $("#input_numero_consignacion");

		//Al presionar botón registro con cheque
		$("#btn_cheque").on("click", function(){
			console.log('Abriendo registro con cheque...');

			//Se abre el modal
			$('#modal_cheque').modal({
				show: true
			});//Fin modal
		});//Fin btn_cheque click

		//Al presionar botón registro con cheque
		$("#btn_guardar_registro").on("click", function(){
			console.log('Procesando registro...');

			//Campos obligatorios a validar
			var campos_vacios = new Array(
				nombre.val(), 
				cedula.val(), 
				ciudad.val(), 
				email.val(),
				password1.val(),
				password2.val(),
				telefono.val()
			);
			//console.log(campos_vacios);
			
			//Si existe cheque
			var campos_vacios_cheque = new Array(
				numero_cheque.val(),
				codigo_cheque.val(),
				numero_consignacion.val()
			);
			//console.log(campos_vacios_cheque)

			//Si no supera la validación
			if (!validar_campos_vacios(campos_vacios)) {
				//Se muestra el error
				mostrar_error($("#mensajes"), "Por favor llene los campos marcados con *");
			//Si las contraseñas no coinciden
			} else if(!validar_claves(password1, password2)){
				//Se muestra el error
				mostrar_error($("#mensajes"), "Las contraseñas no coinciden. Por favor verifique.");
			} else if(cheque.val() == "1" && !validar_campos_vacios(campos_vacios_cheque)) {
				//Si los campos de cheque se eligieron y no se han llenado
				//Se muestra el error
				mostrar_error($("#mensajes"), "Por favor complete el registro de la información del cheque para poder guardar.");
			} else {
				//Datos a guardar
				var datos = {
					nombre: nombre.val(), 
					cedula: cedula.val(), 
					ciudad: ciudad.val(), 
					email: email.val(),
					direccion: direccion.val(),
					password: password1.val(),
					telefono: telefono.val(),
					numero_cheque: numero_cheque.val(),
					codigo_cheque: codigo_cheque.val(),
					numero_consignacion: numero_consignacion.val()
				};

				//Datos a guardar del cheque
				var datos_cheque = {
					numero_cheque: numero_cheque.val(),
					codigo_cheque: codigo_cheque.val(),
					numero_consignacion: numero_consignacion.val()
				};

				//Ejecuta la validacion de los datos del cheque
				validar_pre_registro = guardar_formulario("<?php echo site_url('registro/validar_pre_registro') ?>", datos_cheque);

				//Antes de guardar, debe validar que el cheque esté pre-registrado para autorizarlo
				if (cheque.val() == "1" &&  validar_pre_registro) {
					
				} else {
					
				};

				//Se ejecuta el guardado
				guardar = guardar_formulario("<?php echo site_url('registro/guardar'); ?>", datos);
				
				//Si se realiza correctamente el guardado
				if(guardar != "false"){
					//Se muestra el mensaje de exito
					mostrar_exito($("#mensajes"), "¡Se ha creado su registro correctamente! Guarde su código de empleo. También se lo hemos enviado a su correo electrónico junto con la contraseña <h1>" + guardar + "</h1>");

					//Limpia el formulario
					limpiar($(".form-horizontal"));

					//Se envía correo electrónico
					enviar_email("1", guardar);
				} else {
					//Se muestra el error
					mostrar_error($("#mensajes"), "Ha ocurrido un error al guardar el registro.");
				}
			}//Fin if()
		});//Fin btn_guardar_registro click
	});
</script> -->