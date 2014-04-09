<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Sesion
 *
 * @autor John Arley Cano Salinas
 */
Class Sesion extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();

		//Carga de modelos y librerías
		$this->load->model(array('usuario_model'));
	}//Fin construct()

	/**
	 * Interfaz de inicio del módulo
	 */
	function index(){
		//No necesitaremos index
	}//Fin index

	/**
	 * Valida los datos de inicio de sesion
	 */
	function validar(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
			//Recibo los datos por POST
			$codigo_empleo = $this->input->post('codigo_empleo');
			$password = md5($this->input->post('password'));

			$datos_sesion = $this->usuario_model->validar($codigo_empleo, $password);

			//Se ejecuta la validacion en el modelo
			if ($datos_sesion) {
	 			$sesion = array(
	 				"Pk_Id_Usuario" => $datos_sesion->Pk_Id_Usuario,
	 				"Codigo_Empleo" => $datos_sesion->Codigo_Empleo,
	 				"Codigo_Empleo_Especial" => $datos_sesion->Codigo_Empleo_Especial,
	 				"Nombre" => $datos_sesion->Nombre,
	 				"Email" => $datos_sesion->Email
 				);

 				//Se cargan los datos a la sesión
                $this->session->set_userdata($sesion);

                //Respuesta ok
		 		echo true;
		 	}else{
		 		echo false;
		 	}
		}else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}

	function cerrar(){
        //Se destruye la sesion actual
        $this->session->sess_destroy();
        
        //Se redirige hacia el controlador principal
        redirect('');
    }//Fin cerrar()
}
/* Fin del archivo sesion.php */
/* Ubicación: ./application/controllers/sesion.php */