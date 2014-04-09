<?php
$valor = 0;
$id_usuario = $this->session->userdata('Pk_Id_Usuario');
if($id_usuario){
    //Se consultan las tres autorizaciones
    $autorizacion = $this->autorizacion_model->validar_autorizacion("todas", $id_usuario); 
    //Validaciones
    if ($autorizacion->Padre > 0) {
        $valor = $valor  + 1;
    }
    if ($autorizacion->Abuelo > 0) {
        $valor = $valor  + 1;
    }
    if ($autorizacion->Fundacion > 0){
        $valor = $valor  + 1;    
    }
}
?>
<input id="codigo" type="hidden">
<div class="row">
    <div class="col-lg-6">
        <?php if(!$id_usuario){ ?>
            <div class="alert alert-info">Por favor inicie sesión con su código y su contraseña para poder autorizar</div>
        <?php } else if(!$this->autorizacion_model->permitir($this->session->userdata('Pk_Id_Usuario'))){ ?>
            <div class="alert alert-info">Usted aun no puede autorizar. Debe primero recibir la autorización de su padre, su abuelo y la fundación.</div>
        <?php } else if($valor != 3) { ?>
            <div class="alert alert-info">Para poder autorizar, primero debe estar autorizado por su padre, su abuelo y por la fundación. Si quiere ver quién lo ha autorizado, por favor <a href="<?php echo site_url('posicion') ?>">Haga clic aquí</a></div>
        <?php } else { ?>
            <div class="input-group">
                <input type="text" id="input_codigo_empleo" class="form-control" placeholder="Escriba el código de empleo" autofocus />
                <span class="input-group-btn">
                    <button id="btn_buscar" class="btn btn-default" type="button">Buscar</button>
                </span>
            </div><!-- /input-group -->
        <?php } ?>
    </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
<div class="col-lg-6">
    <div id="buscar_codigo" class="input-group"></div>
</div><!-- /.col-lg-6 -->
<script type="text/javascript">
    $(document).ready(function(){
        //Botón buscar
        $("#btn_buscar").on("click", function(){ 
            //Ejecutamos la función
            buscar_codigo_empleo(String($("#input_codigo_empleo").val()));
        })
    });
</script>