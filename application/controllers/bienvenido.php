<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Bienvenido
 *
 * @autor John Arley Cano Salinas
 */
Class Bienvenido extends CI_Controller{
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
		$this->data['titulo'] = 'Bienvenido';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'bienvenido/bienvenido_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'bienvenido/bienvenido_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}//Fin index

	function denuncia(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Denuncie';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'denuncia/denuncia_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'denuncia/denuncia_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}

	function presentacion(){
		//Se establece el título de la página
		$this->data['titulo'] = '¿Quiénes somos?';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'bienvenido/presentacion/presentacion_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'bienvenido/presentacion/presentacion_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}
}
/* Fin del archivo bienvenido.php */
/* Ubicación: ./application/controllers/bienvenido.php */