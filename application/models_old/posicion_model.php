<?php
/**
 * Modelo encargado de gestionar la información de
 * las posiciones del usuario
 * 
 * @author 		       John Arley Cano Salinas
 */
Class Posicion_model extends CI_Model{
	function obtener_posicion($id_usuario){
		$sql = 
		"SELECT
		autorizaciones.Id_Padre,
		autorizaciones.Autorizado_Padre,
		autorizaciones.Id_Abuelo,
		autorizaciones.Autorizado_Abuelo,
		autorizaciones.Id_Fundacion,
		autorizaciones.Autorizado_Fundacion
		FROM
		autorizaciones
		WHERE
		autorizaciones.Fk_Id_Usuario = {$id_usuario}";

		return $this->db->query($sql)->row();
	}

	function obtener_info($id_usuario){
		$this->db->select('*');
		$this->db->where('Pk_Id_Usuario', $id_usuario);

		return $this->db->get('tbl_usuarios')->row();
	}


	function obtener_datos($tipo, $id_usuario){
		switch ($tipo) {
			case 'padre':
				$sql =
				"SELECT
					tbl_usuarios.Pk_Id_Usuario,
					tbl_usuarios.Nombre,
					tbl_usuarios.Email
				FROM
					tbl_usuarios
				WHERE
					tbl_usuarios.Pk_Id_Usuario = (SELECT
					autorizaciones.Padre
				FROM
					autorizaciones
					INNER JOIN tbl_usuarios ON autorizaciones.Fk_Id_Usuario = tbl_usuarios.Pk_Id_Usuario
				WHERE
					tbl_usuarios.Pk_Id_Usuario = {$id_usuario})";
	
				return $this->db->query($sql)->row();
			break;
		}
	}
}
/* Fin del archivo posicion_model.php */
/* Ubicación: ./application/models/posicion_model.php */