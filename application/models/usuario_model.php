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
				$this->db->where('Pk_Id_Usuario', $id_usuario);
		        
		        // Si se guarda
		        if($this->db->update('tbl_usuarios', array('Codigo_Empleo', $codigo_empleo))){
		            //Retorna verdadero
		            return 'true';
		        } // if

				break;		
		} // suiche
	} // actualizar

	function listar($tipo){
		// suiche para cada tipo
		switch ($tipo) {
			//Cuando son afiliados
			case 'afiliados':
				$this->db->where('Codigo_Empleo IS NOT NULL', null, false);
				break;

			//Cuando no se han afiliado aun
			case 'pendientes':
				$this->db->where('Codigo_Empleo IS NULL', null, false);
				break;			
		} // suiche
		
		//Se retorna la consulta con todos los campos
		$this->db->select('*');
		return $this->db->get('tbl_usuarios')->result();
	} // listar
}
/* Fin del archivo registro_model.php */
/* Ubicación: ./application/models/usuario_model.php */