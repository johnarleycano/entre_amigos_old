<?php
/**
 * Modelo encargado de gestionar la información de
 * los usuarios
 * 
 * @author 		       John Arley Cano Salinas
 */
Class Usuario_model extends CI_Model{
	function actualizar($tipo, $id_usuario, $codigo_empleo){
		// suiche para cada tipo
		switch ($tipo) {
			//Cuando son afiliados
			case 'codigo_empleo':
				$sql =  "UPDATE tbl_usuarios SET Codigo_Empleo = '{$codigo_empleo}' WHERE Pk_Id_Usuario = {$id_usuario}";
				return $this->db->query($sql)->result();
				break;	
		} // suiche
	} // actualizar

	function consultar_datos($id_usuario){
		$this->db->select('Nombre');
		$this->db->select('Codigo_Empleo');
		$this->db->select('Email');

		$this->db->where('Pk_Id_Usuario', $id_usuario);
		return $this->db->get('tbl_usuarios')->row();
	}

	function listar($tipo){
		if($tipo == 'afiliados'){
			$condicion = "WHERE tbl_usuarios.Codigo_Empleo <> 'Pendiente'";
		}
		if($tipo == 'pendientes'){
			$condicion = "WHERE tbl_usuarios.Codigo_Empleo = 'Pendiente'";
		}
		if($tipo == 'todos'){
			$condicion = "";
		}

		$sql =
		"SELECT
		tbl_usuarios.Pk_Id_Usuario,
		tbl_usuarios.Nombre,
		tbl_usuarios.Ciudad,
		tbl_usuarios.Codigo_Afiliacion,
		tbl_usuarios.Codigo_Empleo,
		tbl_usuarios.Telefono,
		cheques.Numero AS Numero_Cheque,
		cheques.Clave,
		cheques.Tipo_Consignacion,
		cheques.Numero_Consignacion
		FROM
		tbl_usuarios
		LEFT JOIN cheques ON cheques.Fk_Id_Usuario = tbl_usuarios.Pk_Id_Usuario
		{$condicion}";
		
		return $this->db->query($sql)->result();
	} // listar

	function validar($datos){
		//Campos a retornar
		$this->db->select('Pk_Id_Usuario');
		$this->db->select('Codigo_Afiliacion');
		$this->db->select('Codigo_Empleo');
		$this->db->select('Nombre');
		$this->db->select('Email');
		$this->db->select('Tipo');

		//Se validan el codigo y el password ingresados
        $this->db->where('Codigo_Afiliacion', $datos['Codigo_Afiliacion']);
        $this->db->where('Password', $datos['Password']);

        //Se ejecuta la consulta
        $resultado = $this->db->get('tbl_usuarios')->row();
        
        //Si lo encuentra
        if (count($resultado) == 1) {
        	//Se devuelve el arreglo
        	return $resultado;
        } else {
        	//Se devuelve falso
        	return 'false';
        }// if
	} // validar
}
/* Fin del archivo registro_model.php */
/* Ubicación: ./application/models/usuario_model.php */