<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Posicion
 *
 * @autor John Arley Cano Salinas
 */
Class Posicion extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();

		//Carga de modelos y librerías
		$this->load->model(array('posicion_model', 'autorizacion_model'));
	}//Fin construct()

	/**
	 * Interfaz de inicio 
	 */
	function index(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Mi Posicion';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'posicion/posicion_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'posicion/posicion_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}//Fin index
}
/* Fin del archivo posicion.php */
/* Ubicación: ./application/controllers/posicion.php */