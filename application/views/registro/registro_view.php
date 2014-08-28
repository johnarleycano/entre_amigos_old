<div class="well row">
    <div id="mensajes"></div>
    <div class="col-lg-6">
        <label for="input_nombre" class="control-label">Nombre *</label>
        <input type="text" class="form-control" id="input_nombre" placeholder="Escriba su nombre completo" autofocus>
    </div>

    <div class="col-lg-6">
        <label for="input_cedula" class="control-label">Cédula *</label>
        <input type="text" class="form-control" id="input_cedula" placeholder="Digite sólo números">
    </div>

    <div class="col-lg-6">
        <label for="input_ciudad" class="control-label">Ciudad *</label>
        <input type="text" class="form-control" id="input_ciudad" placeholder="Escriba la ciudad">
    </div>

    <div class="col-lg-6">
        <label for="input_email" class="control-label">Correo electrónico *</label>
        <input type="text" class="form-control" id="input_email" placeholder="Escriba el correo electrónico">
    </div>

    <div class="col-lg-6">
        <label for="input_telefono" class="control-label">Teléfono*</label>
        <input type="text" class="form-control" id="input_telefono" placeholder="Escriba el número telefónico">
    </div>

    <div class="col-lg-6">
        <label for="input_direccion" class="control-label">Dirección (opcional)</label>
        <input type="text" class="form-control" id="input_direccion" placeholder="Digite su dirección">
    </div>


    <div class="col-lg-6">
        <label for="input_password1" class="control-label">Contraseña *</label><br>
        <input type="password" class="form-control" id="input_password1" placeholder="Escriba su contraseña">
    </div>

    <div class="col-lg-6">
        <label for="input_password2" class="control-label">Repita su contraseña *</label><br>
        <input type="password" class="form-control" id="input_password2" placeholder="Repita su contraseña">
    </div>
</div>
<button type="button" id="guardar_registro" class="btn btn-success btn-block">Guardar registro</button><br>

<script type="text/javascript">
    $(document).ready(function(){
        // Inicialización de la tabla
        $('#tabla').dataTable( {
            "bProcessing": true,
        }); // Tabla

        //Al presionar botón registro con cheque
        $("#guardar_registro").on("click", function(){
            //Declaración de variables
            var nombre = $("#input_nombre");    
            var cedula = $("#input_cedula");
            var ciudad = $("#input_ciudad");
            var email = $("#input_email");
            var password1 = $("#input_password1");
            var password2 = $("#input_password2");
            var telefono = $("#input_telefono");
            var direccion = $("#input_direccion");

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

            // si no supera la validación
            if (!validar_campos_vacios(campos_vacios)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor diligencie todos los campos marcados con *");
            //Si las claves no coinciden
            }else if(!validar_claves(password1, password2)){
                //Se muestra el error
                mostrar_error($("#mensajes"), "Las contraseñas no coinciden. Por favor verifique.");
            }else{
                //Obtenemos un código de afiliación
                codigo_afiliacion = ajax("<?php echo site_url('registro/generar_codigo_afiliacion'); ?>", {'datos': {}}, 'html');

                //Si no se generó el código
                if (codigo_afiliacion == 'false') {
                    //Mensaje de error
                    mostrar_error($("#mensajes"), "No se ha podido guardar su afiliación. Intente nuevamente por favor.");

                    // Se detiene el formulario
                    return false;
                }else{
                    //Datos a guardar
                    datos = {
                        'Cedula': cedula.val(),
                        'Ciudad': ciudad.val(),
                        'Codigo_Afiliacion': codigo_afiliacion,
                        'Codigo_Empleo': 'Pendiente',
                        'Direccion': direccion.val(),
                        'Email': email.val(),
                        'Fecha_Registro': "<?php echo date('Y-m-d H:i:s') ?>",
                        'Nombre': nombre.val(),
                        'Password': password1.val(),
                        'Telefono': telefono.val()
                    }; // datos
                    // console.log(datos);

                    //Teniendo todo listo, procedemos a guardar el usuario
                    usuario = ajax("<?php echo site_url('registro/guardar'); ?>", {'datos': datos}, 'html');

                    //Si se guarda correctamente
                    if(usuario != 'false'){
                        //Declaramos un arreglo con los datos a enviar por correo
                        datos_email = {
                            'nombre': nombre.val(),
                            'codigo_afiliacion': codigo_afiliacion,
                            'password': password1.val(),
                            'destinatario': email.val()
                        }//Fin datos email
                        //console.log(datos_email)

                        //Se envía el correo electrónico de bienvenida
                        email = ajax("<?php echo site_url('email/enviar'); ?>", {'datos': datos_email, 'tipo': 'bienvenido'}, 'html');

                        //Se muestra el mensaje de exito
                        mostrar_exito($("#mensajes"), "¡Se ha afiliado correctamente! Le hemos enviado a su correo electrónico el código de afiliación y la contraseña con la que ingresará a partir de ahora. <h1>Su código de afiliación es " + codigo_afiliacion + "</h1>");
                    }// if usuario guardado
                } // if codigo de afiliación
            } // if campos vacíos
        });//Fin guardar
    });//Fin document.ready
</script>