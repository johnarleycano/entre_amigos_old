<div class="row">
    <div class="col-lg-6">
        <div class="radio">
            <label>
                <input type="radio" name="metodo_afiliacion" value="sin_cheque" checked>
                <h3>Afiliación con consignación</h3>
            </label>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="radio">
            <label>
                <input type="radio" name="metodo_afiliacion" value="cheque_pagado">
                <h3>Registro con bono</h3>
            </label>
        </div>
    </div>
    <span style="font-size: 14px;">Si tiene un bono, seleccione "Registro con bono"</span>

    <!-- <div class="col-lg-3">
        <div class="radio">
            <label>
                <input type="radio" name="metodo_afiliacion" value="patrocinador">
                <h3>Bono patrocinio</h3>
            </label>
        </div>
    </div> -->
</div>

<div class="well row">
    <div id="mensajes"></div>
    <div class="col-lg-4">
        <label for="input_nombre" class="control-label">Nombre *</label>
        <input type="text" class="form-control" id="input_nombre" placeholder="Escriba su nombre completo" autofocus>
    </div>

    <div class="col-lg-4">
        <label for="input_cedula" class="control-label">Cédula *</label>
        <input type="text" class="form-control" id="input_cedula" placeholder="Digite sólo números">
    </div>

    <div class="col-lg-4">
        <label for="departamento" class="control-label">Departamento *</label>
        <select class="form-control" id="departamento">
            <option value="">Seleccione...</option>
                                
            <!-- Se recorren los tipos de áreas -->
            <?php foreach ($this->administracion_model->cargar_departamentos() as $departamento) { ?>
                <option value="<?php echo $departamento->Pk_Id; ?>"><?php echo $departamento->Nombre; ?></option>
            <?php } ?>
        </select>
    </div>

    <div class="col-lg-4">
        <label for="municipio" class="control-label">Municipio *</label>
        <select class="form-control" id="municipio"></select>
    </div>

    <div class="col-lg-4">
        <label for="input_email" class="control-label">Correo electrónico *</label>
        <input type="text" class="form-control" id="input_email" placeholder="Escriba el correo electrónico">
    </div>

    <div class="col-lg-4">
        <label for="input_telefono" class="control-label">Teléfono*</label>
        <input type="text" class="form-control" id="input_telefono" placeholder="Escriba el número telefónico">
    </div>

    <div class="col-lg-4">
        <label for="input_direccion" class="control-label">Dirección</label>
        <input type="text" class="form-control" id="input_direccion" placeholder="Digite su dirección">
    </div>


    <div class="col-lg-4">
        <label for="input_password1" class="control-label">Contraseña *</label><br>
        <input type="password" class="form-control" id="input_password1" placeholder="Escriba su contraseña">
        <span style="font-size: 14px;">Todos los datos se los enviaremos al correo electrónico</span>
    </div>

    <div class="col-lg-4">
        <label for="input_password2" class="control-label">Repita su contraseña *</label><br>
        <input type="password" class="form-control" id="input_password2" placeholder="Repita su contraseña">
    </div>
</div>

<div id="cont_pagos" class="well row">
    <div class="col-lg-6">
        <label for="input_consignacion" class="control-label">Número consignación</label>
        <input type="text" class="form-control" id="input_consignacion" placeholder="Escriba el número de consignación">
    </div>

    <div class="col-lg-6">
        <label for="input_empresa" class="control-label">Empresa por la que consignó</label>
        <input type="text" class="form-control" id="input_empresa" placeholder="Escriba la emprea por la que consignó">
    </div>
</div>

<div id="cont_cheques" class="well row oculto">
    <div class="col-lg-6">
        <label for="input_codigo_cheque" class="control-label">Código del bono CP *</label>
        <input type="text" class="form-control" id="input_codigo_cheque" placeholder="Obligatorio">
    </div>

    <div class="col-lg-6">
        <label for="input_clave_cheque" class="control-label">Clave en letras *</label>
        <input type="text" class="form-control" id="input_clave_cheque" placeholder="Obligatorio">
    </div>

    <!-- <div class="col-lg-4">
        <label for="input_codigo_asesor" class="control-label">Código <span id="nombre_patrocinio">asesor</span> *</label>
        <input type="text" class="form-control" id="input_codigo_asesor" placeholder="Obligatorio">
    </div> -->
</div>

<button type="button" id="guardar_registro" class="btn btn-success btn-block">Guardar registro</button><br>

