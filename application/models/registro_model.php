<?php
/**
 * Modelo encargado de gestionar tel registro de los usuarios
 * 
 * @author 		       John Arley Cano Salinas
 */
Class Registro_model extends CI_Model{
	function cargar_cheques(){
		$this->db->select('*');
		return $this->db->get('cheques')->result();
	}

	function validar_codigo_afiliacion($codigo){
		//Se consulta el código
		$this->db->where('Codigo_Afiliacion', $codigo);

		$resultado = $this->db->get('tbl_usuarios')->row();

		//Si existe
		if (count($resultado) == 1) {
			//Retorna true
			return 'true';
		} else {
			//Retorna tfalse
			return 'false';
		}
	}

	function validar_codigo_empleo($codigo){
		//Se consulta el código
		$this->db->where('Codigo_Empleo', $codigo);

		$resultado = $this->db->get('tbl_usuarios')->row();

		//Si existe
		if (count($resultado) == 1) {
			//Retorna true
			return 'true';
		} else {
			//Retorna tfalse
			return 'false';
		}
	} // validar_codigo_empleo
	
	function generar_codigo_afiliacion(){
		//Se crea un código
		$codigo = str_pad(rand(1, 999999), 6, 0, STR_PAD_LEFT);

		//Si el código ya existe
		if($this->validar_codigo_afiliacion($codigo) == "true"){
			return "false";
		} else {
			return $codigo;
		}
	} // generar_codigo_afiliacion

	function generar_codigo_empleo(){
		//Se crea un código
		$codigo = str_pad(rand(1, 999999), 6, 0, STR_PAD_LEFT)."CE";

		//Si el código ya existe
		if($this->validar_codigo_empleo($codigo) == "true"){
			return "false";
		} else {
			return $codigo;
		}
	} // generar_codigo_empleo

	function guardar($tipo, $datos){
		switch ($tipo) {
			case 'registro':
				//Si se insertan bien
				if ($this->db->insert('tbl_usuarios', $datos)) {
					return 'true';
				} else {
					return 'false';
				}
				break;

			case 'cheque':
				//Si se insertan bien
				if ($this->db->insert('cheques', $datos)) {
					return 'true';
				} else {
					return 'false';
				}
				break;
			
			/*case 'autorizacion':
				//Si se insertan bien
				if ($this->db->insert('autorizaciones', $datos)) {
					return true;
				} else {
					return false;
				}
				break;*/

			/*case 'pre_registro':
				//Si se insertan bien
				if ($this->db->insert('pre_registros', $datos)) {
					return true;
				} else {
					return false;
				}
				break;*/
		}
		
	} // guardar
}	
/* Fin del archivo registro_model.php */
/* Ubicación: ./application/models/registro_model.php */