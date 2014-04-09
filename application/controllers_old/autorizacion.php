<?php
//Zona horaria
date_default_timezone_set('America/Bogota');

//Si se intenta hacer acceso indebido
if ( ! defined('BASEPATH')) exit('Lo sentimos, usted no tiene acceso a esta ruta');

/**
 * Autorización
 *
 * @autor John Arley Cano Salinas
 */
Class Autorizacion extends CI_Controller{
	/**
	 * Constructora de la clase
	 */
	function __construct() {
		parent::__construct();

		//Carga de modelos y librerías
		$this->load->model(array('autorizacion_model', 'registro_model'));
	}//Fin construct()

	/**
	 * Interfaz de inicio 
	 */
	function index(){
		//Se establece el título de la página
		$this->data['titulo'] = 'Autorización';
		//Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'autorizacion/autorizacion_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'autorizacion/autorizacion_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
	}//Fin index

	function generar_codigo_empleo(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
        	echo $this->registro_model->generar_codigo_empleo();
    	} else {
			//Retorna falso
			echo "false";
		}
		
	}

	function buscar_codigo_empleo(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
        	//Se recibe el código de empleo
			$codigo_empleo = $this->input->post("codigo_empleo");

			//Si el código es diferente al propio
			if ($codigo_empleo != $this->session->userdata("Codigo_Empleo")) {
				//Se ejecuta el modelo
				$busqueda = $this->autorizacion_model->validar_codigo_empleo($codigo_empleo);

				//Se ejecuta la validacion en el modelo
				if ($busqueda) {
					//Se retorna un array JSON con los datos del usuario
					print json_encode($busqueda);
				} else {
					//Retorna falso
					echo "false";
				}
			} else {
				//Retorna falso
				echo "false";
			}
		}else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}

	function autorizar(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
        	//Recibe el codigo de empleo
            $codigo_empleo = trim($this->input->post('codigo_empleo'));

            //Primero, valida que no tenga padre. Si no tiene, este será el padre
            $datos = $this->autorizacion_model->validar_existencia_padre($codigo_empleo);

            //Si no trae un id de padre
            if(!isset($datos->Id_Padre)){
                //Procederemos a autorizar padre
                $this->autorizacion_model->autorizar("padre", $datos->Fk_Id_Usuario, $this->session->userdata('Pk_Id_Usuario'));

                //Ahora agregaremos el id del abuelo, que es el padre de este padre
                $abuelo = $this->autorizacion_model->consultar_padre($this->session->userdata('Pk_Id_Usuario'));
                $id_abuelo = $abuelo->Id_Abuelo;

                //Guardamos el id del abuelo
                $this->autorizacion_model->agregar_abuelo($datos->Fk_Id_Usuario, $id_abuelo);

                echo "padre";
            } else {
                //Si trajo id padre, validamos que el id de sesion de usuario corresponda
                //al id del abuelo

                $abuelo = $this->autorizacion_model->consultar_abuelo($datos->Fk_Id_Usuario);

                if ($abuelo->Id_Abuelo == $this->session->userdata('Pk_Id_Usuario')){
                    $this->autorizacion_model->autorizar("abuelo", $datos->Fk_Id_Usuario, $this->session->userdata('Pk_Id_Usuario'));

                    echo "abuelo";
                } else {
                    echo "false";
                }

            } 


        	/*
			
        	$id_autorizado = $this->autorizacion_model->obtener_id_usuario($codigo_empleo);

        	//Si no existe padre
    		if(!$this->autorizacion_model->validar_existencia_padre($id_autorizado)){
    			echo "como no existe padre";
    			//Este usuario será el padre
    			if($this->autorizacion_model->autorizar("padre", $id_autorizado, $id_usuario)){
        			echo "Se logró guardar";
	        	} else {
	        		echo "Ya tiene los dos hijos";
	        	}
    		}

        	//Si no existe para

        	//echo $id_autorizado;
			*/
        } else {
        	//Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}

	function autorizacion_automatica(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
        	//Se obtiene el id de usuario
    		$id_usuario = $this->input->post("id_usuario");

        	//Se procede a autorizar automáticamente por parte de la fundacion
            $this->autorizacion_model->autorizar("fundacion", $id_usuario, null);

            //Se procede a autorizar automáticamente por parte del abuelo
            $this->autorizacion_model->autorizar("abuelo", $id_usuario, "2");

            //Se procede a autorizar automáticamente por parte del padre
            $this->autorizacion_model->autorizar("padre", $id_usuario, "3");
    	} else {
        	//Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
	}
}
/* Fin del archivo sesion.php */
/* Ubicación: ./application/controllers/sesion.php */