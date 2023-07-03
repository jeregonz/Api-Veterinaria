<?php
require_once 'libs/Router.php';
require_once 'app/controllers/mascotas.controller.php';

$router = new Router();

$router->addRoute('mascotas', 'GET', 'mascotasController', 'getMascotas');
$router->addRoute('mascotas/:ID', 'GET', 'mascotasController', 'getMascota');
$router->addRoute('mascota/:ID', 'GET', 'mascotasController', 'getMascota');
$router->addRoute('mascotas/:ID', 'DELETE', 'mascotasController', 'deleteMascota');
$router->addRoute('mascotas', 'POST', 'mascotasController', 'insertMascota'); 
$router->addRoute('mascotas/:ID', 'PUT', 'mascotasController', 'updateMascota'); 

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);