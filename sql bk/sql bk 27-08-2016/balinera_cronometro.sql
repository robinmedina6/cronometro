-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-08-2016 a las 01:47:58
-- Versión del servidor: 5.5.44-37.3-log
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `balinera_cronometro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia`
--

CREATE TABLE IF NOT EXISTS `competencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `largada` datetime NOT NULL,
  `estado` varchar(10) NOT NULL,
  `observacion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `hsalida` varchar(13) DEFAULT NULL,
  `hllegada` varchar(13) DEFAULT NULL,
  `diferencia` varchar(13) DEFAULT NULL,
  `observacion` varchar(100) NOT NULL,
  `id_competencia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Volcado de datos para la tabla `tiempo`
--

INSERT INTO `tiempo` (`id`, `numero`, `nombre`, `hsalida`, `hllegada`, `diferencia`, `observacion`, `id_competencia`) VALUES
(1, 1, 'prueba', '14:04:52.508', '14:05:12.331', '00:00:19.823', '', 3),
(2, 1, '', '14:07:18.662', '', '', '', 3),
(3, 1, 'alexander sanchez, sergio lopez', '15:14:41.823', '15:33:15.686', '00:18:33.863', '', 2),
(4, 2, 'yesid fique, herctor sanchez', '15:17:21.666', '15:32:15.171', '00:14:53.505', '', 2),
(5, 3, 'uriel,nelson', '15:19:54.832', '15:33:45.525', '00:13:50.693', '', 2),
(6, 4, 'luis,william', '15:20:53.191', '15:33:29.243', '00:12:36.052', '', 2),
(7, 5, 'diego, sebastian', '15:21:58.815', '15:38:29.123', '00:16:30.308', '', 2),
(8, 6, 'yimi, pipe', '15:23:25.758', '15:36:07.706', '00:12:41.948', '', 2),
(9, 7, 'devid, cristian', '15:24:10.578', '15:40:11.332', '00:16:00.754', '', 2),
(10, 8, 'sergio, william', '15:24:45.833', '15:42:38.237', '00:17:52.404', '', 2),
(11, 9, 'omar, uriel', '15:25:39.218', '15:38:11.110', '00:12:31.892', '', 2),
(12, 10, 'luis, fabian', '15:26:17.455', '15:47:43.816', '00:21:26.361', '', 2),
(13, 11, 'yose, ivan', '15:27:15.949', '15:41:59.997', '00:14:44.048', '', 2),
(14, 12, 'juan, jairo', '15:28:23.537', '15:41:17.305', '00:12:53.768', '', 2),
(15, 13, 'elias, roberto', '15:29:23.696', '15:42:40.829', '00:13:17.133', '', 2),
(16, 14, 'alejandro, yeison', '15:30:22.266', '17:18:41.938', '01:48:19.672', '', 2),
(17, 15, 'rafael, daniel', '15:31:29.218', '15:45:13.922', '00:13:44.704', '', 2),
(18, 16, 'dilan, wilson', '15:33:06.805', '15:47:31.519', '00:14:24.714', '', 2),
(19, 17, 'jose,cesar', '15:34:06.381', '15:46:19.992', '00:12:13.611', '', 2),
(20, 18, 'camilo,leonardo', '15:35:42.059', '15:51:37.509', '00:15:55.450', '', 2),
(21, 19, 'camilo, daniel', '15:36:34.418', '15:52:42.866', '00:16:08.448', '', 2),
(22, 20, 'santos, william', '15:37:58.688', '15:54:15.090', '00:16:16.402', '', 2),
(23, 21, 'tito, cristian', '15:39:09.689', '15:56:15.968', '00:17:06.279', '', 2),
(24, 22, 'samuel,hector', '15:39:41.264', '16:18:00.417', '00:38:19.153', '', 2),
(25, 23, 'cristian, andres', '15:40:18.365', '15:54:48.968', '00:14:30.603', '', 2),
(26, 24, 'nelson, ivan', '15:40:59.394', '15:53:42.873', '00:12:43.479', '', 2),
(27, 25, 'pedro,miguel', '15:41:22.108', '15:57:01.472', '00:15:39.364', '', 2),
(28, 26, 'omar,gabriel', '15:42:03.844', '15:56:17.205', '00:14:13.361', '', 2),
(29, 27, 'stiven,julian', '15:43:17.425', '15:58:25.475', '00:15:08.050', 'listo arreglado le reste 10', 2),
(30, 28, 'elver,daniel', '15:45:30.797', '15:59:44.155', '00:14:13.358', '', 2),
(31, 29, 'juan,wilmer', '15:46:10.303', '15:58:35.789', '00:12:25.486', '', 2),
(32, 30, 'camilo,camilo', '15:47:25.861', '16:01:34.001', '00:14:08.140', '', 2),
(33, 31, 'brayan,victor', '15:48:40.048', '17:18:45.703', '01:30:05.655', '', 2),
(34, 32, 'william,reinaldo', '15:50:50.638', '16:06:51.859', '00:16:01.221', '', 2),
(35, 33, 'daniel,fabio', '15:51:59.415', '16:09:01.762', '00:17:02.347', '', 2),
(36, 34, 'gustavo,daniel', '15:52:56.812', '16:07:26.451', '00:14:29.639', '', 2),
(37, 35, 'jesus,leonel', '15:53:30.606', '16:07:24.282', '00:13:53.676', '', 2),
(38, 36, 'camilo,jordi', '15:53:59.029', '16:07:52.456', '00:13:53.427', '', 2),
(39, 37, 'robin,ivan', '15:54:37.796', '16:07:36.094', '00:12:58.298', '', 2),
(40, 38, 'diego,alfonso', '16:09:23.244', '16:23:25.483', '00:14:02.239', '', 2),
(41, 39, 'luis, yair', '16:09:58.908', '16:24:11.891', '00:14:12.983', '', 2),
(42, 40, 'angie,david', '16:10:23.987', '16:31:35.105', '00:21:11.118', '', 2),
(43, 41, 'carlos,william', '16:10:57.853', '16:23:51.588', '00:12:53.735', '', 2),
(44, 42, 'miguel,marcos', '16:12:30.855', '16:25:45.601', '00:13:14.746', '', 2),
(45, 43, 'oscar, yefer', '16:13:03.026', '16:25:57.077', '00:12:54.051', '', 2),
(46, 44, 'david,yuber', '16:13:54.477', '16:34:13.459', '00:20:18.982', '', 2),
(47, 45, 'cristian,elver', '16:15:15.781', '16:29:26.706', '00:14:10.925', '', 2),
(48, 46, 'nestor, victor', '16:34:52.495', '16:50:18.907', '00:15:26.412', '', 2),
(49, 47, 'fabian,cesar', '16:35:22.241', '16:49:00.298', '00:13:38.057', '', 2),
(50, 48, 'sergio, david', '16:36:03.211', '16:51:36.516', '00:15:33.305', '', 2),
(51, 49, 'nelson, nelson', '16:36:32.029', '16:52:01.343', '00:15:29.314', '', 2),
(52, 50, 'victor, jose', '16:37:24.893', '16:50:54.322', '00:13:29.429', '', 2),
(53, 51, 'yuber, marcos', '16:37:58.793', '16:53:00.004', '00:15:01.211', '', 2),
(54, 52, 'camilo, andres', '16:38:35.453', '16:56:37.517', '00:18:02.064', '', 2),
(55, 53, 'carlos, holman', '16:39:09.302', '16:53:15.045', '00:14:05.743', '', 2),
(56, 54, 'pablo, daniel', '16:39:56.625', '16:56:30.122', '00:16:33.497', '', 2),
(57, 55, 'dario,edwin', '16:40:33.819', '16:55:07.485', '00:14:33.666', '', 2),
(58, 56, 'ferney, angel', '16:41:08.346', '17:05:09.444', '00:24:01.098', '', 2),
(59, 57, 'oscar, juan', '16:42:25.515', '16:57:39.956', '00:15:14.441', '', 2),
(60, 59, 'raul alejandro', '16:43:51.268', '16:56:31.637', '00:12:40.369', '', 2),
(61, 60, 'diego, oscar', '16:44:34.463', '16:56:56.202', '00:12:21.739', '', 2),
(62, 61, 'pablo, julio', '16:45:50.991', '16:59:31.023', '00:13:40.032', '', 2),
(63, 63, 'andres, alejandro', '16:47:13.792', '17:18:48.565', '00:31:34.773', '', 2),
(64, 64, 'fredy, sergio', '16:47:55.746', '17:04:34.318', '00:16:38.572', '', 2),
(65, 66, 'ivan, camilo', '16:49:34.027', '17:18:49.732', '00:29:15.705', '', 2),
(66, 67, 'miguel, sergio', '16:50:20.903', '17:04:25.005', '00:14:04.102', '', 2),
(67, 69, 'nestor, victor', '16:52:21.282', '17:06:35.815', '00:14:14.533', '', 2),
(68, 70, 'brayan, sebastian', '16:53:42.567', '17:08:07.257', '00:14:24.690', '', 2),
(69, 71, 'miguel, wilson', '16:54:14.576', '17:10:00.581', '00:15:46.005', '', 2),
(70, 58, 'edwin, beto', '16:55:11.151', '17:09:15.553', '00:14:04.402', '', 2),
(71, 72, 'yenny, ingrid', '16:56:06.594', '17:16:57.920', '00:20:51.326', '', 2),
(72, 73, 'arley, juan', '16:57:01.318', '17:12:21.717', '00:15:20.399', '', 2),
(73, 75, 'james, carlos', '16:57:49.916', '17:10:22.680', '00:12:32.764', '', 2),
(74, 76, 'luis, jhon', '16:58:38.822', '17:13:04.129', '00:14:25.307', '', 2),
(75, 77, 'kevin, dubiel', '16:59:22.003', '17:12:11.077', '00:12:49.074', '', 2),
(76, 78, 'cristian,santiago', '17:00:00.949', '17:14:58.489', '00:14:57.540', '', 2),
(77, 68, 'jose, cesar', '17:02:28.303', '17:15:43.976', '00:13:15.673', '', 2),
(78, 79, 'francis, wilson', '17:03:32.937', '17:18:25.662', '00:14:52.725', '', 2),
(79, 80, 'fasdf, asdfa', '00:40:13.916', '00:41:10.781', '00:00:56.865', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `user`, `pass`) VALUES
(1, 'robinson', 'rjme', 'rjme'),
(2, 'mauricio', 'jvz', 'jvz');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
