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
		$this->load->model(array('registro_model', 'autorizacion_model'));
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

	function guardar(){
		//Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Se genera un código de empleo y cheques
            $codigo_empleo = $this->registro_model->generar_codigo_empleo();

            //Datos para el registro
        	$datos = array(
        		'Nombre' => $this->input->post('nombre'),
        		'Cedula' => $this->input->post('cedula'),
        		'Ciudad' => $this->input->post('ciudad'),
        		'Email' => $this->input->post('email'),
                'Codigo_Empleo' => $codigo_empleo,
                'Password' => md5($this->input->post('password')),
                'Telefono' => $this->input->post('telefono'),
                'Direccion' => $this->input->post('direccion'),
    		);

            //Si se guarda correctamente
    		if($this->registro_model->guardar("registro", $datos)){
                //Se obtiene el id del usuario
                $id_usuario = mysql_insert_id();

                //Se guarda la autorizacion
    			if ($this->registro_model->guardar("autorizacion", array('Fk_Id_Usuario' => $id_usuario))) {
                    //Se envia un arreglo con los datos necesarios en JSON
                    echo $id_usuario;
                }
    		} else {
    			echo 'false';
    		}//Fin if
    	}else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }//Fin 

    function pre_registro(){
        //Se establece el título de la página
        $this->data['titulo'] = 'Pre-Registro de Cheques';
        //Se establece la vista que tiene el contenido principal
        $this->data['contenido_principal'] = 'registro/pre_registro_view';
        //Se establece la vista que tiene la cabecera
        $this->data['cabecera'] = 'registro/pre_registro_cabecera';
        //Se carga la plantilla con las demas variables
        $this->load->view('plantillas/template', $this->data);
    }

    function guardar_pre_registro(){
        //Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Se almacenan los datos en un arreglo
            $datos = array(
                'Numero' => $this->input->post("numero_cheque"),
                'Codigo' => $this->input->post("codigo_cheque"),
                'Numero_Consignacion' => $this->input->post("numero_consignacion")
            );

            //Si se guarda correctamente
            if($this->registro_model->guardar("pre_registro", $datos)){
               echo "Pre-Registro guardado";
            } else {
                echo 'false';
            }//Fin if
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }

    function validar_pre_registro(){
        //Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Se almacenan los datos en un arreglo
            $datos = array(
                'Numero' => $this->input->post("numero_cheque"),
                'Codigo' => $this->input->post("codigo_cheque"),
                'Numero_Consignacion' => $this->input->post("numero_consignacion")
            );//Fin datos

            //Se valida que el registro exista
            if($this->registro_model->validar_pre_registro($datos)){
                echo true;
            } else {
                echo false;
            }
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }

    function generar_codigo_cheque(){
        //Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Se almacenan los dos cheques
            $cheque1 = $this->registro_model->generar_codigo_cheque();
            $cheque2 = $this->registro_model->generar_codigo_cheque();

            //Se obtiene el id de usuario
            $id_usuario = $this->input->post("id_usuario");

            //Se realiza el update
            if ($this->registro_model->guardar_codigo_cheque($cheque1, $cheque2, $id_usuario)) {
                 print json_encode(array("Cheque_1" => $cheque1, "Cheque_2" => $cheque2));
             } 
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }

    function validar_cheque(){
        //Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Se valida que el cheque exista
            if($this->registro_model->validar_cheque($this->input->post("numero_cheque_2"))){
                echo true;
            } else {
                echo false;
            }
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }

    function consultar_usuario(){
        //Se valida que la peticion venga mediante ajax y no mediante el navegador
        if($this->input->is_ajax_request()){
            //Se toma el id del usuario
            $id_usuario = $this->input->post('id_usuario');

            //Se ejecuta el modelo que consulta la información
            $usuario = $this->registro_model->datos_usuario($id_usuario);
            
            //Se retornan los datos en un arreglo JSON
            print json_encode($usuario);
        }else{
            //Si la peticion fue hecha mediante navegador, se redirecciona a la pagina de inicio
            redirect('');
        }
    }
}
/* Fin del archivo registro.php */
/* Ubicación: ./application/controllers/registro.php */