<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Email
 *
 * @autor John Arley Cano Salinas
 */
Class Email extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();

		//Carga de modelos y librerías
		$this->load->model(array('email_model'));
		$this->load->library(array('email'));
	}//Fin construct()

	/**
	 * Interfaz de inicio 
	 */
	function index(){
		
	}//Fin index

	function enviar(){
		//Se recibe el destinatario y dato adicional
		$destinatario = $this->input->post('destinatario');

		//Suiche
		switch ($this->input->post('tipo')) {
			case "bienvenido":
				$texto = "<h3>Estimado <b>".$this->input->post('nombre').":</b></h3><br>Le damos la bienvenida al programa. Desde ahora cuenta con un código de empleo para ingresar a la aplicación y participar.<br><br>Su código de empleo es el ".$this->input->post('codigo_empleo').". Su clave es ".$this->input->post('password').".<br>Por favor no olvide sus datos y nunca le entregue su clave a otra persona.";

				$this->email_model->enviar_info($destinatario, "Bienvenido", $texto);
				break;
			
			case "2":
				$this->email_model->enviar($destinatario, "Está autorizado", "Bienvenido. Ahora usted está autorizado y puede seguir. ".$dato."Cualquier inquietud llámenos");
				break;

			case "autorizado_automatico":
				$texto = "<h3>Estimado <b>".$this->input->post('nombre').":</b></h3><br>Como usted ya posee cheque, ha sido autorizado automáticamente por la fundación y desde ya puede moverse en el programa.<br><br>También le hemos generado dos números de cheque para que invite a dos personas más.<br>Los números de cheques son: <b>".$this->input->post('cheque1')."</b> y <b>".$this->input->post('cheque2')."</b>";
				$this->email_model->enviar_info($destinatario, "Ha sido autorizado automáticamente", $texto);
				break;

			case "denuncia":
				$texto = "<h3>Estimado <b>".$this->input->post('nombre').":</b></h3><br>Hemos recibido su denuncia. En cuanto Podamos atenderle daremos respuesta.<br>Denuncia: ".$this->input->post('denuncia');
				
				//Email al denunciante
				$this->email_model->enviar_denuncia($destinatario, "Recibimos su denuncia", $texto);

				//Email a denuncias
				//Email al denunciante
				$this->email_model->enviar_denuncia("info@empleosystemthree.org", "Nueva denuncia", $texto);
				break;
		}
	}//Fin enviar

	function prueba(){
		$this->email_model->enviar("johnarleycano@hotmail.com", "Prueba", "Envío de prueba");
	}
}
/* Fin del archivo email.php */
/* Ubicación: ./application/controllers/email.php */