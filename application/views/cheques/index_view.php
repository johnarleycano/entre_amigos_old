<div class="well row">
    <div id="mensajes"></div>
	<div class="col-lg-6">
        <label for="input_numero" class="control-label">Número *</label>
        <input type="text" class="form-control" id="input_numero" placeholder="Escriba el número del cheque" autofocus>
    </div>

    <div class="col-lg-6">
        <label for="input_clave" class="control-label">Clave alfabética *</label>
        <input type="text" class="form-control" id="input_clave" placeholder="Digite la clave del cheque">
    </div>
</div>
<button type="button" id="guardar_cheque" class="btn btn-success btn-block">Guardar</button><br>

<script type="text/javascript">
    $(document).ready(function(){

    	$("#guardar_cheque").on("click", function(){
    		//Declaración de variables
            var numero = $("#input_numero");  
            var clave = $("#input_clave");  

            //Campos obligatorios a validar
            var campos_vacios = new Array(
                numero.val(), 
                clave.val()
            );

            // si no supera la validación
            if (!validar_campos_vacios(campos_vacios)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor diligencie todos los campos marcados con *");
            }else{
            	//Datos a guardar
                datos = {
                    'Numero': numero.val(),
                    'Clave': clave.val()
                }; // datos
                // console.log(datos);

            	// Guardamos
            	cheque = ajax("<?php echo site_url('cheque/guardar'); ?>", {'datos': datos}, 'html');

            	//Se muestra el mensaje de exito
                mostrar_exito($("#mensajes"), "Se ha guardado correctamente el cheque.");
            }
    	});//Fin guardar
    });//Fin document.ready
</script>