-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-11-2020 a las 11:50:18
-- Versión del servidor: 5.7.32-0ubuntu0.16.04.1
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cronometro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia`
--

CREATE TABLE `competencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `largada` datetime NOT NULL,
  `estado` varchar(10) NOT NULL,
  `observacion` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `competencia`
--

INSERT INTO `competencia` (`id`, `nombre`, `largada`, `estado`, `observacion`) VALUES
(2, 'bajasbalineras', '2015-09-11 00:00:00', '0', 'guarda las bajas de balineras'),
(1, 'balineras', '2016-09-04 22:48:29', '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo`
--

CREATE TABLE `tiempo` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `hsalida` varchar(13) DEFAULT NULL,
  `hllegada` varchar(13) DEFAULT NULL,
  `diferencia` varchar(13) DEFAULT NULL,
  `observacion` varchar(100) NOT NULL,
  `id_competencia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiempo`
--

INSERT INTO `tiempo` (`id`, `numero`, `nombre`, `hsalida`, `hllegada`, `diferencia`, `observacion`, `id_competencia`) VALUES
(1, 1, 'berardo riaÃ±o y fernando morales', '14:41:43.663', '14:52:36.134', '00:10:52.471', '', 1),
(2, 2, 'omar gomez y uriel sierra', '14:42:16.247', '14:56:06.723', '00:13:50.476', '', 1),
(3, 3, 'urbano castillo y lina castillo', '14:42:55.878', '14:59:40.201', '00:16:44.323', '', 1),
(4, 99, 'migue y alejandro larota', '14:43:36.854', '14:57:49.206', '00:14:12.352', '', 1),
(5, 4, 'jonatan vargaz y edwar castiblanco', '14:44:30.381', '14:58:57.620', '00:14:27.239', '', 1),
(6, 5, 'nelson fonseca y andres vargaz', '14:45:03.758', '15:01:35.486', '00:16:31.728', '', 1),
(7, 6, 'yesison jamaica y alejandro jamaica', '14:46:00.805', '15:02:39.303', '00:16:38.498', '', 1),
(8, 7, 'beto cucanchon y sergio otalora', '14:46:35.700', '15:01:31.479', '00:14:55.779', '', 1),
(9, 8, 'marco rodriguez e ivan cely', '14:47:26.764', '15:01:28.630', '00:14:01.866', '', 1),
(10, 9, 'santos rodriguez y yeison cruz', '14:48:05.252', '15:02:02.773', '00:13:57.521', '', 1),
(11, 10, 'dianiel gil y fausto matamoros', '14:49:23.579', '15:09:21.565', '00:19:57.986', '', 1),
(12, 11, 'juan sierra y nicolas sierra', '14:50:02.187', '15:06:12.030', '00:16:09.843', '', 1),
(13, 12, 'cristian betancour y diego quiroga', '14:50:57.986', '15:07:21.768', '00:16:23.782', '', 1),
(14, 13, 'jhon buitrago y duvan lara', '14:51:26.986', '15:08:27.006', '00:17:00.020', '', 1),
(15, 14, 'ivan otalora y german otalora', '14:51:57.202', '15:06:00.530', '00:14:03.328', '', 1),
(16, 15, 'jose buitrago y carlos gil', '14:52:39.786', '15:06:37.087', '00:13:57.301', '', 1),
(17, 16, 'wilson carlos y Juan carlos', '14:53:30.297', '15:17:36.698', '00:24:06.401', '', 1),
(18, 17, 'carlos rodriguez y david castiblanco', '14:54:21.385', '15:11:38.849', '00:17:17.464', '', 1),
(19, 18, 'nelson gomez e ivan sierra', '14:54:56.369', '15:07:29.056', '00:12:32.687', '', 1),
(20, 19, 'camilo buitrago y santiago buitrago', '14:56:57.960', '15:11:40.702', '00:14:42.742', '', 1),
(21, 20, 'luis hernadez y jair rodriguez', '14:57:39.448', '15:10:45.578', '00:13:06.130', '', 1),
(22, 21, 'daniel la rota y helber la rota', '14:58:36.687', '15:16:17.917', '00:17:41.230', '', 1),
(23, 22, 'david toro y miguel murillo', '14:59:07.671', '15:12:18.934', '00:13:11.263', '', 1),
(24, 24, 'orcar tobar y edwin arevalo', '15:00:32.118', '15:15:09.539', '00:14:37.421', '', 1),
(25, 25, 'daniel bautista e ivan sierra', '15:01:10.110', '15:19:41.307', '00:18:31.197', '', 1),
(26, 26, 'santiago aponte y nicolas', '15:01:48.334', '16:24:20.466', '01:22:32.132', '', 1),
(27, 27, 'sergio sierra y leonardo barrera', '15:02:33.829', '15:22:52.376', '00:20:18.547', '', 1),
(28, 28, 'luis osuna y eduar osuna', '15:03:03.534', '15:16:23.459', '00:13:19.925', '', 1),
(29, 29, 'cristian jerez y duvan vargaz', '15:04:00.669', '15:18:32.976', '00:14:32.307', '', 1),
(30, 30, 'jhon parra y jhonatan pulido', '15:04:29.357', '15:20:25.985', '00:15:56.628', '', 1),
(31, 31, 'felipe matamoros oscar perez', '15:09:11.115', '15:27:16.625', '00:18:05.510', '', 1),
(32, 32, 'cristian castiblanco y cristian vanegas', '15:09:53.754', '15:24:21.239', '00:14:27.485', '', 1),
(33, 33, 'fredy morales y angel morales', '15:11:40.538', '15:26:32.713', '00:14:52.175', '', 1),
(34, 34, 'diego sierra y miguel martinez', '15:12:43.769', '15:28:03.738', '00:15:19.969', '', 1),
(35, 35, 'fredy vayadales y carlos monzalve', '15:13:32.072', '15:28:59.591', '00:15:27.519', '', 1),
(36, 36, 'giovany bernal y jhon rincon', '15:14:11.856', '15:29:05.956', '00:14:54.100', '', 1),
(37, 37, 'jhon vargaz y luis atara', '15:14:50.560', '15:32:35.687', '00:17:45.127', '', 1),
(38, 38, 'ferley cely y fabian buitrago', '15:15:28.440', '15:29:31.618', '00:14:03.178', '', 1),
(39, 39, 'jose aponte y luis castillo', '15:16:19.367', '15:34:59.558', '00:18:40.191', '', 1),
(40, 40, 'andres castiblanco y edwin castiblanco', '15:17:07.519', '15:41:07.236', '00:23:59.717', '', 1),
(41, 42, 'nelson castellanos y miguel sanchez', '15:20:54.998', '15:35:42.165', '00:14:47.167', '', 1),
(42, 43, 'miguel  castillo y samuel castillo', '15:22:45.573', '15:36:38.115', '00:13:52.542', 'ojo con estos', 1),
(43, 23, 'edwin zapata y yesid fique', '15:23:55.092', '15:38:17.626', '00:14:22.534', '', 1),
(44, 71, 'elis sanchez y roberto ruiz', '15:26:01.555', '15:39:13.522', '00:13:11.967', '', 1),
(45, 45, 'sergio rodriguez y juan montaÃ±es', '15:35:05.607', '15:51:19.136', '00:16:13.529', '', 1),
(46, 46, 'hernando rodriguez y cristian martinez', '15:35:36.510', '15:49:46.476', '00:14:09.966', '', 1),
(47, 51, 'salvador montaÃ±ez y jose rios', '15:36:29.847', '15:51:27.938', '00:14:58.091', '', 1),
(48, 52, 'david buitrago y diego suarez', '15:36:56.798', '15:50:54.423', '00:13:57.625', '', 1),
(49, 53, 'eduar mendez y ricardo castiblanco', '15:37:32.246', '15:52:26.573', '00:14:54.327', '', 1),
(50, 54, 'rafael otalora y edgar montaÃ±ez', '15:37:58.549', '16:24:24.951', '00:46:26.402', '', 1),
(51, 55, 'james correa y carlos torres', '15:38:29.813', '15:51:14.642', '00:12:44.829', 'ojo con estos', 1),
(52, 56, 'edwin ramirez y andres agudelo', '15:39:03.741', '15:49:51.211', '00:10:47.470', 'ojo con estos', 1),
(53, 57, 'sebastian gallo y alejandro alvaran', '15:39:52.773', '15:52:24.122', '00:12:31.349', '', 1),
(54, 58, 'frank roderiguez y neider rodriguez', '15:40:25.757', '15:53:19.914', '00:12:54.157', '', 1),
(55, 59, 'hidelbrando diaz y jorge reyez', '15:40:59.925', '15:58:23.612', '00:17:23.687', '', 1),
(56, 60, 'diego rodriguez y daniel riveros', '15:41:19.420', '15:54:47.838', '00:13:28.418', '', 1),
(57, 61, 'victor torres y francisco torres', '15:41:42.051', '15:56:47.204', '00:15:05.153', '', 1),
(58, 62, 'cristian bustos y leonardo mendoza', '15:42:08.284', '15:58:45.364', '00:16:37.080', '', 1),
(59, 63, 'jose hernandez y maicol hernadez', '15:42:32.667', '15:56:52.172', '00:14:19.505', '', 1),
(60, 64, 'pedro moso y sebastian otalora', '15:42:58.188', '15:58:39.745', '00:15:41.557', '', 1),
(61, 65, 'luis molina y diego gonzales', '15:43:24.059', '16:24:28.379', '00:41:04.320', '', 1),
(62, 66, 'henrry chavez y alejandro', '15:43:48.795', '15:58:13.672', '00:14:24.877', '', 1),
(63, 67, 'edwin pulido e ivan caicedo', '15:44:46.251', '16:03:35.741', '00:18:49.490', '', 1),
(64, 68, 'jose espinel y milton rios', '15:45:22.650', '15:59:51.417', '00:14:28.767', '', 1),
(65, 69, 'camilo enites y wilmar calanche', '15:45:59.290', '15:58:59.559', '00:13:00.269', '', 1),
(66, 70, 'william quiroga y cristian quiroga', '15:46:22.050', '16:06:08.786', '00:19:46.736', '', 1),
(67, 72, 'david parra y duvan galeano', '15:46:56.562', '16:05:43.840', '00:18:47.278', '', 1),
(68, 73, 'sergio lopez y estiven sanchez', '15:47:23.642', '16:02:06.443', '00:14:42.801', '', 1),
(69, 74, 'jhon vayadales y carlos vayadales', '15:47:45.633', '16:04:28.669', '00:16:43.036', '', 1),
(70, 75, 'william rodriguez y william aponte', '15:48:16.554', '16:02:13.277', '00:13:56.723', '', 1),
(71, 76, 'fredy torre y julian lopez', '15:48:39.233', '16:03:48.520', '00:15:09.287', '', 1),
(72, 77, 'jeferson guerrero y dairon cruz', '15:49:15.649', '16:02:29.508', '00:13:13.859', '', 1),
(73, 41, 'alfonso rodriguez y camilo betancourt', '15:49:45.944', '16:04:20.324', '00:14:34.380', '', 1),
(74, 78, 'yesid buitrago y pablo bonilla', '15:52:56.703', '16:14:28.153', '00:21:31.450', '', 1),
(75, 44, 'jesis espitia y diego jamaica', '15:53:28.631', '16:10:52.023', '00:17:23.392', '', 1),
(76, 80, 'luis mesa y duvan espitia', '15:55:02.048', '16:08:40.665', '00:13:38.617', '', 1),
(77, 50, 'yojan rodriguez y sebastian quiroga', '15:55:42.270', '16:22:03.624', '00:26:21.354', '', 1),
(78, 79, 'juan cely y jeferson gomez', '15:56:51.959', '16:11:41.314', '00:14:49.355', '', 1),
(79, 81, 'laura garcia y sebastian parra', '15:57:21.053', '16:17:33.860', '00:20:12.807', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiempo`
--
ALTER TABLE `tiempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
