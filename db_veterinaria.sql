-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2023 a las 00:21:43
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`, `email`) VALUES
(1, 'Juan Pérez', '555-1234', 'juanperez@example.com'),
(2, 'María López', '555-5678', 'marialopez@example.com'),
(3, 'Carlos Rodríguez', '555-9876', 'carlosrodriguez@example.com'),
(4, 'Laura García', '555-4321', 'lauragarcia@example.com'),
(5, 'Andrés Ramírez', '555-8765', 'andresramirez@example.com'),
(6, 'Ana Martín', '555-3214', 'anamartinez@example.com'),
(7, 'Sergio Sánchez', '555-6543', 'sergiosanchez@example.com'),
(8, 'Carolina Torres', '555-3456', 'carolinatorres@example.com'),
(9, 'Luis Vargas', '555-7654', 'luisavargas@example.com'),
(10, 'Pedro Morales', '555-2345', 'pedromorales@example.com'),
(13, 'juancito ramirez', '3424234', 'juancito@hmail.com'),
(15, 'Rudy Wisozk', 'erwrwe', 'qweq@f.com'),
(16, 'zyra Rice', '324234', 'Kareem_Graham47@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascota` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `raza` varchar(150) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id_mascota`, `nombre`, `tipo`, `raza`, `id_cliente`) VALUES
(1, 'max', 'perro', 'labrador', 7),
(2, 'luna', 'gato', 'siamesa', 3),
(3, 'rocky', 'perro', 'bulldogg', 2),
(4, 'bella', 'gato', 'persa', 2),
(5, 'charlie', 'perro', 'golden retriever', 9),
(6, 'daisy', 'gato', 'maine cooon', 5),
(7, 'rocky', 'perro', 'pastor alemán', 4),
(8, 'oliver', 'gato', 'bengalí', 8),
(9, 'bella', 'perro', 'chihuahua', 4),
(10, 'lily', 'gato', 'ragdoll', 10),
(11, 'coco', 'perro', 'labrador', 7),
(12, 'lola', 'gato', 'siamesa', 3),
(13, 'rocko', 'perro', 'bulldog', 5),
(14, 'nina', 'gato', 'persa', 2),
(15, 'maxi', 'perro', 'golden retriever', 9),
(16, 'daisy', 'gato', 'maine coon', 1),
(17, 'buddy', 'perro', 'pastor alemán', 6),
(18, 'mia', 'gato', 'bengalí', 8),
(19, 'lucky', 'perro', 'chihuahua', 4),
(20, 'simba', 'gato', 'ragdoll', 10),
(37, 'pedro', 'mono', 'koko', 8),
(41, 'aetet', 'etaeteat', 'tat', 5),
(48, 'jyfgufu', 'ututu', 'ttututf', 8),
(50, 'jjajaaja', 'jajaja', 'ajajaaj', 8),
(51, 'htdrhdrt', 'hdrhrdhrdtht', 'ttdhrdhrh', 8),
(63, 'zzzzz', 'zzzzzzz', 'zzzzzzzz', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `clave`) VALUES
(1, 'admin', '$2y$10$n8mr17Se3b1GKbVLnFBzvO1PIrSZqf7SY2QHTgxyBh.JKBy9HuMzq'),
(2, 'juancito', '$2y$10$xxkFbY5ME5Nh9ezP1EbedOSncAEG2tKdjyosiu7q2C3ntUmbzNsWm');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
