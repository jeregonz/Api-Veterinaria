<?php

class mascotasModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_veterinaria;charset=utf8', 'root', '');
    }

    public function getAllMascotas($tipo, $sort) {
        $query = $this->db->prepare("SELECT mascotas.*, clientes.nombre as nombre_cliente 
                                    FROM `mascotas` 
                                    JOIN clientes ON mascotas.id_cliente = clientes.id_cliente $tipo $sort");
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getMascotaById($id) {
        $query = $this->db->prepare("SELECT * FROM mascotas WHERE id_mascota = ?");
        $query->execute([$id]);
        
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function insertMascota($nombre, $tipo, $raza, $id_cliente) {
        $query = $this->db->prepare("INSERT INTO mascotas (nombre, tipo, raza, id_cliente) VALUES (?, ?, ?, ?)");
        $query->execute([$nombre, $tipo, $raza, $id_cliente]);

        return $this->db->lastInsertId();
    }

    function deleteMascotaById($id) {
        $query = $this->db->prepare('DELETE FROM mascotas WHERE id_mascota = ?');
        $query->execute([$id]);
    }

    public function updateMascotaById($id_mascota, $nombre, $tipo, $raza, $id_cliente) {
        $query = $this->db->prepare('UPDATE mascotas 
            SET `nombre`= ?, `tipo`=?, `raza`= ?, `id_cliente`= ? WHERE id_mascota = ?');
        $query->execute([$nombre, $tipo, $raza, $id_cliente, $id_mascota]);
    }

}