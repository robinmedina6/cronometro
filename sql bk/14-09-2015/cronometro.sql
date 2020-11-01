-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2015 a las 14:22:08
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cronometro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia`
--

CREATE TABLE IF NOT EXISTS `competencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `largada` datetime NOT NULL,
  `estado` varchar(10) NOT NULL,
  `observacion` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `competencia`
--

INSERT INTO `competencia` (`id`, `nombre`, `largada`, `estado`, `observacion`) VALUES
(1, 'balineras', '2015-09-09 15:05:22', '0', ''),
(2, 'balineras', '2015-09-09 15:06:36', '1', ''),
(3, 'bajasbalineras', '2015-09-11 00:00:00', '0', 'guarda las bajas de balineras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo`
--

CREATE TABLE IF NOT EXISTS `tiempo` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `hsalida` varchar(12)NULL,
  `hllegada` varchar(12)  NULL,
  `diferencia` varchar(12) NULL,
  `observacion` varchar(100) NOT NULL,
  `id_competencia` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiempo`
--

INSERT INTO `tiempo` (`id`, `numero`, `nombre`, `hsalida`, `hllegada`, `diferencia`, `observacion`, `id_competencia`) VALUES
(9, 0, '', '05:08:22.036', NULL, NULL, '', 0),
(10, 1, '', '23:52:22.000', '00:00:00.000', '00:00:00.000', '', 3),
(11, 2, '', '23:52:57.000', '00:00:00.000', '00:00:00.000', '', 3),
(12, 3, '', '23:53:10.000', '00:00:00.000', '00:00:00.000', '', 3),
(13, 4, '', '23:55:00.000', '00:00:00.000', '00:00:00.000', '', 3),
(14, 5, '', '00:00:00.000', '00:00:00.000', '00:00:00.000', '', 3),
(15, 6, '', '00:00:00.000', '00:00:00.000', '00:00:00.000', '', 3),
(16, 7, '', '00:15:56.000', '00:00:00.000', '00:00:00.000', '', 3),
(17, 8, '', '00:21:26.000', '00:00:00.000', '00:00:00.000', '', 3),
(18, 9, 'f', '00:22:41.000', '00:00:00.000', '00:00:00.000', '', 3),
(19, 10, 'afd', '00:24:18.737', '00:00:00.000', '00:00:00.000', '', 3),
(20, 11, '', '00:25:59.468', '00:00:00.000', '00:00:00.000', '', 3),
(21, 12, '', '00:27:02.633', '00:00:00.000', '00:00:00.000', '', 3),
(22, 10, 'dayan', '01:19:20.733', '00:00:00.000', '00:00:00.000', '', 3),
(23, 3, 'fernandp', '01:26:49.800', '00:00:00.000', '00:00:00.000', '', 3),
(24, 3, 'fernand', '01:27:20.846', '00:00:00.000', '00:00:00.000', '', 3),
(25, 15, '', '01:28:45.287', '00:00:00.000', '00:00:00.000', '', 3),
(26, 16, 'robinson', '17:10:13.341', '22:00:46.743', '04:50:33.402', 'medina', 3),
(27, 1, 'david', '14:00:43.838', '00:00:00.000', '00:00:00.000', '', 3),
(28, 1, '', '15:25:58.563', '22:00:53.047', '06:34:54.484', '', 3),
(29, 2, '', '15:29:10.989', '22:00:56.632', '06:31:45.643', '', 3),
(30, 3, '', '15:31:30.297', '22:00:58.381', '06:29:28.084', '', 3),
(31, 4, '', '19:04:00.691', '22:01:16.248', '02:57:15.557', '', 3),
(32, 5, '', '20:17:54.861', '22:01:17.184', '01:43:22.323', '', 3),
(33, 6, '', '20:20:22.067', '22:01:18.082', '01:40:56.015', '', 3),
(34, 7, '', '20:20:26.060', '22:01:18.602', '01:40:52.542', '', 3),
(35, 8, '', '20:20:28.785', '20:21:31.206', '00:00:00.000', '', 3),
(36, 9, '', '20:20:33.867', '20:22:43.437', '00:00:00.000', '', 3),
(37, 10, '', '20:23:36.611', '20:23:40.109', '00:00:00.000', '', 3),
(38, 11, '', '20:44:59.469', '20:45:34.172', '00:00:00.000', '', 3),
(39, 12, '', '20:45:53.445', '00:00:00.000', '00:00:00.000', '', 3),
(40, 13, '', '20:46:00.671', '20:46:06.578', '00:00:00.000', '', 3),
(41, 14, '', '20:48:20.319', '20:48:24.931', '00:00:00.000', '', 3),
(42, 15, '', '21:41:29.318', '21:41:33.429', '00:00:00.000', '', 3),
(43, 17, '', '21:51:11.246', '00:00:00.000', '00:00:00.000', '', 3),
(44, 18, '', '21:52:12.162', '00:00:00.000', '00:00:00.000', '', 3),
(45, 19, '', '21:53:46.370', '21:58:58.426', '00:00:00.000', '', 3),
(46, 1, 'david', '22:02:15.903', '22:03:29.520', '00:01:13.617', '', 3),
(47, 2, '', '22:03:26.122', '22:03:33.767', '00:00:07.645', '', 3),
(48, 3, '', '22:03:50.488', '22:03:57.178', '00:00:06.690', '', 3),
(49, 4, '', '22:04:35.903', '22:04:36.889', '00:00:00.986', '', 3),
(50, 5, '', '22:04:45.821', '22:04:46.150', '00:00:00.329', '', 3),
(51, 6, '', '22:04:50.384', '22:04:50.521', '00:00:00.137', '', 3),
(52, 7, '', '22:04:55.873', '22:04:58.346', '00:00:02.473', '', 3),
(53, 8, '', '22:05:01.343', '22:05:01.507', '00:00:00.164', '', 3),
(54, 1, '', '22:33:52.125', '22:35:01.049', '00:01:08.924', '', 3),
(55, 1, 'robinson', '11:59:14.034', '00:00:00.000', '00:00:00.000', '', 2),
(56, 2, '', '11:59:21.424', '11:59:45.626', '00:00:24.202', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `user`, `pass`) VALUES
(1, 'robinson', 'rjme', 'rjme'),
(2, 'mauricio', 'jvz', 'jvz');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiempo`
--
ALTER TABLE `tiempo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `competencia`
--
ALTER TABLE `competencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tiempo`
--
ALTER TABLE `tiempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
