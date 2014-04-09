<?php
$id_usuario = $this->session->userdata('Pk_Id_Usuario');

//Si ya inició sesión
if($id_usuario){
    //Consulta las autorizaciones y ids necesarios
    $fundacion = $this->autorizacion_model->validar_autorizacion("fundacion", $id_usuario);
    $padre =  $this->autorizacion_model->consultar_padre($id_usuario);
    if (count($padre) == 1) {
        $abuelo = $this->autorizacion_model->consultar_padre($padre->Fk_Id_Padre);
        $autorizacion_abuelo = $this->autorizacion_model->validar_autorizacion("abuelo", $id_usuario);
    }
}
?>

<!-- Si no ha iniciado sesión -->
<?php if(!$id_usuario){ ?>
    <div class="alert alert-info">Por favor inicie sesión con su código y su contraseña para poder ver su posición en el programa</div>
<?php } else { ?>
    <div id="posicion" class="row">
        <!-- Fundación -->
        <div class="col-md-4">
            <!-- Si trae datos de la fundación, quiere decir que ya ha sido autorizado -->
            <?php if ($fundacion->Autorizado == "1"){ ?>
            <div class="alert alert-success">
                <h1><center>Fundación</center></h1>
                <h3>Ya ha sido autorizado <br>
                <small>Ya cuenta con la autorización de la fundación</small></h3>
            <?php } else { ?>
            <div class="alert alert-danger">
                <h1><center>Fundación</center></h1>
                <h3>Aun no está autorizado <br>
                <small>Aun no ha recibido la autorización por parte de la fundación</small></h3>
            <?php  } ?>
            </div>
        </div>

        <!-- Padre -->
        <div class="col-md-4">
            <?php if(count($padre) == 1){ ?>
            <div class="alert alert-success">
                <h1><center>Padre</center></h1>
                <h3>Ya ha sido autorizado <br>
                <small>Ya está autorizado. Ahora puede obtener sus datos</small></h3>
                <p><span class="glyphicon glyphicon-user"></span> <?php echo $padre->Nombre; ?></p>
                <p><span class="glyphicon glyphicon-road"></span> <?php echo $padre->Ciudad; ?></p>
                <p><span class="glyphicon glyphicon-earphone"></span> <?php echo $padre->Telefono; ?></p>
                <p><span class="glyphicon glyphicon-envelope"></span> <?php echo $padre->Email; ?></p>
                <p><span class="glyphicon glyphicon-home"></span> <?php echo $padre->Direccion; ?></p>
            <?php } else { ?>
            <div class="alert alert-danger">
                <h1><center>Padre</center></h1>
                <h3>Aun no está autorizado <br>
                <small>Cuando su padre lo autorice, entonces pordrá ver sus datos,  su autorización y los datos de su abuelo</small></h3>
            <?php } ?>
            </div>
        </div>

        <!-- Abuelo -->
        <div class="col-md-4">
            <?php
            if (count($padre) == 1){
                if(($autorizacion_abuelo->Autorizado == "1")){
                ?>
                    <div class="alert alert-success">
                        <h1><center>Abuelo</center></h1>
                        <h3>Ya ha sido autorizado<br>
                        <small>Usted ya cuenta con la autorización de su abuelo.</small></h3>
                <?php
                } else {
                ?>
                    <div class="alert alert-danger">
                        <h1><center>Abuelo</center></h1>
                        <h3>Aun no ha sido autorizado<br>
                        <small>Usted ya cuenta con llos datos de su abuelo, pero aun no ha sido autorizado.</small></h3>
                <?php } ?>
                <p><span class="glyphicon glyphicon-user"></span> <?php echo $abuelo->Nombre; ?></p>
                <p><span class="glyphicon glyphicon-road"></span> <?php echo $abuelo->Ciudad; ?></p>
                <p><span class="glyphicon glyphicon-earphone"></span> <?php echo $abuelo->Telefono; ?></p>
                <p><span class="glyphicon glyphicon-envelope"></span> <?php echo $abuelo->Email; ?></p>
                <p><span class="glyphicon glyphicon-home"></span> <?php echo $abuelo->Direccion; ?></p>
            <?php } else { ?>
            <div class="alert alert-danger">
                <h1><center>Abuelo</center></h1>
                <h3>Aun no está autorizado<br>
                <small>Cuando su padre lo autorice, podrá ver los datos de su abuelo. De ese modo, él podrá autorizarlo posteriormente.</small>
            <?php } ?>
            
                
                <!-- <h3><?php /*echo $abuelo->Nombre;*/ ?> <small>Secondary text</small></h3> -->
            </div>
        </div>
    </div>
<?php } ?>