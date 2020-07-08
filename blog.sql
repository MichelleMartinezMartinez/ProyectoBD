-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2020 a las 00:07:14
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id_blog` int(11) NOT NULL,
  `titulo` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `descripcion` varchar(500) CHARACTER SET armscii8 NOT NULL,
  `fecha` date NOT NULL,
  `autor` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `status` int(1) DEFAULT 1,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id_blog`, `titulo`, `descripcion`, `fecha`, `autor`, `status`, `categoria`) VALUES
(1, 'Se anuncio el PS5', 'La PlayStation 5 saldra a la venta a finales de este ano, siete anos despues de la PS4, lanzada en 2013.\r\nAdemas de ofrecer mejores imagenes, la nueva consola tambien tiene un disco duro personalizado que permitira reducir radicalmente los tiempos de carga.\r\nSony tambien destaco las nuevas caracteristicas del hardware de la PS5, incluido el audio 3D y un reproductor de Blu-ray 4K. Tambien la nueva consola podria lanzarse en una version sin unidad de disco.\r\n\r\n', '2020-06-12', 'Michelle Martinez', 1, 0),
(2, 'La actualizacion de Windows 10 May 2020 Update ya esta disponible para mas usuarios.', 'Microsoft ha anunciado que la gran actualizacion de mayo de Windows 10 ya esta disponible para mas dispositivo. Descubre si puedes instalarla en tu equipo.\r\n\r\nEl pasado 27 de mayo, la compania de Redmond libero la actualizacion de Windows 10 May 2020 Update, la primera gran actualizacion del anio del sistema operativo.\r\n\r\nNo obstante, para evitar los problemas habituales que se vienen produciendo en los ultimos anios, en esta ocasion Microsoft ha decidido escalonar el proceso.', '2020-06-11', 'Karen Martinez', 1, 0),
(3, 'La ultima build de Windows 10 llega con la esperada actualizacion del kernel de Linux v?a Windows Up', 'Primero llego el dia en el que Linux se erigio como la caracteristica m?s importante de una nueva version del sistema operativo de Microsoft, de la Windows 10 May 2020 Update concretamente, y despues el momento en el que su kernel va a poder actualizarse a traves de Windows Update.\r\n\r\nPese a que se esperaba que con la ultima gran actualizacion del sistema se eliminase el kernel de Linux de la imagen de Windows y en su lugar se entregase a traves de Windows Update.', '2020-06-13', 'Juan Perez', 1, 0),
(4, 'Descubren tres vulnerabilidades en Linux que afectan a las defensas contra Spectre.', 'Un ingeniero de Google ha descubierto tres agujeros de seguridad (1, 2 y 3) que afectan a las defensas contra Spectre incluidas en el kernel Linux, concretamente aquellas dise?adas para los procesadores de AMD e Intel.\r\n\r\nPara los que anden perdidos, las vulnerabilidades tipo Spectre, que en esencia son de canal lateral, han afectado a procesadores de todos los fabricantes conocidos y son imposibles de corregir debido a que requieren de parchear el propio silicio.', '2020-06-14', 'Alejandra Hernandez', 1, 0),
(5, 'Prueba de post editado', 'Esto es un texto de prueba editado', '2020-06-18', 'Prueba de edicion', 1, 0),
(12, 'Prueba ', 'Texto', '2020-06-10', 'Prueba2', 1, 1),
(22, 'Prueba de post editado', 'dqwdqwdqw', '2020-07-22', 'qweqwqe', 1, 2);

