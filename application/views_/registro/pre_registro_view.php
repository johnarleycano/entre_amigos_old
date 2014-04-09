<form id="form_pre_registro" class="form-inline" role="form">
	<div class="form-group">
		<label for="numero_cheque">Número de cheque</label>
		<input type="text" class="form-control" id="numero_cheque" placeholder="Número de cheque" autofocus>
	</div>
	<div class="form-group">
		<label for="codigo_cheque">Código de cheque</label>
		<input type="text" class="form-control" id="codigo_cheque" placeholder="Número de cheque">
	</div>
	<div class="form-group">
		<label for="numero_consignacion">Número de consignación</label>
		<input type="text" class="form-control" id="numero_consignacion" placeholder="Número de consignación">
	</div><br><br>
	<input class="btn btn-primary btn-lg btn-block" type="submit" value="Guardar pre-registro de cheque">
</form><br>
<div id="mensajes"></div>

<script type="text/javascript">
	$(document).ready(function(){
		//Al presionar botón registro con cheque
		$("#form_pre_registro").on("submit", function(){
			console.log('Guardando pre-registro...')

			//Tomo los valores
			var numero_cheque = $("#numero_cheque");
			var codigo_cheque = $("#codigo_cheque");
			var numero_consignacion = $("#numero_consignacion");

			datos = {
				numero_cheque: numero_cheque.val(),
				codigo_cheque: codigo_cheque.val(),
				numero_consignacion: numero_consignacion.val()
			}
			//console.log(datos)

			guardar = guardar_formulario("<?php echo site_url('registro/guardar_pre_registro') ?>", datos);

			//Si se realiza correctamente el guardado
			if(guardar != "false"){
				//Se muestra el mensaje de exito
				mostrar_exito($("#mensajes"), "Se ha guardado correctamente el pre-registro");

				//Limpia el formulario
				limpiar($("#form_pre_registro"));
			} else {
				//Se muestra el error
				mostrar_error($("#mensajes"), "Ha ocurrido un error al guardar el pre-registro.");
			}

			return false;
		});//Fin submit pre_registro
	});//Fin document.ready
</script>
