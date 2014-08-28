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

		//Carga de modelos y librerías
		$this->load->model(array('registro_model'));
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

	function listar(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Cheques';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'cheques/listado_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'cheques/cheque_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}//Fin index

	function guardar(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            // Se reciben los datos por post
            $datos = $this->input->post('datos');
            
            //Si se guarda correctamente
    		if($this->registro_model->guardar("cheque", $datos) == 'true'){
    			//Se retorna el id del usuario creado
    			echo mysql_insert_id();
    		} else {
    			echo 'false';
    		}//Fin if
    	}else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }//Fin 
}
/* Fin del archivo cheque.php */
/* Ubicación: ./application/controllers/cheque.php */