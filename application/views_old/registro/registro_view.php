<div class="col-lg-6">
    <div class="well">
        <!-- Datos generales -->
        <label for="input_nombre" class="control-label">Nombre *</label>
        <input type="text" class="form-control" id="input_nombre" placeholder="Escriba su nombre completo" autofocus>

        <label for="input_cedula" class="control-label">Cédula *</label>
        <input type="text" class="form-control" id="input_cedula" placeholder="Digite sólo números">

        <label for="input_ciudad" class="control-label">Ciudad *</label>
        <input type="text" class="form-control" id="input_ciudad" placeholder="Escriba la ciudad">

        <label for="input_email" class="control-label">Correo electrónico *</label>
        <input type="text" class="form-control" id="input_email" placeholder="Escriba el correo electrónico">
        
        <label for="input_telefono" class="control-label">Teléfono*</label>
        <input type="text" class="form-control" id="input_telefono" placeholder="Escriba el número telefónico">

        <label for="input_password1" class="control-label">Contraseña *</label><br>
        <input type="password" class="form-control" id="input_password1" placeholder="Escriba su contraseña">
        <input type="password" class="form-control" id="input_password2" placeholder="Repita su contraseña">

        <label for="input_direccion" class="control-label">Dirección (opcional)</label>
        <input type="text" class="form-control" id="input_direccion" placeholder="Digite su dirección">
    </div>
</div>