<script type="text/javascript">
    /**
     * Autorizar
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
            // mostrar_exito($("#mensajes"), "Le ha generado el código de empleo " + codigo_empleo + " correctamente. Se le ha enviado un correo electrónico notificándole.");
        } // if codigo de empleo
    } // autorizar

    $(document).ready(function(){
        // Inicialización de la tabla
        $('#tabla').dataTable( {
            "bProcessing": true,
        }); // Tabla

        // Cuando cambie la opción de cheque
        $('input:radio[name=metodo_afiliacion]').change(function () {
            // Se recogen variables
            var tipo_cheque = $(this).val();

            // Si es cheque pagado o prestado
            if (tipo_cheque == "cheque_pagado") {
                // Se activa la interfaz
                $("#cont_cheques").show("slow");
                $("#cont_pagos").hide("slow");
            }else{
                // Se oculta la interfaz
                $("#cont_cheques").hide("slow");
                $("#cont_pagos").show("slow");
            }

            // Si es patrocinador
            // if (tipo_cheque == "patrocinador") {
            //     $("#nombre_patrocinio").text("patrocinador");
            //     $("#cont_cheques").show("slow");
            // }else{
            //     $("#nombre_patrocinio").text("asesor");
            // }
        }); // change

        //Al presionar botón registro con cheque
        $("#guardar_registro").on("click", function(){
            //Declaración de variables
            var nombre = $("#input_nombre");    
            var cedula = $("#input_cedula");
            var email = $("#input_email");
            var password1 = $("#input_password1");
            var password2 = $("#input_password2");
            var telefono = $("#input_telefono");
            var direccion = $("#input_direccion");
            var consignacion = $("#input_consignacion");
            var empresa = $("#input_empresa");
            var id_municipio = $("#municipio");

            // Datos del cheque
            var tipo_cheque = $('input:radio[name=metodo_afiliacion]:checked');
            var codigo_cheque = $("#input_codigo_cheque");
            var clave_cheque = $("#input_clave_cheque");

            //Campos obligatorios a validar
            var campos_vacios = new Array(
                nombre.val(), 
                cedula.val(), 
                email.val(),
                password1.val(),
                password2.val(),
                telefono.val(),
                id_municipio.val()
            );
            // console.log(campos_vacios);

            //Campos obligatorios a validar del cheque
            var campos_vacios_cheques = new Array(
                codigo_cheque.val(),
                clave_cheque.val()
            );

            // si no supera la validación
            if (!validar_campos_vacios(campos_vacios)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor diligencie todos los campos marcados con *");

                return false;
            }

            // Si es un cheque pagado o prestado
            if(tipo_cheque.val() == "cheque_pagado") {
                // Si hay campos que no se han llenado
                if(!validar_campos_vacios(campos_vacios_cheques)){
                    //Se muestra el error
                    alert("Por favor diligencie todos los campos del cheque.");

                    return false;
                }

                datos_cheque = {
                    "Codigo_Cheque" :codigo_cheque.val(),
                    "Clave" :clave_cheque.val()
                }
                // console.log(datos_cheque);

                // Se consultan los datos del cheque en la base de datos
                id_cheque = ajax("<?php echo site_url('cheque/validar'); ?>", {'datos': datos_cheque, 'tipo': 'bienvenido'}, 'html');
                // console.log(id_cheque);

                // Si no existe el cheque
                if (id_cheque == 0) {
                    alert("Los datos del cheque no existen. No puede afiliarse con este cheque.");

                    return false;
                };
            }

            // Si no coincide los cheques
            if (!validar_claves(password1, password2)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Las contraseñas no coinciden. Por favor verifique.");

                return false;
            }

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
                    'Codigo_Afiliacion': codigo_afiliacion,
                    'Codigo_Empleo': 'Pendiente',
                    'Direccion': direccion.val(),
                    'Email': email.val(),
                    'Fecha_Registro': "<?php echo date('Y-m-d') ?>",
                    'Nombre': nombre.val(),
                    'Fk_Id_Municipio': id_municipio.val(),
                    'Password': password1.val(),
                    'Telefono': telefono.val(),
                    'Consignacion': consignacion.val(),
                    'Empresa': empresa.val()
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

                    // Se inactiva el botón
                    $("#guardar_registro").attr('disabled', true);

                    //Se muestra el mensaje de exito
                    mostrar_exito($("#mensajes"), "¡Se ha afiliado correctamente! Le hemos enviado a su correo electrónico el código de afiliación y la contraseña con la que ingresará a partir de ahora. <h1>Su código de afiliación es " + codigo_afiliacion + "</h1>");

                    // Si tiene datos de cheque
                    if(tipo_cheque.val() == "cheque_pagado") {
                        // Si se asocia el cheque al usuario correctamente
                        actualizar = ajax("<?php echo site_url('cheque/actualizar_cheque_usuario'); ?>", {"id_usuario": usuario, "id_cheque": id_cheque}, 'html');
                        
                        // Si se actualiza
                        if (actualizar) {
                            // Se autoriza
                            autorizar(usuario);
                        };
                    }
                }// if usuario guardado
            } // if codigo de afiliación
        });//Fin guardar

        // Evento change
        $("#departamento").on("change", function(){
            // Se limpia el select
            $("#municipio").html('').append("<option value=''>Seleccione...</option>");

            // Si se selecciona un valor
            if($(this).val() != ""){
                // Se consultan los municipios
                municipios = ajax("<?php echo site_url('administracion/cargar_municipios'); ?>", {"id_departamento": $(this).val()}, 'JSON');
                // console.log(municipios);

                // Si hay municipios
                if (municipios.length > 0) {
                    //Se recorren las municipios
                    $.each(municipios, function(key, val){
                        //Se agrega cada entidad al select
                        $("#municipio").append("<option value='" + val.Pk_Id + "'>" + val.Nombre + "</option>");
                    })//Fin each
                } // if
            } // if
        }); // clic
    });//Fin document.ready
</script>