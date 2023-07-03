<?php
require_once 'libs/Router.php';
require_once 'app/controllers/mascotas.controller.php';

// crea el router
$router = new Router();

// defina la tabla de ruteo
$router->addRoute('mascotas', 'GET', 'mascotasController', 'getMascotas');
//poner a lo ultimo los que tengan :ID
$router->addRoute('mascotas/:ID', 'GET', 'mascotasController', 'getMascota');
//$router->addRoute('mascota/:ID', 'GET', 'mascotasController', 'getMascota');
$router->addRoute('mascotas/:ID', 'DELETE', 'mascotasController', 'deleteMascota');
$router->addRoute('mascotas', 'POST', 'mascotasController', 'insertMascota'); 
$router->addRoute('mascotas/:ID', 'PUT', 'mascotasController', 'updateMascota'); 

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);