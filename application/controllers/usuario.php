<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Registro
 *
 * @autor John Arley Cano Salinas
 */
Class Usuario extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();

		//Carga de modelos y librerías
		$this->load->model(array('usuario_model'));
	}//Fin construct()

	function afiliados(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Afiliados';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'usuario/index_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'usuario/usuario_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}

	function actualizar(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
			// Se hace la actualización según el tipo
			echo $this->usuario_model->actualizar($this->input->post('tipo'), $this->input->post('id_usuario'), $this->input->post('codigo_empleo'));
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}// actualizar

	function cargar_interfaz(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
			//Se consultan los usuarios según el tipo
			$this->data['usuarios'] = $this->usuario_model->listar($this->input->post('tipo'));
			
			//Se carga la interfaz
			$this->load->view('usuario/lista_view', $this->data);
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}// cargar_interfaz
}
/* Fin del archivo usuario.php */
/* Ubicación: ./application/controllers/usuario.php */