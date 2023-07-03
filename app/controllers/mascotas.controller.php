<?php

require_once 'app/models/mascotas.model.php';
require_once 'app/views/mascotas.view.php';

class mascotasController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new mascotasModel();
        $this->view = new mascotasView();

        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getMascotas() {
        $sort = $this->getOrderBy();
        $tipo = $this->getWhere();
        
        $mascotas = $this->model->getAllMascotas($tipo, $sort);
        $this->view->response($mascotas);
    }

    public function getOrderBy(){
        $sort = '';
        if (key_exists('sort', $_GET)) {
            $sort = $_GET['sort'];
            if ($sort != 'id_mascota' && $sort != 'nombre' && $sort != 'tipo' && $sort != 'raza' && $sort != 'id_cliente'){
                $this->view->response("Error en parametro GET, la columna '$sort' no existe en la tabla 'Mascotas' ", 400);
                die();
            }
            if (key_exists('order', $_GET)) {
                $sort = $sort . ' '.$_GET['order'];
            }
            $sort = 'ORDER BY '.$sort;
        }
        else {
            $sort = 'ORDER BY id_mascota';
        }
        return $sort;
    }

    public function getWhere(){
        $tipo = '';
        if (key_exists('tipo', $_GET)) {
            $tipo = $_GET['tipo'];
            if ($tipo!="gato" && $tipo!="perro"){
                $this->view->response("Error en parametro GET, el 'tipo' debe ser 'perro' o 'gato' ", 400);
                die();    
            }
            else
                $tipo = "WHERE tipo = '$tipo'";
        }
        return $tipo;
    }

    public function getMascota($params = null) {
        $id = $params[':ID'];
        $mascota = $this->model->getMascotaById($id);

        if ($mascota)
            $this->view->response($mascota);
        else 
            $this->view->response("La mascota con el id $id no existe", 404);
    }

    public function deleteMascota($params = null) {
        $id = $params[':ID'];

        if (is_numeric($id) && !empty($id)){
            $mascota = $this->model->getMascotaById($id);

            if ($mascota) {
                $this->model->deleteMascotaById($id);
                $this->view->response($mascota);
            } else 
                $this->view->response("La mascota con el id $id no existe", 404);
        } else {
            $this->view->response("Error en el parametro ID", 400);
        }
    }

    public function insertMascota() {
        $mascota = $this->getData();

        if (empty($mascota->nombre) || empty($mascota->tipo) || empty($mascota->raza) || empty($mascota->id_cliente)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insertMascota($mascota->nombre, $mascota->tipo, $mascota->raza, $mascota->id_cliente);
            $mascota = $this->model->getMascotaById($id);
            $this->view->response($mascota, 201);
        }
    }

    public function updateMascota($params = null) {
        $id = $params[':ID'];

        if (is_numeric($id) && !empty($id)){
            $mascota = $this->getData();

            if (empty($mascota->nombre) || empty($mascota->tipo) || empty($mascota->raza) || empty($mascota->id_cliente)) {
                $this->view->response("Complete los datos", 400);
            } else {
                $this->model->updateMascotaById($id, $mascota->nombre, $mascota->tipo, $mascota->raza, $mascota->id_cliente);
                $mascota = $this->model->getMascotaById($id);
                if ($mascota)
                    $this->view->response($mascota, 201);
                else
                    $this->view->response("La mascota con el id $id no existe", 404);
            }
        } else {
            $this->view->response("Error en el parametro ID", 400);
        }
    }
}