--
-- Disparadores `blog`
--
DELIMITER $$
CREATE TRIGGER `TD_LOGS` AFTER DELETE ON `blog` FOR EACH ROW INSERT INTO logs (fuente_log, mensaje_log) VALUES('BLOG', CONCAT('Se ha eliminado el registro ', old.titulo))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TI_LOGS` AFTER INSERT ON `blog` FOR EACH ROW INSERT INTO logs (fuente_log,mensaje_log)VALUES('BLOG', CONCAT('Se registro un nuevo valor ', new.titulo, ' dentro de la tabla BLOG'))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TU_LOGS` AFTER UPDATE ON `blog` FOR EACH ROW INSERT INTO logs (fuente_log, mensaje_log)VALUES('BLOG', CONCAT('Se ha editado el registro ',old.titulo, ' con el nuevo valor', new.titulo))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_cat` int(11) NOT NULL,
  `nombre_cat` varchar(100) NOT NULL,
  `status_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_cat`, `nombre_cat`, `status_cat`) VALUES
(1, 'VideoJuegos', 1),
(2, 'Noticias', 2),
(3, 'Cine', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL,
  `fuente_log` varchar(50) DEFAULT NULL,
  `mensaje_log` varchar(255) DEFAULT NULL,
  `fecha_log` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id_log`, `fuente_log`, `mensaje_log`, `fecha_log`) VALUES
(3, 'BLOG', 'Se registro un nuevo valor PRUEBA dentro de la tabla BLOG', '2020-07-08 17:26:38.187750'),
(4, 'BLOG', 'se ha eliminado el registro PRUEBA', '2020-07-08 19:45:19.920910'),
(5, 'BLOG', 'Se registro un nuevo valor prueba de post 223 dentro de la tabla BLOG', '2020-07-08 20:33:28.748764'),
(6, 'BLOG', 'Se registro un nuevo valor prueba de post 223 dentro de la tabla BLOG', '2020-07-08 20:33:43.563153'),
(7, 'BLOG', 'Se ha eliminado el registro prueba de post 223', '2020-07-08 20:34:08.836266'),
(8, 'BLOG', 'Se registro un nuevo valor prueba de post 223 dentro de la tabla BLOG', '2020-07-08 20:48:24.000878'),
(9, 'BLOG', 'Se ha eliminado el registro Prueba de post editado', '2020-07-08 21:10:10.152491'),
(10, 'BLOG', 'Se ha eliminado el registro Prueba de post editado', '2020-07-08 21:10:11.313536'),
(11, 'BLOG', 'Se ha eliminado el registro prueba de post 223', '2020-07-08 21:10:12.927975'),
(12, 'BLOG', 'Se ha eliminado el registro prueba de post 223', '2020-07-08 21:10:14.244921'),
(13, 'BLOG', 'Se registro un nuevo valor Prueba de post editado dentro de la tabla BLOG', '2020-07-08 21:21:22.073070'),
(14, 'BLOG', 'Se ha eliminado el registro 123123124', '2020-07-08 21:57:08.890920'),
(15, 'BLOG', 'Se ha eliminado el registro Prueba 213123123', '2020-07-08 22:01:57.363740');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usr` int(11) UNSIGNED NOT NULL,
  `nombre_usr` varchar(255) NOT NULL,
  `telefono_usr` varchar(20) NOT NULL,
  `direccion_usr` varchar(150) NOT NULL,
  `correo_usr` text NOT NULL,
  `password_usr` varchar(15) NOT NULL,
  `status_usr` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usr`, `nombre_usr`, `telefono_usr`, `direccion_usr`, `correo_usr`, `password_usr`, `status_usr`) VALUES
(1, 'Michelle', '9983054641', 'SM 525', 'michellemtzmtz@hotmail.com', '123456', 1),
(3, 'Alejandra', '123456', 'Villas otoch', 'alej@gmail.com', '123456', 1),
(4, 'Luis', '1234567', 'SMS 520', 'Luis@gmail.com', '1234567', 1),
(7, 'Patricia', '12345678910', 'Sm 525', 'paty@gmail.com', '12131515615', 1),
(9, 'Karen', '99830564594', 'Sm prueba', 'karen@gmail.com', '96587412', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_blog`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usr`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id_blog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usr` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
