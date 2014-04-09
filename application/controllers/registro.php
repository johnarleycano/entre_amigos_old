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
Class Registro extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();

		//Carga de modelos y librerías
		$this->load->model(array('registro_model'));
	}//Fin construct()

	/**
	 * Interfaz de inicio 
	 */
	function index(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Registro';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'registro/registro_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'registro/registro_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}//Fin index

	function generar_codigo_afiliacion(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
        	//Se genera un código de afiliación y cheques
            echo $this->registro_model->generar_codigo_afiliacion();
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}

	function guardar(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Si se guarda correctamente
    		if($this->registro_model->guardar("registro", $this->input->post('datos')) == 'true'){
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
/* Fin del archivo registro.php */
/* Ubicación: ./application/controllers/registro.php */