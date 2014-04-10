<!-- Caja de mensajes -->
<div id="mensajes"></div>

<!-- Tabla -->
<table id="tbl_usuarios">
    <thead>
        <th>Nombre</th>
        <th>Cédula</th>
        <th>Ciudad</th>
        <th>Código de Afiliacion</th>
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
                        <span class="glyphicon glyphicon-ok" title="Afiliado"></span>
                    <?php }else{ ?>
                        <!-- desafiliados -->
                        <span class="glyphicon glyphicon-remove" title="Pendiente"></span>
                    <?php } ?>
                    <?php echo $usuario->Nombre; ?>
                </td>
                <td><?php echo $usuario->Cedula; ?></td>
                <td><?php echo $usuario->Ciudad; ?></td>
                <td><?php echo $usuario->Codigo_Afiliacion; ?></td>
                <td><?php echo $usuario->Telefono; ?></td>
                <td><?php echo $usuario->Direccion; ?></td>
                <td>
                    <?php if($usuario->Codigo_Empleo){ ?>
                        <!-- Afiliar -->
                        <a href="javascript:desafiliar('<?php echo $usuario->Pk_Id_Usuario; ?>')">
                            <span class="glyphicon glyphicon-import" title="Desafiliar"></span>
                        </a>
                    <?php }else{ ?>
                        <!-- Desafiliar -->
                        <a href="javascript:afiliar('<?php echo $usuario->Pk_Id_Usuario; ?>')">
                            <span class="glyphicon glyphicon-thumbs-up" title="Generar código de empleo"></span>
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