<!-- Datos de cheque -->
<div class="col-lg-6">
    <label for="cheque" class="control-label">¿Tiene un cheque? Seleccione el tipo de cheque que tiene</label>
    <select id="cheque" class="form-control input-lg">
        <option value="0">Seleccione una opción</option>
        <option value="0">No tengo cheque</option>
        <option value="1">Si, de $350.000</option>
        <option value="2">Si, de $150.000</option>
    </select><br>

    <div id="cheque1" class="oculto">
        <label for="input_numero_cheque" class="col-sm-12 control-label"><p>Digite por favor los datos del cheque y el pago para poder registrarse y quedar autorizado automáticamente por la fundación</p></label>  
        <div class="col-lg-4">
            <input type="text" class="form-control" id="input_numero_cheque" placeholder="Número del cheque">
        </div>
        <div class="col-lg-4">
            <input type="text" class="form-control" id="input_codigo_cheque" placeholder="Código del cheque">
        </div>
        <div class="col-lg-4">
            <input type="text" class="form-control" id="input_numero_consignacion" placeholder="Núm. consignación">
        </div>
    </div>

    <div id="cheque2" class="oculto">
        <label for="input_numero_cheque" class="col-sm-12 control-label"><p>Digite por favor los datos del cheque y el pago para poder registrarse y quedar autorizado automáticamente por la fundación</p></label>
        <input type="text" class="form-control" id="input_numero_cheque_2" placeholder="Número del cheque">
    </div>

    <button type="button" id="guardar_registro" class="btn btn-success btn-block">Guardar registro</button><br>
    <div id="mensajes"></div>
    <div id="mensaje_codigo1" class="col-lg-6"></div>
    <div id="mensaje_codigo2" class="col-lg-6"></div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#cheque").on("change", function(){
            if($(this).val() == "1") {
                //Oculta y muestra
                ocultar("cheque2");
                mostrar("cheque1");
            } else if($(this).val() == "2") {
                //Oculta y muestra
                ocultar("cheque1");
                mostrar("cheque2");
            }else {
                ocultar("cheque1");
                ocultar("cheque2");
            }
        });//Fin cheque change

        //Al presionar botón registro con cheque
        $("#guardar_registro").on("click", function(){
            //Recojo todos los campos
            var nombre = $("#input_nombre");    
            var cedula = $("#input_cedula");
            var ciudad = $("#input_ciudad");
            var email = $("#input_email");
            var password1 = $("#input_password1");
            var password2 = $("#input_password2");
            var telefono = $("#input_telefono");
            var direccion = $("#input_direccion");

            //Cheques
            var cheque = $("#cheque");
            var numero_cheque = $("#input_numero_cheque");
            var codigo_cheque = $("#input_codigo_cheque");
            var numero_consignacion = $("#input_numero_consignacion");
            var numero_cheque_2 = $("#input_numero_cheque_2");

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

            var campos_vacios_cheque1 = new Array(
                numero_cheque.val(),
                codigo_cheque.val(),
                numero_consignacion.val()
            );

            var campos_vacios_cheque2 = new Array(
                numero_cheque_2.val()
            );

            var datos_cheque2 = {
                numero_cheque_2: numero_cheque_2.val()
            }

            //Si no supera la validación
            if (!validar_campos_vacios(campos_vacios)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor llene los campos marcados con *");
            //Si las contraseñas no coinciden
            } else if(!validar_claves(password1, password2)){
                //Se muestra el error
                mostrar_error($("#mensajes"), "Las contraseñas no coinciden. Por favor verifique.");
            } else if(cheque.val() == "1" && !validar_campos_vacios(campos_vacios_cheque1)){
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor complete el registro de la información del cheque para poder guardar."); 
            } else if(cheque.val() == "2" && !validar_campos_vacios(campos_vacios_cheque2)) {
                //Se muestra el error
                mostrar_error($("#mensajes"), "Por favor complete el registro de la información del cheque para poder guardar."); 
            } else {
                console.log("Validación superada");
                //Datos a guardar
                var datos = {
                    nombre: nombre.val(), 
                    cedula: cedula.val(), 
                    ciudad: ciudad.val(), 
                    email: email.val(),
                    telefono: telefono.val(),
                    direccion: direccion.val(),
                    password: password1.val(),
                    cheque: cheque.val(),
                    numero_cheque: numero_cheque.val(),
                    codigo_cheque: codigo_cheque.val(),
                    numero_consignacion: numero_consignacion.val(),
                    numero_cheque_2: numero_cheque_2.val() 
                };

                //Se ejecuta el guardado
                guardar = guardar_formulario("<?php echo site_url('registro/guardar'); ?>", datos);

                //Si se realiza correctamente el guardado
                if(guardar != "false"){
                    //Consulta la informacion del usuario que acaba de guardarse
                    usuario = ajax("<?php echo site_url('registro/consultar_usuario'); ?>", {id_usuario: guardar});

                    //Se prepara un arreglo con la información que requeriremos
                    datos_email = {
                        tipo: "bienvenido",
                        nombre: usuario.Nombre,
                        codigo_empleo: usuario.Codigo_Empleo,
                        password: password1.val(),
                        destinatario: email.val()
                    }//Fin datos

                    //Se muestra el mensaje de exito
                    mostrar_exito($("#mensajes"), "¡Se ha creado su registro correctamente! Le hemos enviado a su correo electrónico el código de empleo y la contraseña con la que ingresará de ahora en adelante. <h1>Su código de empleo es " + usuario.Codigo_Empleo + "</h1>");

                    //Se envía correo electrónico con los datos
                    enviar_email(datos_email);
                } else {
                    //Se muestra el error
                    mostrar_error($("#mensajes"), "Ha ocurrido un error al guardar el registro.");
                }//Fin if guardar

                var datos_cheque1 = {
                    numero_cheque: numero_cheque.val(),
                    codigo_cheque: codigo_cheque.val(),
                    numero_consignacion: numero_consignacion.val(),
                    id_usuario: guardar
                }

                //Validamos pre-registro y cheque existente
                if(cheque.val() == "1"){
                    //Validamos pre-registro
                    validar_pre_registro = guardar_formulario("<?php echo site_url('registro/validar_pre_registro') ?>", datos_cheque1);

                    //Si existe, se autoriza automáticamente
                    if(validar_pre_registro){
                        //Se autoriza automáticamente
                        autorizar = guardar_formulario("<?php echo site_url('autorizacion/autorizacion_automatica'); ?>", datos_cheque1);

                        //Ahora crea los cheques 
                        cheques =  ajax("<?php echo site_url('registro/generar_codigo_cheque'); ?>", datos_cheque1);
                        
                        /*//Recorrido de los resultados
                        cont = 1;

                        JSON.parse(dar_cheques, function (key, value) {
                            if (cont == 1){
                                //Guardo el código de empleo
                                numero_cheque1 = value;
                            } else if(cont == 2){
                                //Guardo el id del usuario
                                numero_cheque2 = value;
                            }//Fin if

                            //Aumento el contador
                            cont++;
                        });//Fin parse*/

                        //Se prepara un arreglo con la información que requeriremos
                        datos_email = {
                            tipo: "autorizado_automatico",
                            nombre: usuario.Nombre,
                            cheque1: cheques.Cheque_1,
                            cheque2: cheques.Cheque_2,
                            destinatario: email.val()
                        }//Fin datos
                        
                        //Mensaje de los cheques
                        mostrar_exito($("#mensaje_codigo1"), "Ha sido autorizado automáticamente. Ahora dispone de este cheque para invitar una persona más: <b>" + datos_email.cheque1 + "</b>");
                        mostrar_exito($("#mensaje_codigo2"), "Ha sido autorizado automáticamente. Ahora dispone de este cheque para invitar una persona más: <b>" + datos_email.cheque2 + "</b>");

                        //Se envía correo electrónico con destinatario y tipo y dato adicional
                        enviar_email(datos_email);
                    }//Fin if
                } else if(cheque.val() == "2"){
                    //Validamos que exista el cheque
                    validar_cheque = guardar_formulario("<?php echo site_url('registro/validar_cheque') ?>", datos_cheque2);

                    //Si existe, ???
                    if(validar_cheque){
                        console.log("El cheque registrado existe en base de datos");
                    }//Fin if
                }//Fin if cheque



            }//Fin if
        });//Fin guardar
    });//Fin document.ready
</script>