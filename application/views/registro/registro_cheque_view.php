<div class="well row">
    <div id="mensajes"></div>
    <div class="col-lg-3">
        <label for="input_numero" class="control-label">Número *</label>
        <input type="text" class="form-control" id="input_numero" placeholder="Escriba el número del cheque" autofocus>
    </div>

    <div class="col-lg-3">
        <label for="input_clave" class="control-label">Clave *</label>
        <input type="text" class="form-control" id="input_clave" placeholder="Digite la clave del cheque">
    </div>

    <div class="col-lg-3">
        <label for="select_tipo_consignacion" class="control-label">Tipo de pago *</label>
        <select id="select_tipo_consignacion" class="form-control" >
        	<option value="">Seleccione...</option>
        	<option value="Consignación">Consignación</option>
        	<option value="Éxito">Éxito</option>
        	<option value="GANA">GANA</option>
        	<option value="Vía Baloto">Vía Baloto</option>
        </select>
    </div>

    <div class="col-lg-3">
        <label for="input_consignacion" class="control-label">Consignación *</label>
        <input type="text" class="form-control" id="input_consignacion" placeholder="Digite la clave del cheque">
    </div>
</div>
<button type="button" id="guardar_cheque" class="btn btn-success btn-block">Guardar</button><br>

<script type="text/javascript">
    $(document).ready(function(){
    	//Declaración de variables
        var numero = $("#input_numero");  
        var clave = $("#input_clave"); 
        var tipo_consignacion = $("#select_tipo_consignacion");
        var numero_consignacion = $("#input_consignacion");

        // Registrar el cheque
        $("#guardar_cheque").on("click", function(){
        	//Campos obligatorios a validar
            var campos_vacios = new Array(
                numero.val(),
				clave.val(),
				tipo_consignacion.val(),
				numero_consignacion.val()
            );

            // si no supera la validación
            if (!validar_campos_vacios(campos_vacios)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor diligencie todos los campos marcados con *");
            }else{
    			//Primero, se busca el chueque basado en el número y la clave
				id_cheque = ajax("<?php echo site_url('cheque/validar'); ?>", {numero: numero.val(), clave: clave.val()}, 'html');

				// Si existe
				if(id_cheque > 0){
					// Se recogen los datos
					datos = {
						'Numero_Consignacion': numero_consignacion.val(),
						'Tipo_Consignacion': tipo_consignacion.val(),
						'Fk_Id_Usuario': "<?php echo $this->session->userdata('Pk_Id_Usuario'); ?>"
					};
					// console.log(datos);
					
					// Se actualizan los datos del cheque
					actualizar = ajax("<?php echo site_url('cheque/actualizar'); ?>", {id_cheque: id_cheque, datos: datos}, 'html');

					//Se muestra el mensaje de exito
                        mostrar_exito($("#mensajes"), "Se ha registrado su cheque correctamente. En cuanto podamos revisaremos la información para su autorización por parte de la fundación.");

				}else{
					//Se muestra el error
                	mostrar_error($("#mensajes"), "El número y la clave del cheque no coinciden con nuestros registros. Veifique nuevamente");
				}
            }
        })// fin gaurdar
    });//Fin document.ready
</script>