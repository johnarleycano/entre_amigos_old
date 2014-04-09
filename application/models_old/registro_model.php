<?php
/**
 * Modelo encargado de gestionar tel registro de los usuarios
 * 
 * @author 		       John Arley Cano Salinas
 */
Class Registro_model extends CI_Model{
	function guardar($tipo, $datos){
		switch ($tipo) {
			case 'registro':
				//Si se insertan bien
				if ($this->db->insert('tbl_usuarios', $datos)) {
					return true;
				} else {
					return false;
				}
				break;
			
			case 'autorizacion':
				//Si se insertan bien
				if ($this->db->insert('autorizaciones', $datos)) {
					return true;
				} else {
					return false;
				}
				break;
			case 'pre_registro':
				//Si se insertan bien
				if ($this->db->insert('pre_registros', $datos)) {
					return true;
				} else {
					return false;
				}
				break;
		}
		
	}

	function validar_codigo_empleo($codigo){
		//Se consulta el código
		$this->db->where('Codigo_Empleo', $codigo);

		//Si existe
		if ($this->db->get('tbl_usuarios')->row()) {
			//Retorna true
			return true;
		} else {
			//Retorna tfalse
			return false;
		}
	}

	function validar_codigo_cheque($codigo){
		//Se consulta el código
		$this->db->where('Codigo_Empleo', $codigo);

		//Si existe
		if ($this->db->get('tbl_usuarios')->row()) {
			//Retorna true
			return true;
		} else {
			//Retorna tfalse
			return false;
		}
	}

	function generar_codigo_empleo(){
		//Se crea un código
		$codigo = str_pad(rand(1, 999999), 6, 0, STR_PAD_LEFT);

		//Si el código ya existe
		if($this->validar_codigo_empleo($codigo)){
			//Vuelve a ejecutar la generación del código
			$this->generar_codigo_empleo();
		} else {
			return $codigo;
		}
	}

	function generar_codigo_cheque(){
		//Se crea un código
		$codigo = str_pad(rand(1, 9999), 4, 0, STR_PAD_LEFT);

		//Si el código ya existe
		if($this->validar_codigo_cheque($codigo)){
			//Vuelve a ejecutar la generación del código
			$this->generar_codigo_cheque();
		} else {
			return $codigo;
		}
	}

	function guardar_codigo_cheque($cheque1, $cheque2, $id_usuario){
		$this->db->where('Fk_Id_Usuario', $id_usuario);
		if ($this->db->update('autorizaciones', array("Cheque1" => $cheque1, "Cheque2" => $cheque2))) {
		 	return true;
		 } 
	}

	function validar_pre_registro($datos){
		$this->db->where('Numero', $datos['Numero']);
		$this->db->where('Codigo', $datos['Codigo']);
		$this->db->where('Numero_Consignacion', $datos['Numero_Consignacion']);

		//Si devuelve datos
		if (count($this->db->get('pre_registros')->row()) > 0) {
			//Retorna verdadero
        	return true;
        } else {
        	//Retorna falso
        	return false;
        }
	}

	function validar_cheque($numero){
		//Consulta SQL
		$sql = 
		"SELECT
			autorizaciones.Fk_Id_Usuario
		FROM
			autorizaciones
		WHERE
			autorizaciones.Cheque1 = '{$numero}' OR
			autorizaciones.Cheque2 = '{$numero}'
		LIMIT 1";

		//Recorrido para obtener valor
		foreach ($this->db->query($sql)->result() as $resultado) {
			if ($resultado->Fk_Id_Usuario) {
				return true;
			}//Fin if()
		}//Fin foreach
	}

	function datos_usuario($id_usuario){
		$this->db->where('Pk_Id_Usuario', $id_usuario);
		$this->db->select('*');

		return $this->db->get('tbl_usuarios')->row();
	}
}
/* Fin del archivo registro_model.php */
/* Ubicación: ./application/models/registro_model.php */