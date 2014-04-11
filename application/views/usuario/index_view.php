<br>

<!-- Mensajes -->
<div id="mensajes"></div>

<center>
	<div class="btn-group">
		<button type="button" id="btn_todos" class="btn btn-default">Todos</button>
		<button type="button" id="btn_autorizados" class="btn btn-default">Autorizados</button>
		<button type="button" id="btn_pendientes" class="btn btn-default">Pendientes por autorizar</button>
	</div>
</center>

<!-- Tabla -->
<div id="cont_tabla"></div>

<script>
	/**
	 * Afiliar
	 */
	function autorizar(id_usuario){
		// Se ejecuta el ajax que genera el Código de Empleo
        codigo_empleo = ajax("<?php echo site_url('registro/generar_codigo_empleo'); ?>", {'datos': {}}, 'html');

        // Se le ingresa el código de empleo al usuario
        actualizar = ajax("<?php echo site_url('usuario/actualizar'); ?>", {'tipo': 'codigo_empleo', 'id_usuario': id_usuario, 'codigo_empleo': codigo_empleo}, 'HTML');

        //Si no se generó el código
        if (codigo_empleo == 'false') {
        	//Mensaje de error
            mostrar_error($("#mensajes"), "No se ha podido generar el código. Intente nuevamente por favor.");

            // Se detiene el formulario
            return false;
        }else{
            // Se traen todos los datos del usuario
            usuario = ajax("<?php echo site_url('usuario/consultar_datos'); ?>", {'id_usuario': id_usuario}, 'JSON');

            //Declaramos un arreglo con los datos a enviar por correo
            datos_email = {
                'nombre': usuario.Nombre,
                'codigo_empleo': usuario.Codigo_Empleo,
                'destinatario': usuario.Email
            }//Fin datos email
            // console.log(datos_email)
                        
            //Se envía el correo electrónico informando que se le dio código de empleo
            email = ajax("<?php echo site_url('email/enviar'); ?>", {'datos': datos_email, 'tipo': 'autorizacion'}, 'html');

            //Se recara la tabla
            $("#cont_tabla").load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'todos'});

            //Se muestra el mensaje de exito
            mostrar_exito($("#mensajes"), "Le ha generado el código de empleo " + codigo_empleo + " correctamente. Se le ha enviado un correo electrónico notificándole.");
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

        // btn_autorizados
        $('#btn_autorizados').on("click",function(){
            //Cargaremos la tabla con todos los afiliados
            contenedor.load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'afiliados'});
        }); // btn_autorizados

        // btn_pendientes
        $('#btn_pendientes').on("click",function(){
            //Cargaremos la tabla con todos los pendientes por afiliarse
            contenedor.load("<?php echo site_url('usuario/cargar_interfaz'); ?>", {'tipo': 'pendientes'});
        }); // btn_pendientes
    });// document.ready
</script>