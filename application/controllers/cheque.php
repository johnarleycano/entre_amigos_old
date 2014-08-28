<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Cheque
 *
 * @autor John Arley Cano Salinas
 */
Class Cheque extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();
	}//Fin construct()

	/**
	 * Interfaz de inicio del módulo
	 */
	function index(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Cheques';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'cheques/index_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'cheques/cheque_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}//Fin index
}
/* Fin del archivo cheque.php */
/* Ubicación: ./application/controllers/cheque.php */