<!-- Tabla -->
<table id="tbl_usuarios">
    <thead>
        <th>Nombre</th>
        <th>Cédula</th>
        <th>Ciudad</th>
        <th>Código de Afiliacion</th>
        <th>Código de Empleo</th>
        <th>Teléfono</th>
        <th>Dirección</th>
        <th>Opciones</th>
    </thead>
    <tbody>
        <?php
        // se recorren los usuarios
        foreach ($usuarios as $usuario) {
        ?>
            <tr>
                <td>
                    <?php if($usuario->Codigo_Empleo){ ?>
                        <!-- Afiliados -->
                        <span class="glyphicon glyphicon-ok" title="Autorizado"></span>
                    <?php }else{ ?>
                        <!-- desafiliados -->
                        <span class="glyphicon glyphicon-remove" title="Pendiente de autorización"></span>
                    <?php } ?>
                    <?php echo $usuario->Nombre; ?>
                </td>
                <td><?php echo $usuario->Cedula; ?></td>
                <td><?php echo $usuario->Ciudad; ?></td>
                <td><?php echo $usuario->Codigo_Afiliacion; ?></td>
                <td><?php echo $usuario->Codigo_Empleo; ?></td>
                <td><?php echo $usuario->Telefono; ?></td>
                <td><?php echo $usuario->Direccion; ?></td>
                <td>
                    <?php if($usuario->Codigo_Empleo){ ?>
                        <!-- Afiliar -->
                        <a href="javascript:desafiliar('<?php echo $usuario->Pk_Id_Usuario; ?>')">
                            <span class="glyphicon glyphicon-import" title="Quitar autorización"></span>
                        </a>
                    <?php }else{ ?>
                        <!-- Desafiliar -->
                        <a href="javascript:autorizar('<?php echo $usuario->Pk_Id_Usuario; ?>')">
                            <span class="glyphicon glyphicon-thumbs-up" title="Autorizar y generar código de empleo"></span>
                        </a>
                    <?php } ?>
                </td>
            </tr>
        <?php
        } // foreach
        ?>
    </tbody>
</table><!-- Tabla -->

<script>
    // Cuando el documento esté listo
    $(document).ready(function(){
        // Inicialización de la tabla
        $('#tbl_usuarios').dataTable( {
            "bProcessing": true
        }); // Tabla


    });// document.ready
</script>
