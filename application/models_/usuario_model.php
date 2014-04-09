<?php
/**
 * Modelo encargado de gestionar la información de
 * los usuarios
 * 
 * @author 		       John Arley Cano Salinas
 */
Class Usuario_model extends CI_Model{
	function validar($codigo_empleo, $password){
		$this->db->select('Pk_Id_Usuario');
		$this->db->select('Codigo_Empleo');
		$this->db->select('Codigo_Empleo_Especial');
		$this->db->select('Nombre');
		$this->db->select('Email');

		//Se validan el codigo y el password ingresados
        $this->db->where('Codigo_Empleo', $codigo_empleo);
        $this->db->where('Password', $password);
        
        if ($this->db->get('tbl_usuarios')->row() != 1) {
        	return $this->db->get('tbl_usuarios')->row();
        } else {
        	return false;
        }
	}
}
/* Fin del archivo registro_model.php */
/* Ubicación: ./application/models/registro_model.php */