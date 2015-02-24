<div class="well row">
    <div id="mensajes"></div>
	<div class="col-lg-4">
        <label for="input_cheque1" class="control-label">Cheque biblioteca privada *</label>
        <input type="text" class="form-control" id="input_cheque1" placeholder="Escriba el número del cheque" autofocus>
    </div>

    <div class="col-lg-4">
        <label for="input_cheque2" class="control-label">Cheque libro de poesía *</label>
        <input type="text" class="form-control" id="input_cheque2" placeholder="Escriba el número del cheque">
    </div>

    <div class="col-lg-4">
        <label for="input_cheque3" class="control-label">Sorteo por un año *</label>
        <input type="text" class="form-control" id="input_cheque3" placeholder="Escriba el número del cheque">
    </div>
</div>
<button type="button" id="guardar_cheque" class="btn btn-success btn-block">Guardar</button><br>

<script type="text/javascript">
    $(document).ready(function(){

    	$("#guardar_cheque").on("click", function(){
    		//Declaración de variables
            var cheque1 = $("#input_cheque1");  
            var cheque2 = $("#input_cheque2");  
            var cheque3 = $("#input_cheque3");  

            //Campos obligatorios a validar
            var campos_vacios = new Array(
                cheque1.val(), 
                cheque2.val(),
                cheque3.val()
            );

            // si no supera la validación
            if (!validar_campos_vacios(campos_vacios)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor diligencie todos los campos marcados con *");
            }else{
            	//Datos a guardar
                datos = {
                    'Cheque1': cheque1.val(),
                    'Cheque2': cheque2.val(),
                    'Cheque3': cheque3.val()
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