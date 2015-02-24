<?php
/**
 * Administracion_model
 * 
 * @author              John Arley Cano Salinas - johnarleycano@hotmail.com
 */
Class Administracion_model extends CI_Model{
    function actualizar_cuadro($id_cuadro, $datos){
        $this->db->where('id', $id_cuadro);
        if($this->db->update('cuadros', $datos)){
            //Retorna verdadero
            return true;
        }
    }//actualizar_cuadro

    function cargar_paises(){
        $this->db->select('*');
        $this->db->order_by('nombre', 'ASC');

        return $this->db->get('paises')->result();
    }//cargar_paises

    function cargar_tipos(){
        $this->db->select('*');
        $this->db->order_by('nombre', 'ASC');

        return $this->db->get('tipos')->result();
    }//cargar_tipos

    function checkear_foto($id_cuadro){
        $this->db->where('id', $id_cuadro);
        if($this->db->update('cuadros', array("imagen" => "1"))){
            //Retorna verdadero
            return true;
        }
    }//checkear_foto

    function eliminar_foto($id_cuadro){
        //Si se elimina
        if ($this->db->delete('cuadros', array('id' => $id_cuadro))) {
            //Se retorna true
            return 'true';
        }
    }//eliminar_foto

	function guardar_cuadro($datos){
		if ($this->db->insert('cuadros', $datos)) {
             return true;
        } //if
	}//Fin guardar_cuadro

    function listar_cuadros($id_cuadro){
        $this->db->select('*');
        $this->db->order_by('fecha_creacion', 'DESC');
        $this->db->order_by('nombre', 'ASC');

        if($id_cuadro){
            $this->db->where('id', $id_cuadro);
            return $this->db->get('cuadros')->row();
        }else{
            return $this->db->get('cuadros')->result();
        }
    }//listar_cuadros

    function listar_cuadros_principales($numero){
        $this->db->select('*');
        $this->db->order_by('fecha_creacion', 'DESC');

        return $this->db->get('cuadros', $numero, 0)->result();
    }//listar_cuadros_principales
}
/* Fin del archivo administracion_model.php */
/* Ubicación: ./application/models/administracion_model.php */