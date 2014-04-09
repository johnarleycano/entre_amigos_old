<?php
/**
 * Modelo encargado de gestionar la información de
 * las autorizaciones
 * 
 * @author 		       John Arley Cano Salinas
 */
Class Autorizacion_model extends CI_Model{
	function validar_codigo_empleo($codigo_empleo){
		$this->db->select('Pk_Id_Usuario');
		$this->db->select('Codigo_Empleo');
		$this->db->select('Codigo_Empleo_Especial');
		$this->db->select('Nombre');
		$this->db->select('Email');
		$this->db->where('Codigo_Empleo', $codigo_empleo);

		return $this->db->get('tbl_usuarios')->row();
	}

	function validar_autorizacion($tipo, $id_usuario){
		switch ($tipo) {
			case 'todas':
				$sql = 
				"SELECT
					IFNULL(autorizaciones.Autorizado_Padre,0) as Padre,
					IFNULL(autorizaciones.Autorizado_Abuelo,0) as Abuelo,
					IFNULL(autorizaciones.Autorizado_Fundacion,0) as Fundacion
				FROM
					autorizaciones
				WHERE
				autorizaciones.Fk_Id_Usuario = {$id_usuario}";

				return $this->db->query($sql)->row();
				break;

			case 'fundacion':
				$sql =
				"SELECT
					autorizaciones.Autorizado_Fundacion AS Autorizado
				FROM
					autorizaciones
				WHERE
					autorizaciones.Fk_Id_Usuario = {$id_usuario}";
				return $this->db->query($sql)->row();
				break;

			case 'abuelo':
				$sql =
				"SELECT
					autorizaciones.Autorizado_Abuelo AS Autorizado
				FROM
					autorizaciones
				WHERE
					autorizaciones.Fk_Id_Usuario = {$id_usuario}";
				return $this->db->query($sql)->row();
				break;
		}
		
	}

	function obtener_id_usuario($codigo_empleo){
		$this->db->select('Pk_Id_Usuario');
		$this->db->where('Codigo_Empleo', $codigo_empleo);

		//Se recorre para extraer el id
		foreach ($this->db->get('tbl_usuarios')->result() as $resultado) {
			//Se reorna el id
			return $resultado->Pk_Id_Usuario;
		}
	}

	function validar_existencia_padre($codigo_empleo){
		$sql = 
		"SELECT
			autorizaciones.Fk_Id_Usuario,
			autorizaciones.Id_Padre
		FROM
			tbl_usuarios
			INNER JOIN autorizaciones ON autorizaciones.Fk_Id_Usuario = tbl_usuarios.Pk_Id_Usuario
		WHERE
			tbl_usuarios.Codigo_Empleo = '{$codigo_empleo}'";

		return $this->db->query($sql)->row();
	}
	
	function autorizar($tipo, $id_usuario, $id){
		switch ($tipo) {
			case 'fundacion':
				$this->db->where('Fk_Id_Usuario', $id_usuario);
				$this->db->update('autorizaciones', array("Autorizado_Fundacion" => "1"));
				break;

			case 'abuelo':
				$this->db->where('Fk_Id_Usuario', $id_usuario);
				$this->db->update('autorizaciones', array("Autorizado_Abuelo" => "1", "Id_Abuelo" => $id));
				break;

			case 'padre':
				$this->db->where('Fk_Id_Usuario', $id_usuario);
				$this->db->update('autorizaciones', array("Autorizado_Padre" => "1", "Id_Padre" => $id));
				break;
		}
	}

	function permitir($id_usuario){
		//$this->db->where('Fundacion', );
		return  true;
	}

	function consultar_padre($id_usuario){
		$sql =
		"SELECT
		autorizaciones.Id_Padre AS Id_Abuelo
		FROM
		autorizaciones
		WHERE
		autorizaciones.Fk_Id_Usuario = {$id_usuario}";

		return $this->db->query($sql)->row();
	}

	function consultar_abuelo($id_usuario){
		$sql =
		"SELECT
		autorizaciones.Id_Abuelo AS Id_Abuelo
		FROM
		autorizaciones
		WHERE
		autorizaciones.Fk_Id_Usuario = {$id_usuario}";

		return $this->db->query($sql)->row();
	}

	function agregar_abuelo($id_usuario, $id_abuelo){
		$this->db->where('Fk_Id_Usuario', $id_usuario);
		$this->db->update('autorizaciones', array("Id_Abuelo" => $id_abuelo));
	}

	
}
/* Fin del archivo autorizacion_model.php */
/* Ubicación: ./application/models/autorizacion_model.php */