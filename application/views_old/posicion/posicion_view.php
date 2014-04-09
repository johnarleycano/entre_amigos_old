<?php
//Se toma el id del usuario
$id_usuario = $this->session->userdata('Pk_Id_Usuario');

if(!$id_usuario){
?>
<div class="alert alert-info">Por favor inicie sesión con su código y su contraseña para poder ver su posición en el programa</div>

<?php 
} else {
//Se toman los datos de la autorizacion
$autorizacion = $this->posicion_model->obtener_posicion($id_usuario);
?>
    <!-- Padre -->
    <div class="col-md-4">
        <?php
        $padre = $this->posicion_model->obtener_info($autorizacion->Id_Padre);

        if(count($padre) > 0) {
            if($autorizacion->Autorizado_Padre == "1"){ ?>
                <div id="padre" class="alert alert-success">   
            <?php } else { ?>
                <div id="padre" class="alert alert-info">
            <?php } ?>
                <h1>
                    <center>Padre</center>
                    <h3>
                        Usteh ha sido o no autorizado
                        <small>Aquí especificaremos</small>
                    </h3>
                    <p><span class="glyphicon glyphicon-user"></span> <?php echo $padre->Nombre; ?></p>
                    <p><span class="glyphicon glyphicon-road"></span> <?php echo $padre->Ciudad; ?></p>
                    <p><span class="glyphicon glyphicon-earphone"></span> <?php echo $padre->Telefono; ?></p>
                    <p><span class="glyphicon glyphicon-envelope"></span> <?php echo $padre->Email; ?></p>
                    <p><span class="glyphicon glyphicon-home"></span> <?php echo $padre->Direccion; ?></p>
                </h1>
            </div>
        <?php } else { ?>
            <div id="padre" class="alert alert-danger">
                <h1>
                    <center>Padre</center>
                    <h3>
                        Aun no está autorizado<br>
                        <small>Debe ser autorizado por su padre.</small>
                    </h3>
                    <p><span class="glyphicon glyphicon-user"></span></p>
                    <p><span class="glyphicon glyphicon-road"></span></p>
                    <p><span class="glyphicon glyphicon-earphone"></span></p>
                    <p><span class="glyphicon glyphicon-envelope"></span></p>
                    <p><span class="glyphicon glyphicon-home"></span></p>
                </h1>
            </div>
        <?php } ?>
    </div>

    <!-- Abuelo -->
    <div class="col-md-4">
        <?php
        $abuelo = $this->posicion_model->obtener_info($autorizacion->Id_Abuelo);
        if(count($abuelo) > 0) {
            if($autorizacion->Autorizado_Abuelo == "1"){ ?>
                <div id="abuelo" class="alert alert-success">   
            <?php } else { ?>
                <div id="abuelo" class="alert alert-info">
            <?php } ?>
            <h1>
                <center>Abuelo</center>
                <h3>
                    Usteh ha sido o no autorizado
                    <small>Aquí especificaremos</small>
                </h3>
                <p><span class="glyphicon glyphicon-user"></span> <?php echo $abuelo->Nombre; ?></p>
                <p><span class="glyphicon glyphicon-road"></span> <?php echo $abuelo->Ciudad; ?></p>
                <p><span class="glyphicon glyphicon-earphone"></span> <?php echo $abuelo->Telefono; ?></p>
                <p><span class="glyphicon glyphicon-envelope"></span> <?php echo $abuelo->Email; ?></p>
                <p><span class="glyphicon glyphicon-home"></span> <?php echo $abuelo->Direccion; ?></p>
            </h1>
        </div>
        <?php } else { ?>
        <div id="abuelo" class="alert alert-danger">
            <h1>
                <center>Abuelo</center>
                <h3>
                    Aun no está autorizado<br>
                    <small>Debe ser autorizado por su padre.</small>
                </h3>
                <p><span class="glyphicon glyphicon-user"></span></p>
                <p><span class="glyphicon glyphicon-road"></span></p>
                <p><span class="glyphicon glyphicon-earphone"></span></p>
                <p><span class="glyphicon glyphicon-envelope"></span></p>
                <p><span class="glyphicon glyphicon-home"></span></p>
            </h1>
        </div>
        <?php } ?>
    </div>

    <!-- Fundacion -->
    <div class="col-md-4">
        <?php
        $fundacion = $this->posicion_model->obtener_info($autorizacion->Id_Fundacion);
        if(count($fundacion) > 0) {
            if($autorizacion->Autorizado_Fundacion == "1"){ ?>
                <div id="fundacion" class="alert alert-success">   
            <?php } else { ?>
                <div id="fundacion" class="alert alert-info">
            <?php } ?>
            <h1>
                <center>Fundación</center>
                <h3>
                    Usteh ha sido o no autorizado
                    <small>Aquí especificaremos</small>
                </h3>
                <p><span class="glyphicon glyphicon-user"></span> <?php echo $fundacion->Nombre; ?></p>
                <p><span class="glyphicon glyphicon-road"></span> <?php echo $fundacion->Ciudad; ?></p>
                <p><span class="glyphicon glyphicon-earphone"></span> <?php echo $fundacion->Telefono; ?></p>
                <p><span class="glyphicon glyphicon-envelope"></span> <?php echo $fundacion->Email; ?></p>
                <p><span class="glyphicon glyphicon-home"></span> <?php echo $fundacion->Direccion; ?></p>
            </h1>
        </div>
        <?php } else { ?>
        <div id="fundacion" class="alert alert-danger">
            <h1>
                <center>Fundación</center>
                <h3>
                    Aun no está autorizado<br>
                    <small>Debe ser autorizado por su padre.</small>
                </h3>
                <p><span class="glyphicon glyphicon-user"></span></p>
                <p><span class="glyphicon glyphicon-road"></span></p>
                <p><span class="glyphicon glyphicon-earphone"></span></p>
                <p><span class="glyphicon glyphicon-envelope"></span></p>
                <p><span class="glyphicon glyphicon-home"></span></p>
            </h1>
        </div>
        <?php } ?>
    </div>
<?php } ?>