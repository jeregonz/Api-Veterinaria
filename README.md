[API Rest - Gestión de Base de Datos de Veterinaria ]

### Indice
1. - Opciones disponibles
2. - Veterinaria API directory
3. - Base Link
4. - Cuerpo de un pedido
5. - Tabla de ruteo
6. - Obtener resultados ordenados
7. - Obtener resultados filtrados por tipo de mascota
8. - Obtener resultados ordenados y filtrados
9. - Realizar altas.
10. - Realizar modificaciones
11. - Códigos de error

#### 1.- Opciones disponibles

- Gestión de la base de datos de los pacientes de la veterinaria;
- Consultas de las mascotas;
- Listar pacientes;
- Agregar pacientes;
- Eliminar pacientes;
- Modificar datos de pacientes.

#### 2.- Directorio Veterinaria API

 app/
		controllers/
		models/
		views/
		libs/
		.htaccess
		README.md
		api.router.php
		db_veterinaria.sql

#### 3.- Link base
http://localhost/carpetalocal/api-veterinaria/api/


#### 4.- Cuerpo de un pedido
```
  {
    "nombre": "max",
    "tipo": "perro",
    "raza": "labrador",
    "id_cliente": 7
  }
```


#### 5.- Tabla de Ruteo

| URL | Verbo  | Controller  | Metodo |
| ------------ |------------ |---------------| -----|
| mascotas | GET        | mascotasController   | getMascotas |
| mascotas/:ID | GET        | mascotasController   | getMascota |
| mascota/:ID | GET        | mascotasController   | getMascota |
| mascotas | POST | mascotasController  | insertMascota |
| mascotas/:ID |  PUT       | mascotasController    | updateMascota  |
| mascotas/:ID | DELETE        | mascotasController    | deleteMascota |


##### 6.- Obtener resultados ordenados
| URL | Respuesta  |
| :------------ | :------------ | 
| mascotas?sort=nombre | Lista ordenada por nombre ascendente  | 
| mascotas?sort=nombre&order=desc | Lista ordenada por nombre descendente  | 
| mascotas?sort=id_mascota | Lista ordenada por ID ascendente  | 

##### 7.- Obtener resultados filtrados por tipo de mascota
| URL | Respuesta  |
| :------------ | :------------ | 
| mascotas?tipo=gato | Muestra solo los gatos | 
| mascotas?tipo=perro | Muestra solo los perros | 

##### 8.- Obtener resultados ordenados y filtrados
| URL | Respuesta  |
| :------------ | :------------ | 
| mascotas?tipo=perro&sort=nombre | Lista solo los perros ordenados por nombre | 
| mascotas?tipo=gato&sort=id_cliente&order=desc | Lista solo los gatos ordenados en forma descendente por ID del cliente | 

### 9.- Realizar altas
| URL | Verbo | Respuesta |
| :------------ | :------------ | 
| http://localhost/api-veterinaria/api/mascotas/ | POST | Genera un nuevo recurso | 

Formato de envío
```
{
    "nombre": "Pepito",
    "tipo": "Loro",
    "raza": "Brasileño",
    "id_cliente": 7
}
```
Resultado
```
{
    "id_mascota": 64,
    "nombre": "Pepito",
    "tipo": "Loro",
    "raza": "Brasileño",
    "id_cliente": 7
}
```
###### Código 201. La solicitud ha tenido éxito y se ha creado un nuevo recurso.


-----------
### 10.- Realizar modificaciones
| URL | Verbo | Respuesta |
| :------------ | :------------ | 
| http://localhost/api-veterinaria/api/mascotas/3 | PUT | Modifica los datos de un recurso existente. | 

Antes
```
 {
    "id_mascota": 3,
    "nombre": "Manchita",
    "tipo": "Gato",
    "raza": "Persa",
    "id_cliente": 10
}
```
Formato de envío
```
{
    "nombre": "Peluquita",
    "tipo": "Gato",
    "raza": "Mestizo",
    "id_cliente": 10
}
```
Resultado
```
{
    "id_mascota": 3,
    "nombre": "Peluquita",
    "tipo": "Gato",
    "raza": "Mestizo",
    "id_cliente": 10
}
```
###### Código 201. La solicitud ha tenido éxito y se ha modificado un recurso existente.


##### 11.- Códigos de Error
| Código | Error  |   Descripción  |
| :------------ | :------------ |  :------------ | 
| 200 | OK | La solicitud ha tenido éxito | 
| 201 | Created | La solicitud ha tenido éxito y se ha creado un nuevo recurso | 
| 400 | Bad request | No pudo interpretar la solicitud dada una sintaxis inválida | 
| 401 | Not found | El servidor no pudo encontrar el contenido solicitado | 
| 500 | Internal Server Error | El servidor ha encontrado una situación que no sabe cómo manejar. |
