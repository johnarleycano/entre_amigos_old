<br>
<center>
	<div class="btn-group">
		<button type="button" id="btn_todos" class="btn btn-default">Todos</button>
		<button type="button" id="btn_afiliados" class="btn btn-default">Afiliados</button>
		<button type="button" id="btn_pendientes" class="btn btn-default">Pendientes por afiliar</button>
	</div>
</center>

<!-- Tabla -->
<div id="cont_tabla"></div>

<script>
	/**
	 * Afiliar
	 */
	function afiliar(id_usuario){
		// Se ejecuta el ajax que genera el Código de Empleo
        codigo_empleo = ajax("<?php echo site_url('registro/generar_codigo_empleo'); ?>", {'datos': {}}, 'html');

        // Se le ingresa el código de empleo al usuario
        actualizar = ajax("<?php echo site_url('usuario/actualizar'); ?>", {'tipo': codigo_empleo, 'id_usuario': id_usuario, 'codigo_empleo': codigo_empleo}, 'HTML');
        console.log(actualizar);

        //Si no se generó el código
        if (codigo_empleo == 'false') {
        	//Mensaje de error
            mostrar_error($("#mensajes"), "No se ha podido generar el código. Intente nuevamente por favor.");

            // Se detiene el formulario
            return false;
        }else{
        	
        } // if codigo de empleo
	} // afiliar

	/**
	 * Desafiliar
	 */
	function desafiliar(id_usuario){
		console.log(id_usuario)
	}

    // Cuando el documento esté listo
    $(document).ready(function(){
    	//Declaración de variables
    	var contenedor = $("#cont_tabla");

    	/**
    	 * De entrada cargaremos la tabla con todos los usuarios
    	 */
        contenedor.load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'todos'});

        // btn_todos
        $('#btn_todos').on("click",function(){
            //Cargaremos la tabla con todos los usuarios
            contenedor.load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'todos'});
        }); // btn_todos

        // btn_afiliados
        $('#btn_afiliados').on("click",function(){
            //Cargaremos la tabla con todos los afiliados
            contenedor.load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'afiliados'});
        }); // btn_afiliados

        // btn_pendientes
        $('#btn_pendientes').on("click",function(){
            //Cargaremos la tabla con todos los pendientes por afiliarse
            contenedor.load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'pendientes'});
        }); // btn_pendientes
    });// document.ready
</script>