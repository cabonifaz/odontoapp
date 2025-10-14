-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-10-2025 a las 18:43:34
-- Versión del servidor: 10.11.14-MariaDB-cll-lve
-- Versión de PHP: 8.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rvvugkfj_db_consultorios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `detalle_pieza` int(11) NOT NULL DEFAULT 0,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `nombre`, `precio`, `detalle_pieza`, `empresa_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'EVALUACION', 0, 0, 1, 1, '2024-11-11 20:25:56', '2024-11-11 21:10:07'),
(2, 'LIMPIEZA DENTAL T', 4500, 0, 1, 1, '2024-11-11 21:13:03', '2024-11-11 21:13:03'),
(3, 'TRATAMIENTO DE ENCIAS', 6000, 0, 1, 1, '2024-11-12 12:41:44', '2024-12-18 18:11:04'),
(4, 'OBTURACIONES', 0, 0, 1, 1, '2024-11-12 17:05:17', '2024-11-12 17:05:17'),
(5, 'BLANQUEAMIENTO DENTAL', 700, 0, 1, 1, '2024-11-14 16:00:25', '2025-02-20 08:47:20'),
(6, 'ENDODONCIA ANTERIOR', 0, 1, 1, 7, '2024-12-16 11:51:39', '2025-07-16 21:22:34'),
(7, 'ENDODONCIA PREMOLAR', 0, 0, 1, 1, '2024-12-16 11:52:06', '2024-12-16 11:52:06'),
(8, 'ENDODONCIA MOLAR', 0, 0, 1, 1, '2024-12-16 11:52:23', '2024-12-16 11:52:23'),
(9, 'RETRATAMIENTO DE ENDODONCIA', 0, 0, 1, 1, '2024-12-16 11:52:42', '2024-12-16 11:52:42'),
(10, 'FIBRA DE VIDRIO', 0, 0, 1, 1, '2024-12-16 11:52:56', '2024-12-16 11:52:56'),
(11, 'CORONA', 0, 0, 1, 1, '2024-12-16 11:53:06', '2024-12-16 11:53:06'),
(12, 'PUENTE', 0, 0, 1, 1, '2024-12-16 11:53:17', '2024-12-16 11:53:17'),
(13, 'PROVISIONALES', 0, 0, 1, 1, '2024-12-16 11:53:28', '2024-12-16 11:53:28'),
(14, 'PLACA DE RELAJAMIENTO', 0, 0, 1, 1, '2024-12-16 11:53:46', '2024-12-16 11:53:46'),
(15, 'RASPADO Y ALISADO RADICULAR', 0, 0, 1, 1, '2024-12-16 11:54:01', '2024-12-16 11:54:01'),
(16, 'EXODONCIA', 0, 0, 1, 1, '2024-12-16 11:54:18', '2024-12-16 11:54:18'),
(17, 'CARILLAS', 1500, 1, 1, 1, '2024-12-16 11:54:32', '2025-03-13 17:45:30'),
(18, 'PPR METAL', 0, 0, 1, 1, '2024-12-16 11:54:43', '2024-12-16 11:54:43'),
(19, 'PROTESIS COMPLETA', 0, 0, 1, 1, '2024-12-16 11:54:59', '2024-12-16 11:54:59'),
(20, 'PPR DE ACRILICO', 0, 0, 1, 1, '2024-12-16 11:55:13', '2024-12-16 11:55:13'),
(21, 'CIRUGIA DE IMPLANTE', 0, 0, 1, 1, '2024-12-16 11:55:26', '2024-12-16 11:55:26'),
(22, 'CORONA SOBRE IMPLANTE', 0, 0, 1, 1, '2024-12-16 11:55:36', '2024-12-16 11:55:36'),
(23, 'PROTOCOLO CIRUGIA', 0, 0, 1, 1, '2024-12-16 11:55:44', '2024-12-16 11:55:44'),
(24, 'PROTESIS SOBRE IMPLANTE', 0, 0, 1, 1, '2024-12-16 11:55:57', '2024-12-16 11:55:57'),
(25, 'TOMOGRAFIA', 0, 0, 1, 1, '2024-12-16 11:56:09', '2024-12-16 11:56:09'),
(26, 'MOCK UP', 0, 0, 1, 1, '2024-12-16 11:56:18', '2024-12-16 11:56:18'),
(27, 'SENSIBILIDAD', 0, 0, 1, 1, '2024-12-16 11:56:28', '2024-12-16 11:56:28'),
(28, 'ATM', 0, 0, 1, 1, '2024-12-16 11:56:37', '2024-12-16 11:56:37'),
(29, 'CIRUGIA', 0, 0, 1, 1, '2024-12-16 11:56:46', '2024-12-16 11:56:46'),
(30, 'TRATAMIENTO ODONTOPEDIATRICO', 0, 0, 1, 1, '2024-12-16 11:56:58', '2024-12-16 11:56:58'),
(31, 'ORTODONCIA', 0, 0, 1, 1, '2024-12-16 11:57:16', '2024-12-16 11:57:16'),
(32, 'CLEAR CORRECTT', 0, 0, 1, 1, '2024-12-16 11:57:34', '2024-12-16 11:57:34'),
(33, 'BOTOX', 0, 0, 1, 1, '2024-12-16 11:57:43', '2024-12-16 11:57:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_paciente`
--

CREATE TABLE `actividades_paciente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detalle_presupuesto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `nueva_cita_id` bigint(20) DEFAULT NULL,
  `medico_id` bigint(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividades_paciente`
--

INSERT INTO `actividades_paciente` (`id`, `detalle_presupuesto_id`, `servicio_id`, `nueva_cita_id`, `medico_id`, `fecha`, `hora_inicio`, `hora_fin`, `estado`, `user_id`, `empresa_id`, `created_at`, `updated_at`) VALUES
(65, 28, 28, 1304, 1, '2025-08-26', '11:00:00', '11:30:00', 1, 7, 1, '2025-08-25 13:05:30', '2025-08-26 13:43:21'),
(66, 28, 102, 1303, 2, '2025-08-29', '10:30:00', '11:00:00', 0, 7, 1, '2025-08-25 13:05:30', '2025-08-26 13:43:00'),
(67, 28, 3, NULL, NULL, NULL, NULL, NULL, 0, 7, 1, '2025-08-25 13:05:30', '2025-08-25 13:05:30'),
(68, 29, 102, NULL, NULL, NULL, NULL, NULL, 0, 7, 1, '2025-08-25 15:14:46', '2025-08-25 15:14:46'),
(69, 29, 3, NULL, NULL, NULL, NULL, NULL, 0, 7, 1, '2025-08-25 15:14:46', '2025-08-25 15:14:46'),
(70, 30, 71, NULL, NULL, NULL, NULL, NULL, 0, 7, 1, '2025-09-03 22:59:13', '2025-09-03 22:59:13'),
(71, 31, 71, 1311, 1, '2025-10-02', '19:00:00', '19:30:00', 0, 7, 1, '2025-10-02 21:28:31', '2025-10-02 21:37:59'),
(72, 32, 3, 1314, 1, '2025-10-09', '09:30:00', '10:00:00', 0, 7, 1, '2025-10-02 21:47:09', '2025-10-02 21:48:10'),
(73, 32, 102, NULL, NULL, NULL, NULL, NULL, 0, 7, 1, '2025-10-02 21:47:09', '2025-10-02 21:47:09'),
(74, 32, 28, NULL, NULL, NULL, NULL, NULL, 0, 7, 1, '2025-10-02 21:47:09', '2025-10-02 21:47:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_por_tratamiento`
--

CREATE TABLE `actividades_por_tratamiento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tratamiento_id` bigint(20) UNSIGNED NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `orden` int(11) NOT NULL DEFAULT 1,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividades_por_tratamiento`
--

INSERT INTO `actividades_por_tratamiento` (`id`, `tratamiento_id`, `servicio_id`, `porcentaje`, `orden`, `empresa_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 39, 100.00, 1, 1, 1, '2024-12-17 10:58:04', '2024-12-17 11:20:36'),
(4, 2, 21, 0.00, 2, 1, 1, '2024-12-17 11:28:57', '2024-12-17 11:28:57'),
(5, 3, 59, 50.00, 1, 1, 1, '2024-12-18 18:00:03', '2024-12-18 18:00:03'),
(6, 3, 60, 25.00, 2, 1, 1, '2024-12-18 18:00:25', '2024-12-18 18:00:25'),
(7, 3, 61, 25.00, 3, 1, 1, '2024-12-18 18:02:48', '2024-12-18 18:02:48'),
(8, 3, 21, 0.00, 4, 1, 1, '2024-12-18 18:04:15', '2024-12-18 18:04:15'),
(9, 5, 3, 100.00, 2, 1, 1, '2025-01-03 13:30:05', '2025-10-02 23:20:52'),
(11, 17, 8, 10.00, 1, 1, 1, '2025-01-21 15:03:45', '2025-01-21 15:03:45'),
(12, 5, 102, 0.00, 1, 1, 1, '2025-01-21 15:48:17', '2025-10-02 23:20:52'),
(14, 5, 28, 0.00, 3, 1, 1, '2025-03-03 17:38:17', '2025-09-03 22:56:29'),
(15, 28, 71, 3.00, 1, 1, 7, '2025-08-23 21:23:59', '2025-08-23 21:23:59'),
(16, 31, 7, 100.00, 1, 1, 7, '2025-08-25 13:09:38', '2025-08-25 13:09:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_medico` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `id_paciente` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `fecha_cita` datetime NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_servicio` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `precio` double(8,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `condicion` int(11) NOT NULL DEFAULT 1,
  `precio_final` double(8,2) NOT NULL DEFAULT 0.00,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `presupuesto_id` bigint(20) NOT NULL DEFAULT 0,
  `tratamiento_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `id_medico`, `id_paciente`, `fecha_cita`, `hora_inicio`, `hora_fin`, `id_servicio`, `precio`, `user_id`, `condicion`, `precio_final`, `empresa_id`, `created_at`, `updated_at`, `estado`, `presupuesto_id`, `tratamiento_id`) VALUES
(1292, 4, 5038, '2025-08-25 00:00:00', '10:30:00', '11:00:00', 2, 0.00, 7, 2, 0.00, 1, '2025-08-25 13:00:56', '2025-08-25 13:00:56', 0, 0, 0),
(1293, 1, 5039, '2025-08-25 00:00:00', '11:30:00', '12:00:00', 16, 0.00, 7, 1, 0.00, 1, '2025-08-25 13:01:24', '2025-08-25 13:01:24', 0, 0, 0),
(1294, 2, 5040, '2025-08-25 00:00:00', '10:30:00', '11:00:00', 39, 0.00, 7, 5, 0.00, 1, '2025-08-25 13:02:01', '2025-08-25 13:02:24', 0, 0, 0),
(1295, 2, 5041, '2025-08-28 00:00:00', '10:00:00', '10:30:00', 39, 0.00, 7, 3, 0.00, 1, '2025-08-25 13:04:38', '2025-08-28 19:30:43', 1, 0, 0),
(1296, 1, 5037, '2025-08-25 00:00:00', '09:00:00', '10:50:00', 26, 0.00, 7, 3, 0.00, 1, '2025-08-25 14:50:42', '2025-08-25 14:50:42', 0, 0, 0),
(1297, 1, 5037, '2025-08-26 00:00:00', '10:00:00', '11:00:00', 1, 0.00, 7, 2, 0.00, 1, '2025-08-25 14:51:40', '2025-08-25 14:51:40', 0, 0, 0),
(1298, 2, 5041, '2025-08-25 00:00:00', '09:30:00', '10:00:00', 2, 0.00, 7, 1, 0.00, 1, '2025-08-25 14:55:08', '2025-08-25 14:55:08', 0, 0, 0),
(1299, 1, 5037, '2025-09-01 00:00:00', '10:00:00', '10:30:00', 111, 0.00, 7, 1, 0.00, 1, '2025-08-25 15:04:39', '2025-08-25 15:04:39', 1, 0, 0),
(1300, 3, 5041, '2025-08-26 00:00:00', '11:30:00', '12:00:00', 39, 0.00, 7, 1, 0.00, 1, '2025-08-26 13:26:53', '2025-08-26 13:26:53', 0, 0, 0),
(1301, 3, 5039, '2025-08-26 00:00:00', '09:00:00', '09:30:00', 2, 0.00, 7, 5, 0.00, 1, '2025-08-26 13:27:14', '2025-08-26 13:27:57', 0, 0, 0),
(1302, 4, 5038, '2025-08-26 00:00:00', '09:30:00', '10:00:00', 39, 0.00, 7, 1, 0.00, 1, '2025-08-26 13:27:33', '2025-08-26 13:27:33', 0, 0, 0),
(1303, 2, 5040, '2025-08-29 00:00:00', '10:30:00', '11:00:00', 102, 0.00, 7, 1, 0.00, 1, '2025-08-26 13:41:29', '2025-08-26 13:43:00', 0, 15, 5),
(1304, 1, 5040, '2025-08-26 00:00:00', '11:00:00', '11:30:00', 28, 0.00, 7, 1, 0.00, 1, '2025-08-26 13:42:24', '2025-08-26 13:42:24', 9, 15, 5),
(1305, 2, 5040, '2025-08-26 00:00:00', '11:00:00', '12:00:00', 1, 0.00, 7, 1, 0.00, 1, '2025-08-26 14:45:23', '2025-08-26 14:45:23', 0, 0, 0),
(1306, 3, 5039, '2025-09-03 00:00:00', '21:30:00', '22:00:00', 28, 0.00, 7, 1, 0.00, 1, '2025-09-03 22:57:35', '2025-09-03 22:57:35', 0, 0, 0),
(1307, 2, 5041, '2025-09-05 00:00:00', '10:30:00', '11:00:00', 27, 0.00, 7, 1, 0.00, 1, '2025-09-05 16:02:33', '2025-09-05 16:02:33', 0, 0, 0),
(1308, 4, 5039, '2025-09-05 00:00:00', '12:00:00', '12:30:00', 39, 0.00, 7, 2, 0.00, 1, '2025-09-05 16:02:49', '2025-09-05 16:02:49', 0, 0, 0),
(1309, 1, 5040, '2025-09-23 00:00:00', '08:00:00', '08:30:00', 22, 0.00, 7, 1, 0.00, 1, '2025-09-23 23:24:44', '2025-09-23 23:24:44', 0, 0, 0),
(1310, 1, 5040, '2025-10-02 00:00:00', '19:30:00', '20:00:00', 7, 0.00, 7, 1, 0.00, 1, '2025-10-02 21:22:44', '2025-10-02 21:22:44', 0, 0, 0),
(1311, 1, 5040, '2025-10-02 00:00:00', '19:00:00', '19:30:00', 71, 0.00, 7, 1, 0.00, 1, '2025-10-02 21:37:59', '2025-10-02 21:37:59', 0, 19, 28),
(1312, 1, 5044, '2025-10-02 00:00:00', '20:00:00', '20:30:00', 28, 0.00, 7, 1, 0.00, 1, '2025-10-02 21:42:48', '2025-10-02 21:42:48', 0, 0, 0),
(1313, 3, 5044, '2025-10-03 00:00:00', '12:00:00', '13:00:00', 1, 0.00, 7, 1, 0.00, 1, '2025-10-02 21:45:24', '2025-10-02 21:45:24', 1, 0, 0),
(1314, 1, 5044, '2025-10-09 00:00:00', '09:30:00', '10:00:00', 3, 0.00, 7, 1, 0.00, 1, '2025-10-02 21:48:10', '2025-10-02 21:48:10', 0, 20, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ruc` char(11) NOT NULL,
  `rsocial` varchar(200) NOT NULL DEFAULT '',
  `direccion` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `telefono` varchar(15) NOT NULL DEFAULT '',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `ruc`, `rsocial`, `direccion`, `email`, `telefono`, `user_id`, `empresa_id`, `created_at`, `updated_at`) VALUES
(2, '20609812509', 'ALZAMORA CALLE INVERSIONES SOCIEDAD ANONIMA CERRADA', 'MZA. G LOTE 7 A.H. MARIA GORETTI', '', '', 1, 1, '2025-02-10 11:43:49', '2025-02-10 11:43:49'),
(4, '03301534', 'LEON PALACIOS CLARA AURORA', '-', '', '', 1, 1, '2025-04-14 20:38:51', '2025-04-14 20:38:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_facturacion`
--

CREATE TABLE `detalle_facturacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facturaciones_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `tratamiento_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `procedimiento_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `importe` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_facturacion`
--

INSERT INTO `detalle_facturacion` (`id`, `facturaciones_id`, `tratamiento_id`, `procedimiento_id`, `importe`, `created_at`, `updated_at`) VALUES
(51, 56, 31, 7, 500, '2025-08-25 13:10:09', '2025-08-25 13:10:09'),
(52, 57, 5, 102, 125, '2025-08-25 15:17:20', '2025-08-25 15:17:20'),
(53, 57, 5, 3, 125, '2025-08-25 15:17:20', '2025-08-25 15:17:20'),
(54, 58, 5, 102, 125, '2025-08-25 15:19:06', '2025-08-25 15:19:06'),
(55, 58, 5, 3, 125, '2025-08-25 15:19:06', '2025-08-25 15:19:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presupuesto`
--

CREATE TABLE `detalle_presupuesto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `presupuesto_id` bigint(20) UNSIGNED NOT NULL,
  `tratamiento_id` bigint(20) UNSIGNED NOT NULL,
  `precio` double UNSIGNED NOT NULL DEFAULT 0,
  `cantidad` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `detalle_pieza` char(50) DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_presupuesto`
--

INSERT INTO `detalle_presupuesto` (`id`, `presupuesto_id`, `tratamiento_id`, `precio`, `cantidad`, `detalle_pieza`, `empresa_id`, `user_id`, `created_at`, `updated_at`) VALUES
(28, 15, 5, 700, 1, NULL, 1, 7, '2025-08-25 13:05:30', '2025-08-25 13:05:30'),
(29, 16, 5, 500, 1, NULL, 1, 7, '2025-08-25 15:14:46', '2025-08-25 15:14:46'),
(30, 18, 28, 15000, 1, NULL, 1, 7, '2025-09-03 22:59:13', '2025-09-03 22:59:13'),
(31, 19, 28, 200, 1, NULL, 1, 7, '2025-10-02 21:28:31', '2025-10-02 21:28:31'),
(32, 20, 5, 700, 1, NULL, 1, 7, '2025-10-02 21:47:09', '2025-10-02 21:47:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre_contacto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre_empresa`, `ruc`, `telefono`, `email`, `direccion`, `nombre_contacto`, `created_at`, `updated_at`) VALUES
(1, 'CONSULTORIOS DEL NORTE', '20604578204', '999999999', 'contacto@delnorte.com', 'Piura', 'Jhon Doe', '2024-09-06 23:11:02', '2024-09-08 15:08:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `enfermedades`
--

INSERT INTO `enfermedades` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'DEPRESION', '2025-04-17 21:15:52', '2025-04-17 21:15:53'),
(2, 'PRESION ALTA', '2025-04-17 21:16:10', '2025-04-17 21:16:11'),
(3, 'ASMA', '2025-04-17 21:16:26', '2025-04-17 21:16:27'),
(4, 'DIABETES', '2025-04-17 21:16:37', NULL),
(5, 'GASTRITIS', '2025-04-17 21:20:59', '2025-04-17 21:21:00'),
(6, 'DESMAYO', '2025-04-17 21:21:17', '2025-04-17 21:21:17'),
(7, 'JAQUECAS', '2025-04-17 21:21:31', '2025-04-17 21:21:32'),
(8, 'ULCERA', '2025-04-17 21:21:43', '2025-04-17 21:21:43'),
(9, 'REUMATISMO', '2025-04-17 21:21:54', '2025-04-17 21:21:54'),
(10, 'CONVULSION', '2025-04-17 21:22:09', '2025-04-17 21:22:09'),
(11, 'CANCER', '2025-04-17 21:22:17', '2025-04-17 21:22:17'),
(12, 'DERRAME', '2025-04-17 21:22:29', '2025-04-17 21:22:30'),
(13, 'HEPATITIS', '2025-04-17 21:22:41', '2025-04-17 21:22:41'),
(14, 'GLAUCOMA', '2025-04-17 21:23:01', '2025-04-17 21:23:02'),
(15, 'VIH', '2025-04-17 21:23:15', '2025-04-17 21:23:16'),
(16, 'PROBLEMA DE TIROIDES', '2025-04-17 21:23:34', '2025-04-17 21:23:35'),
(17, 'PROBLEMA RENAL', '2025-04-17 21:23:51', '2025-04-17 21:23:52'),
(18, 'OSTEOSPOROSIS', '2025-04-17 21:24:07', '2025-04-17 21:24:08'),
(19, 'PROBLEMA CARDIACO', '2025-04-17 21:24:21', '2025-04-17 21:24:22'),
(20, 'PROBLEMA RESPIRATORIO', '2025-04-17 21:24:40', '2025-04-17 21:24:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `nombre_especialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `nombre_especialidad`) VALUES
(1, 'Dentista general'),
(2, 'Odontopediatra'),
(3, 'Ortodoncista'),
(4, 'Periodoncista '),
(5, 'Endodoncista'),
(6, 'Cirujano oral'),
(7, 'Prostodoncista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturaciones`
--

CREATE TABLE `facturaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `presupuesto_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `fecha` datetime NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `medico_tratante_id` bigint(20) UNSIGNED NOT NULL,
  `medico_factura_id` bigint(20) UNSIGNED NOT NULL,
  `tipodoc` varchar(2) NOT NULL,
  `serie` varchar(4) NOT NULL,
  `numdoc` varchar(8) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `igv` decimal(10,2) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `hash_cpe` varchar(255) DEFAULT NULL,
  `estado_sunat` int(11) NOT NULL DEFAULT 0,
  `fecha_cdr` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `num_doc_iden` char(20) DEFAULT '',
  `observaciones` text DEFAULT NULL,
  `baja` int(11) NOT NULL DEFAULT 0,
  `fecha_baja` datetime DEFAULT NULL,
  `ident` char(17) DEFAULT NULL,
  `hash_cpe_baja` varchar(255) DEFAULT NULL,
  `medio_pago` int(11) NOT NULL DEFAULT 0,
  `ticket_baja` char(50) DEFAULT NULL,
  `facturador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `descripcion_error` char(150) DEFAULT NULL,
  `t_doc_iden` char(1) DEFAULT NULL,
  `mostrar_paciente` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `facturaciones`
--

INSERT INTO `facturaciones` (`id`, `presupuesto_id`, `fecha`, `paciente_id`, `medico_tratante_id`, `medico_factura_id`, `tipodoc`, `serie`, `numdoc`, `subtotal`, `igv`, `importe`, `hash_cpe`, `estado_sunat`, `fecha_cdr`, `created_at`, `updated_at`, `user_id`, `empresa_id`, `num_doc_iden`, `observaciones`, `baja`, `fecha_baja`, `ident`, `hash_cpe_baja`, `medio_pago`, `ticket_baja`, `facturador_id`, `descripcion_error`, `t_doc_iden`, `mostrar_paciente`) VALUES
(56, 0, '2025-08-25 09:09:44', 5041, 1, 1, '03', 'B001', '00000001', 423.73, 76.27, 500.00, 'gfBzkxtEhGlHjP5kaPk0lVtrpJw=', 1, '2025-08-25 09:10:10', '2025-08-25 13:10:09', '2025-08-25 13:10:32', 7, 1, '99999999', NULL, 0, NULL, NULL, NULL, 2, NULL, 1, NULL, '1', 0),
(57, 16, '2025-08-25 11:15:59', 5037, 1, 1, '03', 'B001', '00000002', 211.86, 38.14, 250.00, '9rAEsv+smplsDltDQ90J+sp/PCA=', 1, '2025-08-25 11:17:20', '2025-08-25 15:17:20', '2025-08-25 15:17:20', 7, 1, '12345678', 'primer pago', 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '1', 0),
(58, 16, '2025-08-25 11:18:43', 5037, 1, 1, '03', 'B001', '00000003', 211.86, 38.14, 250.00, 'hDY/mYrDZvZHRwQnPhCMVp3WUco=', 1, '2025-08-25 11:19:07', '2025-08-25 15:19:06', '2025-08-25 15:19:06', 7, 1, '12345678', 'segundo pago', 0, NULL, NULL, NULL, 1, NULL, 1, NULL, '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadores`
--

CREATE TABLE `facturadores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `nombre_comercial` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `usuario_emisor` varchar(50) DEFAULT NULL,
  `clave_emisor` varchar(50) DEFAULT NULL,
  `ruta_certificado` varchar(200) DEFAULT NULL,
  `clave_certificado` varchar(50) DEFAULT NULL,
  `ubigeo_dpto` varchar(50) DEFAULT NULL,
  `ubigeo_provincia` varchar(50) DEFAULT NULL,
  `ubigeo_distrito` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `facturadores`
--

INSERT INTO `facturadores` (`id`, `empresa_id`, `ruc`, `razon_social`, `nombre_comercial`, `direccion`, `usuario_emisor`, `clave_emisor`, `ruta_certificado`, `clave_certificado`, `ubigeo_dpto`, `ubigeo_provincia`, `ubigeo_distrito`) VALUES
(1, 1, '20601168431', 'CONSULTORIOS DEL NORTE SAC', 'CONSULTORIOS DEL NORTE', 'CAL.CAMINO REAL 1234', 'GUSTAV25', 'Evol2025', 'sunat_files/NUEVO-CertificadoPFX.pfx', 'Evolution2025', 'PIURA', 'PIURA', 'PIURA'),
(2, 1, '20609027593', 'BUENA SALUD SAC', 'BUENA SALUD', 'CAL.CAMINO REAL 1234', 'ELMERG25', 'Evol2025', 'sunat_files/NUEVO-CertificadoPFX_Evolution.pfx', 'Evolution2025', 'PIURA', 'PIURA', 'PIURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas_v2`
--

CREATE TABLE `historias_clinicas_v2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` date NOT NULL DEFAULT '2025-04-28',
  `tratamiento_medico` varchar(255) DEFAULT NULL,
  `medicamentos_actuales` varchar(255) DEFAULT NULL,
  `problema_cicatrizacion` varchar(255) DEFAULT NULL,
  `transfusion` varchar(255) DEFAULT NULL,
  `radio_quimio` varchar(255) DEFAULT NULL,
  `reaccion_medicamento` varchar(255) DEFAULT NULL,
  `alergia` varchar(255) DEFAULT NULL,
  `problema_articulaciones` varchar(255) DEFAULT NULL,
  `fumador` varchar(255) DEFAULT NULL,
  `toma_alchohol` varchar(255) DEFAULT NULL,
  `embarazada` varchar(255) DEFAULT NULL,
  `ansiedad` varchar(255) DEFAULT NULL,
  `problema_sueno` varchar(255) DEFAULT NULL,
  `ultimo_tratamiento` varchar(255) DEFAULT NULL,
  `complicacion_tratamiento` varchar(255) DEFAULT NULL,
  `sonrisa` varchar(255) DEFAULT NULL,
  `restauraciones` varchar(255) DEFAULT NULL,
  `dientes_blancos` varchar(255) DEFAULT NULL,
  `dolor_masticar` varchar(255) DEFAULT NULL,
  `dolor_musculo` varchar(255) DEFAULT NULL,
  `mordida_inestable` varchar(255) DEFAULT NULL,
  `molestia_masticar` varchar(255) DEFAULT NULL,
  `aprieta_dientes` varchar(255) DEFAULT NULL,
  `uso_placa` varchar(255) DEFAULT NULL,
  `diente_sensible` varchar(255) DEFAULT NULL,
  `diente_cavidad` varchar(255) DEFAULT NULL,
  `caries` varchar(255) DEFAULT NULL,
  `diente_desgaste` varchar(255) DEFAULT NULL,
  `usa_hilo` varchar(255) DEFAULT NULL,
  `hilo_facil` varchar(255) DEFAULT NULL,
  `boca_seca` varchar(255) DEFAULT NULL,
  `sangra_encia` varchar(255) DEFAULT NULL,
  `trato_encias` varchar(255) DEFAULT NULL,
  `problema_aliento` varchar(255) DEFAULT NULL,
  `higiene` varchar(255) DEFAULT NULL,
  `info_adicional` varchar(255) DEFAULT NULL,
  `motivo_consulta` varchar(255) DEFAULT NULL,
  `obser_antecedentes` varchar(255) DEFAULT NULL,
  `obser_enfermedades` varchar(255) DEFAULT NULL,
  `proxima_cita` timestamp NULL DEFAULT NULL,
  `id_cita` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historias_clinicas_v2`
--

INSERT INTO `historias_clinicas_v2` (`id`, `paciente_id`, `version`, `estado`, `fecha_registro`, `tratamiento_medico`, `medicamentos_actuales`, `problema_cicatrizacion`, `transfusion`, `radio_quimio`, `reaccion_medicamento`, `alergia`, `problema_articulaciones`, `fumador`, `toma_alchohol`, `embarazada`, `ansiedad`, `problema_sueno`, `ultimo_tratamiento`, `complicacion_tratamiento`, `sonrisa`, `restauraciones`, `dientes_blancos`, `dolor_masticar`, `dolor_musculo`, `mordida_inestable`, `molestia_masticar`, `aprieta_dientes`, `uso_placa`, `diente_sensible`, `diente_cavidad`, `caries`, `diente_desgaste`, `usa_hilo`, `hilo_facil`, `boca_seca`, `sangra_encia`, `trato_encias`, `problema_aliento`, `higiene`, `info_adicional`, `motivo_consulta`, `obser_antecedentes`, `obser_enfermedades`, `proxima_cita`, `id_cita`, `created_at`, `updated_at`) VALUES
(118, 5041, 1, 1, '2025-08-25', 'hepatitis', 'Omeprazol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hace 2 años', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIMPIEZA DENTAL', NULL, NULL, '2025-08-28 04:00:00', 1295, '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(119, 5037, 1, 1, '2025-08-25', 'si con antenolol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no se cual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Seguimiento semanal', NULL, 'Paciente con covid', '2025-09-01 04:00:00', 1299, '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(120, 5044, 1, 1, '2025-10-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Consulta', NULL, NULL, '2025-10-03 04:00:00', 1313, '2025-10-02 21:45:24', '2025-10-02 21:45:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_medico` varchar(255) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `cmp` varchar(50) NOT NULL,
  `especialidad` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `fyh_ingreso` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `nombre_medico`, `telefono`, `cmp`, `especialidad`, `email`, `direccion`, `fyh_ingreso`, `user_id`, `created_at`, `updated_at`, `empresa_id`) VALUES
(1, 'JHON DOE', '999999999', '7777', 1, 'ETRUCIOS@GMAIL.COM', 'PIURA', '2024-10-22 00:00:00', 1, '2024-09-10 11:46:13', '2025-07-10 15:54:38', 1),
(2, 'COSME FULANITO', '999999999', '878787', 3, 'GTRUCIOS@GMAIL.COM', 'PIURA', '2024-08-06 00:00:00', 1, '2024-09-10 11:46:29', '2025-07-10 15:55:02', 1),
(3, 'CARMEN ELECTRA', '999999999', '8888', 1, 'CCEVASCO@GMAIL.COM', 'PIURA', '2024-08-08 00:00:00', 1, '2024-09-10 11:46:41', '2025-07-10 15:55:29', 1),
(4, 'JUAN PEREZ', '999999999', '9999', 1, 'JAMAYA@GMAIL.COM', 'PIURA', '2024-08-08 00:00:00', 1, '2024-09-10 11:46:50', '2025-07-10 15:55:52', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2024_08_27_172552_create_chirps_table', 2),
(9, '2024_08_29_103322_create_medicos_table', 3),
(10, '2024_09_05_165716_create_pacientes_table', 4),
(11, '2024_09_06_094145_create_administracions_table', 5),
(12, '2024_09_06_094145_create_empresas_table', 6),
(13, '2024_09_06_175154_add_empresa_id_to_users_table', 6),
(14, '2024_09_06_175214_add_empresa_id_to_medicos_table', 6),
(15, '2024_09_06_175227_add_empresa_id_to_pacientes_table', 7),
(18, '2024_09_08_112644_create_servicios_table', 8),
(19, '2024_09_08_113447_create_citas_table', 8),
(20, '2024_09_23_172511_create_permission_tables', 9),
(21, '2024_11_11_190740_create_actividades_table', 10),
(22, '2024_11_12_104436_create_actividades_por_servicio_table', 11),
(23, '2024_11_15_103959_create_actividades_paciente_table', 12),
(24, '2025_01_03_163022_create_presupuestos_table', 13),
(25, '2025_04_17_201757_create_enfermedads_table', 14),
(26, '2025_04_17_201944_create_historial_clinicos_table', 14),
(27, '2025_04_17_202016_create_paciente_enfermedads_table', 14),
(28, '2025_04_18_164417_create_tb_cajas_table', 15),
(29, '2025_04_28_183658_create_historias_clinicas_v2_table', 16),
(30, '2025_04_29_094442_add_historia_clinica_id_to_paciente_enfermedad_table', 17),
(31, '2025_05_28_125902_create_odontogramas_detalle_table', 18),
(32, '2025_07_01_161353_create_productos_almacen_table', 19),
(33, '2025_07_01_162157_create_movimientos_almacen_table', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_almacen`
--

CREATE TABLE `movimientos_almacen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `tipo` enum('entrada','salida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT '2025-07-01',
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_almacen`
--

INSERT INTO `movimientos_almacen` (`id`, `producto_id`, `tipo`, `cantidad`, `precio_unitario`, `motivo`, `fecha`, `usuario_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'entrada', 10, NULL, 'Compra', '2025-07-01', 1, '2025-07-01 18:02:37', '2025-07-01 18:02:37'),
(2, 1, 'salida', 5, NULL, 'Descarte', '2025-07-01', 1, '2025-07-01 18:03:43', '2025-07-01 18:03:43'),
(3, 1, 'salida', 7, NULL, 'Descarte', '2025-07-01', 1, '2025-07-01 19:30:08', '2025-07-01 19:30:08'),
(4, 4, 'entrada', 20, NULL, 'Compra', '2025-07-01', 1, '2025-07-01 20:33:49', '2025-07-01 20:33:49'),
(5, 3, 'entrada', 50, NULL, 'Compra', '2025-07-01', 1, '2025-07-01 20:34:07', '2025-07-01 20:34:07'),
(6, 4, 'salida', 5, NULL, 'Descarte', '2025-07-01', 1, '2025-07-01 20:34:21', '2025-07-01 20:34:21'),
(7, 3, 'salida', 4, NULL, 'Descarte', '2025-07-01', 1, '2025-07-01 20:34:35', '2025-07-01 20:34:35'),
(8, 4, 'entrada', 20, NULL, 'Compra', '2025-07-13', 1, '2025-07-13 20:34:40', '2025-07-13 20:34:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_credito`
--

CREATE TABLE `nota_credito` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `tipodoc` char(2) NOT NULL DEFAULT '07',
  `serie` char(4) NOT NULL DEFAULT '',
  `numdoc` char(8) NOT NULL DEFAULT '',
  `motivo` char(50) DEFAULT '',
  `facturacion_id` bigint(20) UNSIGNED NOT NULL,
  `estado_sunat` int(11) NOT NULL DEFAULT 0,
  `hash_cpe` char(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `facturador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `descripcion_error` char(150) DEFAULT NULL,
  `fecha_cdr` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontogramas_detalle`
--

CREATE TABLE `odontogramas_detalle` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `historia_clinica_id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `desde_diente` int(11) NOT NULL,
  `hasta_diente` int(11) NOT NULL,
  `coordenada_x1` double(8,2) NOT NULL,
  `coordenada_y1` double(8,2) NOT NULL,
  `coordenada_x2` double(8,2) NOT NULL,
  `coordenada_y2` double(8,2) NOT NULL,
  `path_svg` text DEFAULT NULL,
  `zona_id` varchar(30) DEFAULT NULL,
  `texto_x` double(8,2) NOT NULL DEFAULT 0.00,
  `texto_y` double(8,2) NOT NULL DEFAULT 0.00,
  `color` varchar(20) NOT NULL,
  `accion` enum('aplicado','eliminado') NOT NULL DEFAULT 'aplicado',
  `sentido` enum('horario','antihorario') NOT NULL DEFAULT 'horario',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `odontogramas_detalle`
--

INSERT INTO `odontogramas_detalle` (`id`, `historia_clinica_id`, `tipo`, `sigla`, `nombre`, `descripcion`, `observaciones`, `desde_diente`, `hasta_diente`, `coordenada_x1`, `coordenada_y1`, `coordenada_x2`, `coordenada_y2`, `path_svg`, `zona_id`, `texto_x`, `texto_y`, `color`, `accion`, `sentido`, `created_at`, `updated_at`) VALUES
(1707, 118, 'caries', 'CDP', 'Lesión de Caries Dental', 'Lesión de Caries con compromiso de la pulpa.', '', 22, 22, 0.00, 0.00, 0.00, 0.00, NULL, 'CA-P22-C', 0.00, 0.00, 'red', 'aplicado', 'horario', '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(1708, 118, 'espigo', 'EM', 'Espigo – Muñón', 'Línea vertical azul en la raíz unida a un cuadrado en la corona. Si está en mal estado, se dibuja en rojo.', '', 45, 45, 127.50, 285.00, 127.50, 270.00, NULL, NULL, 0.00, 0.00, 'blue', 'aplicado', 'horario', '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(1709, 118, 'fusion', 'FUS', 'Fusión', 'Dos dientes con circunferencias interceptadas (fusión)', '', 33, 34, 399.00, 315.00, 436.50, 315.00, NULL, NULL, 0.00, 0.00, 'blue', 'aplicado', 'horario', '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(1710, 119, 'caries', 'CD', 'Lesión de Caries Dental', 'Lesión de Caries a nivel de la dentina.', 'superficial', 11, 11, 0.00, 0.00, 0.00, 0.00, NULL, 'CA-P11-R', 0.00, 0.00, 'red', 'aplicado', 'horario', '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(1711, 119, 'caries', 'CE', 'Lesión de Caries Dental', 'Lesión de Caries a nivel del esmalte.', 'superficial minima', 18, 18, 0.00, 0.00, 0.00, 0.00, NULL, 'CA-P18-C', 0.00, 0.00, 'red', 'aplicado', 'horario', '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(1712, 119, 'restauracion_definitiva', 'AM', 'Restauración Definitiva', 'Restauración definitiva con Amalgama Dental.', 'cambio', 35, 35, 0.00, 0.00, 0.00, 0.00, 'M 478.7137145996094 275.4622802734375', 'RD-P35-1', 0.00, 0.00, 'blue', 'aplicado', 'horario', '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(1713, 119, 'restauracion_definitiva', 'AM', 'Restauración Definitiva', 'Restauración definitiva con Amalgama Dental.', 'cambio', 35, 35, 0.00, 0.00, 0.00, 0.00, 'M 478.7137145996094 275.4622802734375', 'RD-P35-2', 0.00, 0.00, 'blue', 'aplicado', 'horario', '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(1714, 119, 'restauracion_definitiva', 'AM', 'Restauración Definitiva', 'Restauración definitiva con Amalgama Dental.', 'cambio', 35, 35, 0.00, 0.00, 0.00, 0.00, 'M 478.7137145996094 275.4622802734375', 'RD-P35-3', 0.00, 0.00, 'blue', 'aplicado', 'horario', '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(1715, 119, 'restauracion_definitiva', 'AM', 'Restauración Definitiva', 'Restauración definitiva con Amalgama Dental.', 'cambio', 35, 35, 0.00, 0.00, 0.00, 0.00, 'M 479.7483825683594 273.3929138183594 L 479.7483825683594 273.3929138183594 L 480.7830810546875 273.3929138183594 L 481.8177490234375 273.3929138183594 L 484.92181396484375 274.4276123046875 L 489.060546875 274.4276123046875 L 491.1299133300781 274.4276123046875 L 491.1299133300781 273.3929138183594 L 490.09521484375 273.3929138183594 L 489.060546875 273.3929138183594 L 488.0258483886719 273.3929138183594 L 488.0258483886719 273.3929138183594 L 486.9911804199219 273.3929138183594 L 485.95648193359375 273.3929138183594 L 485.95648193359375 272.3582458496094 L 484.92181396484375 272.3582458496094 L 483.8871154785156 272.3582458496094 L 482.8524475097656 272.3582458496094 L 481.8177490234375 272.3582458496094 L 480.7830810546875 272.3582458496094 L 479.7483825683594 272.3582458496094 L 478.7137145996094 272.3582458496094 L 477.67901611328125 272.3582458496094 L 477.67901611328125 272.3582458496094 L 476.64434814453125 272.3582458496094 L 475.6096496582031 272.3582458496094 L 474.5749816894531 272.3582458496094 L 473.540283203125 272.3582458496094 L 472.505615234375 272.3582458496094 L 471.4709167480469 272.3582458496094 L 471.4709167480469 272.3582458496094 L 470.4362487792969 272.3582458496094 L 469.40155029296875 272.3582458496094 L 469.40155029296875 271.32354736328125 L 469.40155029296875 271.32354736328125 L 470.4362487792969 271.32354736328125 L 471.4709167480469 272.3582458496094 L 471.4709167480469 273.3929138183594 L 472.505615234375 273.3929138183594 L 472.505615234375 273.3929138183594 L 473.540283203125 273.3929138183594 L 473.540283203125 273.3929138183594 L 473.540283203125 274.4276123046875 L 474.5749816894531 274.4276123046875 L 475.6096496582031 274.4276123046875 L 476.64434814453125 274.4276123046875 L 477.67901611328125 274.4276123046875 L 477.67901611328125 274.4276123046875 L 478.7137145996094 274.4276123046875 L 479.7483825683594 274.4276123046875 L 479.7483825683594 274.4276123046875 L 481.8177490234375 274.4276123046875 L 481.8177490234375 274.4276123046875 L 482.8524475097656 274.4276123046875 L 483.8871154785156 274.4276123046875 L 483.8871154785156 274.4276123046875 L 484.92181396484375 274.4276123046875 L 484.92181396484375 273.3929138183594 L 485.95648193359375 273.3929138183594 L 485.95648193359375 273.3929138183594 L 486.9911804199219 273.3929138183594 L 485.95648193359375 273.3929138183594 L 485.95648193359375 273.3929138183594 L 484.92181396484375 273.3929138183594 L 483.8871154785156 273.3929138183594 L 483.8871154785156 273.3929138183594 L 482.8524475097656 273.3929138183594 L 481.8177490234375 273.3929138183594 L 480.7830810546875 273.3929138183594 L 479.7483825683594 273.3929138183594 L 478.7137145996094 273.3929138183594 L 477.67901611328125 273.3929138183594 L 476.64434814453125 273.3929138183594 L 475.6096496582031 273.3929138183594 L 475.6096496582031 273.3929138183594 L 474.5749816894531 273.3929138183594 L 473.540283203125 273.3929138183594 L 473.540283203125 273.3929138183594 L 472.505615234375 273.3929138183594 L 472.505615234375 274.4276123046875 L 472.505615234375 275.4622802734375 L 473.540283203125 275.4622802734375 L 473.540283203125 276.4969787597656 L 474.5749816894531 276.4969787597656 L 475.6096496582031 276.4969787597656 L 475.6096496582031 276.4969787597656 L 476.64434814453125 276.4969787597656 L 477.67901611328125 276.4969787597656 L 477.67901611328125 276.4969787597656 L 478.7137145996094 276.4969787597656 L 479.7483825683594 276.4969787597656 L 479.7483825683594 276.4969787597656 L 480.7830810546875 276.4969787597656 L 481.8177490234375 276.4969787597656 L 481.8177490234375 276.4969787597656 L 482.8524475097656 276.4969787597656 L 483.8871154785156 276.4969787597656 L 483.8871154785156 276.4969787597656 L 484.92181396484375 275.4622802734375 L 485.95648193359375 275.4622802734375 L 485.95648193359375 275.4622802734375 L 486.9911804199219 274.4276123046875 L 488.0258483886719 273.3929138183594 L 489.060546875 272.3582458496094 L 490.09521484375 271.32354736328125 L 491.1299133300781 271.32354736328125 L 492.1645812988281 271.32354736328125 L 492.1645812988281 271.32354736328125 L 493.19927978515625 271.32354736328125 L 492.1645812988281 271.32354736328125 L 492.1645812988281 271.32354736328125 L 492.1645812988281 271.32354736328125 L 491.1299133300781 271.32354736328125 L 490.09521484375 270.28887939453125 L 490.09521484375 270.28887939453125 L 489.060546875 270.28887939453125 L 488.0258483886719 270.28887939453125 L 486.9911804199219 270.28887939453125 L 485.95648193359375 270.28887939453125 L 485.95648193359375 270.28887939453125 L 484.92181396484375 270.28887939453125 L 483.8871154785156 270.28887939453125 L 483.8871154785156 270.28887939453125 L 481.8177490234375 270.28887939453125 L 481.8177490234375 270.28887939453125 L 480.7830810546875 270.28887939453125 L 479.7483825683594 270.28887939453125 L 478.7137145996094 270.28887939453125 L 477.67901611328125 270.28887939453125 L 477.67901611328125 270.28887939453125 L 476.64434814453125 270.28887939453125 L 475.6096496582031 270.28887939453125 L 475.6096496582031 270.28887939453125 L 473.540283203125 270.28887939453125 L 473.540283203125 270.28887939453125 L 472.505615234375 270.28887939453125 L 471.4709167480469 270.28887939453125 L 470.4362487792969 270.28887939453125 L 469.40155029296875 270.28887939453125 L 468.3668518066406 270.28887939453125 L 467.3321838378906 270.28887939453125', 'RD-P35-4', 0.00, 0.00, 'blue', 'aplicado', 'horario', '2025-08-25 15:04:39', '2025-08-25 15:04:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `historia` varchar(20) NOT NULL,
  `tipodocumento` varchar(1) NOT NULL DEFAULT '0',
  `numerodoc` varchar(20) NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ape_paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ape_materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cod_estciv` int(11) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `sexo` int(11) DEFAULT 0,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nacionalidad` int(11) DEFAULT 1,
  `pais_procedencia` varchar(50) DEFAULT NULL,
  `profesion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `historia`, `tipodocumento`, `numerodoc`, `nombres`, `ape_paterno`, `ape_materno`, `cod_estciv`, `email`, `direccion`, `telefono`, `sexo`, `fecha_nacimiento`, `fecha_ingreso`, `created_at`, `updated_at`, `empresa_id`, `user_id`, `nacionalidad`, `pais_procedencia`, `profesion`) VALUES
(5037, 'PA25245', '1', '12345678', 'JUAN', 'PEREZ', 'DIAZ', 1, NULL, NULL, '999547963', 1, '1998-06-12', NULL, '2025-08-25 12:54:29', '2025-08-25 12:54:29', 1, 7, 1, NULL, NULL),
(5038, 'PA74582', '1', '87524132', 'ROSA', 'TALLEDO', 'CARBAJAL', 1, 'prueba@gmail.com', NULL, '956722111', 2, '1985-08-23', NULL, '2025-08-25 12:55:40', '2025-08-25 12:55:40', 1, 7, 1, NULL, NULL),
(5039, 'PA77777', '1', '40507080', 'MARIANO', 'VILLALTA', 'PAREDES', 1, NULL, NULL, '999636444', 1, '2002-10-30', NULL, '2025-08-25 12:57:04', '2025-08-25 12:57:04', 1, 7, 1, NULL, NULL),
(5040, 'PA11111', '1', '77777777', 'ABEL', 'LLANOS', 'LOPEZ', 1, NULL, NULL, NULL, 1, '1997-03-05', NULL, '2025-08-25 12:58:29', '2025-08-25 12:58:29', 1, 7, 1, NULL, NULL),
(5041, 'PA99999', '1', '99999999', 'PAMELA', 'RAMOS', 'GALLO', 1, 'pamelaramos@prueba.com', NULL, '978333222', 2, '1999-05-12', NULL, '2025-08-25 13:00:13', '2025-08-25 13:00:13', 1, 7, 1, NULL, NULL),
(5042, 'ODONTOLOGIA', 'A', '07300185548', 'ALEX', 'RAMIREZ', NULL, 1, NULL, NULL, '8090008876', 1, '2002-02-06', NULL, '2025-08-26 16:15:06', '2025-08-26 16:15:06', 1, 7, 1, NULL, NULL),
(5043, '29329239', '1', '29329239', 'RAUL', 'CALLE', 'MONTOYA', 1, 'rcalle@sosnetperu.com', NULL, '958504056', 1, '1970-05-22', NULL, '2025-08-28 13:49:49', '2025-08-28 13:50:09', 1, 7, 1, NULL, NULL),
(5044, '02860648', '1', '02860648', 'JUAN', 'NAVARRO', 'LOZADA', 1, 'juannavarro49@gmail.com', NULL, '970545555', 1, '2025-10-02', NULL, '2025-10-02 21:41:47', '2025-10-02 21:41:47', 1, 7, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_enfermedad`
--

CREATE TABLE `paciente_enfermedad` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `historia_clinica_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enfermedad_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_registro` date NOT NULL DEFAULT '2025-04-17',
  `activo` tinyint(1) NOT NULL DEFAULT 0,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paciente_enfermedad`
--

INSERT INTO `paciente_enfermedad` (`id`, `paciente_id`, `historia_clinica_id`, `enfermedad_id`, `fecha_registro`, `activo`, `observaciones`, `created_at`, `updated_at`) VALUES
(490, 5041, 118, 13, '2025-08-25', 1, NULL, '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(491, 5041, 118, 7, '2025-08-25', 1, NULL, '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(492, 5041, 118, 2, '2025-08-25', 1, NULL, '2025-08-25 13:04:38', '2025-08-25 13:04:38'),
(493, 5037, 119, 3, '2025-08-25', 1, NULL, '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(494, 5037, 119, 2, '2025-08-25', 1, NULL, '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(495, 5037, 119, 19, '2025-08-25', 1, NULL, '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(496, 5037, 119, 20, '2025-08-25', 1, NULL, '2025-08-25 15:04:39', '2025-08-25 15:04:39'),
(497, 5044, 120, 3, '2025-10-02', 1, NULL, '2025-10-02 21:45:24', '2025-10-02 21:45:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` int(11) NOT NULL,
  `tipodoc` char(2) NOT NULL,
  `serie` char(4) NOT NULL,
  `igv` int(11) NOT NULL DEFAULT 0,
  `facturador_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `tipodoc`, `serie`, `igv`, `facturador_id`) VALUES
(1, '01', 'F001', 18, 1),
(2, '03', 'B001', 18, 1),
(3, '01', 'F001', 18, 2),
(4, '03', 'B001', 18, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('salzamora@gmail.com', '$2y$10$LKSGWhOOW0eHUJR6J2teH.7sFnBsbUB6MGLIf2RuNG6UQ2FOKJ5Ly', '2024-10-16 07:58:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Crear', 'web', '2024-09-26 16:57:35', '2024-09-26 16:57:35'),
(2, 'Modificar', 'web', '2024-09-26 16:57:46', '2024-09-26 16:57:46'),
(3, 'Eliminar', 'web', '2024-09-30 13:25:45', '2024-09-30 13:25:45'),
(4, 'Configurar', 'web', '2024-10-09 02:25:58', '2024-10-09 02:25:58'),
(5, 'Editar medico', 'web', '2024-10-09 05:12:26', '2024-10-09 05:12:26'),
(6, 'Crear cita', 'web', '2024-10-09 05:16:08', '2024-10-09 05:16:08'),
(7, 'Editar cita', 'web', '2024-10-09 05:16:20', '2024-10-09 05:16:20'),
(8, 'Aprobar Presupuesto', 'web', '2025-01-21 10:00:50', '2025-01-21 10:00:50'),
(9, 'Facturar', 'web', '2025-03-04 14:46:02', '2025-03-04 14:46:02'),
(10, 'Crear Presupuesto', 'web', '2025-03-05 13:15:34', '2025-03-05 13:15:34'),
(11, 'Modificar Presupuesto', 'web', '2025-03-05 13:20:05', '2025-03-05 13:20:05'),
(12, 'Ver importe presupuesto', 'web', '2025-03-16 13:51:20', '2025-03-16 13:51:20'),
(13, 'Imprimir presupuesto', 'web', '2025-03-16 13:51:40', '2025-03-16 13:51:40'),
(14, 'hola', 'web', '2025-09-24 00:03:06', '2025-09-24 00:03:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

CREATE TABLE `presupuestos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `medico_id` bigint(20) UNSIGNED NOT NULL,
  `importe` decimal(10,2) NOT NULL DEFAULT 0.00,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `estado` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presupuestos`
--

INSERT INTO `presupuestos` (`id`, `paciente_id`, `fecha`, `medico_id`, `importe`, `empresa_id`, `user_id`, `estado`, `created_at`, `updated_at`) VALUES
(15, 5040, '2025-08-25', 1, 700.00, 1, 7, 1, '2025-08-25 13:05:11', '2025-08-25 13:05:37'),
(16, 5037, '2025-08-25', 2, 500.00, 1, 7, 1, '2025-08-25 15:12:21', '2025-08-25 15:15:48'),
(17, 5041, '2025-08-26', 1, 0.00, 1, 7, 0, '2025-08-26 13:36:50', '2025-08-26 13:36:50'),
(18, 5037, '2025-09-03', 3, 15000.00, 1, 7, 1, '2025-09-03 22:58:45', '2025-09-03 22:59:28'),
(19, 5040, '2025-10-02', 2, 200.00, 1, 7, 1, '2025-10-02 21:26:48', '2025-10-02 21:33:22'),
(20, 5044, '2025-10-02', 1, 700.00, 1, 7, 1, '2025-10-02 21:46:41', '2025-10-02 21:47:23'),
(21, 5037, '2025-10-02', 1, 0.00, 1, 7, 0, '2025-10-02 23:22:44', '2025-10-02 23:22:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_almacen`
--

CREATE TABLE `productos_almacen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 0,
  `precio_compra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ultimo_movimiento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_almacen`
--

INSERT INTO `productos_almacen` (`id`, `nombre`, `presentacion`, `fecha_ingreso`, `stock`, `stock_minimo`, `precio_compra`, `ultimo_movimiento_id`, `usuario_id`, `created_at`, `updated_at`) VALUES
(1, 'BATA CLINICA CELESTE', 'UNIDAD', '2025-07-01', 3, 1, 1.00, 3, 1, '2025-07-01 16:55:07', '2025-08-26 16:13:03'),
(3, 'PRUEBA NUEVO PRODUCTO', 'UNIDAD', '2025-07-01', 56, 5, 1.00, 7, 1, '2025-07-01 19:44:49', '2025-07-01 20:34:35'),
(4, 'GUANTES', 'PAR', '2025-07-01', 50, 5, 1.00, 8, 1, '2025-07-01 19:55:54', '2025-07-13 20:34:40'),
(5, 'Fluor', '10ml', '2025-08-25', 10, 2, 10.00, NULL, 7, '2025-08-25 15:07:47', '2025-08-25 15:07:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'web', '2024-09-26 16:20:09', '2024-09-26 16:20:09'),
(2, 'Usuario', 'web', '2024-09-30 13:25:11', '2024-09-30 13:25:11'),
(3, 'Consultorio', 'web', '2024-10-09 01:27:22', '2024-10-09 01:27:22'),
(4, 'Counter', 'web', '2024-10-14 20:04:28', '2024-10-14 20:04:28'),
(5, 'Invitado', 'web', '2024-10-16 08:39:21', '2024-10-16 08:39:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(2, 1),
(2, 4),
(2, 5),
(3, 1),
(3, 4),
(3, 5),
(4, 1),
(5, 1),
(6, 1),
(6, 3),
(6, 4),
(6, 5),
(7, 1),
(7, 3),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(9, 4),
(10, 1),
(10, 3),
(10, 4),
(11, 1),
(11, 3),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `porcentaje` double(8,2) NOT NULL DEFAULT 0.00,
  `tiempominutos` int(11) NOT NULL DEFAULT 0,
  `estado` int(11) NOT NULL DEFAULT 1,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `abreviatura`, `porcentaje`, `tiempominutos`, `estado`, `empresa_id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'APERTURA DE IMPLANTE', 'AP IMPLANT', 100.00, 60, 1, 1, '2024-09-20 20:01:49', '2024-12-16 14:21:13', 1),
(2, 'APLICACION DE FLUOR', 'AP FLUOR', 100.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-12-16 22:41:44', 1),
(3, 'BLANQUEAMIENTO DENTAL', 'BLANQTO', 100.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-12-16 22:43:09', 1),
(4, 'COLOCACIO DE BOTOX', 'BOTOX', 100.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-12-16 22:45:07', 1),
(5, 'CAMBIO DE TORUNDA EP', 'C TORUNDA EP', 100.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-12-16 22:51:14', 1),
(6, 'CEMENTACIóN DE BOTON DE NANCE', 'C. Boton N.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(7, 'Cementación de brackets', 'C. Brackets', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(8, 'Cementación de Carillas', 'C. Carillas', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(9, 'Cementación de corona', 'C. Corona', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(10, 'Cementación de puente', 'C. Puente', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(11, 'Cirugía de Encias', 'CX.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(12, 'Cirugía de implante', 'Implante', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(13, 'Cirugía gingival', 'Cx. Gingival', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(14, 'Colocación de Bandas', 'Col. Banda', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(15, 'Colocación de Holley', 'Col. Holle', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(16, 'Colocación de Placa', 'C. Placa', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(17, 'Colocación de prótesis', 'C. Protesis', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(18, 'Colocación de Prótesis sobre implante', 'Col. Prot. S', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(19, 'Colocación de Separadores', 'Col. Separ', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(20, 'Colocación Placa', 'C. Placa', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(21, 'Control', 'Ctrl', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(22, 'Control de HK', 'Ctrl HK', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(23, 'Control de ortodoncia', 'Ctrl Ort', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(24, 'Control y Fluor Hk', 'Ctrl F HK', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(25, 'Curetaje gingival', 'C. Gingival', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(26, 'Diagnóstico y presupuesto de ORTO', 'Dx y psto orto', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(27, 'Endodoncia anterior', 'Endo', 550.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(28, 'Evaluación', 'Eval', 100.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(29, 'Evaluación de Ortodoncia', 'Eval. Orto', 350.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(30, 'Exodoncia impactada', 'Ex. Impac', 800.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(31, 'Exodoncia semi impactada', 'Ex. SemI', 500.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(32, 'Exodoncia simple', 'Ex. Simp', 300.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(33, 'Explicación de Tomografía', 'Exp. Tomo', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(34, 'Fibra de vidrio', 'Fibra', 350.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(35, 'Impresión con cubetas', 'Imp. Cub.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(36, 'Impresiones', 'Imp', 100.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(37, 'Impresiones con copas de Reepol', 'Imp. Reepol', 300.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(38, 'Instrumentación', 'Inst.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(39, 'Limpieza Dental', 'Limp. D', 250.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(40, 'Mini Tornillo', 'Min. Tor', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(41, 'Mockup', 'MCK', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(42, 'Obturación', 'Obt', 250.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(43, 'Obturación final de endodoncia', 'Obt. Endo', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(44, 'Obturación HK', 'Obt. HK', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(45, 'Operación Dental', 'OP. Dental', 250.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(46, 'Provisionales', 'Provis.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(48, 'Prueba de enfilado', 'P. Enfilado', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(49, 'Prueba de Metal', 'Pru. Metal', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(50, 'Prueba de rodete', 'P. Rodete', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(51, 'REGENARACION OSEA', 'Reg. Osea', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-06 19:21:09', 1),
(52, 'Retiro de Brackets', 'Ret. Brack', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(53, 'Retiro de coronas', 'Ret. Coronas', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(54, 'Retiro de Mockup', 'Ret. Mocku', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(55, 'Retiro de Puntos', 'R. Ptos', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(56, 'Sellantes', 'Sell.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(57, 'Sesi?n de fotos', 'Fotos', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(58, 'Tallado', 'Tallad', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(59, 'TRATAMIENTO DE ENCIAS I', 'Tto EncaI', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-08-20 17:30:20', 1),
(60, 'TRATAMIENTO DE ENCIAS II', 'Tto EncaII', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-06 19:19:24', 1),
(61, 'TRATAMIENTO DE ENCIAS III', 'Tto EncaIII', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-06 19:19:45', 1),
(62, 'APICEPTOMIA', 'APIC', 90.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-12-16 22:32:49', 1),
(63, 'COLOCACION DE CLEARS CORRETT', 'Col. Cle. Cor', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(64, 'COLOCACION DE CONTENSION', 'COL. CONTE', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(65, 'CONTROL DE CARILLAS', 'CON. CARIL', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(66, 'CONTROL DE CIRUGIA', 'CON. CIRUG', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(67, 'CONTROL DE CLEARS CORRETT', 'Con. Cle. Cor', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(68, 'CONTROL DE CORONAS', 'CTL. CORONAS', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-10 11:40:21', 1),
(69, 'CONTROL DE CURETAJE GINGIVAL', 'Con. Cur. Gin', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(70, 'CONTROL DE DOLOR', 'CON. DOLOR', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(71, 'CONTROL DE DOLOR DE ATM', 'Ctrl Endo', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(72, 'CONTROL DE ENDODONCIA', 'CON. ENDOD', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(73, 'CONTROL DE EXODONCIA', 'CON. EXODO', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(74, 'CONTROL DE IMPLANTE', 'CTRL IMPLANT', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 2),
(75, 'CONTROL DE INFLAMACION', 'CON. INFLA', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(76, 'CONTROL DE OBTURACION', 'CTRL. OBT.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(77, 'CONTROL DE PACIENTE MEDICADO', 'Con. Pac. Med', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(78, 'CONTROL DE PROTESIS', 'CON. PROTE', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(79, 'CONTROL DE PUENTE', 'CON. PUENT', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(80, 'CONTROL DE REHABILITACION COMPLETA', 'Con. Reh. Com', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(81, 'CONTROL DE SENSIBILIDAD', 'CON. SENSI', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(82, 'IMPRESION PARA CUBETA INDIVIDUAL', 'Imp. Cub. Ind', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(83, 'IMPRESION POR ARRASTRE ATP', 'Imp. Arr. Atp', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(84, 'IMPRESION POR ARRASTRE P ARA BOTON DE NANCE Y REJI', 'IMPR PR', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(85, 'IMPRESION POR ARRASTRE PARA BOTON DE NANCE', 'IMPR PN', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(86, 'IMPRESION POR ARRASTRE PARA LIP BUMMPERS', 'IMPR PB', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(87, 'INVISALING', 'Invi', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(88, 'PRESENTACION DE MOCKUP', 'PRE. MOCKU', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(89, 'RETRATAMIENTO DE ENDODONCIA', 'RET. ENDOD', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(90, 'SCANEO', 'Scan', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(91, 'SCANEO PARA MOCKUP', 'SCA. MOCKU', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(92, 'SCANEO PARA ORTODONCIA', 'SCA. ORTOD', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(93, 'Cirugia de Mucocele', 'Cir. Mucoc', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(94, 'Endodoncia Molar', 'End. Mol', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(95, 'Endodoncia Premolar', 'End. Pre', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(96, 'Endodoncias en dientes deciduos o de leche', 'Endo DL', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(97, 'Obturaciön Compuesta', 'Obt. Com', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(98, 'Pulpotomia', 'Pulp.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(99, 'Topicaciones de fluor', 'Top. fluor', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(100, 'CONTROL DE CORONA', 'CTRL COR.', 0.00, 30, 1, 1, '2024-09-05 11:04:54', '2024-09-20 20:01:49', 1),
(101, 'CONTROL DE PLACA', 'CTRL PLAC', 0.00, 30, 1, 1, '2024-09-05 13:06:31', '2024-09-20 20:01:49', 1),
(102, 'CONTROL DE BLANQUEMIENTO', 'CTRL BLANQ.', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(103, 'CONTROL DE HOLLEY', 'CTRL HOLL', 0.00, 30, 1, 1, '2024-09-05 16:44:42', '2024-09-20 20:01:49', 1),
(104, 'CONTROL DE CONTENCIONES', 'CTRL CONT', 0.00, 30, 1, 1, '2024-09-05 16:45:25', '2024-09-20 20:01:49', 1),
(105, 'EVALUACION DE CLEAR CORRETT', 'EVAL. C.C', 0.00, 30, 1, 1, '2024-09-07 09:42:37', '2024-09-20 20:01:49', 1),
(106, 'CONTROL DE REGENERACIÓN OSEA', 'CTL REG.O', 0.00, 30, 1, 1, '2024-09-07 10:28:37', '2024-09-20 20:01:49', 1),
(107, 'CONTROL DE PROVICIONAL', 'CTL PROV.', 0.00, 30, 1, 1, '2024-09-09 18:41:00', '2024-09-20 20:01:49', 1),
(108, 'CONTROL DE BOTOX', 'CTRL BTX', 0.00, 30, 1, 1, '2024-09-10 11:02:56', '2024-09-20 20:01:49', 1),
(109, 'NO ASISTIO', 'AUSENTE', 0.00, 30, 1, 1, '2024-09-10 11:49:27', '2024-09-10 11:50:34', 1),
(110, 'CONTROL DE APICEPTOMIA', 'CRTL APIC', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(111, 'CARILLA DE RESINA', 'CTL C. RE', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(112, 'TRANSFERENCIA DE MINIPILARES', 'CTRL.TMP', 0.00, 30, 1, 1, '2024-10-04 11:30:38', '2024-09-20 20:01:49', 1),
(113, 'SELECCION DE PILARES', 'SEL.PILAR', 0.00, 30, 1, 1, '2024-09-20 20:01:49', '2024-09-20 20:01:49', 1),
(114, 'OXIDO NITROSO', 'COL.OXIDO', 0.00, 30, 1, 1, '2024-10-19 12:49:12', '2024-09-20 20:01:49', 1),
(115, 'IMPRESIONES PARA  PLACA DE RELAJAMIENTO', 'IMP PLACA DE RELAJ', 400.00, 30, 1, 1, '2024-10-21 13:59:52', '2024-10-21 14:01:08', 2),
(116, 'LIMPIEZA Y APERTURA DE IMPLANTE', 'LC Y APERT IMPL', 250.00, 30, 1, 1, '2024-10-21 20:08:10', '2024-10-21 20:08:10', 2),
(117, 'EXPLICACION DEBOTOX', 'EXPL BOTOX', 2000.00, 30, 1, 1, '2024-10-22 22:51:11', '2024-10-22 22:51:11', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `dni` text DEFAULT NULL,
  `celular` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `email_minedu` text DEFAULT NULL,
  `ape_paterno` text DEFAULT NULL,
  `ape_materno` text DEFAULT NULL,
  `nombres` text DEFAULT NULL,
  `cod_mod` text DEFAULT NULL,
  `NOTA_DO` text DEFAULT NULL,
  `RUBRICA_DO` text DEFAULT NULL,
  `ESTADO_ME` text DEFAULT NULL,
  `NOTA_ME` text DEFAULT NULL,
  `RUBRICA_ME` text DEFAULT NULL,
  `ESTADO_FIN` text DEFAULT NULL,
  `NOTA_FIN` int(11) DEFAULT NULL,
  `rubrica_fin` text DEFAULT NULL,
  `COMPONENTE 1` int(11) DEFAULT NULL,
  `DNI otro` int(11) DEFAULT NULL,
  `ASESORÍA 01` text DEFAULT NULL,
  `ASESORÍA 02` text DEFAULT NULL,
  `ASESORÍA 03` text DEFAULT NULL,
  `ASESORÍA 04` text DEFAULT NULL,
  `ASESORÍA 05` text DEFAULT NULL,
  `ASESORÍA 06` text DEFAULT NULL,
  `N_ASESORIA` int(11) DEFAULT NULL,
  `GIA 01` text DEFAULT NULL,
  `GIA 02` text DEFAULT NULL,
  `GIA 03` text DEFAULT NULL,
  `N_GIA` int(11) DEFAULT NULL,
  `CURSO 01` text DEFAULT NULL,
  `CURSO 02` text DEFAULT NULL,
  `CURSO 03` text DEFAULT NULL,
  `CURSO 04` text DEFAULT NULL,
  `CURSO 05` text DEFAULT NULL,
  `N_CURSO` int(11) DEFAULT NULL,
  `COMPONENTE 2` int(11) DEFAULT NULL,
  `situacion_final` text DEFAULT NULL,
  `archivo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(4, '70337255', '918397258', 'DBRANDONEDGAR@GMAIL.COM', 'brandon.diazc@minedu.edu.pe', 'DIAZ                               ', 'CHUQUIMIA                          ', 'BRANDON EDGAR                 ', '1559582', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70337255, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70337255.pdf'),
(5, '10076411', '926652060', 'agarciamejia27@gmail.com', 'alfredo.garciame@minedu.edu.pe', 'GARCIA                             ', 'MEJIA                              ', 'ALFREDO                       ', '1529304', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 10076411, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10076411.pdf'),
(11, '46547099', '987603348', 'hebert_90_21@hotmail.com', 'HEBERTDANIL.ROJASGONZ@minedu.edu.pe', 'ROJAS                              ', 'GONZALES                           ', 'HEBERT DANILO                 ', '1183631', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 46547099, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46547099.pdf'),
(12, '70152361', '910469747', 'LS.SALVATIERRA.07@GMAIL.COM', 'LINDEMBERGSEBAS.SALVATIERRACOTR@minedu.edu.pe', 'SALVATIERRA                        ', 'COTRINA                            ', 'LINDEMBERG SEBASTIAN          ', '0394213', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70152361, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70152361.pdf'),
(13, '16674180', '947919810', 'MARY15521@HOTMAIL.COM', 'VICTORORLAN.SANTISTEBANGARC@minedu.edu.pe', 'SANTISTEBAN                        ', 'GARCIA                             ', 'VICTOR ORLANDO                ', '1469360', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 16674180, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16674180.pdf'),
(14, '20035751', '956275424', 'RAQUELVB345@GMAIL.COM', 'RAQUEL.VELIZBUEN@minedu.edu.pe', 'VELIZ                              ', 'BUENDIA                            ', 'RAQUEL                        ', '1529262', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 20035751, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '20035751.pdf'),
(16, '16447978', '999095057', 'jorgezapata868@hotmail.com', 'JORGEALBER.ZAPATACRUZ@minedu.edu.pe', 'ZAPATA                             ', 'CRUZ                               ', 'JORGE ALBERTO                 ', '0790667', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 16447978, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16447978.pdf'),
(17, '71060445', '994195329', 'EVELINDANITZAAV@GMAIL.COM', 'EVELINDANIT.AGUILARVASQ@minedu.edu.pe', 'AGUILAR                            ', 'VASQUEZ                            ', 'EVELIN DANITZA                ', '0571034', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71060445, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71060445.pdf'),
(18, '70452498', '951171674', 'noemi.yosselincs27@gmail.com', 'NOEMIYOSSE.CHOQUESIGU@minedu.edu.pe', 'CHOQUE                             ', 'SIGUAIRO                           ', 'NOEMI YOSSELIN                ', '506154', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70452498, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70452498.pdf'),
(19, '47859173', '973616059', 'ENALITACORDOVARUIZ@GMAIL.COM', 'ENALITA.CORDOVARUIZ@minedu.edu.pe', 'CORDOVA                            ', 'RUIZ                               ', 'ENALITA                       ', '1745835', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47859173, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47859173.pdf'),
(20, '43246814', '981786730', 'benamoron@hotmail.com', 'HEIDYCONSU.GONZALEZMORO@minedu.edu.pe', 'GONZALEZ                           ', 'MORON                              ', 'HEIDY CONSUELO                ', '1660364', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43246814, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43246814.pdf'),
(21, '71275033', '959250944', 'HUANACUNIPEREZHILDA@GMAIL.COM', 'HILDAJESSI.HUANACUNIPERE@minedu.edu.pe', 'HUANACUNI                          ', 'PEREZ                              ', 'HILDA JESSICA                 ', '0536383', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71275033, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71275033.pdf'),
(22, '03365511', '917765487', 'MARIAJARAMILLOCARRASCO8@GMAIL.COM', 'MARIAARMAN.JARAMILLOCARR@minedu.edu.pe', 'JARAMILLO                          ', 'CARRASCO                           ', 'MARIA ARMANDINA               ', '1715739', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 3365511, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03365511.pdf'),
(23, '76741262', '989953806', 'fidelia280897@outlook.com', 'FIDELIARUBER.JIMENEZYAGU@minedu.edu.pe', 'JIMENEZ                            ', 'YAGUANA                            ', 'FIDELIA RUBERTANY             ', '0622449', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 76741262, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76741262.pdf'),
(24, '45553089', '950646770', 'GIULIANALARACHUGNAS@GMAIL.COM', 'GIULIANAFRANC.LARACHUG@minedu.edu.pe', 'LARA                               ', 'CHUGNAS                            ', 'GIULIANA FRANCESCA            ', '1138106', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45553089, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45553089.pdf'),
(25, '40675140', '987254418', 'sare_cancer80@hotmail.com', 'SARELABEXZA.LIMAZURI@minedu.edu.pe', 'LIMA                               ', 'ZURITA                             ', 'SARELA BEXZABE                ', '1648385', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40675140, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40675140.pdf'),
(26, '73481052', '929230695', 'LIAMARIBEL1809@GMAIL.COM', 'JULIAMARIB.LOMAALEJ@minedu.edu.pe', 'LOMA                               ', 'ALEJO                              ', 'JULIA MARIBEL                 ', '1782135', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73481052, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73481052.pdf'),
(27, '70801256', '973512188', 'LIDIAMAYILILUPACALUPACA@GMAIL.COM', 'LIDIAMAYIL.LUPACALUPA@minedu.edu.pe', 'LUPACA                             ', 'LUPACA                             ', 'LIDIA MAYILI                  ', '0259648', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70801256, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70801256.pdf'),
(28, '16698906', '995513039', 'vilmanavarretequintos@gmail.com', 'VILMA.NAVARRETEQUIN@minedu.edu.pe', 'NAVARRETE                          ', 'QUINTOS                            ', 'VILMA                         ', '1139088', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16698906, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16698906.pdf'),
(29, '70912750', '915156908', 'briyith_201@hotmail.com', 'BRIGIDAEUGEN.NINAMAMA@minedu.edu.pe', 'NINA                               ', 'MAMANI                             ', 'BRIGIDA EUGENIA               ', '0536383', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70912750, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70912750.pdf'),
(30, '32139403', '924525445', 'CECILIA_UNIVERSIDAD_01@HOTMAIL.COM', 'cecilia.nizamaj@minedu.edu.pe', 'NIZAMA                             ', 'JUAREZ                             ', 'CECILIA                       ', '1567239', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 32139403, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32139403.pdf'),
(31, '42257110', '968060291', 'aslheychura1109@gmail.com', 'MARIAYSABE.QUISPECHUR@minedu.edu.pe', 'QUISPE                             ', 'CHURA DE BURGOS                    ', 'MARIA YSABEL                  ', '1567205', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42257110, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42257110.pdf'),
(32, '77300028', '957129583', 'CARLAUGARTE204@GMAIL.COM', 'carla.ugartec@minedu.edu.pe', 'UGARTE                             ', 'CALLO                              ', 'CARLA NADDYA                  ', '1588482', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77300028, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77300028.pdf'),
(33, '42588091', '910853744', 'SONIA14Y15@GMAIL.COM', 'VILMASONIA.VASQUEZMAMA@minedu.edu.pe', 'VASQUEZ                            ', 'MAMANI                             ', 'VILMA SONIA                   ', '0571034', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42588091, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42588091.pdf'),
(36, '15760616', '991416640', 'CRISTINA20678@GMAIL.COM', 'MARIACRIST.CASTILLOESTU@minedu.edu.pe', 'CASTILLO                           ', 'ESTUPIÑAN                          ', 'MARIA CRISTINA                ', '1456821', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 15760616, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '15760616.pdf'),
(37, '47620769', '921751340', 'castillovasquezcarolyne@gmail.com', 'carolyne.castillov@minedu.edu.pe', 'CASTILLO                           ', 'VASQUEZ                            ', 'CAROLYNE SILVANA              ', '1427418', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47620769, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47620769.pdf'),
(42, '32734674', '952878988', 'ARIES_ISABEL_4@HOTMAIL.COM', 'ROSAISABE.IBAÑEZCORA@minedu.edu.pe', 'IBAÑEZ                             ', 'CORALES                            ', 'ROSA ISABEL                   ', '1455831', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 32734674, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32734674.pdf'),
(45, '46344111', '981686777', 'silvialorena-1990@hotmail.com', 'SILVIALOREN.MENDOCILLAMEND@minedu.edu.pe', 'MENDOCILLA                         ', 'MENDEZ                             ', 'SILVIA LORENA                 ', '1550359', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46344111, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46344111.pdf'),
(50, '47848454', '992161029', 'RALONSOCOLLAZOS@GMAIL.COM', 'RUDYYOSEL.ALONSOCOLL@minedu.edu.pe', 'ALONSO                             ', 'COLLAZOS                           ', 'RUDY YOSELI                   ', '1343268', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 47848454, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47848454.pdf'),
(51, '43194604', '990811164', 'sppedy101@hotmail.com', 'OSCARSTEVE.BECERRANAMO@minedu.edu.pe', 'BECERRA                            ', 'NAMOC                              ', 'OSCAR STEVEN                  ', '0475640', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43194604, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43194604.pdf'),
(52, '18171520', '961837671', 'rocioburgosgordillo@gmail.com', 'ROCIODEL.BURGOSGORD@minedu.edu.pe', 'BURGOS                             ', 'GORDILLO                           ', 'ROCIO DEL PILAR               ', '1370600', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 18171520, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18171520.pdf'),
(53, '02835338', '945012225', 'leoroca14@hotmail.com', 'ROGERALEXA.CARRILLOREYE@minedu.edu.pe', 'CARRILLO                           ', 'REYES                              ', 'ROGER ALEXANDER               ', '0576777', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 2835338, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02835338.pdf'),
(54, '03673313', '930210470', 'jdcm7771604@gmail.com', 'JUANDANIE.COLMENARESMART@minedu.edu.pe', 'COLMENARES                         ', 'MARTINEZ                           ', 'JUAN DANIEL                   ', '0576801', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 3673313, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03673313.pdf'),
(55, '47940277', '951426445', 'isabelhuayan@gmail.com', 'MARIAISABE.HUAYANBRIC@minedu.edu.pe', 'HUAYAN                             ', 'BRICEÑO                            ', 'MARIA ISABEL                  ', '1627876', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 47940277, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47940277.pdf'),
(56, '43757339', '940176640', 'viclez_0729@hotmail.com', 'VICKYLILIA.LEZAMAAQUI@minedu.edu.pe', 'LEZAMA                             ', 'AQUINO                             ', 'VICKY LILIANA                 ', '1627850', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43757339, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43757339.pdf'),
(57, '72488189', '990606777', 'CESARMENDOZAPRADA@GMAIL.COM', 'cesar.mendozapr@minedu.edu.pe', 'MENDOZA                            ', 'PRADA                              ', 'CESAR MARINO                  ', '1211614', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 72488189, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72488189.pdf'),
(58, '40709544', '932343261', 'rosmerymonsefu@gmail.com', 'ROSMERY.MONSEFUQUIR@minedu.edu.pe', 'MONSEFU                            ', 'QUIROZ                             ', 'ROSMERY                       ', '1719020', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40709544, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40709544.pdf'),
(59, '73628492', '928360813', 'ANGIEMORETOGUEVARA@GMAIL.COM', 'angie.moretog@minedu.edu.pe', 'MORETO                             ', 'GUEVARA                            ', 'ANGIE VANESSA                 ', '1157080', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 73628492, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73628492.pdf'),
(60, '02861936', '969648044', 'lauamarielaq0@gmail.com', 'LAURAMARIE.QUITOALVA@minedu.edu.pe', 'QUITO                              ', 'ALVA                               ', 'LAURA MARIELA                 ', '0719005', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 2861936, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02861936.pdf'),
(61, '02854900', '964543337', 'carisa_74@hotmail.com', 'carina.riverac@minedu.edu.pe', 'RIVERA                             ', 'CARRASCO                           ', 'CARINA ISABEL                 ', '0490474', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 2854900, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02854900.pdf'),
(62, '42043506', '928865427', 'hardman1533@gmail.com', 'antonio.ruizg@minedu.edu.pe', 'RUIZ                               ', 'GARCIA                             ', 'ANTONIO MIGUEL                ', '1529270', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42043506, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42043506.pdf'),
(63, '40294724', '934518259', 'osmanmiguel@hotmail.com', 'OSMANMIGUE.ZAVALETACHAV@minedu.edu.pe', 'ZAVALETA                           ', 'CHAVEZ                             ', 'OSMAN MIGUEL                  ', '1252253', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 40294724, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40294724.pdf'),
(64, '42079810', '952070301', 'MAGUIMEN04@GMAIL.COM', 'MARISOL.AGUILARMEND@minedu.edu.pe', 'AGUILAR                            ', 'MENDOZA                            ', 'MARISOL                       ', '0366369', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42079810, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42079810.pdf'),
(65, '41575831', '936906899', 'princess_karlita@hotmail.com', 'KARLAFRANC.ALVARADOGARC@minedu.edu.pe', 'ALVARADO                           ', 'GARCIA                             ', 'KARLA FRANCISCA               ', '0822189', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41575831, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41575831.pdf'),
(66, '18177575', '948401618', 'carismatico.01@hotmail.com', 'ROGEROVIDI.ARGOMEDOGONZ@minedu.edu.pe', 'ARGOMEDO                           ', 'GONZALES                           ', 'ROGER OVIDIO                  ', '1170182', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 18177575, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18177575.pdf'),
(67, '70278744', '983320817', 'KIMBERLI.BALTODANO2@GMAIL.COM', 'KIMBERLIJAEL.BALTODANOCONT@minedu.edu.pe', 'BALTODANO                          ', 'CONTRERAS                          ', 'KIMBERLI JAEL                 ', '1758630', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70278744, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70278744.pdf'),
(68, '41375753', '986034403', 'LILICABEZA16@GMAIL.COM', 'LILIANASOLED.CABEZAYUPA@minedu.edu.pe', 'CABEZA                             ', 'YUPANQUI                           ', 'LILIANA SOLEDAD               ', '1763606', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41375753, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41375753.pdf'),
(69, '70690667', '920190616', 'mayra_24_2011@hotmail.com', 'MAYRAELIZA.CARRANZALOPE@minedu.edu.pe', 'CARRANZA                           ', 'LOPEZ                              ', 'MAYRA ELIZABETH               ', '0520395', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70690667, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70690667.pdf'),
(70, '16705085', '938645080', 'jleonz@hotmail.com', 'PATRICIAVERON.FALLAQUELEON@minedu.edu.pe', 'FALLAQUE                           ', 'LEON                               ', 'PATRICIA VERONICA             ', '1159649', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16705085, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16705085.pdf'),
(71, '06793984', '921512815', 'ANAMARIAFERNANDEZMANAY@GMAIL.COM', 'ana.fernandezm@minedu.edu.pe', 'FERNANDEZ                          ', 'MANAY                              ', 'ANA MARIA                     ', '0572735', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 6793984, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '06793984.pdf'),
(72, '40342907', '942266833', 'megdaliguerra15@hotmail.com', 'MEGDALIKARIN.GUERRAMÉND@minedu.edu.pe', 'GUERRA                             ', 'MÉNDEZ                             ', 'MEGDALI KARINA                ', '0508762', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40342907, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40342907.pdf'),
(73, '16787098', '999662097', 'katilu_23@hotmail.com', 'DANNIAKATHE.LEGUIASALA@minedu.edu.pe', 'LEGUIA                             ', 'SALAZAR                            ', 'DANNIA KATHERINE              ', '0445890', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16787098, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16787098.pdf'),
(74, '42508643', '941188283', 'amatiasac@gmail.com', 'alicia.matiasa@minedu.edu.pe', 'MATIAS                             ', 'ANCI                               ', 'ALICIA                        ', '0396291', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42508643, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42508643.pdf'),
(75, '47997963', '971427695', 'julianajosif@gmail.com', 'JULIANASTEFH.MEDINASIES@minedu.edu.pe', 'MEDINA                             ', 'SIESQUEN                           ', 'JULIANA STEFHANY              ', '0456277', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47997963, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47997963.pdf'),
(76, '16733306', '953509371', 'mowiroka2@hotmail.es', 'MONICADEL.PEREZPERE@minedu.edu.pe', 'PEREZ                              ', 'PEREZ                              ', 'MONICA DEL PILAR              ', '1750942', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16733306, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16733306.pdf'),
(77, '72467626', '912107072', 'liz.pineda21eg@hotmail.com', 'LETICIAELIZA.PINEDAGUTI@minedu.edu.pe', 'PINEDA                             ', 'GUTIERREZ                          ', 'LETICIA ELIZABETH             ', '1170554', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72467626, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72467626.pdf'),
(79, '75717246', '979953542', 'ERICAVL777@GMAIL.COM', 'ERICAELIZA.VÁSQUEZLUPÚ@minedu.edu.pe', 'VASQUEZ                            ', 'LUPU                               ', 'ERICA ELIZABETH               ', '1541432', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75717246, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75717246.pdf'),
(80, '27081648', '938357442', 'carmenvillar1975@gmail.com', 'CARMENROSA.VILLARBUST@minedu.edu.pe', 'VILLAR                             ', 'BUSTAMANTE                         ', 'CARMEN ROSA                   ', '1155597', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 27081648, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '27081648.pdf'),
(81, '45212332', '933427427', 'diamari_acuario@hotmail.com', 'DIANAMARIL.AVILAOLAY@minedu.edu.pe', 'AVILA                              ', 'OLAYA                              ', 'DIANA MARILU                  ', '0466870', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45212332, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45212332.pdf'),
(82, '45006446', '946936340', 'alicia_cp16@hotmail.com', 'alicia.cabanillasp@minedu.edu.pe', 'CABANILLAS                         ', 'PULIDO                             ', 'ALICIA JUDITH                 ', '0346684', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45006446, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45006446.pdf'),
(83, '45939799', '950301405', 'JENNY_EDITH15@HOTMAIL.COM', 'LADY.CALDERONCARH@minedu.edu.pe', 'CALDERON                           ', 'CARHUACHINCHAY                     ', 'LADY                          ', '0446898', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45939799, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45939799.pdf'),
(84, '44763025', '951933287', 'rubyrocy_0109@hotmail.com', 'RUBYDEL.CARBAJALSAMI@minedu.edu.pe', 'CARBAJAL                           ', 'SAMILLAN                           ', 'RUBY DEL ROCIO                ', '0452052', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44763025, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44763025.pdf'),
(85, '45265844', '955131234', 'iris_243_7@hotmail.com', 'JUANAIRIS.CORDOVATORR@minedu.edu.pe', 'CORDOVA                            ', 'TORRES                             ', 'JUANA IRIS                    ', '0466870', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45265844, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45265844.pdf'),
(86, '44310867', '965889655', 'GINCITAAMOR2@GMAIL.COM', 'EVELYN.MENDOZASAYR@minedu.edu.pe', 'MENDOZA                            ', 'SAYRITUPAC                         ', 'EVELYN                        ', '0346577', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 44310867, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44310867.pdf'),
(87, '43505500', '913252157', 'NOEMIMIREZ@GMAIL.COM', 'NOEMI.MIREZGUEV@minedu.edu.pe', 'MIREZ                              ', 'GUEVARA                            ', 'NOEMI                         ', '0620229', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43505500, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43505500.pdf'),
(88, '46392283', '942725950', 'deisy28_05@hotmail.com', 'DEISYSAIRA.MORAVALE@minedu.edu.pe', 'MORA                               ', 'VALENCIA                           ', 'DEISY SAIRA                   ', '0527762', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46392283, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46392283.pdf'),
(89, '45214944', '947134444', 'ANJANETHMZ20@GMAIL.COM', 'anjaneth.mundacaz@minedu.edu.pe', 'MUNDACA                            ', 'ZAVALETA                           ', 'ANJANETH                      ', '0346403', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45214944, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45214944.pdf'),
(90, '45082801', '945385920', 'elizabeth_06_05@hotmail.com', 'ELIZABETH.OLIVERAYANG@minedu.edu.pe', 'OLIVERA                            ', 'YANGUA                             ', 'ELIZABETH                     ', '0346494', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45082801, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45082801.pdf'),
(91, '46059499', '917111446', 'luisa_porras_rojas@hotmail.com', 'LUISASOLED.PORRASROJA@minedu.edu.pe', 'PORRAS                             ', 'ROJAS                              ', 'LUISA SOLEDAD                 ', '0346528', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46059499, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46059499.pdf'),
(92, '47605941', '949155354', 'rosariosanandres@hotmail.com', 'ROSARIOMARIB.RIVERASANA@minedu.edu.pe', 'RIVERA                             ', 'SANANDRES                          ', 'ROSARIO MARIBEL               ', '0347104', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47605941, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47605941.pdf'),
(93, '44496763', '992906760', 'estrella_soldado2507@hotmail.com', 'CYNDIESTRE.SOLDADOCAMP@minedu.edu.pe', 'SOLDADO                            ', 'CAMPOS                             ', 'CYNDI ESTRELLA                ', '0648014', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44496763, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44496763.pdf'),
(94, '44749257', '928454854', 'alex_2105_42@hotmail.com', 'alex.tarrillot@minedu.edu.pe', 'TARRILLO                           ', 'TARRILLO                           ', 'ALEX MICHAEL                  ', '0346445', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44749257, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44749257.pdf'),
(95, '45832653', '940626102', 'emely_vidaurre_44@hotmail.com', 'EMELYFIORE.VIDAURREMACO@minedu.edu.pe', 'VIDAURRE                           ', 'MACO                               ', 'EMELY FIORELLA                ', '0346791', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45832653, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45832653.pdf'),
(96, '45275852', '975158043', 'yuar_25@hotmail.com', 'YURICOARACE.VILLAVICENCIOCABA@minedu.edu.pe', 'VILLAVICENCIO                      ', 'CABALLERO                          ', 'YURICO ARACELY                ', '0446898', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45275852, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45275852.pdf'),
(97, '41843754', '949050246', 'koonnyalbanr@hotmail.com', 'KOONNYMABEL.ALBANREYE@minedu.edu.pe', 'ALBAN                              ', 'REYES                              ', 'KOONNY MABEL                  ', '0259390', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 41843754, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41843754.pdf'),
(98, '45961499', '953413780', 'vanigabi@hotmail.com', 'VANIAGABRI.COAQUIRARODR@minedu.edu.pe', 'COAQUIRA                           ', 'RODRIGUEZ                          ', 'VANIA GABRIELA                ', '0574145', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45961499, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45961499.pdf'),
(99, '73685733', '996946208', 'nair.cruz.bautista@gmail.com', 'carolyn.cruzb@minedu.edu.pe', 'CRUZ                               ', 'BAUTISTA                           ', 'CAROLYN NAYR DE LOS MILAGROS  ', '1587856', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73685733, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73685733.pdf'),
(100, '76465059', '922610251', 'YESSENIACUSTODIO1996@GMAIL.COM', 'YESSENIACHABE.CUSTODIOLOCO@minedu.edu.pe', 'CUSTODIO                           ', 'LOCONI                             ', 'YESSENIA CHABELI              ', '0259622', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76465059, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76465059.pdf'),
(101, '72021429', '928215934', 'kaescobarvil@gmail.com', 'KATHERENELISSE.ESCOBARVILL@minedu.edu.pe', 'ESCOBAR                            ', 'VILLANUEVA                         ', 'KATHERENE LISSET              ', '0807875', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 72021429, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72021429.pdf'),
(102, '47564566', '955779443', 'MELIFAJARDO.A@GMAIL.COM', 'MELISSADENIS.FAJARDOALEJ@minedu.edu.pe', 'FAJARDO                            ', 'ALEJOS                             ', 'MELISSA DENISSE               ', '0807875', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 47564566, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47564566.pdf'),
(103, '71942945', '976512705', 'GRAZIAGARAY@GMAIL.COM', 'GRAZIAYAJAI.GARAYGARC@minedu.edu.pe', 'GARAY                              ', 'GARCIA                             ', 'GRAZIA YAJAIRA                ', '1139963', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71942945, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71942945.pdf'),
(104, '08677772', '996760461', 'wjgwa@hotmail.com', 'adelina.herrerap@minedu.edu.pe', 'HERRERA                            ', 'PIMENTEL                           ', 'ADELINA IRENE                 ', '1714237', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 8677772, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '08677772.pdf'),
(105, '42084312', '948839961', 'mercy-27092010@hotmail.com', 'MERCYJACKE.IMANSOSA@minedu.edu.pe', 'IMAN                               ', 'SOSA DE GUZMAN                     ', 'MERCY JACKELIN                ', '1714542', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42084312, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42084312.pdf'),
(106, '44069901', '986985796', 'mechita171509@gmail.com', 'ROSAMERCE.INFANTEFIES@minedu.edu.pe', 'INFANTE                            ', 'FIESTAS                            ', 'ROSA MERCEDES                 ', '0807941', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44069901, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44069901.pdf'),
(107, '72651736', '943421802', 'LUCCEY.ROSAS@GMAIL.COM', 'LUCCEYYANIR.ROSASCRUZ@minedu.edu.pe', 'ROSAS                              ', 'CRUZ                               ', 'LUCCEY YANIRA                 ', '0259515', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 72651736, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72651736.pdf'),
(108, '74163291', '989347047', 'ISA9318@GMAIL.COM', 'ISABELBEATR.SALASPOVE@minedu.edu.pe', 'SALAS                              ', 'POVES                              ', 'ISABEL BEATRIZ                ', '0259515', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 74163291, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74163291.pdf'),
(109, '74914419', '969677685', 'sanchezramospa14@gmail.com', 'PAULAALEXA.SANCHEZRAMO@minedu.edu.pe', 'SANCHEZ                            ', 'RAMOS                              ', 'PAULA ALEXANDRA               ', '0493650', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 74914419, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74914419.pdf'),
(110, '42811902', '984192420', 'mela2024@yahoo.es', 'PAMELAYENNI.SOLANOREBA@minedu.edu.pe', 'SOLANO                             ', 'REBATTA                            ', 'PAMELA YENNIFER               ', '1714625', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42811902, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42811902.pdf'),
(111, '03888414', '968126824', 'MIMITALVARADO@HOTMAIL.COM', 'MERCEDESNOEMI.TAVARAALVA@minedu.edu.pe', 'TAVARA                             ', 'ALVARADO                           ', 'MERCEDES NOEMI                ', '0259515', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 3888414, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03888414.pdf'),
(112, '47835307', '917096169', '47835307elena@gmail.com', 'ELIZABETHELENA.TICONACARI@minedu.edu.pe', 'TICONA                             ', 'CARI                               ', 'ELIZABETH ELENA               ', '1137546', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 47835307, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47835307.pdf'),
(113, '44532638', '979340235', 'JOSEABE1903@GMAIL.COM', 'YSAURAAMPAR.VALDIVIAMONT@minedu.edu.pe', 'VALDIVIA                           ', 'MONTOYA                            ', 'YSAURA AMPARO                 ', '1137587', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44532638, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44532638.pdf'),
(114, '80615618', '947929821', 'naywi_15@hotmail.com', 'LILIANAEDITH.BALCAZARCAST@minedu.edu.pe', 'BALCAZAR                           ', 'CASTRO DE YNOLOPU                  ', 'LILIANA EDITH                 ', '1139955', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 80615618, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80615618.pdf'),
(115, '00795011', '971991749', 'dinacardenasc2016@gmail.com', 'DINA.CARDENASCUTI@minedu.edu.pe', 'CARDENAS                           ', 'CUTIPA                             ', 'DINA                          ', '0867390', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 795011, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00795011.pdf'),
(116, '42320437', '957624522', 'cleyver_peru@hotmail.com', 'CLEVERNOLBE.CHAVEZHERN@minedu.edu.pe', 'CHAVEZ                             ', 'HERNANDEZ                          ', 'CLEVER NOLBERTO               ', '0348961', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42320437, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42320437.pdf'),
(117, '45388290', '940838271', 'anghelad28@gmail.com', 'anghela.diaza@minedu.edu.pe', 'DIAZ                               ', 'AGUIRRE                            ', 'ANGHELA GIULIANA              ', '0348946', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45388290, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45388290.pdf'),
(118, '01324412', '988875423', 'florescondorimario09@gmail.com', 'MARIO.FLORESCOND@minedu.edu.pe', 'FLORES                             ', 'CONDORI                            ', 'MARIO                         ', '0854885', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 1324412, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '01324412.pdf'),
(119, '42166038', '929783273', 'haydngonza@gmail.com', 'carlos.gonzalesa@minedu.edu.pe', 'GONZALES                           ', 'ALIAGA                             ', 'CARLOS                        ', '0340836', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42166038, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42166038.pdf'),
(120, '40095848', '962728917', 'arlthe.1907@gmail.com', 'NANCY.GUEVARALOZA@minedu.edu.pe', 'GUEVARA                            ', 'LOZANO DE VERGARA                  ', 'NANCY                         ', '1797109', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40095848, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40095848.pdf'),
(124, '26732293', '966535191', 'luismi_mll@hotmail.com', 'LUIS.MINCHANLLIC@minedu.edu.pe', 'MINCHAN                            ', 'LLICO                              ', 'LUIS                          ', '0352005', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 26732293, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '26732293.pdf'),
(125, '01323596', '927214447', 'kariley_9601@hotmail.com', 'CARMENLEYDA.PACAZACA@minedu.edu.pe', 'PACA                               ', 'ZACARI                             ', 'CARMEN LEYDA                  ', '0340802', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 1323596, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '01323596.pdf'),
(126, '02045586', '929113916', 'salvador311076@hotmail.com', 'SALVADOR.PARICCAP@minedu.edu.pe', 'PARI                               ', 'CCAPA                              ', 'SALVADOR                      ', '0350843', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 2045586, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02045586.pdf'),
(128, '03695127', '968447737', 'oraliayahuana@hotmail.com', 'ORALIA.YAHUANAMERI@minedu.edu.pe', 'YAHUANA                            ', 'MERINO                             ', 'ORALIA                        ', '0467555', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 48, 'Logrado', 1, 3695127, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03695127.pdf'),
(129, '30427657', '953250339', 'DANY.YONY.ZEBALLOS@GMAIL.COM', 'DANYYONY.ZEBALLOSTACO@minedu.edu.pe', 'ZEBALLOS                           ', 'TACO                               ', 'DANY YONY                     ', '0348987', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 30427657, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '30427657.pdf'),
(130, '16791605', '992772288', 'lizalemanmedina@gmail.com', 'LIZGERAL.ALEMANMEDI@minedu.edu.pe', 'ALEMAN                             ', 'MEDINA                             ', 'LIZ GERALDINE                 ', '1016807', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16791605, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16791605.pdf'),
(131, '71057755', '946755465', 'luzaynacondori@gmail.com', 'LUZVERON.AYNACOND@minedu.edu.pe', 'AYNA                               ', 'CONDORI                            ', 'LUZ VERONICA                  ', '1561281', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 71057755, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71057755.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(132, '48503302', '931239573', 'yesenia_55_15@hotmail.com', 'YESENIA.CALLATAAPAZ@minedu.edu.pe', 'CALLATA                            ', 'APAZA                              ', 'YESENIA                       ', '0675215', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48503302, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48503302.pdf'),
(133, '75424339', '938668563', 'TATIANACARMEN94GONZALES@GMAIL.COM', 'LEIDYTATIA.CARMENGONZ@minedu.edu.pe', 'CARMEN                             ', 'GONZALES                           ', 'LEIDY TATIANA VANESSA         ', '0571083', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75424339, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75424339.pdf'),
(134, '003314993', '981091554', 'YISEGABO@GMAIL.COM', 'YELIMARCAROL.CARREÑOCAST@minedu.edu.pe', 'CARREÑO                            ', 'CASTILLO                           ', 'YELIMAR CAROLINA              ', '0674762', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 3314993, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '003314993.pdf'),
(135, '41480211', '950757740', 'magdajaneth@hotmail.com', 'MAGDAJANET.CRESPOSÁNC@minedu.edu.pe', 'CRESPO                             ', 'SÁNCHEZ                            ', 'MAGDA JANETH                  ', '1564863', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41480211, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41480211.pdf'),
(136, '44958475', '993720688', 'ale_cp_5@hotmail.com', 'ALEXANDRANANCY.CRUZPARE@minedu.edu.pe', 'CRUZ                               ', 'PAREDES                            ', 'ALEXANDRA NANCY               ', '1516798', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44958475, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44958475.pdf'),
(137, '77672074', '941560623', 'kemerly.ruth12@gmail.com', 'KEMERLYRUTH.DELA@minedu.edu.pe', 'DE LA CRUZ                         ', 'PEÑA                               ', 'KEMERLY RUTH                  ', '0674754', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77672074, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77672074.pdf'),
(138, '15738573', '920842194', 'CDUPUICHCHO@GMAIL.COM', 'candy.dupuichc@minedu.edu.pe', 'DUPUICH                            ', 'CHO                                ', 'CANDY ROSSANA                 ', '1586817', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 15738573, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '15738573.pdf'),
(139, '16717496', '958546105', 'ESTHERCATALINALIVAVAR@GMAIL.COM', 'ESTHERCATAL.LIVAQUEVARG@minedu.edu.pe', 'LIVAQUE                            ', 'VARGAS                             ', 'ESTHER CATALINA               ', '0259663', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 16717496, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16717496.pdf'),
(140, '48062981', '935063260', 'monicaluna635@gmail.com', 'MONICAGLADY.LUNACHOQ@minedu.edu.pe', 'LUNA                               ', 'CHOQUE                             ', 'MONICA GLADYS                 ', '0734921', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48062981, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48062981.pdf'),
(141, '04440137', '978160190', 'marry.wong.146@hotmail.com', 'TEODORAMARIB.MAMANCHURARAMO@minedu.edu.pe', 'MAMANCHURA                         ', 'RAMOS DE CHOQUE                    ', 'TEODORA MARIBEL               ', '0259663', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 4440137, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '04440137.pdf'),
(142, '45253548', '945333536', 'viviyasmin88@gmail.com', 'VILMAYAZMI.ROMEROBARR@minedu.edu.pe', 'ROMERO                             ', 'BARRIENTOS                         ', 'VILMA YAZMINE                 ', '0259663', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45253548, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45253548.pdf'),
(143, '41347706', '974600557', 'TINEOMONJAKAREN@GMAIL.COM', 'KARIN.TINEOMONJ@minedu.edu.pe', 'TINEO                              ', 'MONJA                              ', 'KARIN                         ', '0674754', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41347706, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41347706.pdf'),
(144, '70230744', '947086836', 'yolanda44tc@gmail.com', 'YOLANDA.TORRECARR@minedu.edu.pe', 'TORRE                              ', 'CARRASCO                           ', 'YOLANDA                       ', '0536383', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 70230744, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70230744.pdf'),
(145, '46656055', '996878101', 'cristina_832@hotmail.com', 'CRISTINA.VALDIVIEZOCRUZ@minedu.edu.pe', 'VALDIVIEZO                         ', 'CRUZ                               ', 'CRISTINA                      ', '1096460', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46656055, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46656055.pdf'),
(146, '43209814', '991965589', 'CARLOXMATEX@GMAIL.COM', 'JUANCARLO.AGUIRREGARC@minedu.edu.pe', 'AGUIRRE                            ', 'GARCIA                             ', 'JUAN CARLOS                   ', '1395110', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 43209814, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43209814.pdf'),
(147, '17614461', '947445865', 'juandocente3596@gmail.com', 'JUANANTON.BARDALESMIO@minedu.edu.pe', 'BARDALES                           ', 'MIO                                ', 'JUAN ANTONIO                  ', '0490169', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 17614461, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17614461.pdf'),
(148, '42199027', '916338289', 'cesardiazgonzales@hotmail.com', 'cesar.diazg@minedu.edu.pe', 'DIAZ                               ', 'GONZALES                           ', 'CESAR BERNARDHO               ', '1139351', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42199027, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42199027.pdf'),
(149, '42140918', '949119687', 'CINDYPUICON18@GMAIL.COM', 'EDGAROMAR.DIAZSALA@minedu.edu.pe', 'DIAZ                               ', 'SALAZAR                            ', 'EDGAR OMAR                    ', '1719046', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42140918, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42140918.pdf'),
(150, '43911090', '945295426', 'VICTORMATIAS0329@GMAIL.COM', 'VICTORABEL.GARCIAORTI@minedu.edu.pe', 'GARCIA                             ', 'ORTIZ                              ', 'VICTOR ABEL                   ', '1599109', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43911090, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43911090.pdf'),
(151, '74429489', '963249323', 'GOICOCHEADIAZERICK@GMAIL.COM', 'ERICKEDGAR.GOICOCHEADIAZ@minedu.edu.pe', 'GOICOCHEA                          ', 'DIAZ                               ', 'ERICK EDGARDO                 ', '1578921', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74429489, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74429489.pdf'),
(152, '72996033', '998347957', 'NATALY.GUERRAH@GMAIL.COM', 'LUISANATAL.GUERRAHUAC@minedu.edu.pe', 'GUERRA                             ', 'HUACHURUNTO                        ', 'LUISA NATALY                  ', '1771419', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 72996033, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72996033.pdf'),
(153, '41664162', '977204178', 'davielemental@gmail.com', 'DAVIDMOISÉ.HUARACAPOTE@minedu.edu.pe', 'HUARACA                            ', 'POTENCIANO                         ', 'DAVID MOISÉS                  ', '1558634', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41664162, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41664162.pdf'),
(154, '40602188', '966866863', 'MYLLAUCE@GMAIL.COM', 'MILAGROS.LLAUCENIÑO@minedu.edu.pe', 'LLAUCE                             ', 'NIÑO DE MATIAS                     ', 'MILAGROS                      ', '1095785', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40602188, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40602188.pdf'),
(155, '44622261', '944937055', 'DMAZA2261@GMAIL.COM', 'DENNISHIPOL.MAZASILV@minedu.edu.pe', 'MAZA                               ', 'SILVA                              ', 'DENNIS HIPOLITO               ', '1413244', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44622261, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44622261.pdf'),
(156, '40879032', '948903042', 'henrypt_06@hotmail.com', 'HENRY.PALOMINOTELL@minedu.edu.pe', 'PALOMINO                           ', 'TELLO                              ', 'HENRY                         ', '1435171', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40879032, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40879032.pdf'),
(157, '16668558', '990126779', 'elmer1620@yahoo.com.pe', 'ELMERGONZA.SALAZARCAST@minedu.edu.pe', 'SALAZAR                            ', 'CASTAÑEDA                          ', 'ELMER GONZALO                 ', '1777408', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 16668558, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16668558.pdf'),
(159, '42105338', '986597206', 'jimmy221028@hotmail.com', 'JIMMY.SANTISTEBANACOS@minedu.edu.pe', 'SANTISTEBAN                        ', 'ACOSTA                             ', 'JIMMY                         ', '1095579', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42105338, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42105338.pdf'),
(161, '76469441', '969187597', 'luz_2950@hotmail.com', 'betzabeth.alamop@minedu.edu.pe', 'ALAMO                              ', 'PRIETO                             ', 'BETZABETH LUZMILA             ', '0571315', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76469441, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76469441.pdf'),
(163, '73785350', '978010676', 'LESS_EDUC_04@OUTLOOK.ES', 'LESLIELOREN.ANTONCHAP@minedu.edu.pe', 'ANTON                              ', 'CHAPILLIQUEN                       ', 'LESLIE LORENA                 ', '0719476', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73785350, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73785350.pdf'),
(164, '03672421', '937636920', 'ARCELAROJAS31@GMAIL.COM', 'FELICITADEL.ARCELAROJA@minedu.edu.pe', 'ARCELA                             ', 'ROJAS                              ', 'FELICITA DEL PILAR            ', '1465160', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 3672421, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03672421.pdf'),
(165, '16705462', '934542100', 'VICTORBARRENO86@GMAIL.COM', 'VICTORFERMI.BARRENOQUES@minedu.edu.pe', 'BARRENO                            ', 'QUESQUEN                           ', 'VICTOR FERMIN                 ', '1782168', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 16705462, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16705462.pdf'),
(168, '05641241', '958033530', 'cmazahidalgo@gmail.com', 'CARLOSTADEO.MAZAHIDA@minedu.edu.pe', 'MAZA                               ', 'HIDALGO                            ', 'CARLOS TADEO                  ', '1236876', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 5641241, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '05641241.pdf'),
(169, '02899795', '937750902', 'seimy132@hotmail.com', 'SEIMYVIVIA.MIÑANHUAC@minedu.edu.pe', 'MIÑAN                              ', 'HUACCHILLO DE GUERRERO             ', 'SEIMY VIVIANA                 ', '0355958', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 2899795, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02899795.pdf'),
(170, '45221840', '979334352', 'eder.r.mundaca.lopez@hotmail.com', 'EDERROBER.MUNDACALOPE@minedu.edu.pe', 'MUNDACA                            ', 'LOPEZ                              ', 'EDER ROBERTO                  ', '1095868', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45221840, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45221840.pdf'),
(171, '40569366', '945837697', 'SANRABE16@GMAIL.COM', 'SANTIAGORONAL.RAMIREZBENI@minedu.edu.pe', 'RAMIREZ                            ', 'BENITES                            ', 'SANTIAGO RONALD               ', '0674374', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40569366, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40569366.pdf'),
(172, '43907423', '933134888', 'ALONSORIOS1410@GMAIL.COM', 'JOSEALONS.RIOSCAMP@minedu.edu.pe', 'RIOS                               ', 'CAMPOS                             ', 'JOSE ALONSO                   ', '1759588', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43907423, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43907423.pdf'),
(173, '80490276', '986913992', 'DOEL3802@GMAIL.COM', 'DOEL.RIVERACARR@minedu.edu.pe', 'RIVERA                             ', 'CARREÑO                            ', 'DOEL                          ', '0571166', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 80490276, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80490276.pdf'),
(174, '75178453', '956468281', '1896CARTE@GMAIL.COM', 'carlos.temocher@minedu.edu.pe', 'TEMOCHE                            ', 'ROJAS                              ', 'CARLOS EDUARDO                ', '0356147', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 75178453, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75178453.pdf'),
(175, '47884379', '920990851', 'GIAMPIERRE1493@GMAIL.COM', 'MAXGIAMP.TRONCOSOJED@minedu.edu.pe', 'TRONCOS                            ', 'OJEDA                              ', 'MAX GIAMPIERRE                ', '1567254', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47884379, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47884379.pdf'),
(176, '71070480', '966964997', 'lore_miu@hotmail.com', 'LORENACLAUD.AGUILARVASQ@minedu.edu.pe', 'AGUILAR                            ', 'VASQUEZ                            ', 'LORENA CLAUDIA                ', '0571752', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71070480, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71070480.pdf'),
(177, '74134734', '975365785', 'aenzocanela@gmail.com', 'antonio.canelah@minedu.edu.pe', 'CANELA                             ', 'HERENCIA                           ', 'ANTONIO ENZO                  ', '1522531', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 74134734, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74134734.pdf'),
(178, '45946223', '936961705', 'JIMCASTILLOMACO@GMAIL.COM', 'JIMPAUL.CASTILLOMACO@minedu.edu.pe', 'CASTILLO                           ', 'MACO                               ', 'JIM PAUL                      ', '1413244', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45946223, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45946223.pdf'),
(179, '80666847', '933815560', 'EFACUNDOPUELLES@GMAIL.COM', 'ENRIQUE.FACUNDOPUEL@minedu.edu.pe', 'FACUNDO                            ', 'PUELLES                            ', 'ENRIQUE                       ', '0511832', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 80666847, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80666847.pdf'),
(180, '46970175', '918828756', 'verogutierrezsandoval1991@gmail.com', 'VERONICA.GUTIERREZSAND@minedu.edu.pe', 'GUTIERREZ                          ', 'SANDOVAL                           ', 'VERONICA                      ', '1759588', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46970175, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46970175.pdf'),
(181, '73582766', '969172176', 'MERIMANQUINTANA23@GMAIL.COM', 'MERCEDESDEL.IMANQUIN@minedu.edu.pe', 'IMAN                               ', 'QUINTANA                           ', 'MERCEDES DEL PILAR            ', '1137025', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73582766, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73582766.pdf'),
(182, '40573905', '978599321', 'RUTH33916@GMAIL.COM', 'RUTHELIZA.MARTINEZRAMO@minedu.edu.pe', 'MARTINEZ                           ', 'RAMOS                              ', 'RUTH ELIZABETH                ', '1137025', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40573905, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40573905.pdf'),
(183, '80598295', '947206025', 'ISABELPUENTE0808@GMAIL.COM', 'VERONICAISABE.MEDIANEROPUEN@minedu.edu.pe', 'MEDIANERO                          ', 'PUENTE                             ', 'VERONICA ISABEL               ', '1552827', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 80598295, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80598295.pdf'),
(184, '40425372', '974839315', 'mariosmc1979@gmail.com', 'MARIOSAMUE.MENDOZACANO@minedu.edu.pe', 'MENDOZA                            ', 'CANOVA                             ', 'MARIO SAMUEL                  ', '0537100', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40425372, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40425372.pdf'),
(185, '00256849', '952973432', 'CELIARMORANROSILLO@GMAIL.COM', 'CELIADEL.MORANROSI@minedu.edu.pe', 'MORAN                              ', 'ROSILLO                            ', 'CELIA DEL ROCIO               ', '1139559', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 256849, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00256849.pdf'),
(186, '40959645', '945792378', 'paolaramosvillalobos@gmail.com', 'LOURDESPAOLA.RAMOSVILL@minedu.edu.pe', 'RAMOS                              ', 'VILLALOBOS                         ', 'LOURDES PAOLA                 ', '0356162', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40959645, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40959645.pdf'),
(187, '44754236', '943837863', 'nadhiamor@hotmail.com', 'NADHIAMARIB.SANCHEZAYAL@minedu.edu.pe', 'SANCHEZ                            ', 'AYALA                              ', 'NADHIA MARIBELL               ', '0674341', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44754236, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44754236.pdf'),
(188, '02856651', '953649518', 'teosan_niza@hotmail.com', 'TEODORODONIC.SANCHEZNIZA@minedu.edu.pe', 'SANCHEZ                            ', 'NIZAMA                             ', 'TEODORO DONICIO               ', '0635649', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 2856651, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02856651.pdf'),
(189, '10815200', '992939858', 'SHELLAVALMER77@HOTMAIL.COM', 'SHELLAGISSE.VALERIOMERI@minedu.edu.pe', 'VALERIO                            ', 'MERINO                             ', 'SHELLA GISSELA                ', '1559400', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 10815200, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10815200.pdf'),
(190, '03643396', '962289494', 'julken2@hotmail.com', 'JULIOCESAR.ZAMORANOFLOR@minedu.edu.pe', 'ZAMORANO                           ', 'FLORES                             ', 'JULIO CESAR                   ', '1138221', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 3643396, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03643396.pdf'),
(191, '43742253', '947207953', 'shavy21@hotmail.com', 'MARIAFABIO.ALAMAPESE@minedu.edu.pe', 'ALAMA                              ', 'PESEROS                            ', 'MARIA FABIOLA DEL CARMEN      ', '1553312', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43742253, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43742253.pdf'),
(192, '70072714', '959061494', 'carmenarando07@gmail.com', 'CARMENROSA.ARANDOHUAM@minedu.edu.pe', 'ARANDO                             ', 'HUAMANÑAHUI                        ', 'CARMEN ROSA                   ', '1419514', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70072714, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70072714.pdf'),
(193, '77162643', '942000811', 'ballenasamameevelyn@gmail.com', 'EVELYNISABE.BALLENASAMA@minedu.edu.pe', 'BALLENA                            ', 'SAMAME                             ', 'EVELYN ISABEL                 ', '0259879', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77162643, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77162643.pdf'),
(194, '40261554', '934049997', 'VEBEFER0106@GMAIL.COM', 'VERONICA.BENITESFERN@minedu.edu.pe', 'BENITES                            ', 'FERNANDEZ                          ', 'VERONICA                      ', '0675157', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40261554, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40261554.pdf'),
(195, '02817020', '961753862', 'MIVECADMO@HOTMAIL.COM', 'MIRCIAVERON.CARRASCOCAST@minedu.edu.pe', 'CARRASCO                           ', 'CASTRO DE MOREY                    ', 'MIRCIA VERONICA               ', '0642124', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 2817020, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02817020.pdf'),
(196, '46556110', '938373222', 'marielenaccopaapaza@gmail.com', 'MARIELENA.CCOPAAPAZ@minedu.edu.pe', 'CCOPA                              ', 'APAZA                              ', 'MARIELENA                     ', '0614206', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 46556110, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46556110.pdf'),
(197, '45998064', '998245087', 'naty_leo15@hotmail.com', 'ROSSYNATAL.MANTARISAIR@minedu.edu.pe', 'MANTARI                            ', 'SAIRITUPAC                         ', 'ROSSY NATALY                  ', '1516244', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45998064, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45998064.pdf'),
(198, '32124158', '940710457', 'RMILLA5@HOTMAIL.COM', 'MARIADEL.MILLAGAST@minedu.edu.pe', 'MILLA                              ', 'GASTIABURU                         ', 'MARIA DEL ROSARIO             ', '0613851', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 32124158, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32124158.pdf'),
(199, '77347410', '939794808', 'XIOMARA.MONTOYA0810@GMAIL.COM', 'XIOMARAYOSSE.MONTOYAMIRA@minedu.edu.pe', 'MONTOYA                            ', 'MIRANDA                            ', 'XIOMARA YOSSELYN              ', '0675231', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77347410, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77347410.pdf'),
(200, '47093696', '931124955', 'karenninarosales@gmail.com', 'KARENCAROL.NINAROSA@minedu.edu.pe', 'NINA                               ', 'ROSALES                            ', 'KAREN CAROLINA                ', '0675231', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47093696, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47093696.pdf'),
(201, '77145689', '923362854', 'NGKARINA98@GMAIL.COM', 'KARINAMICHE.NINACHOQUEGINE@minedu.edu.pe', 'NINACHOQUE                         ', 'GINEZ                              ', 'KARINA MICHEL                 ', '0675231', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77145689, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77145689.pdf'),
(202, '40019402', '958552901', 'isamob_@hotmail.com', 'ISABELMARIA.OJEDABECE@minedu.edu.pe', 'OJEDA                              ', 'BECERRA                            ', 'ISABEL MARIA                  ', '0938233', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40019402, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40019402.pdf'),
(203, '75385380', '957706761', 'karenramosf123@gmail.com', 'ROCISELAKAREN.RAMOSFIGU@minedu.edu.pe', 'RAMOS                              ', 'FIGUEROA                           ', 'ROCISELA KAREN                ', '1017102', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75385380, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75385380.pdf'),
(204, '70258510', '923339211', 'naomi_nataly17@outlook.es', 'NAOMINATAL.SANCHEZGARC@minedu.edu.pe', 'SANCHEZ                            ', 'GARCIA                             ', 'NAOMI NATALY                  ', '1516251', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70258510, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70258510.pdf'),
(205, '41743889', '993489774', 'blanca_saucedof@hotmail.com', 'blanca.saucedof@minedu.edu.pe', 'SAUCEDO                            ', 'FLORES                             ', 'BLANCA IVONNE                 ', '1017185', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41743889, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41743889.pdf'),
(206, '72697544', '951122823', 'keydiyuli26@gmail.com', 'KEYDIYULIZ.SUCASACAIBER@minedu.edu.pe', 'SUCASACA                           ', 'IBEROS                             ', 'KEYDI YULIZA                  ', '1516475', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72697544, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72697544.pdf'),
(207, '71374958', '920292163', 'yamival12@gmail.com', 'YANELAMILAG.VALDIVIACHIL@minedu.edu.pe', 'VALDIVIA                           ', 'CHILI                              ', 'YANELA MILAGROS               ', '1516475', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71374958, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71374958.pdf'),
(208, '44437498', '958852752', 'analu1905@outlook.com', 'LUCIA.AGUILARBENI@minedu.edu.pe', 'AGUILAR                            ', 'BENITES                            ', 'LUCIA                         ', '1565191', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 44437498, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44437498.pdf'),
(209, '03675631', '945351794', 'KARLAMIROSLAVA2305@GMAIL.COM', 'KARLAMIROS.ALVARADOSOCO@minedu.edu.pe', 'ALVARADO                           ', 'SOCOLA                             ', 'KARLA MIROSLAVA               ', '1137579', '13', 'Proceso', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 3675631, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03675631.pdf'),
(210, '40421859', '969367576', 'anamari03@hotmail.com', 'ANAMARIA.ARBOLEDAVILC@minedu.edu.pe', 'ARBOLEDA                           ', 'VILCHEZ                            ', 'ANA MARIA                     ', '1569185', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40421859, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'No', 'Sí', 'Sí', 2, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40421859.pdf'),
(211, '03886572', '950266631', 'missjovanna1@gmail.com', 'JOVANNADEL.ARTEAGAVALL@minedu.edu.pe', 'ARTEAGA                            ', 'VALLADARES                         ', 'JOVANNA DEL MILAGRO           ', '0574178', '13', 'Proceso', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 3886572, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03886572.pdf'),
(212, '41357336', '961381660', 'irmabenedicto21@gmail.com', 'IRMABELIN.BENEDICTOMINA@minedu.edu.pe', 'BENEDICTO                          ', 'MINAYA                             ', 'IRMA BELINDA                  ', '1778596', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 41357336, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41357336.pdf'),
(213, '76090359', '945344999', 'MEHILLYCARBAJALGARAY@GMAIL.COM', 'MEHILLY.CARBAJALGARA@minedu.edu.pe', 'CARBAJAL                           ', 'GARAY                              ', 'MEHILLY                       ', '1559780', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 45, 'Logrado', 1, 76090359, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76090359.pdf'),
(214, '41280334', '999112033', 'GLORIACP82@HOTMAIL.COM', 'GLORIA.CORDOVAPEÑA@minedu.edu.pe', 'CORDOVA                            ', 'PEÑA                               ', 'GLORIA                        ', '1778562', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41280334, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41280334.pdf'),
(215, '48198882', '926926993', 'CRUZRAMOSLISBETH018@GMAIL.COM', 'ARELYLISBE.CRUZRAMO@minedu.edu.pe', 'CRUZ                               ', 'RAMOS                              ', 'ARELY LISBETH GUDI DE LOS ANGE', '0938738', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 48198882, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48198882.pdf'),
(216, '40571600', '945277105', 'maregara2304@hotmail.com', 'MARINARENEE.GARCIARAMI@minedu.edu.pe', 'GARCIA                             ', 'RAMIREZ                            ', 'MARINA RENEE                  ', '0675223', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40571600, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40571600.pdf'),
(218, '40359280', '938198456', 'MIRELLY14@HOTMAIL.COM', 'MIRELLYDEL.LABANCABR@minedu.edu.pe', 'LABAN                              ', 'CABRERA                            ', 'MIRELLY DEL CARMEN            ', '1095256', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40359280, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'No', 'Sí', 'Sí', 2, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40359280.pdf'),
(219, '40334224', '981253759', 'LORENITAMARIA13@GMAIL.COM', 'LORENAMARIA.LACHAPELLVERA@minedu.edu.pe', 'LACHAPELL                          ', 'VERA                               ', 'LORENA MARIA                  ', '0938555', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40334224, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40334224.pdf'),
(222, '18197422', '949592025', 'KARHYDC@GMAIL.COM', 'KARINDEL.MONJARABI@minedu.edu.pe', 'MONJA                              ', 'RABINES                            ', 'KARIN DEL CARMEN              ', '0674689', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 18197422, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18197422.pdf'),
(224, '47461139', '918931502', 'mikat.p2@gmail.com', 'KATTIAARACE.PAICOPAIC@minedu.edu.pe', 'PAICO                              ', 'PAICO                              ', 'KATTIA ARACELLI               ', '0674689', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47461139, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47461139.pdf'),
(226, '05645455', '969431340', 'PRUIZ@CSIL.EDU.PE', 'PEGGYJENNI.RUIZGARC@minedu.edu.pe', 'RUIZ                               ', 'GARCIA                             ', 'PEGGY JENNIFER                ', '1680875', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 5645455, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '05645455.pdf'),
(227, '74413116', '957096135', 'MAR_1996.9@HOTMAIL.COM', 'MARIELENAYESEN.ACHATAACHA@minedu.edu.pe', 'ACHATA                             ', 'ACHATA                             ', 'MARIELENA YESENIA             ', '1745926', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 74413116, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74413116.pdf'),
(228, '70212547', '932518934', 'renyir1996@gmail.com', 'IRISTEODO.CAMPOSDIAZ@minedu.edu.pe', 'CAMPOS                             ', 'DIAZ                               ', 'IRIS TEODORA                  ', '0626911', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70212547, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70212547.pdf'),
(229, '03575983', '976486351', 'ARQUIMACHOQUE@HOTMAIL.COM', 'arquima.choquehuancal@minedu.edu.pe', 'CHOQUEHUANCA                       ', 'LOPEZ                              ', 'ARQUIMA ESTANILA              ', '0571174', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 3575983, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03575983.pdf'),
(230, '41619941', '963626370', 'JADIZE_1982@HOTMAIL.COM', 'JANNETHDEL.DIOSESZEGA@minedu.edu.pe', 'DIOSES                             ', 'ZEGARRA DE OJEDA                   ', 'JANNETH DEL ROSARIO           ', '0511659', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41619941, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41619941.pdf'),
(231, '29629285', '922188952', 'YUDYGUERRA22@GMAIL.COM', 'JUDITH.GUERRAQUIS@minedu.edu.pe', 'GUERRA                             ', 'QUISPE                             ', 'JUDITH                        ', '1746007', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 29629285, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29629285.pdf'),
(232, '46636535', '998627303', 'MARYCELY56@HOTMAIL.COM', 'JESUSMARIC.HUAMANHUAC@minedu.edu.pe', 'HUAMAN                             ', 'HUACCHILLO                         ', 'JESUS MARICELI                ', '0571174', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46636535, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46636535.pdf'),
(233, '43943193', '902262643', 'HUAMANCHABETHSY@GMAIL.COM', 'bethsy.huamanchal@minedu.edu.pe', 'HUAMANCHA                          ', 'LANDA DE VERDI                     ', 'BETHSY LORENA                 ', '1648682', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43943193, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43943193.pdf'),
(234, '76546080', '955299634', 'M.HUARACA.28@GMAIL.COM', 'MIRTHAYOLAN.HUARACANOLB@minedu.edu.pe', 'HUARACA                            ', 'NOLBERTO                           ', 'MIRTHA YOLANDA                ', '1680768', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 76546080, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76546080.pdf'),
(235, '09526889', '995327874', 'ibet22@hotmail.com', 'EVETTE.IBERICOCARR@minedu.edu.pe', 'IBERICO                            ', 'CARRILLO                           ', 'EVETTE                        ', '0673608', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 9526889, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09526889.pdf'),
(236, '42526076', '991490307', 'anny.lopez.gabriel@gmail.com', 'ANNYCLEOF.LOPEZGABR@minedu.edu.pe', 'LOPEZ                              ', 'GABRIEL DE AGUILAR                 ', 'ANNY CLEOFE                   ', '1680768', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42526076, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42526076.pdf'),
(237, '10594412', '968186288', 'kattyli77@hotmail.com', 'LIZKATTY.PUMAURPE@minedu.edu.pe', 'PUMA                               ', 'URPE                               ', 'LIZ KATTY                     ', '1648674', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 10594412, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10594412.pdf'),
(238, '73176994', '930916351', 'ISA_LQA@HOTMAIL.COM', 'ISABELLISBE.QUISPEARRO@minedu.edu.pe', 'QUISPE                             ', 'ARROYO                             ', 'ISABEL LISBETH                ', '1561232', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73176994, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73176994.pdf'),
(239, '48284592', '916957536', 'CYELY_CYNDY@HOTMAIL.COM', 'cindy.ramosm@minedu.edu.pe', 'RAMOS                              ', 'MARQUEZ                            ', 'CINDY ELIZABETH               ', '1745959', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48284592, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48284592.pdf'),
(240, '43774292', '952335783', 'MVROSALI1122@HOTMAIL.COM', 'ROSALIESPER.VARGASMEND@minedu.edu.pe', 'VARGAS                             ', 'MENDOZA                            ', 'ROSALI ESPERANZA              ', '0571208', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43774292, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43774292.pdf'),
(242, '04644572', '953645801', 'imeldavillanueva07@gmail.com', 'MILAGROSIMELD.VILLANUEVAMENE@minedu.edu.pe', 'VILLANUEVA                         ', 'MENESES                            ', 'MILAGROS IMELDA               ', '1561315', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 4644572, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '04644572.pdf'),
(243, '40766503', '992777698', 'zevto_cazt@hotmail.com', 'chris.zevallost@minedu.edu.pe', 'ZEVALLOS                           ', 'TORIBIO                            ', 'CHRIS ANABELL                 ', '1680768', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40766503, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40766503.pdf'),
(244, '48201663', '922010244', 'marielenaangeles26@gmail.com', 'MARIELENA.ANGELESZEÑA@minedu.edu.pe', 'ANGELES                            ', 'ZEÑA                               ', 'MARIELENA                     ', '0342717', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48201663, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48201663.pdf'),
(245, '43271994', '958920791', 'yessi120816@hotmail.com', 'JESSICAPAOLA.BUSTAMANTETORR@minedu.edu.pe', 'BUSTAMANTE                         ', 'TORRES                             ', 'JESSICA PAOLA                 ', '0342683', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 43271994, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43271994.pdf'),
(246, '16702514', '982149937', 'jlsadir@hotmail.com', 'SARA.DIAZRIMA@minedu.edu.pe', 'DIAZ                               ', 'RIMARACHIN                         ', 'SARA                          ', '0572537', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 16702514, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16702514.pdf'),
(247, '40437667', '958280193', 'elsitaelsitafuentes@hotmail.com', 'ELSALUCER.FUENTESPACC@minedu.edu.pe', 'FUENTES                            ', 'PACCARA                            ', 'ELSA LUCERO                   ', '0677922', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40437667, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40437667.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(248, '47100563', '968496285', 'alex_120_130@hotmail.com', 'JULIOALEXA.IPANAQUESAND@minedu.edu.pe', 'IPANAQUE                           ', 'SANDOVAL                           ', 'JULIO ALEXANDER               ', '0349464', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47100563, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47100563.pdf'),
(249, '40989852', '971180326', 'armipo81@gmail.com', 'ANADEL.MACHADOIBAÑ@minedu.edu.pe', 'MACHADO                            ', 'IBAÑEZ                             ', 'ANA DEL ROCIO                 ', '0849042', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40989852, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40989852.pdf'),
(250, '44782625', '949866208', 'anadej15@gmail.com', 'ana.mongeb@minedu.edu.pe', 'MONGE                              ', 'BARTUREN                           ', 'ANA DE JESUS                  ', '0354811', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 44782625, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44782625.pdf'),
(251, '42061329', '902289986', 'YAHP06@GMAIL.COM', 'cinthia.pechor@minedu.edu.pe', 'PECHO                              ', 'ROMERO                             ', 'CINTHIA KARINA                ', '0342717', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 42061329, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42061329.pdf'),
(252, '41226318', '939637168', 'dipm_2109@hotmail.com', 'IVANDUSTI.PEREZMEDI@minedu.edu.pe', 'PEREZ                              ', 'MEDINA                             ', 'IVAN DUSTIN                   ', '0494302', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41226318, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41226318.pdf'),
(253, '32825404', '962915307', 'anamelva1234@hotmail.com', 'ana.ramosde@minedu.edu.pe', 'RAMOS                              ', 'DEL RIO                            ', 'ANA MELVA                     ', '0553461', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 32825404, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32825404.pdf'),
(254, '46153834', '927103556', 'ALANRAMOSGOMEZ5@GMAIL.COM', 'alan.ramosg@minedu.edu.pe', 'RAMOS                              ', 'GOMEZ                              ', 'ALAN ROBERTO                  ', '0848069', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46153834, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46153834.pdf'),
(255, '70779707', '985075356', 'ROSY_38_93@HOTMAIL.COM', 'ROSA.RIOSRAMO@minedu.edu.pe', 'RIOS                               ', 'RAMOS                              ', 'ROSA                          ', '0342717', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 70779707, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70779707.pdf'),
(256, '42095581', '938590041', 'MAHONRY.JEYCOT@GMAIL.COM', 'FANNYMERCE.SANCHEZYENQ@minedu.edu.pe', 'SANCHEZ                            ', 'YENQUE                             ', 'FANNY MERCEDES                ', '0848929', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 42095581, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42095581.pdf'),
(257, '44132840', '950644901', 'dannachuman@gmail.com', 'ERIKANATAL.TANTALEANMESO@minedu.edu.pe', 'TANTALEAN                          ', 'MESONES                            ', 'ERIKA NATALI                  ', '0613430', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 44132840, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44132840.pdf'),
(258, '44845705', '931325465', 'shirley1487@hotmail.com', 'SHIRLEYDEL.TEJADASANC@minedu.edu.pe', 'TEJADA                             ', 'SANCHEZ                            ', 'SHIRLEY DEL PILAR             ', '0848986', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 44845705, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44845705.pdf'),
(259, '40938143', '945345662', 'yrinatsu@hotmail.com', 'YRINACECIL.TRONCOSOCAST@minedu.edu.pe', 'TRONCOSO                           ', 'CASTAÑEDA                          ', 'YRINA CECILIA                 ', '0490219', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40938143, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40938143.pdf'),
(260, '47057613', '984658181', 'COBENASYAURICASA@GMAIL.COM', 'STEFANYIRENE.COBEÑASYAUR@minedu.edu.pe', 'COBEÑAS                            ', 'YAURICASA                          ', 'STEFANY IRENE                 ', '1673854', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 47057613, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47057613.pdf'),
(261, '71608389', '949882700', 'alecontreraszuniga@gmail.com', 'ESTRELLITAALEJA.CONTRERASZUÑI@minedu.edu.pe', 'CONTRERAS                          ', 'ZUÑIGA                             ', 'ESTRELLITA ALEJANDRA          ', '1557511', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 71608389, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71608389.pdf'),
(262, '76827946', '958397884', 'BEA.FIESTAS.06@GMAIL.COM', 'SANTOSBEATR.FIESTASLLEN@minedu.edu.pe', 'FIESTAS                            ', 'LLENQUE                            ', 'SANTOS BEATRIZ                ', '1595107', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 76827946, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76827946.pdf'),
(263, '71479924', '930393250', 'MEYLZ2709@GMAIL.COM', 'SANDYMEYLI.LOZADAZUÑE@minedu.edu.pe', 'LOZADA                             ', 'ZUÑE DE MEDINA                     ', 'SANDY MEYLIN                  ', '1674159', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 71479924, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71479924.pdf'),
(264, '76533880', '965848437', 'MENDOLUCERO1995@GMAIL.COM', 'MARTHAELIZA.MENDOLUCE@minedu.edu.pe', 'MENDO                              ', 'LUCERO                             ', 'MARTHA ELIZA                  ', '1706951', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 76533880, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76533880.pdf'),
(265, '47466221', '985908340', 'PIILITAA21@GMAIL.COM', 'MARIADEL.MIÑOPECAST@minedu.edu.pe', 'MIÑOPE                             ', 'CASTAÑEDA                          ', 'MARIA DEL PILAR               ', '1157783', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47466221, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47466221.pdf'),
(267, '76474648', '929751345', 'HILMAGA2305@GMAIL.COM', 'HILDAMAGAL.PADILLAMANC@minedu.edu.pe', 'PADILLA                            ', 'MANCHAY                            ', 'HILDA MAGALY                  ', '1743038', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 76474648, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76474648.pdf'),
(269, '75716023', '945420401', 'fany7254@gmail.com', 'MIRIANESTEF.RAMIREZCARR@minedu.edu.pe', 'RAMIREZ                            ', 'CARRION                            ', 'MIRIAN ESTEFANY               ', '0710269', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 75716023, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75716023.pdf'),
(270, '47905918', '925388403', 'thiale.25@gmail.com', 'JENIFERPAOLA.SALAZARPOZO@minedu.edu.pe', 'SALAZAR                            ', 'POZO                               ', 'JENIFER PAOLA                 ', '1157783', '16', 'Suficiente', 'Borrador Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 47905918, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47905918.pdf'),
(271, '76432082', '914449769', 'DIANHASANTAMARIA11@GMAIL.COM', 'DIANAMILAG.SANTAMARIAGONZ@minedu.edu.pe', 'SANTAMARIA                         ', 'GONZALES                           ', 'DIANA MILAGROS                ', '0344291', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 76432082, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76432082.pdf'),
(272, '47204814', '938295401', 'sonia_aries7@hotmail.com', 'SONIAMARIB.SANTILLANMONT@minedu.edu.pe', 'SANTILLAN                          ', 'MONTALVO                           ', 'SONIA MARIBEL                 ', '1557545', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 47204814, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47204814.pdf'),
(273, '75490667', '930419123', 'SOSASECLENLEANDRAGISSELA@GMAIL.COM', 'LEANDRAGISSE.SOSASECL@minedu.edu.pe', 'SOSA                               ', 'SECLEN                             ', 'LEANDRA GUISELA               ', '1742907', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 75490667, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75490667.pdf'),
(274, '72020863', '916393408', 'LORENA_VIRGO12@HOTMAIL.COM', 'NATALIALOREN.SUAREZPISC@minedu.edu.pe', 'SUAREZ                             ', 'PISCOYA DE MUÑOZ                   ', 'NATALIA LORENA                ', '0492835', '20', 'Destacado', 'Calificado', '33', 'Destacado', 'Calificado', 56, 'Destacado', 1, 72020863, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72020863.pdf'),
(275, '47632624', '976410738', 'karlavelizc@gmail.com', 'KARLANATHA.VELIZCAST@minedu.edu.pe', 'VELIZ                              ', 'CASTRO                             ', 'KARLA NATHALY                 ', '1673854', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47632624, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47632624.pdf'),
(276, '75949845', '943796156', 'marialejandra_vg@hotmail.com', 'MARIAALEJA.VIVESGONZ@minedu.edu.pe', 'VIVES                              ', 'GONZALES                           ', 'MARIA ALEJANDRA               ', '0492835', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 75949845, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75949845.pdf'),
(277, '41035272', '968948195', 'brigth_125@hotmail.com', 'OLIVIABRIGI.ALCAQUEZ@minedu.edu.pe', 'ALCA                               ', 'QUEZADA                            ', 'OLIVIA BRIGIDA                ', '0560938', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 41035272, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41035272.pdf'),
(278, '43525684', '949747494', 'kvad17@hotmail.com', 'KARLAVANES.ALCANTARADIAZ@minedu.edu.pe', 'ALCANTARA                          ', 'DIAZ                               ', 'KARLA VANESSA                 ', '0326900', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 43525684, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43525684.pdf'),
(279, '72435309', '957794518', 'abi_1993_4@hotmail.com', 'ABIGAILSOLED.ALCOCERNAVA@minedu.edu.pe', 'ALCOCER                            ', 'NAVARRO                            ', 'ABIGAIL SOLEDAD               ', '0349431', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72435309, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72435309.pdf'),
(280, '25790675', '984402569', 'gianncarloalegreh@gmail.com', 'GIANNCARLO.ALEGREHIDA@minedu.edu.pe', 'ALEGRE                             ', 'HIDALGO                            ', 'GIANNCARLO                    ', '0350322', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 42, 'Proceso', 0, 25790675, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'NO APROBADO', '25790675.pdf'),
(283, '46982411', '932114745', 'roxanacapsan@gmail.com', 'ROXANA.CAPUÑAYSANT@minedu.edu.pe', 'CAPUÑAY                            ', 'SANTISTEBAN                        ', 'ROXANA                        ', '0326843', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 46982411, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46982411.pdf'),
(284, '00498936', '950613945', 'romina.cardloz@hotmail.com', 'clotilde.cardenasl@minedu.edu.pe', 'CARDENAS                           ', 'LOZA                               ', 'CLOTILDE MERCEDES             ', '1465194', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 498936, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00498936.pdf'),
(285, '44738749', '961023067', 'mariellacori@hotmail.com', 'carmen.coriq@minedu.edu.pe', 'CORI                               ', 'QUISPE                             ', 'CARMEN MARIELLA               ', '0560938', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 44738749, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44738749.pdf'),
(286, '04645145', '935998075', 'gabykarol18@hotmail.com', 'HILDALUZ.CUTIPACHAM@minedu.edu.pe', 'CUTIPA                             ', 'CHAMBILLA                          ', 'HILDA LUZ                     ', '0560938', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 4645145, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '04645145.pdf'),
(287, '41416305', '910446229', 'eliann14@hotmail.com', 'ELIA.JIHUALLANCACCOT@minedu.edu.pe', 'JIHUALLANCA                        ', 'CCOTOHUANCA                        ', 'ELIA                          ', '0845958', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 41416305, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41416305.pdf'),
(288, '40327326', '998005979', 'rosaperezflores23@gmail.com', 'ROSAELVIR.PÉREZFLOR@minedu.edu.pe', 'PÉREZ                              ', 'FLORES                             ', 'ROSA ELVIRA                   ', '1450501', '13', 'Proceso', 'Calificado', '36', 'Destacado', 'Calificado', 49, 'Logrado', 1, 40327326, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40327326.pdf'),
(289, '42720337', '979558725', 'sandy.23.25@hotmail.com', 'SANDYALEJA.PUICONSANC@minedu.edu.pe', 'PUICON                             ', 'SANCHEZ                            ', 'SANDY ALEJANDRY               ', '0845958', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 42720337, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42720337.pdf'),
(290, '41589137', '928006484', 'leo.soe28321@gmail.com', 'INESSUSAN.RODRIGUEZPARE@minedu.edu.pe', 'RODRIGUEZ                          ', 'PAREJA                             ', 'INES SUSANA                   ', '0673897', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 41589137, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41589137.pdf'),
(291, '40004088', '979629262', 'karina.lizana@gmail.com', 'KARINAMARIB.SANCHEZLIZA@minedu.edu.pe', 'SANCHEZ                            ', 'LIZANA                             ', 'KARINA MARIBEL                ', '0326488', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 40004088, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40004088.pdf'),
(292, '41532352', '983432591', 'milagros.kamila25@gmail.com', 'MILAGROSDEL.SOLISTELL@minedu.edu.pe', 'SOLIS                              ', 'TELLO                              ', 'MILAGROS DEL PILAR            ', '0326488', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 45, 'Logrado', 1, 41532352, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41532352.pdf'),
(293, '41644298', '982297185', 'morris20sud@gmail.com', 'MORRISCARLO.URIBEFLOR@minedu.edu.pe', 'URIBE                              ', 'FLORES                             ', 'MORRIS CARLOS                 ', '1560432', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 41644298, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41644298.pdf'),
(294, '40131700', '929530853', 'soniaeli_cc@hotmail.com', 'SONIAELIZA.CARBAJALCAMP@minedu.edu.pe', 'CARBAJAL                           ', 'CAMPOS                             ', 'SONIA ELIZABETH               ', '0560870', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40131700, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40131700.pdf'),
(295, '21574153', '956027063', 'ZULEMACONDEG@GMAIL.COM', 'ZULEMA.CONDEGALI@minedu.edu.pe', 'CONDE                              ', 'GALINDO                            ', 'ZULEMA                        ', '0342204', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 21574153, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '21574153.pdf'),
(296, '44784131', '951405664', 'marielena_g2015@hotmail.com', 'MARIAELENA.GERONIMOQUIS@minedu.edu.pe', 'GERONIMO                           ', 'QUISPE                             ', 'MARIA ELENA                   ', '0342204', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44784131, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44784131.pdf'),
(297, '03869086', '969026915', 'mercehidal@hotmail.com', 'MERCEDESANGEL.HIDALGOGARC@minedu.edu.pe', 'HIDALGO                            ', 'GARCIA                             ', 'MERCEDES ANGELITA             ', '0860171', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 3869086, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03869086.pdf'),
(298, '16583795', '964081093', 'marleipanaque1966@hotmail.com', 'MARLENY.IPANAQUEMAZA@minedu.edu.pe', 'IPANAQUE                           ', 'MAZA                               ', 'MARLENY                       ', '0352211', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16583795, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16583795.pdf'),
(299, '72496161', '969384153', 'marilu.10063@gmail.com', 'MARIALUISA.LLONTOPTORR@minedu.edu.pe', 'LLONTOP                            ', 'TORRES                             ', 'MARIA LUISA                   ', '1599612', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72496161, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72496161.pdf'),
(300, '40373749', '951968794', 'edita115@hotmail.com', 'EDITHYRIS.MECHANENEQ@minedu.edu.pe', 'MECHAN                             ', 'ENEQUE                             ', 'EDITH YRIS                    ', '0352187', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40373749, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40373749.pdf'),
(301, '43447516', '981599401', 'lita_sole1720@hotmail.com', 'annie.mejias@minedu.edu.pe', 'MEJIA                              ', 'SALVATIERRA                        ', 'ANNIE LUZ                     ', '1599612', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43447516, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43447516.pdf'),
(302, '45536482', '930106184', 'damarispaola1988@gmail.com', 'DAMARISPAOLA.NEGRONALVA@minedu.edu.pe', 'NEGRON                             ', 'ALVAREZ                            ', 'DAMARIS PAOLA                 ', '0342246', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45536482, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45536482.pdf'),
(303, '40148288', '930377530', 'cesol_07@hotmail.com', 'clemira.ocrospomal@minedu.edu.pe', 'OCROSPOMA                          ', 'LOPEZ                              ', 'CLEMIRA SOFIA                 ', '0342204', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40148288, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40148288.pdf'),
(304, '41200245', '951821295', 'FANNIOL82@GMAIL.COM', 'NINFA.ORDOÑEZLAUR@minedu.edu.pe', 'ORDOÑEZ                            ', 'LAURA                              ', 'NINFA                         ', '0342196', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41200245, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41200245.pdf'),
(305, '43590813', '955715517', 'puma_mp_15@hotmail.com', 'EMILIANA.PUMAMAMA@minedu.edu.pe', 'PUMA                               ', 'MAMANI                             ', 'EMILIANA                      ', '0342295', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43590813, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43590813.pdf'),
(306, '77053459', '921690626', 'nramosd13@unc.edu.pe', 'NILVIAMIRTH.RAMOSDÁVI@minedu.edu.pe', 'RAMOS                              ', 'DÁVILA                             ', 'NILVIA MIRTHA                 ', '0352187', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77053459, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77053459.pdf'),
(307, '30854711', '920828827', 'veronica_ramos2015@hotmail.com', 'BRIGIDAVERON.RAMOSGONZ@minedu.edu.pe', 'RAMOS                              ', 'GONZALES                           ', 'BRIGIDA VERONICA              ', '0342204', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 30854711, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '30854711.pdf'),
(308, '45870658', '980474551', 'jackiedawson6@hotmail.com', 'JACKELINE.SALDARRIAGAGARC@minedu.edu.pe', 'SALDARRIAGA                        ', 'GARCIA                             ', 'JACKELINE                     ', '0860171', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45870658, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45870658.pdf'),
(309, '80410527', '981044063', 'luzmarinascm@live.com', 'LUZMARIN.SANTACRUZ@minedu.edu.pe', 'SANTA CRUZ                         ', 'MIO                                ', 'LUZ MARINA                    ', '0352187', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 80410527, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80410527.pdf'),
(310, '73472531', '916152570', 'zuly_isepomc@hotmail.com', 'ELYZULY.TELLOGUEV@minedu.edu.pe', 'TELLO                              ', 'GUEVARA                            ', 'ELY ZULY                      ', '0342287', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73472531, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73472531.pdf'),
(311, '16751581', '954519777', 'pattypatty_16@hotmail.com', 'PATRICIADEL.ARBULUVERA@minedu.edu.pe', 'ARBULU                             ', 'VERA                               ', 'PATRICIA DEL CARMEN           ', '0632406', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 16751581, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16751581.pdf'),
(312, '71430135', '978152413', 'katheprado29@gmail.com', 'KATHERINEHUMBE.BANCESPRAD@minedu.edu.pe', 'BANCES                             ', 'PRADO                              ', 'KATHERINE HUMBELINA           ', '0710145', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 71430135, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71430135.pdf'),
(313, '16753457', '952993964', 'FEBBYBRICENOOROZCO@GMAIL.COM', 'FELICITABEATR.BRICEÑOOROZ@minedu.edu.pe', 'BRICEÑO                            ', 'OROZCO                             ', 'FELICITA BEATRIZ              ', '1651355', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 16753457, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16753457.pdf'),
(314, '44047419', '941378022', 'meuri186@hotmail.com', 'MIRIANADELA.CARMENALQU@minedu.edu.pe', 'CARMEN                             ', 'ALQUIZAR                           ', 'MIRIAN ADELA                  ', '1591908', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 69, 'Destacado', 1, 44047419, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44047419.pdf'),
(315, '73777822', '935173155', 'dori_13@outlook.es', 'DORAALICI.CARRILLOCUMP@minedu.edu.pe', 'CARRILLO                           ', 'CUMPA                              ', 'DORA ALICIA                   ', '1673599', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 45, 'Logrado', 1, 73777822, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73777822.pdf'),
(316, '70905219', '903111896', 'allyssondv@hotmail.com', 'allysson.davilav@minedu.edu.pe', 'DAVILA                             ', 'VALLADOLID                         ', 'ALLYSSON FIORELA              ', '0575902', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 70905219, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70905219.pdf'),
(317, '47634064', '965486224', 'pd961612@gmail.com', 'PAMELAALEJA.DIAZHOYO@minedu.edu.pe', 'DIAZ                               ', 'HOYOS                              ', 'PAMELA ALEJANDRA              ', '0574277', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47634064, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47634064.pdf'),
(318, '16764750', '958477971', 'kguevara@sanagustinchiclayo.edu.pe', 'KAROLINACONSU.GUEVARALEYV@minedu.edu.pe', 'GUEVARA                            ', 'LEYVA                              ', 'KAROLINA CONSUELO             ', '1591858', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 16764750, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16764750.pdf'),
(319, '48065193', '951688119', 'ISEPSCJAJMC@GMAIL.COM', 'ana.mendozacarl@minedu.edu.pe', 'MENDOZA                            ', 'CARLOS                             ', 'ANA JOVELY                    ', '1523836', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 48065193, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48065193.pdf'),
(320, '40527728', '954815723', 'OCAMPOMMF@HOTMAIL.COM', 'CONSUELO.MORIFERN@minedu.edu.pe', 'MORI                               ', 'FERNANDEZ                          ', 'CONSUELO                      ', '0574723', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40527728, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40527728.pdf'),
(321, '74927954', '949359057', 'lgnepo.96@gmail.com', 'LESLIEGISEL.NEPOLOPE@minedu.edu.pe', 'NEPO                               ', 'LOPEZ                              ', 'LESLIE GISELLE                ', '0632406', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 74927954, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74927954.pdf'),
(322, '40106536', '990690038', 'claudiariosreyes@hotmail.com', 'claudia.riosr@minedu.edu.pe', 'RIOS                               ', 'REYES                              ', 'CLAUDIA LORENA                ', '0580936', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 45, 'Logrado', 1, 40106536, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40106536.pdf'),
(323, '16795259', '999992930', 'jullissita@gmail.com', 'MERCYJULLI.RODRIGUEZGAST@minedu.edu.pe', 'RODRIGUEZ                          ', 'GASTELO                            ', 'MERCY JULLISSA                ', '0344119', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 16795259, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16795259.pdf'),
(324, '09885252', '959352434', 'ROMEROROXANA646@GMAIL.COM', 'ENRIQUETAROXAN.ROMEROTORR@minedu.edu.pe', 'ROMERO                             ', 'TORRES                             ', 'ENRIQUETA ROXANA              ', '0344580', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 9885252, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09885252.pdf'),
(325, '72560154', '924593170', 'rosa170597@hotmail.com', 'ROSAALEXA.SALAZARBARD@minedu.edu.pe', 'SALAZAR                            ', 'BARDALES                           ', 'ROSA ALEXANDRA                ', '0344630', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 72560154, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72560154.pdf'),
(326, '77576421', '972580900', 'greis_lupita@hotmail.com', 'GRECIARONAL.SANCHEZLOPE@minedu.edu.pe', 'SANCHEZ                            ', 'LOPEZ                              ', 'GRECIA RONAL                  ', '1673508', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 77576421, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77576421.pdf'),
(327, '76730879', '935889898', 'gady_23_@outlook.com', 'NATALYGASDA.SOLISCAJÁ@minedu.edu.pe', 'SOLIS                              ', 'CAJAN DE RONDOY                    ', 'NATALY GASDALY                ', '1705326', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 76730879, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76730879.pdf'),
(328, '40227187', '980804890', 'WMILAGROS@HOTMAIL.COM', 'MILAGRITOSDEL.WONGVARG@minedu.edu.pe', 'WONG                               ', 'VARGAS                             ', 'MILAGRITOS DEL CARMEN         ', '0753251', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40227187, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40227187.pdf'),
(330, '47352962', '975381089', 'cecilia_libra_19@hotmail.com', 'cecilia.camizanv@minedu.edu.pe', 'CAMIZAN                            ', 'VALDERRAMA                         ', 'CECILIA ISAMAR                ', '0357608', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47352962, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47352962.pdf'),
(331, '43824195', '980785284', 'zurcaguadalupe@gmail.com', 'ROCÍODEL.CARRANZAREGA@minedu.edu.pe', 'CARRANZA                           ', 'REGALADO                           ', 'ROCÍO DEL PILAR               ', '0357632', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 43824195, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43824195.pdf'),
(332, '45752010', '948184114', 'NORELLYCS@GMAIL.COM', 'NORELLYSULEY.CASTROSALD@minedu.edu.pe', 'CASTRO                             ', 'SALDAÑA                            ', 'NORELLY SULEYKA               ', '0352302', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45752010, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45752010.pdf'),
(333, '72805325', '970733673', 'cynthia25_31@hotmail.com', 'CYNTHIAMIREY.CHIMOYCARH@minedu.edu.pe', 'CHIMOY                             ', 'CARHUAPOMA                         ', 'CYNTHIA MIREYLLE              ', '0350322', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 72805325, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72805325.pdf'),
(334, '42477792', '958047749', 'JULISSAESCAJADILLO@GMAIL.COM', 'JEYMIJULIS.ESCAJADILLODIAZ@minedu.edu.pe', 'ESCAJADILLO                        ', 'DIAZ                               ', 'JEYMI JULISSA                 ', '0350322', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 42477792, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42477792.pdf'),
(336, '29645571', '950321496', 'EITUZACCASA@GMAIL.COM', 'ESTILITAEUGEN.ITUZACCAS@minedu.edu.pe', 'ITUZA                              ', 'CCASA                              ', 'ESTILITA EUGENIA              ', '0342477', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 29645571, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29645571.pdf'),
(339, '40515430', '991209663', 'vinavi_03@hotmail.com', 'VICTORIAIRENE.NARROVILL@minedu.edu.pe', 'NARRO                              ', 'VILLALOBOS                         ', 'VICTORIA IRENE                ', '0342469', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40515430, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40515430.pdf'),
(341, '26718698', '976532602', 'jcarlosquispe19031973@gmail.com', 'JOSECARLO.QUISPECHUQ@minedu.edu.pe', 'QUISPE                             ', 'CHUQUIMANGO                        ', 'JOSE CARLOS                   ', '0560870', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 52, 'Logrado', 1, 26718698, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '26718698.pdf'),
(342, '40373977', '998883884', 'luzmilaquispecontreras@gmail.com', 'LUZMILA.QUISPECONT@minedu.edu.pe', 'QUISPE                             ', 'CONTRERAS                          ', 'LUZMILA                       ', '0341057', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40373977, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40373977.pdf'),
(344, '80263744', '927271845', 'vision27ag@gmail.com', 'GIANNIALONS.ROQUEGRAN@minedu.edu.pe', 'ROQUE                              ', 'GRANDA                             ', 'GIANNI ALONSO                 ', '0560870', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 80263744, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80263744.pdf'),
(345, '70155247', '995394021', 'KRISTYULLOAP@GMAIL.COM', 'KRISTYEVELY.ULLOAPARE@minedu.edu.pe', 'ULLOA                              ', 'PAREDES                            ', 'KRISTY EVELYN                 ', '0357608', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 70155247, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70155247.pdf'),
(346, '41786663', '942321673', 'darias_ac@hotmail.com', 'FREDYDARIO.APAZACHAC@minedu.edu.pe', 'APAZA                              ', 'CHACON                             ', 'FREDY DARIO                   ', '0507756', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41786663, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41786663.pdf'),
(348, '45556515', '963411471', 'trinifer.1@hotmail.com', 'TRINIDADCECIL.FERNANDEZCRUZ@minedu.edu.pe', 'FERNANDEZ                          ', 'CRUZ                               ', 'TRINIDAD CECILIA              ', '0688465', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45556515, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45556515.pdf'),
(349, '10476320', '955220795', 'TINOTUMBES@HOTMAIL.COM', 'AGUSTINJAVIE.GUERRADIAZ@minedu.edu.pe', 'GUERRA                             ', 'DIAZ                               ', 'AGUSTIN JAVIER                ', '0343194', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 10476320, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10476320.pdf'),
(350, '41961627', '972904632', 'BILLY_HE2@HOTMAIL.COM', 'billy.herrerae@minedu.edu.pe', 'HERRERA                            ', 'ELIZALDE                           ', 'BILLY ALBERT                  ', '0327163', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41961627, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41961627.pdf'),
(351, '001754884', '970600534', 'JORGEMARTINEZTORIBIO5@GMAIL.COM', 'JORGE.MARTINEZTORI@minedu.edu.pe', 'MARTINEZ                           ', 'TORIBIO                            ', 'JORGE                         ', '0260109', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 1754884, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '001754884.pdf'),
(352, '72360569', '954798689', 'DIVAIO_0409@HOTMAIL.COM', 'LEONARDOAVELI.NUÑEZZEVA@minedu.edu.pe', 'NUÑEZ                              ', 'ZEVALLOS                           ', 'LEONARDO AVELINO              ', '0260638', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 72360569, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72360569.pdf'),
(353, '43261316', '983267067', 'ROBERTOQB23@HOTMAIL.COM', 'ROBERTOCARLO.QUIJANOBENA@minedu.edu.pe', 'QUIJANO                            ', 'BENAVIDES                          ', 'ROBERTO CARLOS                ', '0915843', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43261316, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43261316.pdf'),
(354, '70226771', '995744861', 'YOSMARONALDOFLOREZ10@GMAIL.COM', 'YOSMARRONAL.QUISPEFLOR@minedu.edu.pe', 'QUISPE                             ', 'FLOREZ                             ', 'YOSMAR RONALDO BONNI          ', '0840710', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70226771, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70226771.pdf'),
(355, '71458607', '942385608', 'shonildatlvnoemi@gmail.com', 'SONILDANOEMI.QUISPEMAMA@minedu.edu.pe', 'QUISPE                             ', 'MAMANI                             ', 'SONILDA NOEMI                 ', '0341941', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 71458607, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71458607.pdf'),
(356, '77208199', '932704497', 'MADELEINEKATIATITO@GMAIL.COM', 'MADELEINEKATIA.QUISPETITO@minedu.edu.pe', 'QUISPE                             ', 'TITO                               ', 'MADELEINE KATIA               ', '1017821', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 77208199, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77208199.pdf'),
(357, '40897714', '969224951', 'martharp9481@hotmail.com', 'MARTHAIRENE.RAMIREZPALM@minedu.edu.pe', 'RAMIREZ                            ', 'PALMA                              ', 'MARTHA IRENE                  ', '0343038', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40897714, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40897714.pdf'),
(358, '71624792', '957773020', 'CHRISTIANPATRICIOSS@GMAIL.COM', 'christian.roldana@minedu.edu.pe', 'ROLDAN                             ', 'AMPUERO                            ', 'CHRISTIAN PATRICIO            ', '0342980', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71624792, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71624792.pdf'),
(359, '40382144', '966215215', 'SESSAREGOROCIO@GMAIL.COM', 'ROCIODEL.SESSAREGOTASA@minedu.edu.pe', 'SESSAREGO                          ', 'TASAYCO                            ', 'ROCIO DEL CARMEN              ', '0350405', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40382144, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40382144.pdf'),
(360, '41456835', '930260050', 'mary.2382.jans@gmail.com', 'WILMA.SUCAPUCAMAMA@minedu.edu.pe', 'SUCAPUCA                           ', 'MAMANI                             ', 'WILMA                         ', '0467381', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41456835, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41456835.pdf'),
(361, '70473516', '977123358', 'trujillano76@gmail.com', 'amilcar.trujillod@minedu.edu.pe', 'TRUJILLO                           ', 'DIAZ                               ', 'AMILCAR                       ', '0354316', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70473516, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70473516.pdf'),
(362, '44034640', '992033127', 'tumhihobandhu2701@hotmail.com', 'JUANCARLO.ACOSTARIVA@minedu.edu.pe', 'ACOSTA                             ', 'RIVADENEIRA                        ', 'JUAN CARLOS                   ', '1017987', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44034640, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44034640.pdf'),
(363, '002271948', '944339629', 'ABDIELGLOBAL21@GMAIL.COM', 'ABDIELISAAC.BORGESZAMB@minedu.edu.pe', 'BORGES                             ', 'ZAMBRANO                           ', 'ABDIEL ISAAC                  ', '0355958', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 2271948, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '002271948.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(365, '75972237', '984240925', 'kaby_2804@hotmail.com', 'claudia.castillomo@minedu.edu.pe', 'CASTILLO                           ', 'MONTOYA                            ', 'CLAUDIA                       ', '0571042', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75972237, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75972237.pdf'),
(366, '43970515', '942605266', 'elita2ds@hotmail.com', 'ELITAAMARI.DIOSESSAND@minedu.edu.pe', 'DIOSES                             ', 'SANDOVAL                           ', 'ELITA AMARIL                  ', '1406149', '', '', 'Borrador', '', '', 'Calificado', 56, 'Destacado', 1, 43970515, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43970515.pdf'),
(368, '40702679', '992547100', 'CLMT116@GMAIL.COM', 'CAROLINALISSE.MATOSTORR@minedu.edu.pe', 'MATOS                              ', 'TORRES                             ', 'CAROLINA LISSET               ', '0720094', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40702679, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40702679.pdf'),
(370, '18150023', '961010990', 'janinamontes@hotmail.com', 'FLORJANIN.MONTESMUDA@minedu.edu.pe', 'MONTES                             ', 'MUDARRA                            ', 'FLOR JANINA                   ', '0719476', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 18150023, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18150023.pdf'),
(371, '43849230', '966654946', 'nathy1505@hotmail.com', 'RUTHNATHA.PARDODELG@minedu.edu.pe', 'PARDO                              ', 'DELGADO                            ', 'RUTH NATHALY                  ', '0356089', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43849230, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43849230.pdf'),
(372, '43904767', '979565496', 'CARLAF.PEYA@GMAIL.COM', 'CARLAFIORE.PEÑABANC@minedu.edu.pe', 'PEÑA                               ', 'BANCAYAN                           ', 'CARLA FIORELLA                ', '0625673', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43904767, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43904767.pdf'),
(374, '44529240', '969099766', 'mirella0387@hotmail.com', 'JAHAIRAMIREL.ROQUEBERM@minedu.edu.pe', 'ROQUE                              ', 'BERMEJO                            ', 'JAHAIRA MIRELLA               ', '1137066', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44529240, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44529240.pdf'),
(375, '02830914', '968891189', 'IVONET000@HOTMAIL.COM', 'IVONNE.ROSALESVALL@minedu.edu.pe', 'ROSALES                            ', 'VALLADARES                         ', 'IVONNE                        ', '1017524', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 2830914, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02830914.pdf'),
(376, '45934059', '977859213', 'LESLIESALDARRIAGAT@GMAIL.COM', 'LESLIEEVELI.SALDARRIAGATRIP@minedu.edu.pe', 'SALDARRIAGA                        ', 'TRIPUL                             ', 'LESLIE EVELIN                 ', '0327379', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45934059, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45934059.pdf'),
(377, '71256296', '986909482', 'MARGOOD.1996@GMAIL.COM', 'MARGOOD.ALZAMORABARR@minedu.edu.pe', 'ALZAMORA                           ', 'BARRIENTOS                         ', 'MARGOOD                       ', '1575455', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71256296, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71256296.pdf'),
(378, '48514391', '982422051', 'GYRLABN@GMAIL.COM', 'GYRLAYARIS.BALABARCANICA@minedu.edu.pe', 'BALABARCA                          ', 'NICASIO                            ', 'GYRLA YARISHA                 ', '1575455', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 48514391, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48514391.pdf'),
(379, '46498408', '997867685', 'tellito2011@gmail.com', 'MARIAMAGDA.CRISOLOGOTELL@minedu.edu.pe', 'CRISOLOGO                          ', 'TELLO                              ', 'MARIA MAGDALENA               ', '1714187', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46498408, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46498408.pdf'),
(380, '75744846', '930478581', 'TALITAHUERTAS@GMAIL.COM', 'TALITAESTHE.HUERTASCORO@minedu.edu.pe', 'HUERTAS                            ', 'CORONADO                           ', 'TALITA ESTHER                 ', '0510750', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 75744846, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75744846.pdf'),
(381, '46987219', '982588948', 'katherin_mc12@hotmail.com', 'KATHERINHEIDY.MACHACACCAM@minedu.edu.pe', 'MACHACA                            ', 'CCAMA                              ', 'KATHERIN HEIDY                ', '0614057', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46987219, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46987219.pdf'),
(382, '10004070', '917494327', 'karin.1705@hotmail.com', 'KARINROSAR.MARTINEZYNGA@minedu.edu.pe', 'MARTINEZ                           ', 'YNGA                               ', 'KARIN ROSARIO                 ', '0674853', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 10004070, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10004070.pdf'),
(383, '02852150', '949646365', 'piscis.14-03@hotmail.com', 'JOSEFINA.NAVARROVILL@minedu.edu.pe', 'NAVARRO                            ', 'VILLEGAS                           ', 'JOSEFINA                      ', '0629311', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 2852150, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02852150.pdf'),
(384, '09466337', '963964835', 'LEONORNIMAES@GMAIL.COM', 'LEONORESTAT.NIMAESPI@minedu.edu.pe', 'NIMA                               ', 'ESPINOZA                           ', 'LEONOR ESTATE                 ', '1660224', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 9466337, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09466337.pdf'),
(385, '10791747', '977410652', 'misskatherine03@gmail.com', 'KATHERINEMONIC.PERALESMUÑO@minedu.edu.pe', 'PERALES                            ', 'MUÑOZ                              ', 'KATHERINE MONICA              ', '1714237', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 10791747, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10791747.pdf'),
(386, '41105109', '942454184', 'ankipaola55426@hotmail.com', 'ankiza.popicp@minedu.edu.pe', 'POPIC                              ', 'PALOMINO                           ', 'ANKIZA PAOLA                  ', '1587344', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 41105109, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41105109.pdf'),
(387, '70177640', '931518030', 'BETZY15EDITH@GMAIL.COM', 'betzabe.quispey@minedu.edu.pe', 'QUISPE                             ', 'YARANGA                            ', 'BETZABE EDITH                 ', '1716877', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 70177640, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70177640.pdf'),
(388, '09863650', '942104756', 'maricuchita15@hotmail.com', 'MARIADEL.REYESROBL@minedu.edu.pe', 'REYES                              ', 'ROBLES                             ', 'MARIA DEL PILAR               ', '0574145', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 9863650, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09863650.pdf'),
(389, '73645477', '953480272', 'MICHYMAIRIM@GMAIL.COM', 'MIRIAM.RIVERAGUTI@minedu.edu.pe', 'RIVERA                             ', 'GUTIERREZ                          ', 'MIRIAM                        ', '0719583', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73645477, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73645477.pdf'),
(390, '47422433', '977660481', 'ROSADIOCASTILLOJENNIFER@GMAIL.COM', 'JENNIFERSUSAN.ROSADIOCAST@minedu.edu.pe', 'ROSADIO                            ', 'CASTILLO                           ', 'JENNIFER SUSANA               ', '1746049', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47422433, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47422433.pdf'),
(392, '72728083', '952968980', 'CAROLINASANROMANF@GMAIL.COM', 'carolina.sanromanf@minedu.edu.pe', 'SAN ROMAN                          ', 'FIGUEROA                           ', 'CAROLINA ALISON               ', '1649276', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 72728083, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72728083.pdf'),
(393, '40074888', '944899352', 'CAROLINAATIAJA@MONTESSORIPIURA.EDU.PE', 'CAROLINADEL.ATIAJAPINT@minedu.edu.pe', 'ATIAJA                             ', 'PINTADO                            ', 'CAROLINA DEL PILAR            ', '1018084', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 40074888, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40074888.pdf'),
(394, '41387230', '949752026', 'TERESABOBBIO@OUTLOOK.COM', 'TERESADE.BOBBIOVASQ@minedu.edu.pe', 'BOBBIO                             ', 'VASQUEZ DE SANDOVAL                ', 'TERESA DE JESUS               ', '0854299', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 41387230, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41387230.pdf'),
(397, '73664081', '939731109', 'enriquecontrerassolis@gmail.com', 'ENRIQUEROGGE.CONTRERASSOLI@minedu.edu.pe', 'CONTRERAS                          ', 'SOLIS                              ', 'ENRIQUE ROGGER RENAN          ', '0860361', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 73664081, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73664081.pdf'),
(398, '45919045', '936759857', 'lizbethgr_25@hotmail.com', 'LIZBETHDEL.GALLORODR@minedu.edu.pe', 'GALLO                              ', 'RODRIGUEZ                          ', 'LIZBETH DEL PILAR             ', '0343095', '', '', 'Sin Calificar', '', '', 'Calificado', 52, 'Logrado', 1, 45919045, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45919045.pdf'),
(399, '71811043', '955297060', 'karen_876_love@hotmail.com', 'KARENLUISA.GARCIACHUQ@minedu.edu.pe', 'GARCIA                             ', 'CHUQUIHUANGA                       ', 'KAREN LUISA                   ', '0357228', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 71811043, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71811043.pdf'),
(401, '77050325', '931616482', 'noemi_keila@hotmail.com', 'KEILANOEMI.JUAREZMIRA@minedu.edu.pe', 'JUAREZ                             ', 'MIRANDA                            ', 'KEILA NOEMI                   ', '0860361', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 77050325, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77050325.pdf'),
(402, '02820121', '952804392', 'K_MARTINEZA@HOTMAIL.COM', 'ANAKATHE.MARTINEZAZCA@minedu.edu.pe', 'MARTINEZ                           ', 'AZCARATE DE ORDOÑEZ                ', 'ANA KATHERINA                 ', '0457176', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 2820121, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02820121.pdf'),
(404, '45513359', '901527712', 'carlapinedoserquen@gmail.com', 'carla.pinedos@minedu.edu.pe', 'PINEDO                             ', 'SERQUEN                            ', 'CARLA MILUSKA                 ', '1369552', '', '', 'No enviado', '', '', 'No enviado', 48, 'Logrado', 1, 45513359, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45513359.pdf'),
(407, '43512467', '976294805', 'noemisantistebanbances@gmail.com', 'OLGANOEMI.SANTISTEBANBANC@minedu.edu.pe', 'SANTISTEBAN                        ', 'BANCES                             ', 'OLGA NOEMI                    ', '0467472', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 43512467, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43512467.pdf'),
(408, '72778005', '956922108', 'GIMENA297@HOTMAIL.COM', 'SABINAGIMEN.VALDEZSEMI@minedu.edu.pe', 'VALDEZ                             ', 'SEMINARIO                          ', 'SABINA GIMENA                 ', '0860361', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 72778005, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72778005.pdf'),
(409, '42570694', '920226623', 'rosario247@outlook.com', 'ROSARIOJESUS.CALEROPARE@minedu.edu.pe', 'CALERO                             ', 'PAREDES                            ', 'ROSARIO JESUS                 ', '0698613', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42570694, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42570694.pdf'),
(410, '43017403', '940027084', 'ginacastillo2603@gmail.com', 'GINAFIORE.CASTILLOALIA@minedu.edu.pe', 'CASTILLO                           ', 'ALIAGA                             ', 'GINA FIORELLA                 ', '0355966', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43017403, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43017403.pdf'),
(411, '46329926', '977383087', 'LUCHITO15_78@HOTMAIL.COM', 'JOEMARTI.CHAVEZMEDI@minedu.edu.pe', 'CHAVEZ                             ', 'MEDINA                             ', 'JOE MARTIN                    ', '1336056', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46329926, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46329926.pdf'),
(412, '16758458', '922126719', 'ROSADOFATIMA197@GMAIL.COM', 'FATIMA.FLORESFARF@minedu.edu.pe', 'FLORES                             ', 'FARFAN                             ', 'FATIMA                        ', '1768175', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16758458, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16758458.pdf'),
(413, '43848131', '920690700', 'betsy_1120@hotmail.com', 'JENNYBETSY.GAGOTORR@minedu.edu.pe', 'GAGO                               ', 'TORRES                             ', 'JENNY BETSY                   ', '0490284', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43848131, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43848131.pdf'),
(414, '09904528', '935457259', 'aleyam83@hotmail.com', 'LUZPAOLA.LUYOLIZA@minedu.edu.pe', 'LUYO                               ', 'LIZARASO                           ', 'LUZ PAOLA                     ', '1095538', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 9904528, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09904528.pdf'),
(415, '00237528', '939706365', 'BETHMILA1968@GMAIL.COM', 'BETTYMILAG.MENDOZAPEÑA@minedu.edu.pe', 'MENDOZA                            ', 'PEÑA                               ', 'BETTY MILAGROS                ', '0675124', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 237528, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00237528.pdf'),
(416, '44881037', '950864144', 'diris158@hotmail.com', 'DIANAYRIS.NIÑOANIC@minedu.edu.pe', 'NIÑO                               ', 'ANICETO                            ', 'DIANA YRIS                    ', '0356311', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44881037, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44881037.pdf'),
(417, '03680105', '939116803', 'anni_nole@hotmail.com', 'ROSAFREDE.NOLELA@minedu.edu.pe', 'NOLE                               ', 'LA CHIRA                           ', 'ROSA FREDESVINDA              ', '0626564', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 3680105, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03680105.pdf'),
(418, '10122523', '959108834', 'hernanpar@hotmail.com', 'HERNANALFRE.PAREDESRAGA@minedu.edu.pe', 'PAREDES                            ', 'RAGAS                              ', 'HERNAN ALFREDO                ', '1336064', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 10122523, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10122523.pdf'),
(419, '44198364', '914805302', 'PELTROCHEVLUISMIGUEL@GMAIL.COM', 'LUISMIGUE.PELTROCHEVASQ@minedu.edu.pe', 'PELTROCHE                          ', 'VASQUEZ                            ', 'LUIS MIGUEL                   ', '0571042', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44198364, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44198364.pdf'),
(420, '09763209', '963559685', 'hernanportillo10@hotmail.com', 'HERNANALFRE.PORTILLOCONT@minedu.edu.pe', 'PORTILLO                           ', 'CONTRERAS                          ', 'HERNAN ALFREDO                ', '0674440', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 9763209, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09763209.pdf'),
(421, '41730441', '959850873', 'DIFGEOMAT@GMAIL.COM', 'IRMA.RAFAELPERE@minedu.edu.pe', 'RAFAEL                             ', 'PEREZ                              ', 'IRMA                          ', '0809517', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41730441, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41730441.pdf'),
(422, '40264979', '929446890', 'ruedapinedocatherine79@gmail.com', 'CATHERINE.RUEDAPINE@minedu.edu.pe', 'RUEDA                              ', 'PINEDO                             ', 'CATHERINE                     ', '1599463', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40264979, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40264979.pdf'),
(423, '41073734', '943126376', 'raqsyn2011@hotmail.com', 'RAQUEL.SAMILLANINOQ@minedu.edu.pe', 'SAMILLAN                           ', 'INOQUIO                            ', 'RAQUEL                        ', '0576819', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41073734, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41073734.pdf'),
(424, '41731334', '949478394', 'wordordinary_2004@hotmail.com', 'chris.cabanillasl@minedu.edu.pe', 'CABANILLAS                         ', 'LOYOLA                             ', 'CHRIS JEYMI                   ', '0357624', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41731334, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41731334.pdf'),
(425, '45146887', '930883652', 'huamancabanillasyardeny@gmail.com', 'NANCYYARDE.HUAMANCABA@minedu.edu.pe', 'HUAMAN', 'CABANILLAS', 'NANCY YARDENI', '0506253', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45146887, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45146887.pdf'),
(426, '29644096', '959194224', 'edithdina74@hotmail.com', 'EDITHDINA.JIMENEZITO@minedu.edu.pe', 'JIMENEZ                            ', 'ITO                                ', 'EDITH DINA                    ', '1558576', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 29644096, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29644096.pdf'),
(427, '70331426', '971742606', 'llicamendy@gmail.com', 'MENDYYESEN.LLICAHUAY@minedu.edu.pe', 'LLICA                              ', 'HUAYCANI                           ', 'MENDY YESENIA                 ', '0352260', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70331426, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70331426.pdf'),
(428, '44431345', '975465480', 'ERIKALOBATON503@GMAIL.COM', 'ERIKAFABIO.LOBATONESTR@minedu.edu.pe', 'LOBATON                            ', 'ESTRADA                            ', 'ERIKA FABIOLA                 ', '0866475', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44431345, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44431345.pdf'),
(429, '40577372', '935085939', 'memonqui@hotmail.com', 'MERYNARCY.MONROYQUIR@minedu.edu.pe', 'MONROY                             ', 'QUIRO                              ', 'MERY NARCY                    ', '0841361', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40577372, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40577372.pdf'),
(430, '41892018', '973095939', 'kemoni1@hotmail.com', 'KELYDEL.MORANTENIÑO@minedu.edu.pe', 'MORANTE                            ', 'NIÑO                               ', 'KELY DEL PILAR                ', '0342451', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41892018, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41892018.pdf'),
(431, '48040283', '925860139', 'JOELLML652@GMAIL.COM', 'JOELALBIN.MORENOGAST@minedu.edu.pe', 'MORENO                             ', 'GASTULO                            ', 'JOEL ALBINO                   ', '0737346', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 48040283, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48040283.pdf'),
(432, '48252803', '977854057', 'wendy_jake@hotmail.com', 'WENDYJACKE.NOLASCOBAZA@minedu.edu.pe', 'NOLASCO                            ', 'BAZAN                              ', 'WENDY JACKELIN                ', '0848622', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48252803, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48252803.pdf'),
(433, '27751644', '931685302', 'dulceperez-27@hotmail.com', 'DULCEODALI.PEREZHUAM@minedu.edu.pe', 'PEREZ                              ', 'HUAMAN                             ', 'DULCE ODALIS                  ', '0841395', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 27751644, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '27751644.pdf'),
(434, '18138937', '945368128', 'elsiplasenciam@gmail.com', 'MARIAELSA.PLASENCIAMOST@minedu.edu.pe', 'PLASENCIA                          ', 'MOSTACERO                          ', 'MARIA ELSA                    ', '0939397', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18138937, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18138937.pdf'),
(435, '21565520', '927045523', 'CAROLINACALLALLI@HOTMAIL.COM', 'MARIAALBER.PUMAYAURIANDR@minedu.edu.pe', 'PUMAYAURI                          ', 'ANDRES                             ', 'MARIA ALBERTINA               ', '0342451', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 21565520, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '21565520.pdf'),
(436, '75662271', '955539838', 'CINTHIA.RELUZ1405@GMAIL.COM', 'CINTHIAKATHE.RELÚZAYAS@minedu.edu.pe', 'RELÚZ                              ', 'AYASTA                             ', 'CINTHIA KATHERINE             ', '1562602', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 75662271, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75662271.pdf'),
(437, '17638491', '978150842', 'cruznay.ra@outlook.com', 'JOSENOLBE.ROQUERAMO@minedu.edu.pe', 'ROQUE                              ', 'RAMOS                              ', 'JOSE NOLBERTO                 ', '0352484', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 17638491, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17638491.pdf'),
(438, '76008595', '927922109', 'ROXANAVASQUEZNEIRA@GMAIL.COM', 'ELVYROXAN.VASQUEZNEIR@minedu.edu.pe', 'VASQUEZ                            ', 'NEIRA                              ', 'ELVY ROXANA                   ', '0560904', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 76008595, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76008595.pdf'),
(439, '28274557', '947736246', 'MVILLARBAUTISTA70@GMAIL.COM', 'MARIAISABE.VILLARBAUT@minedu.edu.pe', 'VILLAR                             ', 'BAUTISTA                           ', 'MARIA ISABEL                  ', '0561092', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 28274557, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '28274557.pdf'),
(440, '28131024', '914513119', 'banizvasquez@gmail.com', 'BANI.ZELADAVASQ@minedu.edu.pe', 'ZELADA                             ', 'VASQUEZ                            ', 'BANI                          ', '0613505', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 28131024, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '28131024.pdf'),
(441, '41513677', '937597946', 'AGUI.AGUI22@HOTMAIL.COM', 'GIOVANA.AGUILARSIAN@minedu.edu.pe', 'AGUILAR                            ', 'SIANCAS                            ', 'GIOVANA                       ', '0348342', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41513677, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41513677.pdf'),
(442, '00201329', '973977252', 'norma.1963.25@hotmail.com', 'ROSANORMA.CAMPAÑAMONT@minedu.edu.pe', 'CAMPAÑA                            ', 'MONTOYA                            ', 'ROSA NORMA                    ', '0348227', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 201329, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00201329.pdf'),
(443, '48470591', '993870533', 'KATHYCEDANOLECARNAQUE@GMAIL.COM', 'KATTYFAVIA.CEDANOLECA@minedu.edu.pe', 'CEDANO                             ', 'LECARNAQUE                         ', 'KATTY FAVIANA                 ', '0732560', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48470591, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48470591.pdf'),
(444, '40545639', '949619355', 'MILY35.CESAGUI@OUTLOOK.ES', 'JEYESRLIMILUS.CESPEDESAGUI@minedu.edu.pe', 'CESPEDES                           ', 'AGUILAR                            ', 'JEYESRLI MILUSCA              ', '0348193', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40545639, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40545639.pdf'),
(445, '43714475', '930401244', 'DENISDELAMADIOS@GMAIL.COM', 'CLARITADENIS.DELAMA@minedu.edu.pe', 'DE LAMA                            ', 'DIOS                               ', 'CLARITA DENISSE               ', '0348284', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43714475, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43714475.pdf'),
(446, '72399183', '937599208', 'SAFHY15@HOTMAIL.COM', 'SAFHYJULIS.DIOSESCESP@minedu.edu.pe', 'DIOSES                             ', 'CESPEDES                           ', 'SAFHY JULISSA                 ', '0348284', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72399183, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72399183.pdf'),
(447, '47412384', '900798964', 'ROSALY.FER.28@GMAIL.COM', 'ROSALI.FERNANDEZFERN@minedu.edu.pe', 'FERNANDEZ                          ', 'FERNANDEZ                          ', 'ROSALI                        ', '0348342', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47412384, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47412384.pdf'),
(448, '00370151', '958686315', 'vilmagarcy@hotmail.com', 'VILMARAQUE.GARCIATINE@minedu.edu.pe', 'GARCIA                             ', 'TINEDO                             ', 'VILMA RAQUEL                  ', '1136472', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 370151, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00370151.pdf'),
(449, '44259041', '914821775', 'YOMAIR.28@GMAIL.COM', 'YOMAIRAYULIA.GOMEZESPI@minedu.edu.pe', 'GOMEZ                              ', 'ESPINOZA                           ', 'YOMAIRA YULIANA               ', '0732560', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44259041, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44259041.pdf'),
(451, '40127484', '999639523', 'juaniz.sol.mar@gmail.com', 'JUANAMARIS.MARTINEZALBA@minedu.edu.pe', 'MARTINEZ                           ', 'ALBAN                              ', 'JUANA MARISOL                 ', '1144658', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40127484, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40127484.pdf'),
(453, '41748065', '968175169', 'banessarevo@hotmail.com', 'amalia.revolledom@minedu.edu.pe', 'REVOLLEDO                          ', 'MORAN DE SIANCAS                   ', 'AMALIA BANESSA                ', '1144658', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41748065, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41748065.pdf'),
(454, '74935715', '941069906', 'WHYNY_DIANA_98@HOTMAIL.COM', 'WHYNYDIANA.RUIZSISN@minedu.edu.pe', 'RUIZ                               ', 'SISNIEGAS                          ', 'WHYNY DIANA YAKELINHE         ', '0348342', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 74935715, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74935715.pdf'),
(455, '00257293', '913957846', 'MILAGROS061979@GMAIL.COM', 'MILAGROS.SAMPERTEGUISOCO@minedu.edu.pe', 'SAMPERTEGUI                        ', 'SOCOLA                             ', 'MILAGROS                      ', '1144575', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 257293, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00257293.pdf'),
(457, '47098085', '951947141', 'wwalter12@hotmail.com', 'MAYRAMARIB.ZAVALARIVE@minedu.edu.pe', 'ZAVALA                             ', 'RIVERA                             ', 'MAYRA MARIBEL                 ', '0348342', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47098085, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47098085.pdf'),
(458, '41535256', '969974528', 'becerrita_1402@hotmail.com', 'LILY.BECERRATENO@minedu.edu.pe', 'BECERRA                            ', 'TENORIO                            ', 'LILY                          ', '1097377', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41535256, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41535256.pdf'),
(459, '46276244', '958821717', 'vaiby_1990@hotmail.com', 'alicia.bejaranoy@minedu.edu.pe', 'BEJARANO                           ', 'YAURI DE CHAVEZ                    ', 'ALICIA VALERIA                ', '0352492', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46276244, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46276244.pdf'),
(460, '16800376', '996068422', 'adeli26_77@hotmail.com', 'adelayda.bustamanten@minedu.edu.pe', 'BUSTAMANTE                         ', 'NEIRA                              ', 'ADELAYDA                      ', '0467522', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16800376, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16800376.pdf'),
(461, '43654422', '933694581', 'massiel_22_17@hotmail.com', 'YURIMASSI.CONTRERASTARR@minedu.edu.pe', 'CONTRERAS                          ', 'TARRILLO                           ', 'YURI MASSIEL                  ', '0352948', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43654422, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43654422.pdf'),
(462, '73214134', '928945295', 'mariaclarisagonzalessaavedra2@gmail.com', 'MARÍACLARI.GONZÁLESSAAV@minedu.edu.pe', 'GONZÁLES                           ', 'SAAVEDRA                           ', 'MARÍA CLARISA                 ', '0719757', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 73214134, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73214134.pdf'),
(464, '41778165', '925978120', 'annamonteza@hotmail.com', 'anna.montezad@minedu.edu.pe', 'MONTEZA                            ', 'DAVILA                             ', 'ANNA CONSUELO                 ', '0352757', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41778165, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41778165.pdf'),
(465, '41353014', '925644788', 'ALEN16NQ@GMAIL.COM', 'ARMANDOALEN.NUÑEZQUIS@minedu.edu.pe', 'NUÑEZ                              ', 'QUISPE                             ', 'ARMANDO ALEN                  ', '0674101', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41353014, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41353014.pdf'),
(466, '42096978', '958204717', 'PBMARIBEL12@GMAIL.COM', 'MARIBEL.PUMABAUT@minedu.edu.pe', 'PUMA                               ', 'BAUTISTA                           ', 'MARIBEL                       ', '0353029', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42096978, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42096978.pdf'),
(467, '43652747', '947023919', 'piligino31@gmail.com', 'VIOLETADEL.RIOJAZUÑI@minedu.edu.pe', 'RIOJA                              ', 'ZUÑIGA                             ', 'VIOLETA DEL PILAR             ', '0841213', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43652747, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43652747.pdf'),
(468, '41932387', '932070138', 'mary_83_2009@hotmail.com', 'MARIAEVARI.ROJASHUAM@minedu.edu.pe', 'ROJAS                              ', 'HUAMAN                             ', 'MARIA EVARISTA                ', '0621797', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41932387, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41932387.pdf'),
(470, '43984318', '976269890', 'mariaortenciatenoriobarboza@gmail.com', 'MARIAORTEN.TENORIOBARB@minedu.edu.pe', 'TENORIO                            ', 'BARBOZA DE DESCALZI                ', 'MARIA ORTENCIA                ', '0352484', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43984318, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43984318.pdf'),
(471, '46234969', '951696899', 'crissita_torsan@hotmail.com', 'LUZCRIST.TORRESSANC@minedu.edu.pe', 'TORRES                             ', 'SANCARRANCO                        ', 'LUZ CRISTABEL                 ', '0352492', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46234969, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46234969.pdf'),
(472, '40642818', '936356504', 'ROXANATORRESVEGA@GMAIL.COM', 'JULIAROXAN.TORRESVEGA@minedu.edu.pe', 'TORRES                             ', 'VEGA                               ', 'JULIA ROXANA                  ', '1095223', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40642818, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40642818.pdf'),
(473, '27418954', '999206888', 'alfonsovl100@gmail.com', 'alfonso.vasquezl@minedu.edu.pe', 'VASQUEZ                            ', 'LEIVA                              ', 'ALFONSO                       ', '1567056', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 27418954, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '27418954.pdf'),
(474, '40611532', '988675550', 'ERIKA.PASAPERA01@HOTMAIL.COM', 'ERIKAJACQU.ZULOETAPASA@minedu.edu.pe', 'ZULOETA                            ', 'PASAPERA                           ', 'ERIKA JACQUELINE              ', '0352880', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40611532, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40611532.pdf'),
(476, '40898581', '959010514', 'feloman_77@hotmail.com', 'FRANKLINFELIT.CESPEDESVINC@minedu.edu.pe', 'CESPEDES                           ', 'VINCES                             ', 'FRANKLIN FELITO               ', '0327395', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40898581, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40898581.pdf'),
(477, '41985370', '954441146', 'huanarumi808@hotmail.com', 'CESARIGNAC.CHOQUEHUANCASOLO@minedu.edu.pe', 'CHOQUEHUANCA                       ', 'SOLORZANO                          ', 'CESAR IGNACIO                 ', '0493619', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41985370, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41985370.pdf'),
(478, '03589151', '959096513', 'sanita_28@hotmail.com', 'SANTOSANITA.CORDOVACRUZ@minedu.edu.pe', 'CORDOVA                            ', 'CRUZ                               ', 'SANTOS ANITA                  ', '0625673', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 3589151, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03589151.pdf'),
(481, '16718613', '952215933', 'geraldine504@hotmail.com', 'MARIAGERAL.MONTENEGROASEN@minedu.edu.pe', 'MONTENEGRO                         ', 'ASENJO                             ', 'MARIA GERALDINE               ', '1598119', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16718613, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16718613.pdf'),
(482, '43016122', '947886597', 'melimon330@gmail.com', 'MELISSAELIAN.MORANMELG@minedu.edu.pe', 'MORAN                              ', 'MELGAR                             ', 'MELISSA ELIANA                ', '1598200', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43016122, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43016122.pdf'),
(483, '40723532', '945255001', 'monicpp.80@gmail.com', 'MONICAYSABE.PEREZPLAS@minedu.edu.pe', 'PEREZ                              ', 'PLASENCIA                          ', 'MONICA YSABEL                 ', '0620260', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40723532, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40723532.pdf'),
(484, '01296699', '988459329', 'licelycontabilidad@gmail.com', 'JANETLICEL.PINAZOMEND@minedu.edu.pe', 'PINAZO                             ', 'MENDOZA                            ', 'JANET LICELY                  ', '0708438', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 1296699, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '01296699.pdf'),
(486, '40279558', '919591575', 'SINECIOTL@GMAIL.COM', 'SINECIO.TORRESLINA@minedu.edu.pe', 'TORRES                             ', 'LINARES                            ', 'SINECIO                       ', '1627322', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40279558, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40279558.pdf'),
(487, '44935005', '998049047', 'ONAN1487@GMAIL.COM', 'JHONATANCRIST.VALLADARESPALA@minedu.edu.pe', 'VALLADARES                         ', 'PALACIOS                           ', 'JHONATAN CRISTIAN             ', '0356147', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44935005, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44935005.pdf'),
(488, '43555922', '942809216', 'bonderhayde@hotmail.com', 'ALONZOJAVIE.VONDERHEYD@minedu.edu.pe', 'VONDER HEYDE                       ', 'LARA                               ', 'ALONZO JAVIER                 ', '3027885', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43555922, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43555922.pdf'),
(489, '42661865', '998957436', 'huberaparicio2018@gmail.com', 'HUBER.APARICIOSALA@minedu.edu.pe', 'APARICIO                           ', 'SALAS                              ', 'HUBER                         ', '0560607', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42661865, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42661865.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(490, '47721748', '956972264', 'paola-2427@hotmail.com', 'NOHELIPAOLA.AREVALOABRA@minedu.edu.pe', 'AREVALO                            ', 'ABRAMONTE                          ', 'NOHELI PAOLA                  ', '0613844', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47721748, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47721748.pdf'),
(491, '41195210', '936423075', 'ejbr5@hotmail.com', 'ELIZABETHJHANE.BOCANEGRARAMO@minedu.edu.pe', 'BOCANEGRA                          ', 'RAMOS DE VASQUEZ                   ', 'ELIZABETH JHANET              ', '0718981', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41195210, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41195210.pdf'),
(492, '25763218', '944223272', 'GLOMBRIA17@GMAIL.COM', 'GLORIAMARIA.BRICEÑOAGUR@minedu.edu.pe', 'BRICEÑO                            ', 'AGURTO                             ', 'GLORIA MARIA                  ', '0570671', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 25763218, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '25763218.pdf'),
(493, '44940848', '959016081', 'luz_camargo_toledo@yahoo.com', 'LUZPAULI.CAMARGOTOLE@minedu.edu.pe', 'CAMARGO                            ', 'TOLEDO                             ', 'LUZ PAULINA                   ', '0613877', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 44940848, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44940848.pdf'),
(494, '41408975', '971159278', 'CELIZABETH_81@HOTMAIL.COM', 'RUTHELIZA.CARCAMOMONT@minedu.edu.pe', 'CARCAMO                            ', 'MONTERO                            ', 'RUTH ELIZABETH                ', '0570671', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41408975, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41408975.pdf'),
(495, '48417458', '969097111', 'LIGUILLENFLORES@GMAIL.COM', 'ISISLISBE.GUILLENFLOR@minedu.edu.pe', 'GUILLEN                            ', 'FLORES                             ', 'ISIS LISBETH                  ', '0915843', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 48417458, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48417458.pdf'),
(496, '40755136', '916443908', 'REBECA.LOZANO2018@GMAIL.COM', 'REBECARAQUE.LOZANOCAST@minedu.edu.pe', 'LOZANO                             ', 'CASTAÑEDA                          ', 'REBECA RAQUEL                 ', '0718981', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40755136, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40755136.pdf'),
(497, '16746557', '920514411', 'sherazade671@gmail.com', 'MIRNAOLENK.MINOPARE@minedu.edu.pe', 'MINO                               ', 'PAREDES                            ', 'MIRNA OLENKA                  ', '0915843', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16746557, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16746557.pdf'),
(498, '41525315', '955802108', 'alicia_marlene22@hotmail.com', 'alicia.morona@minedu.edu.pe', 'MORON                              ', 'AQUIJE                             ', 'ALICIA MARLENE                ', '0673814', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41525315, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41525315.pdf'),
(499, '45544376', '971301949', 'crisnamuche1@gmail.com', 'CYNTIACRIST.NAMUCHEPING@minedu.edu.pe', 'NAMUCHE                            ', 'PINGO                              ', 'CYNTIA CRISTINA               ', '0350363', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45544376, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45544376.pdf'),
(500, '16733967', '978001288', 'alidoli_1308@hotmail.com', 'alida.olidenb@minedu.edu.pe', 'OLIDEN                             ', 'BANCES                             ', 'ALIDA                         ', '0860247', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 16733967, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16733967.pdf'),
(501, '30850157', '930616754', 'carlosponce.capv@gmail.com', 'CARLOSADRIA.PONCEVILC@minedu.edu.pe', 'PONCE                              ', 'VILCA                              ', 'CARLOS ADRIAN                 ', '0737734', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 30850157, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '30850157.pdf'),
(502, '45506952', '931033407', 'jimmy_27_amor@hotmail.com', 'JAIMENOLBE.REVILLACUEV@minedu.edu.pe', 'REVILLA                            ', 'CUEVA                              ', 'JAIME NOLBERTO                ', '0673814', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45506952, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45506952.pdf'),
(503, '18036902', '947894249', 'mensajera_rogo@hotmail.com', 'ROSAVICTO.RODRIGUEZGOIC@minedu.edu.pe', 'RODRIGUEZ                          ', 'GOICOCHEA                          ', 'ROSA VICTORIA                 ', '0490466', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 18036902, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18036902.pdf'),
(504, '80167688', '939132327', 'yangsanchez@gmail.com', 'YANGKAREN.SANCHEZFARF@minedu.edu.pe', 'SANCHEZ                            ', 'FARFAN                             ', 'YANG KARENINA                 ', '0490482', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 80167688, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80167688.pdf'),
(505, '03679028', '981420405', 'devasi2728@hotmail.com', 'DELLYRUTH.VASQUEZSIAN@minedu.edu.pe', 'VASQUEZ                            ', 'SIANCAS DE ATOCHE                  ', 'DELLY RUTH                    ', '0915843', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 3679028, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03679028.pdf'),
(506, '42980512', '969978556', 'jenaire2014@gmail.com', 'YENIMIRIA.AGUILARLOPE@minedu.edu.pe', 'AGUILAR                            ', 'LOPEZ                              ', 'YENI MIRIAM                   ', '0343228', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 42980512, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42980512.pdf'),
(507, '72973093', '999297799', 'ITALA.18.KARELI.20@GMAIL.COM', 'CINTHYAMILAG.ARELLANOGUER@minedu.edu.pe', 'ARELLANO                           ', 'GUERRERO                           ', 'CINTHYA MILAGROS              ', '0357863', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72973093, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72973093.pdf'),
(508, '46290753', '957832380', 'minely214@gmail.com', 'KATTIAMISHE.BARRANTESSAAV@minedu.edu.pe', 'BARRANTES                          ', 'SAAVEDRA                           ', 'KATTIA MISHELL                ', '0357798', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46290753, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46290753.pdf'),
(509, '41943266', '989319314', 'shirleybecerrac@gmail.com', 'SHIRLEY.BECERRACALD@minedu.edu.pe', 'BECERRA                            ', 'CALDERON                           ', 'SHIRLEY                       ', '0467514', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41943266, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41943266.pdf'),
(510, '80480092', '953106972', 'rociobravo_2407@hotmail.com', 'ROCIODEL.BRAVOMART@minedu.edu.pe', 'BRAVO                              ', 'MARTINEZ                           ', 'ROCIO DEL PILAR               ', '0343244', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 80480092, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80480092.pdf'),
(511, '40432864', '912369572', 'saricarr16@hotmail.com', 'SARAMERCE.CARRASCORUIZ@minedu.edu.pe', 'CARRASCO                           ', 'RUIZ                               ', 'SARA MERCEDES                 ', '0357798', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40432864, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40432864.pdf'),
(512, '16702403', '979002638', 'amorajehovadios@outlook.com', 'SILVIA.CAYATOPAGAON@minedu.edu.pe', 'CAYATOPA                           ', 'GAONA                              ', 'SILVIA                        ', '0357798', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16702403, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16702403.pdf'),
(513, '46467506', '947116761', 'angelica_guivarch@hotmail.com', 'angelica.guivarc@minedu.edu.pe', 'GUIVAR                             ', 'CHILON                             ', 'ANGELICA PAOLA                ', '0352476', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46467506, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46467506.pdf'),
(514, '43735309', '983666542', 'MARIALISETTMENDOZASILVA@GMAIL.COM', 'MARIALISET.MENDOZASILV@minedu.edu.pe', 'MENDOZA                            ', 'SILVA                              ', 'MARIA LISETT                  ', '0343236', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43735309, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43735309.pdf'),
(515, '02827905', '968950445', 'monnchy_2@hotmail.com', 'MONICAPILAR.PALLETEMOGO@minedu.edu.pe', 'PALLETE                            ', 'MOGOLLON                           ', 'MONICA PILAR                  ', '0341677', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 52, 'Logrado', 1, 2827905, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02827905.pdf'),
(516, '16722575', '944992953', 'MARIAELENAPILCOZAPATA75@GMAIL.COM', 'MARIAELENA.PILCOZAPA@minedu.edu.pe', 'PILCO                              ', 'ZAPATA DE DELGADO                  ', 'MARIA ELENA                   ', '0352898', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 16722575, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16722575.pdf'),
(517, '76819888', '922432843', 'AZUCENA.QU.30@GMAIL.COM', 'CRUZAZUCE.QUESQUENUGAZ@minedu.edu.pe', 'QUESQUEN                           ', 'UGAZ                               ', 'CRUZ AZUCENA                  ', '0352930', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 76819888, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76819888.pdf'),
(518, '44263461', '992242174', 'FIOQUISPE1686@GMAIL.COM', 'LIZBETHFIORE.QUISPESAMA@minedu.edu.pe', 'QUISPE                             ', 'SAMAME                             ', 'LIZBETH FIORELLA              ', '0673954', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44263461, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44263461.pdf'),
(519, '43104335', '965653334', 'vicflo_32@hotmail.com', 'PATRICIAESPER.SANTISTEBANFERN@minedu.edu.pe', 'SANTISTEBAN                        ', 'FERNANDEZ                          ', 'PATRICIA ESPERANZA            ', '0352559', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43104335, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43104335.pdf'),
(520, '16770987', '990308152', 'talu_sc@hotmail.es', 'TANIALUDIT.SEGURACARD@minedu.edu.pe', 'SEGURA                             ', 'CARDOSO                            ', 'TANIA LUDITH                  ', '0352666', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16770987, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16770987.pdf'),
(521, '41207524', '963193320', 'mar_sandoval_2000@outlook.com', 'ELVIAMADAM.VALLEJOSCARR@minedu.edu.pe', 'VALLEJOS                           ', 'CARRASCO                           ', 'ELVIA MADAM                   ', '0848275', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 41207524, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41207524.pdf'),
(522, '45486743', '973811693', 'sheyla0605@gmail.com', 'SHEYLADANIT.VILLANUEVABERM@minedu.edu.pe', 'VILLANUEVA                         ', 'BERMEJO                            ', 'SHEYLA DANITZA                ', '0343228', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45486743, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45486743.pdf'),
(523, '45206149', '970823032', 'anesber025@gmail.com', 'ANAESMER.BENITESRODR@minedu.edu.pe', 'BENITES                            ', 'RODRIGUEZ                          ', 'ANA ESMERALDA                 ', '0508549', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45206149, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45206149.pdf'),
(525, '71790027', '980312223', 'LEO_1694@HOTMAIL.COM', 'HELENBEATR.CORONADOSANC@minedu.edu.pe', 'CORONADO                           ', 'SANCHEZ                            ', 'HELEN BEATRIZ                 ', '1598093', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 71790027, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71790027.pdf'),
(526, '00256841', '949063678', 'SHALMAPALACIOS8@GMAIL.COM', 'YEXI.FEIJOOCARR@minedu.edu.pe', 'FEIJOO                             ', 'CARRILLO                           ', 'YEXI                          ', '1406156', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 256841, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00256841.pdf'),
(527, '00246575', '968279528', 'karenfo2011@hotmail.com', 'KARINYESEN.FEIJOOORTI@minedu.edu.pe', 'FEIJOO                             ', 'ORTIZ                              ', 'KARIN YESENIA                 ', '1406156', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 246575, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00246575.pdf'),
(528, '29604247', '952510575', 'macedo@hotmail.es', 'SOLEDAD.FLORESMACE@minedu.edu.pe', 'FLORES                             ', 'MACEDO                             ', 'SOLEDAD                       ', '0348508', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 29604247, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29604247.pdf'),
(530, '43556986', '962925605', 'DANITZAMJ50@GMAIL.COM', 'MIRIANDANIT.GONZALESMUÑO@minedu.edu.pe', 'GONZALES                           ', 'MUÑOZ                              ', 'MIRIAN DANITZA                ', '0348425', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43556986, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43556986.pdf'),
(531, '41074491', '952885486', 'pilartumbes_leo@hotmail.com', 'MERCEDESDEL.HENCKELLBECE@minedu.edu.pe', 'HENCKELL                           ', 'BECERRA                            ', 'MERCEDES DEL PILAR            ', '1718584', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41074491, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41074491.pdf'),
(532, '73746826', '938140559', 'IZQUIERDOZAPATAFERNANDA@GMAIL.COM', 'MARIAFERNA.IZQUIERDOZAPA@minedu.edu.pe', 'IZQUIERDO                          ', 'ZAPATA                             ', 'MARIA FERNANDA                ', '1136472', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73746826, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73746826.pdf'),
(534, '40092324', '974139535', 'sonialamalinda@hotmail.com', 'SONIAMARLE.LAMAARMA@minedu.edu.pe', 'LAMA                               ', 'ARMANZA                            ', 'SONIA MARLENE                 ', '1136472', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40092324, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40092324.pdf'),
(535, '72196102', '994901291', 'abigail_medina95@hotmail.com', 'ABIGAILADRIA.MEDINAGARC@minedu.edu.pe', 'MEDINA                             ', 'GARCIA                             ', 'ABIGAIL ADRIANA               ', '1718600', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72196102, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72196102.pdf'),
(536, '71920698', '971176627', 'LIZBETH_ABIGAIL14@HOTMAIL.COM', 'LIZBETHABIGA.OYOLAROJA@minedu.edu.pe', 'OYOLA                              ', 'ROJAS                              ', 'LIZBETH ABIGAIL               ', '1598093', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 71920698, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71920698.pdf'),
(537, '43526076', '962819791', 'segelidu@gmail.com', 'LIDUANGEL.SERNAQUERIVA@minedu.edu.pe', 'SERNAQUE                           ', 'RIVAS                              ', 'LIDU ANGELICA                 ', '1275833', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43526076, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43526076.pdf'),
(538, '72847365', '941197066', 'SHEYLAR1997@GMAIL.COM', 'SHEYLACAROL.TUPEZCAST@minedu.edu.pe', 'TUPEZ                              ', 'CASTILLO                           ', 'SHEYLA CAROLINA               ', '1275833', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72847365, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72847365.pdf'),
(540, '76503756', '944365215', 'alt.brenda13@gmail.com', 'BRENDARAQUE.ALTAMIRANOSANC@minedu.edu.pe', 'ALTAMIRANO                         ', 'SANCHEZ                            ', 'BRENDA RAQUEL                 ', '1418557', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76503756, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76503756.pdf'),
(541, '70549379', '965074909', 'AVALOSV16.94@GMAIL.COM', 'SUSANMICHE.AVALOSVARA@minedu.edu.pe', 'AVALOS                             ', 'VARAS                              ', 'SUSAN MICHEL                  ', '1418557', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70549379, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70549379.pdf'),
(542, '70854618', '952552557', 'fiorellasofiabl@gmail.com', 'FIORELLASOFIA.BASAURILECC@minedu.edu.pe', 'BASAURI                            ', 'LECCA                              ', 'FIORELLA SOFIA                ', '1464031', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70854618, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70854618.pdf'),
(543, '47148353', '941422550', 'greciablasz@gmail.com', 'GRECIAISABE.BLASZAVA@minedu.edu.pe', 'BLAS                               ', 'ZAVALETA                           ', 'GRECIA ISABEL                 ', '1691096', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 47148353, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47148353.pdf'),
(544, '42813391', '931318234', 'ANARAQUELCUEVASANCHEZ@GMAIL.COM', 'ana.cuevas@minedu.edu.pe', 'CUEVA                              ', 'SANCHEZ                            ', 'ANA RAQUEL                    ', '1691146', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42813391, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42813391.pdf'),
(545, '71857636', '902719241', 'LOREDELGADO.GDR@GMAIL.COM', 'GABRIELALOREN.DELGADORAMO@minedu.edu.pe', 'DELGADO                            ', 'RAMOS                              ', 'GABRIELA LORENA               ', '1560630', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71857636, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71857636.pdf'),
(547, '74021552', '970720272', 'WENDY_LAURENTE_18@HOTMAIL.COM', 'WENDYDANIC.LAURENTETACO@minedu.edu.pe', 'LAURENTE                           ', 'TACON                              ', 'WENDY DANICSA                 ', '1691146', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 74021552, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74021552.pdf'),
(549, '72425232', '949873685', 'gladyslopezm123@gmail.com', 'GLADYSINES.LOPEZMERC@minedu.edu.pe', 'LOPEZ                              ', 'MERCEDES                           ', 'GLADYS INES                   ', '1585496', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 72425232, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72425232.pdf'),
(550, '76659614', '920110538', 'damira_1528@hotmail.com', 'MARIELADAMIR.LOYOLARIVE@minedu.edu.pe', 'LOYOLA                             ', 'RIVERA                             ', 'MARIELA DAMIRA                ', '1175728', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76659614, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76659614.pdf'),
(555, '18181571', '972492803', 'eximva75@outlook.es', 'EMILY.ZAVALETAGARC@minedu.edu.pe', 'ZAVALETA                           ', 'GARCIA                             ', 'EMILY                         ', '1418524', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18181571, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18181571.pdf'),
(556, '70313852', '989591398', 'ELIDA4864@HOTMAIL.COM', 'ELIDAMARIA.ALEMANZARA@minedu.edu.pe', 'ALEMAN                             ', 'ZARATE                             ', 'ELIDA MARIA                   ', '0467100', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70313852, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70313852.pdf'),
(558, '00240738', '924962547', 'CECIBELCHIRAMORAN@GMAIL.COM', 'MILAGRITOSCECIB.CHIRAMORA@minedu.edu.pe', 'CHIRA                              ', 'MORAN                              ', 'MILAGRITOS CECIBEL            ', '1599448', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 49, 'Logrado', 1, 240738, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00240738.pdf'),
(559, '70106390', '918044355', 'aurianadiana1@gmail.com', 'DIANAAURIA.COLQUEMAMA@minedu.edu.pe', 'COLQUE                             ', 'MAMANI                             ', 'DIANA AURIANA                 ', '1589118', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70106390, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70106390.pdf'),
(560, '40721558', '983114270', 'florcitacq1@hotmail.com', 'SUJEYELIZA.CONTRERASMACE@minedu.edu.pe', 'CONTRERAS                          ', 'MACEDO                             ', 'SUJEY ELIZABETH               ', '1561034', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 49, 'Logrado', 1, 40721558, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40721558.pdf'),
(562, '47818254', '971307730', 'MIRBEL_CANCER_17@HOTMAIL.COM', 'NORMAMIRBE.GARCIARUIZ@minedu.edu.pe', 'GARCIA                             ', 'RUIZ                               ', 'NORMA MIRBEL                  ', '0348243', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47818254, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47818254.pdf'),
(563, '74947456', '978714661', 'FRANCESCALANDA8@GMAIL.COM', 'MARIAFRANC.LANDAJIME@minedu.edu.pe', 'LANDA                              ', 'JIMENEZ                            ', 'MARIA FRANCESCA               ', '1406164', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74947456, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74947456.pdf'),
(564, '40866509', '948640142', 'yobanaruth1981@gmail.com', 'YOBANAMARIB.MAQUERAMAMA@minedu.edu.pe', 'MAQUERA                            ', 'MAMANI                             ', 'YOBANA MARIBEL                ', '1589258', '20', 'Destacado', 'Borrador Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40866509, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40866509.pdf'),
(565, '42450438', '935428296', 'ARMINELLY1981@GMAIL.COM', 'NELLYARMID.MORENOPEÑA@minedu.edu.pe', 'MORENO                             ', 'PEÑA                               ', 'NELLY ARMIDAD                 ', '0570762', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42450438, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42450438.pdf'),
(566, '43134338', '926014813', 'yanninaom@hotmail.com', 'YANNINAPAOLA.ORREGOMANT@minedu.edu.pe', 'ORREGO                             ', 'MANTARI                            ', 'YANNINA PAOLA MIA             ', '1406164', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43134338, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43134338.pdf'),
(567, '42450209', '943278700', 'BELGIOTOYA17@GMAIL.COM', 'belgica.otoyaj@minedu.edu.pe', 'OTOYA                              ', 'JIMENEZ                            ', 'BELGICA                       ', '0348243', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42450209, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42450209.pdf'),
(568, '41523490', '994968512', 'elibra16_10@hotmail.com', 'MARIAELIZA.PALACIOSRAMI@minedu.edu.pe', 'PALACIOS                           ', 'RAMIREZ                            ', 'MARIA ELIZABETH               ', '1599588', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41523490, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41523490.pdf'),
(570, '71606060', '952593279', 'VARGASPAZOSLISBETH@GMAIL.COM', 'LISBETHLUCIL.VARGASPAZO@minedu.edu.pe', 'VARGAS                             ', 'PAZOS                              ', 'LISBETH LUCILA                ', '1599588', '', '', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 71606060, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71606060.pdf'),
(572, '43020636', '968877273', 'sonia.zeta29@gmail.com', 'SONIAANALI.ZETACHER@minedu.edu.pe', 'ZETA                               ', 'CHERO                              ', 'SONIA ANALISA                 ', '0570911', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43020636, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43020636.pdf'),
(573, '16735647', '960931164', 'helianaalarcon@hotmail.com', 'HELIANADEL.ALARCONMONT@minedu.edu.pe', 'ALARCON                            ', 'MONTOYA                            ', 'HELIANA DEL ROSARIO           ', '0669572', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 16735647, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16735647.pdf'),
(574, '43831655', '939175216', 'NARDI250580@GMAIL.COM', 'NARDIMARIC.ARELLANOLEON@minedu.edu.pe', 'ARELLANO                           ', 'LEON                               ', 'NARDI MARICELA                ', '0619627', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43831655, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43831655.pdf'),
(575, '16796255', '979623070', 'jvanessabc@hotmail.com', 'JULIAVANES.BARRANTESCAST@minedu.edu.pe', 'BARRANTES                          ', 'CASTAÑEDA                          ', 'JULIA VANESSA                 ', '0702183', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 16796255, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16796255.pdf'),
(576, '40730241', '932239808', 'MSBJ2601@GMAIL.COM', 'MARTHASONIA.BERRUJIME@minedu.edu.pe', 'BERRU                              ', 'JIMENEZ                            ', 'MARTHA SONIA                  ', '1723808', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40730241, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40730241.pdf'),
(577, '45609378', '964379009', 'socivive@hotmail.com', 'NATALIALOREN.BURGADELG@minedu.edu.pe', 'BURGA                              ', 'DELGADO                            ', 'NATALIA LORENA                ', '0345199', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45609378, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45609378.pdf'),
(578, '46217267', '915340438', 'silvanita_785@hotmail.com', 'SILVANAMIREL.CHAVESTACUST@minedu.edu.pe', 'CHAVESTA                           ', 'CUSTODIO                           ', 'SILVANA MIRELLA               ', '0345314', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 46217267, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46217267.pdf'),
(579, '40761894', '920100345', 'GUEVARALILIANA62@GMAIL.COM', 'LILIANAYSABE.GUEVARAAREV@minedu.edu.pe', 'GUEVARA                            ', 'AREVALO                            ', 'LILIANA YSABEL                ', '0672493', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 40761894, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40761894.pdf'),
(580, '16678229', '979202123', 'romygohu@gmail.com', 'ROSMERYMARIB.GUZMANCORO@minedu.edu.pe', 'GUZMAN                             ', 'CORONADO                           ', 'ROSMERY MARIBEL               ', '1158518', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 16678229, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16678229.pdf'),
(581, '16664522', '979401446', 'r_huacchillo@hotmail.com', 'ROBERTO.HUACCHILLOSANC@minedu.edu.pe', 'HUACCHILLO                         ', 'SANCHO                             ', 'ROBERTO                       ', '0456541', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 16664522, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16664522.pdf'),
(582, '41422166', '978419263', 'floli_3@hotmail.com', 'FLORDE.JARAOLIV@minedu.edu.pe', 'JARA                               ', 'OLIVA                              ', 'FLOR DE MARIA                 ', '1225200', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 41422166, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41422166.pdf'),
(583, '41373274', '927025894', 'ruji_2@hotmail.com', 'RUTHAMPAR.LEYVAESPI@minedu.edu.pe', 'LEYVA                              ', 'ESPINOZA                           ', 'RUTH AMPARO                   ', '0446005', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 41373274, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41373274.pdf'),
(584, '43841831', '979262038', 'ysikdlpilar_16@hotmail.com', 'JESSICADEL.PEREZMONT@minedu.edu.pe', 'PEREZ                              ', 'MONTAÑO                            ', 'JESSICA DEL PILAR             ', '0484865', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43841831, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43841831.pdf'),
(585, '46543330', '918071785', 'usalazarsotelo@gmail.com', 'URSULABRILL.SALAZARSOTE@minedu.edu.pe', 'SALAZAR                            ', 'SOTELO                             ', 'URSULA BRILLIT                ', '0345389', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 46543330, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46543330.pdf'),
(586, '40261343', '948017879', 'mijojamis@gmail.com', 'MIRIAMSABIN.URQUIZAMOLO@minedu.edu.pe', 'URQUIZA                            ', 'MOLOCHO                            ', 'MIRIAM SABINA                 ', '0456228', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40261343, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40261343.pdf'),
(587, '43976320', '965156229', 'denisse27@gmail.com', 'GABRIELADENIS.VASQUEZBERE@minedu.edu.pe', 'VASQUEZ                            ', 'BERECHE                            ', 'GABRIELA DENISSE              ', '0345025', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 43976320, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43976320.pdf'),
(588, '43926201', '983924906', 'pezar_13@hotmail.com', 'PEDROPABLO.ZAMORARAMO@minedu.edu.pe', 'ZAMORA                             ', 'RAMOS                              ', 'PEDRO PABLO                   ', '0211763', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43926201, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43926201.pdf'),
(589, '46774574', '992923316', 'analii.mz-.-5@hotmail.com', 'LIBIAANALY.ZEVALLOSGALL@minedu.edu.pe', 'ZEVALLOS                           ', 'GALLO                              ', 'LIBIA ANALY                   ', '0619627', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 46774574, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46774574.pdf'),
(590, '42751633', '943210135', 'MERY.ARANDAC@GMAIL.COM', 'MERYMAGDA.ARANDACLEM@minedu.edu.pe', 'ARANDA                             ', 'CLEMENTE                           ', 'MERY MAGDALENA                ', '1401421', '13', 'Proceso', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 42751633, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42751633.pdf'),
(591, '40475459', '953502727', 'marlen_mar4@hotmail.com', 'MARLENMARGA.AYALARODR@minedu.edu.pe', 'AYALA                              ', 'RODRIGUEZ                          ', 'MARLEN MARGARITA              ', '1431493', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 40475459, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40475459.pdf'),
(592, '41553821', '923591156', 'MONICABLASSUDARIO@GMAIL.COM', 'MONICA.BLASSUDA@minedu.edu.pe', 'BLAS                               ', 'SUDARIO                            ', 'MONICA                        ', '1494152', '13', 'Proceso', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41553821, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41553821.pdf'),
(593, '43242207', '946859194', 'doris_carrasco_@hotmail.com', 'DORISCRIST.CARRASCOALCA@minedu.edu.pe', 'CARRASCO                           ', 'ALCANTARA DE AMAYA                 ', 'DORIS CRISTINA                ', '1431477', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 43242207, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43242207.pdf'),
(594, '70293474', '920408263', 'yosiccarrera3@gmail.com', 'YOSELINCECIB.CARRERAQUIR@minedu.edu.pe', 'CARRERA                            ', 'QUIROZ                             ', 'YOSELIN CECIBEL               ', '1550326', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70293474, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70293474.pdf'),
(595, '42706105', '917172419', 'julycastron@gmail.com', 'FLORAGIULL.CASTRONIMA@minedu.edu.pe', 'CASTRO                             ', 'NIMA                               ', 'FLORA GIULLIANA               ', '1494087', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 42706105, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42706105.pdf'),
(596, '70174162', '930997719', 'JENNYFERPERUEDU20@GMAIL.COM', 'JENNYFERGABRI.CONDECALD@minedu.edu.pe', 'CONDE                              ', 'CALDERON                           ', 'JENNYFER GABRIELA             ', '1427194', '13', 'Proceso', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70174162, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70174162.pdf'),
(597, '19332333', '990237725', 'JACKELINEDELPILARCUBAS@GMAIL.COM', 'JAKELINEDEL.CUBASMONT@minedu.edu.pe', 'CUBAS                              ', 'MONTENEGRO                         ', 'JAKELINE DEL PILAR            ', '1167857', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 19332333, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '19332333.pdf'),
(598, '70278680', '959775390', 'dominguezvillanuevarosita@gmail.com', 'MARYROSIT.DOMINGUEZVILL@minedu.edu.pe', 'DOMINGUEZ                          ', 'VILLANUEVA                         ', 'MARY ROSITA                   ', '1494178', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70278680, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70278680.pdf'),
(599, '43658503', '942924615', 'MARBELFP1986@GMAIL.COM', 'DIANAMARIB.FRANCOPOLO@minedu.edu.pe', 'FRANCO                             ', 'POLO                               ', 'DIANA MARIBEL                 ', '0475616', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43658503, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43658503.pdf'),
(600, '40908886', '962452304', 'evelyng167@hotmail.com', 'JESSICALUZ.GARAYFUEN@minedu.edu.pe', 'GARAY                              ', 'FUENTES                            ', 'JESSICA LUZ                   ', '1690031', '13', 'Proceso', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 40908886, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40908886.pdf'),
(602, '70600422', '919158065', 'maryorihuayaney@gmail.com', 'MARJORILBETZA.HUAYANEYVALV@minedu.edu.pe', 'HUAYANEY                           ', 'VALVERDE                           ', 'MARJORIL BETZABE              ', '1427301', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70600422, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70600422.pdf'),
(603, '41915201', '963840544', 'orelizmedic@gmail.com', 'VIVIANAOLIVI.LAURACHAV@minedu.edu.pe', 'LAURA                              ', 'CHAVEZ                             ', 'VIVIANA OLIVIA                ', '1654300', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41915201, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41915201.pdf'),
(604, '42376188', '927827336', 'VASTILFINICIAL22@GMAIL.COM', 'VASTILUZ.LAVADOFERN@minedu.edu.pe', 'LAVADO                             ', 'FERNANDEZ                          ', 'VASTI LUZ                     ', '1616051', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42376188, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42376188.pdf'),
(605, '45240108', '947891151', 'CAMILI2618@GMAIL.COM', 'MIRTHALILIA.OLAYAORDI@minedu.edu.pe', 'OLAYA                              ', 'ORDINOLA                           ', 'MIRTHA LILIANA                ', '1464031', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45240108, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45240108.pdf'),
(606, '70156357', '948236315', 'lorenalcantaraobando@gmail.com', 'WENDYLOREN.ALCANTARAOBAN@minedu.edu.pe', 'ALCANTARA                          ', 'OBANDO                             ', 'WENDY LORENA                  ', '1157130', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70156357, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70156357.pdf'),
(607, '70745125', '962883006', 'boybrenda185@gmail.com', 'MARIABREND.BOYPRAD@minedu.edu.pe', 'BOY                                ', 'PRADO                              ', 'MARIA BRENDA                  ', '0442848', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70745125, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70745125.pdf'),
(608, '47047688', '956904467', 'BURBEN29@GMAIL.COM', 'KATERINEJOHAN.BURGABEND@minedu.edu.pe', 'BURGA                              ', 'BENDEZU                            ', 'KATERINE JOHANA               ', '1156934', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 47047688, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47047688.pdf'),
(609, '74609493', '933774426', 'LAURI.PAME20@GMAIL.COM', 'LAURAPAMEL.CARBAJALARAU@minedu.edu.pe', 'CARBAJAL                           ', 'ARAUJO                             ', 'LAURA PAMELA                  ', '1156892', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74609493, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74609493.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(610, '41362971', '939261921', 'karintuamiga@hotmail.com', 'KARINANTON.CONTRERASBAYL@minedu.edu.pe', 'CONTRERAS                          ', 'BAYLON                             ', 'KARIN ANTONIETA               ', '1156702', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41362971, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41362971.pdf'),
(611, '75226392', '901773776', 'JOHANNAVIVANCOC@GMAIL.COM', 'KERLYJOHAN.CORNETEROVIVA@minedu.edu.pe', 'CORNETERO                          ', 'VIVANCO                            ', 'KERLY JOHANNA                 ', '0574699', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 75226392, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75226392.pdf'),
(612, '73946591', '926333577', 'KATY23CRUZ@GMAIL.COM', 'YESICAKATTE.CRUZBRAV@minedu.edu.pe', 'CRUZ                               ', 'BRAVO                              ', 'YESICA KATTERINE              ', '1375195', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73946591, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73946591.pdf'),
(613, '73234612', '995020051', 'SUGEYFERNANDEZG7@GMAIL.COM', 'INGRIDSUGEY.FERNANDEZGARC@minedu.edu.pe', 'FERNANDEZ                          ', 'GARCIA DE HURTADO                  ', 'INGRID SUGEY                  ', '1541937', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 73234612, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73234612.pdf'),
(614, '41933051', '963115309', 'PATRICIAFIGUEROA883@GMAIL.COM', 'ANAPATRI.FIGUEROAGUAR@minedu.edu.pe', 'FIGUEROA                           ', 'GUARDAMINO                         ', 'ANA PATRICIA                  ', '1685726', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41933051, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41933051.pdf'),
(616, '74121876', '943901251', 'YENIFERMONTOYA20@GMAIL.COM', 'YENIFERKATER.MONTOYAQUIS@minedu.edu.pe', 'MONTOYA                            ', 'QUISPE                             ', 'YENIFER KATERIN               ', '0442848', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74121876, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74121876.pdf'),
(617, '40697421', '988298009', 'ruthyanina36@gmail.com', 'RUTHYANIN.MORGADOPÉRE@minedu.edu.pe', 'MORGADO                            ', 'PÉREZ                              ', 'RUTH YANINA                   ', '1373505', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 40697421, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40697421.pdf'),
(618, '72492825', '941185088', 'brendamurilloacosta19@gmail.com', 'brenda.murilloa@minedu.edu.pe', 'MURILLO                            ', 'ACOSTA                             ', 'BRENDA                        ', '1523836', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 72492825, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72492825.pdf'),
(619, '41324793', '954822118', 'NANCYPACHECO5@HOTMAIL.COM', 'NANCYLOURD.PACHECOMEND@minedu.edu.pe', 'PACHECO                            ', 'MENDOZA                            ', 'NANCY LOURDES                 ', '0218495', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41324793, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41324793.pdf'),
(620, '76863394', '924950391', 'beky_1230_95@hotmail.com', 'REBECALISET.TERANSALA@minedu.edu.pe', 'TERAN                              ', 'SALAZAR                            ', 'REBECA LISETTE                ', '0344259', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 76863394, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76863394.pdf'),
(621, '75080256', '912137598', 'NATYZE.1201@GMAIL.COM', 'NATALYMIREL.TUYUMEZEGA@minedu.edu.pe', 'TUYUME                             ', 'ZEGARRA                            ', 'NATALY MIRELLA                ', '0574723', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75080256, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75080256.pdf'),
(622, '18162991', '974074857', 'sajavema8@hotmail.com', 'SANDRAJACQU.VEGAMAGA@minedu.edu.pe', 'VEGA                               ', 'MAGAN                              ', 'SANDRA JACQUELIN              ', '1603273', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18162991, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18162991.pdf'),
(623, '44310605', '981526133', 'SUVIJI.PILAR@HOTMAIL.COM', 'PILARNORES.ALCANTARAROJA@minedu.edu.pe', 'ALCANTARA                          ', 'ROJAS                              ', 'PILAR NORES                   ', '0621953', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44310605, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44310605.pdf'),
(624, '44882864', '933905861', 'marlenimarisol.1988@gmail.com', 'MARLENIMARIS.ALVAESPI@minedu.edu.pe', 'ALVA                               ', 'ESPINALES                          ', 'MARLENI MARISOL               ', '0213561', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44882864, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44882864.pdf'),
(625, '41578600', '957854169', 'deysi_34blas@hotmail.com', 'DEYSIJHOAN.BLASREYE@minedu.edu.pe', 'BLAS                               ', 'REYES                              ', 'DEYSI JHOANA                  ', '0213678', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41578600, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41578600.pdf'),
(626, '42322745', '943772996', 'pleyad63@hotmail.com', 'ANALUCY.CHIROQUEHERN@minedu.edu.pe', 'CHIROQUE                           ', 'HERNANDEZ                          ', 'ANA LUCY                      ', '0213553', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42322745, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42322745.pdf'),
(627, '44911203', '945273382', 'rossmary_126@hotmail.com', 'CYNTHIAROSSM.FERNANDEZFERN@minedu.edu.pe', 'FERNANDEZ                          ', 'FERNANDEZ                          ', 'CYNTHIA ROSSMARY              ', '0559591', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44911203, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44911203.pdf'),
(628, '41598216', '967465336', 'BIVIAEMPERATRIZ@GMAIL.COM', 'BIVIAEMPER.GERMANARGO@minedu.edu.pe', 'GERMAN                             ', 'ARGOMEDO                           ', 'BIVIA EMPERATRIZ              ', '0213561', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41598216, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41598216.pdf'),
(629, '42191591', '993893963', 'cega_2728@hotmail.com', 'carmen.gonzaleza@minedu.edu.pe', 'GONZALEZ                           ', 'AGUIRRE                            ', 'CARMEN EDITH                  ', '0475285', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42191591, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42191591.pdf'),
(630, '42972326', '916019803', 'deisy_mego@hotmail.com', 'DEISYVIOLE.MEGOGALL@minedu.edu.pe', 'MEGO                               ', 'GALLARDO                           ', 'DEISY VIOLETA                 ', '0509471', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 42972326, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42972326.pdf'),
(631, '42667695', '961744919', 'jmendozafarro@gmail.com', 'JENNYMAGAL.MENDOZAFARR@minedu.edu.pe', 'MENDOZA                            ', 'FARRO                              ', 'JENNY MAGALI                  ', '0475285', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42667695, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42667695.pdf'),
(632, '42962490', '944057689', 'luciaro_0127@hotmail.com', 'LUCIAISABE.RODRIGUEZCONC@minedu.edu.pe', 'RODRIGUEZ                          ', 'CONCHA                             ', 'LUCIA ISABEL                  ', '0213918', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42962490, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42962490.pdf'),
(633, '77074184', '923530078', 'LEZSHAR1@GMAIL.COM', 'LESLYSHARO.RUIZROJA@minedu.edu.pe', 'RUIZ                               ', 'ROJAS                              ', 'LESLY SHAROL                  ', '0560532', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77074184, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77074184.pdf'),
(634, '41140992', '968919050', 'elizaenz0801@hotmail.com', 'ELIZABETHJHULY.SAENZDEL@minedu.edu.pe', 'SAENZ                              ', 'DEL PINO DE SALDARRIAGA            ', 'ELIZABETH JHULY               ', '0213389', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41140992, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41140992.pdf'),
(635, '42848214', '964881063', 'yaneth_v.a_2012@hotmail.com', 'YANETHYULIA.VALVERDEAVIL@minedu.edu.pe', 'VALVERDE                           ', 'AVILA                              ', 'YANETH YULIANA                ', '0560250', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 49, 'Logrado', 1, 42848214, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42848214.pdf'),
(636, '42456235', '944293079', 'miss_leidydiana@hotmail.com', 'LEIDYDIANA.VASQUEZRAMI@minedu.edu.pe', 'VASQUEZ                            ', 'RAMIREZ                            ', 'LEIDY DIANA                   ', '0213736', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 42456235, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42456235.pdf'),
(637, '44521877', '945962884', 'lisbeth_10_5@hotmail.com', 'ERIKALISBE.VERGARAPALO@minedu.edu.pe', 'VERGARA                            ', 'PALOMINO                           ', 'ERIKA LISBETH                 ', '0214056', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 53, 'Destacado', 1, 44521877, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44521877.pdf'),
(638, '41383550', '956527565', 'rosal-13@hotmail.com', 'ROSALILIA.VILLACORTAAVAL@minedu.edu.pe', 'VILLACORTA                         ', 'AVALOS                             ', 'ROSA LILIA                    ', '0213900', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 41383550, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41383550.pdf'),
(639, '43965223', '970172321', 'karenac02@hotmail.com', 'KAREN.ARROYOCAST@minedu.edu.pe', 'ARROYO                             ', 'CASTILLO                           ', 'KAREN                         ', '0673798', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43965223, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43965223.pdf'),
(640, '02784406', '969654496', 'm-boza2012@hotmail.com', 'MARTINGERAR.BOZARAMO@minedu.edu.pe', 'BOZA                               ', 'RAMOS                              ', 'MARTIN GERARDO                ', '0467654', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 2784406, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02784406.pdf'),
(641, '42504101', '989748517', 'ginita84341984@gmail.com', 'GINAELIZA.BRIONESQUIR@minedu.edu.pe', 'BRIONES                            ', 'QUIROZ                             ', 'GINA ELIZABETH                ', '0698456', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42504101, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42504101.pdf'),
(642, '40429008', '959295816', 'reflectivosdelnorte@outlook.com', 'RUBENMAURI.CABANILLASCORT@minedu.edu.pe', 'CABANILLAS                         ', 'CORTEZ                             ', 'RUBEN MAURICIO                ', '0351791', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40429008, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40429008.pdf'),
(644, '41977356', '962888130', 'abimael143@hotmail.com', 'LUZMARIB.CHIPANAMEND@minedu.edu.pe', 'CHIPANA                            ', 'MENDOZA                            ', 'LUZ MARIBEL                   ', '0351833', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41977356, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41977356.pdf'),
(645, '27990503', '935908225', 'minelydelpilar@hotmail.com', 'MARIADEL.HERNANDEZILIZ@minedu.edu.pe', 'HERNANDEZ                          ', 'ILIZARBE                           ', 'MARIA DEL CARMEN              ', '0351593', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 27990503, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '27990503.pdf'),
(646, '40681956', '994496680', 'JENNYLR20@GMAIL.COM', 'JENNYJUDIT.LEVANOREYE@minedu.edu.pe', 'LEVANO                             ', 'REYES                              ', 'JENNY JUDITH                  ', '0343368', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40681956, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40681956.pdf'),
(647, '41623816', '994005406/974794651', 'LEO8094@HOTMAIL.COM', 'LEONCIOASUNC.MERINOPAST@minedu.edu.pe', 'MERINO                             ', 'PASTOR                             ', 'LEONCIO ASUNCION              ', '0351759', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41623816, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41623816.pdf'),
(648, '42486848', '954841376', 'sanuto_38@hotmail.com', 'SANTOSALADI.NUÑEZTORR@minedu.edu.pe', 'NUÑEZ                              ', 'TORRES                             ', 'SANTOS ALADINO                ', '0351684', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42486848, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42486848.pdf'),
(649, '43693309', '948282096', 'celeyco284@hotmail.com', 'ROXANADEL.PACHERRESCHER@minedu.edu.pe', 'PACHERRES                          ', 'CHERO DE LEYSEQUIA                 ', 'ROXANA DEL PILAR              ', '0351775', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43693309, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43693309.pdf'),
(650, '16711502', '900129233', 'BLANQUITA310713@GMAIL.COM', 'EDITHA.PALOMINOCRUZ@minedu.edu.pe', 'PALOMINO                           ', 'CRUZ                               ', 'EDITHA                        ', '0351627', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16711502, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16711502.pdf'),
(651, '77172537', '921205979', 'KMPEREZS.58@GMAIL.COM', 'KERLYMIREL.PEREZSUYO@minedu.edu.pe', 'PEREZ                              ', 'SUYON                              ', 'KERLY MIRELLA                 ', '0351668', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 77172537, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77172537.pdf'),
(652, '80213018', '961066683', 'guapa_1415@hotmail.com', 'YOVANADEL.PINTADOCHER@minedu.edu.pe', 'PINTADO                            ', 'CHERO                              ', 'YOVANA DEL ROSARIO            ', '0351668', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 80213018, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80213018.pdf'),
(653, '16669890', '955476928', 'lucy12_peru@hotmail.com', 'LUCELINAROSA.TORRESHERN@minedu.edu.pe', 'TORRES                             ', 'HERNANDEZ                          ', 'LUCELINA ROSA                 ', '0351650', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16669890, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16669890.pdf'),
(654, '29531104', '980730423', 'angelica_18_1000@hotmail.com', 'ANGELICA.TURPOQUIS@minedu.edu.pe', 'TURPO                              ', 'QUISPE                             ', 'ANGELICA                      ', '0351833', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 29531104, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29531104.pdf'),
(655, '44732464', '990740173', 'IVETT20041@HOTMAIL.COM', 'YANINAIVETT.BAUTISTABARR@minedu.edu.pe', 'BAUTISTA                           ', 'BARRIOS                            ', 'YANINA IVETTE                 ', '0353300', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44732464, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44732464.pdf'),
(656, '40631341', '956520633', 'lisbetk28@hotmail.com', 'JULLIANAPATRI.CHISCULALBO@minedu.edu.pe', 'CHISCUL                            ', 'ALBORNOZ                           ', 'JULLIANA PATRICIA             ', '0560854', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 40631341, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40631341.pdf'),
(657, '72678378', '933665018', 'PISCIS181989@GMAIL.COM', 'MIRIAMJANET.CHUCCHUCÁNCULQ@minedu.edu.pe', 'CHUCCHUCÁN                         ', 'CULQUI                             ', 'MIRIAM JANETH                 ', '0620922', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72678378, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72678378.pdf'),
(658, '41928390', '958889489', 'mercedesdavid@outlook.es', 'MERCEDESANGEL.FARFANMORI@minedu.edu.pe', 'FARFAN                             ', 'MORI                               ', 'MERCEDES ANGELICA             ', '0620922', '13', 'Proceso', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41928390, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41928390.pdf'),
(659, '40636161', '926031700', 'dayisxiomi2006@gmail.com', 'JUANAELIZA.FIESTASMART@minedu.edu.pe', 'FIESTAS                            ', 'MARTINEZ                           ', 'JUANA ELIZABETH               ', '0353300', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40636161, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40636161.pdf'),
(661, '30835987', '917723353', 'rulitasil20@gmail.com', 'SILVIALEONO.MAMANIMOSC@minedu.edu.pe', 'MAMANI                             ', 'MOSCOSO                            ', 'SILVIA LEONOR                 ', '0560854', '', '', 'Borrador', '', '', 'Calificado', 56, 'Destacado', 1, 30835987, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '30835987.pdf'),
(664, '46791756', '957978033', 'MARIAPINILLOS1131@GMAIL.COM', 'MARIADEL.PINILLOSGUEV@minedu.edu.pe', 'PINILLOS                           ', 'GUEVARA                            ', 'MARIA DEL MILAGROS            ', '0508150', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 46791756, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46791756.pdf'),
(665, '43901072', '927543118', 'jhonkelvis2016@hotmail.com', 'YONY.POMACOPA@minedu.edu.pe', 'POMA                               ', 'COPAJA                             ', 'YONY                          ', '0351882', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 43901072, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43901072.pdf'),
(666, '43054652', '944821276', 'leidi-qh@hotmail.com', 'EDITHLADY.QUISPEHERN@minedu.edu.pe', 'QUISPE                             ', 'HERNANDEZ                          ', 'EDITH LADY                    ', '0353748', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43054652, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43054652.pdf'),
(667, '44075229', '962493880', 'mnrr_31@hotmail.com', 'MILAGROSNATAL.RONDOYRIVA@minedu.edu.pe', 'RONDOY                             ', 'RIVAS                              ', 'MILAGROS NATALI               ', '0353185', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44075229, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44075229.pdf'),
(668, '40173672', '990023108', 'joby_ruiz@hotmail.com', 'MARIAJOBA.RUIZDAVI@minedu.edu.pe', 'RUIZ                               ', 'DAVILA                             ', 'MARIA JOBA                    ', '0571240', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40173672, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40173672.pdf'),
(669, '48232157', '925346682', 'SALESFLORESK@GMAIL.COM', 'KAROLINALIZBE.SALÉSFLOR@minedu.edu.pe', 'SALÉS                              ', 'FLORES                             ', 'KAROLINA LIZBETH              ', '0353185', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 48232157, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48232157.pdf'),
(670, '16752640', '920667345', 'KAREMROSSIO2000@GMAIL.COM', 'KAREMROSSI.VASQUEZLLAQ@minedu.edu.pe', 'VASQUEZ                            ', 'LLAQUE                             ', 'KAREM ROSSIO                  ', '0353276', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16752640, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16752640.pdf'),
(671, '42858506', '923492678', 'LIZBETHLAURA.Z.12@GMAIL.COM', 'LIZBETHJACQU.ZUÑIGALAUR@minedu.edu.pe', 'ZUÑIGA                             ', 'LAURA                              ', 'LIZBETH JACQUELINE            ', '0620740', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42858506, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42858506.pdf'),
(672, '16773692', '949896067', 'vicky31102010@gmail.com', 'VICKYMARTH.AGUEROCOLU@minedu.edu.pe', 'AGUERO                             ', 'COLUNCHE                           ', 'VICKY MARTHA                  ', '1643600', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 16773692, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16773692.pdf'),
(673, '43411750', '981714820', 'MARI.BACA@GMAIL.COM', 'MARIAANGEL.BACALIMO@minedu.edu.pe', 'BACA                               ', 'LIMO                               ', 'MARIA ANGELICA                ', '1643550', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43411750, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43411750.pdf'),
(674, '40784652', '925411023', 'denisebarragansaavedra@gmail.com', 'DENISJHOAN.BARRAGANSAAV@minedu.edu.pe', 'BARRAGAN                           ', 'SAAVEDRA                           ', 'DENIS JHOANA                  ', '1557511', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40784652, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40784652.pdf'),
(675, '40997127', '996655045', 'craccy2003@hotmail.com', 'ANNEMARIE.DELA@minedu.edu.pe', 'DE LA CRUZ                         ', 'CASTILLO                           ', 'ANNE MARIE                    ', '1643584', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 52, 'Logrado', 1, 40997127, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40997127.pdf'),
(676, '42294969', '982496478', 'DELACRUZTABOADAK@GMAIL.COM', 'JHOGANAKARIN.DELA@minedu.edu.pe', 'DE LA CRUZ                         ', 'TABOADA                            ', 'JHOGANA KARINA                ', '1673755', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 42294969, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42294969.pdf'),
(677, '17635383', '990821142', 'FLORECHEVERRIAAR@GMAIL.COM', 'FLORDE.ECHEVERRIAARBO@minedu.edu.pe', 'ECHEVERRIA                         ', 'ARBOLEDA                           ', 'FLOR DE MARIA                 ', '1557545', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 17635383, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17635383.pdf'),
(678, '43619741', '963949266', 'pfarfannegron@gmail.com', 'PEDROAUREL.FARFANNEGR@minedu.edu.pe', 'FARFAN                             ', 'NEGRON                             ', 'PEDRO AURELIO                 ', '1674035', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43619741, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43619741.pdf'),
(680, '41228001', '922130578', 'remito_2015@hotmail.com', 'ROSAEDELM.MARTÍNEZOTIN@minedu.edu.pe', 'MARTÍNEZ                           ', 'OTINIANO                           ', 'ROSA EDELMIRA                 ', '1673821', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41228001, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41228001.pdf'),
(681, '40217558', '950964734', 'TATIANA.M.REINA25041979@GMAIL.COM', 'TATIANA.MENDOZAREIN@minedu.edu.pe', 'MENDOZA                            ', 'REINA                              ', 'TATIANA                       ', '1469436', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40217558, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40217558.pdf'),
(682, '43581888', '920519460', 'deenith11@hotmail.com', 'DELLYENITH.NIÑOANIC@minedu.edu.pe', 'NIÑO                               ', 'ANICETO                            ', 'DELLY ENITH                   ', '1673854', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43581888, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43581888.pdf'),
(683, '16763323', '957640742', 'mios800@hotmail.com', 'MARIAIVONN.ORTEGASUAR@minedu.edu.pe', 'ORTEGA                             ', 'SUAREZ                             ', 'MARIA IVONNE                  ', '0669903', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16763323, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16763323.pdf'),
(684, '16749457', '979007305', 'quiroz74_5@hotmail.com', 'YSIS.RODASQUIR@minedu.edu.pe', 'RODAS                              ', 'QUIROZ                             ', 'YSIS                          ', '0619973', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16749457, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16749457.pdf'),
(685, '33952112', '972989266', 'omia.sac@gmail.com', 'RITAMERIS.RODRIGUEZCALD@minedu.edu.pe', 'RODRIGUEZ                          ', 'CALDERON                           ', 'RITA MERIS                    ', '1557545', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 33952112, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '33952112.pdf'),
(686, '40025208', '966940303', 'MARISOL221978@GMAIL.COM', 'MARIASOLED.SILVACAST@minedu.edu.pe', 'SILVA                              ', 'CASTILLO                           ', 'MARIA SOLEDAD                 ', '0669903', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40025208, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40025208.pdf'),
(687, '42784347', '951479302', 'mireyagabi80@gmail.com', 'GLORIAMIREY.SUAREZLEON@minedu.edu.pe', 'SUAREZ                             ', 'LEON                               ', 'GLORIA MIREYA                 ', '0555631', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42784347, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42784347.pdf'),
(688, '16750300', '983400061', 'SONIAV_21@HOTMAIL.COM', 'SONIAYOVAN.VENTURAMESI@minedu.edu.pe', 'VENTURA                            ', 'MESIA                              ', 'SONIA YOVANI                  ', '1557610', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16750300, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16750300.pdf'),
(692, '74133372', '967624228', 'BENITESTURPOK@GMAIL.COM', 'KATIUSCA.BENITESTURP@minedu.edu.pe', 'BENITES                            ', 'TURPO                              ', 'KATIUSCA                      ', '1138213', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 74133372, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74133372.pdf'),
(693, '44998062', '995491089', 'leidycalle4@gmail.com', 'LEIDYMARIL.CALLEAGUI@minedu.edu.pe', 'CALLE                              ', 'AGUILAR                            ', 'LEIDY MARILYN                 ', '1554005', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44998062, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44998062.pdf'),
(694, '48052173', '978432900', 'flower.1512@hotmail.com', 'FLORDE.CÁRDENASNARR@minedu.edu.pe', 'CÁRDENAS                           ', 'NARRO                              ', 'FLOR DE MARÍA                 ', '0734608', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 48052173, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48052173.pdf'),
(695, '47998975', '964446370', 'DILANLOVE18@GMAIL.COM', 'ROCIOELIZA.CASAHUAMANPINE@minedu.edu.pe', 'CASAHUAMAN                         ', 'PINEDO                             ', 'ROCIO ELIZABETH               ', '1427400', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47998975, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47998975.pdf'),
(696, '48311590', '952183594', 'CASTROMILAGROS.1994@GMAIL.COM', 'MILAGROSVERON.CASTROPUMA@minedu.edu.pe', 'CASTRO                             ', 'PUMA                               ', 'MILAGROS VERONICA             ', '1427228', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 48311590, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48311590.pdf'),
(697, '00401762', '998474236', 'lusmilaemiliana@hotmail.com', 'LUSMILAEMILI.CHAMBEAQUI@minedu.edu.pe', 'CHAMBE                             ', 'AQUINO                             ', 'LUSMILA EMILIANA              ', '1426436', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 401762, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00401762.pdf'),
(698, '45217102', '932427385', 'ro_sana@hotmail.com', 'SILVIAROSAN.CHECLLOTAMA@minedu.edu.pe', 'CHECLLO                            ', 'TAMATA                             ', 'SILVIA ROSANA                 ', '1589555', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45217102, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45217102.pdf'),
(699, '01327345', '974531022', 'poeta.n.n7@gmail.com', 'GLADYSJOSEF.CHOQUEPERE@minedu.edu.pe', 'CHOQUE                             ', 'PEREZ                              ', 'GLADYS JOSEFINA               ', '1431394', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 1327345, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '01327345.pdf'),
(700, '47862495', '936880000', 'merlychunga@hotmail.com', 'MERLYSTEFA.CHUNGAMART@minedu.edu.pe', 'CHUNGA                             ', 'MARTINEZ                           ', 'MERLY STEFANNY                ', '1415579', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47862495, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47862495.pdf'),
(701, '42949602', '912368120', 'IRISPAOLACORNEJOROMAN@GMAIL.COM', 'IRISPAOLA.CORNEJOROMA@minedu.edu.pe', 'CORNEJO                            ', 'ROMAN                              ', 'IRIS PAOLA                    ', '1793074', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42949602, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42949602.pdf'),
(702, '71835676', '933788062', 'INGRIDKATHERINECCH@OUTLOOK.COM', 'INGRIDKATHE.COSTILLACHAC@minedu.edu.pe', 'COSTILLA                           ', 'CHACON                             ', 'INGRID KATHERINE              ', '1414176', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 71835676, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71835676.pdf'),
(703, '18216689', '944489956', 'RELIZA37@GMAIL.COM', 'ROSEMARIEELIZA.ESPEJOMEZA@minedu.edu.pe', 'ESPEJO                             ', 'MEZA                               ', 'ROSEMARIE ELIZA               ', '1494103', '13', 'Proceso', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 18216689, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18216689.pdf'),
(706, '47931067', '926536990', 'karolay-2008@hotmail.com', 'KAROLAYKATIA.MANSILLACOND@minedu.edu.pe', 'MANSILLA                           ', 'CONDORI                            ', 'KAROLAY KATIA                 ', '0630814', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47931067, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47931067.pdf'),
(707, '18212525', '949900000', 'MELISSA.MORILLAS@GMAIL.COM', 'MELISSAVIVIA.MORILLASALDA@minedu.edu.pe', 'MORILLAS                           ', 'ALDAVE DE MURILLO                  ', 'MELISSA VIVIANA               ', '1427269', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 18212525, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18212525.pdf'),
(712, '46534542', '979022397', 'vanessa_arbulu1@hotmail.com', 'claudia.arbulup@minedu.edu.pe', 'ARBULU                             ', 'PERALTA                            ', 'CLAUDIA VANESSA               ', '1571736', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46534542, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46534542.pdf'),
(713, '44288122', '975187974', 'MAESTRA_INICIAL@HOTMAIL.COM', 'FEDELICIAELIZA.CALDERONMART@minedu.edu.pe', 'CALDERON                           ', 'MARTINEZ                           ', 'FEDELICIA ELIZABETH           ', '0619882', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44288122, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44288122.pdf'),
(714, '44402324', '982216174', 'ELITACUMI@GMAIL.COM', 'ELIZABETH.CARHUAJULCACUEV@minedu.edu.pe', 'CARHUAJULCA                        ', 'CUEVA                              ', 'ELIZABETH                     ', '1673698', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44402324, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44402324.pdf'),
(715, '44173693', '931929900', 'melissacastrocisneros@gmail.com', 'MELISSAPAMEL.CASTROCISN@minedu.edu.pe', 'CASTRO                             ', 'CISNEROS                           ', 'MELISSA PAMELA                ', '1158146', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44173693, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44173693.pdf'),
(716, '46545793', '993277087', 'hanna_125@hotmail.com', 'ALEXANDRAMARIE.ELERAGARC@minedu.edu.pe', 'ELERA                              ', 'GARCIA                             ', 'ALEXANDRA MARIETH             ', '0523910', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46545793, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46545793.pdf'),
(717, '46832690', '912065662', 'fiorella_4_7@hotmail.com', 'ana.espinozam@minedu.edu.pe', 'ESPINOZA                           ', 'MORALES                            ', 'ANA FIORELLA                  ', '1557560', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 46832690, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46832690.pdf'),
(718, '45824219', '984051542', 'karina16_azul@hotmail.com', 'KARINAELIZA.FERNANDEZRODR@minedu.edu.pe', 'FERNANDEZ                          ', 'RODRIGUEZ                          ', 'KARINA ELIZABETH              ', '1595164', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45824219, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45824219.pdf'),
(719, '44155597', '951758824', 'karylz2017@gmail.com', 'KARINAELIZA.LAZARODELG@minedu.edu.pe', 'LAZARO                             ', 'DELGADO                            ', 'KARINA ELIZABETH              ', '1706993', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44155597, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44155597.pdf'),
(721, '44976882', '969826709', 'dalis_477@hotmail.com', 'DALYSVANES.NECIOSUPQUES@minedu.edu.pe', 'NECIOSUP                           ', 'QUESQUEN                           ', 'DALYS VANESSA                 ', '1706944', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44976882, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44976882.pdf'),
(722, '45075618', '955654662', 'ariamerol3@gmail.com', 'LORENAMARIA.PEREZLEON@minedu.edu.pe', 'PEREZ                              ', 'LEON                               ', 'LORENA MARIA                  ', '1557669', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45075618, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45075618.pdf'),
(723, '46901611', '985626318', 'LILIANAPORTOCARREROARAUJO@GMAIL.COM', 'LILIANAKARIN.PORTOCARREROARAU@minedu.edu.pe', 'PORTOCARRERO                       ', 'ARAUJO                             ', 'LILIANA KARINA                ', '1595313', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46901611, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46901611.pdf'),
(724, '46802116', '979582232', 'julissa28qr@gmail.com', 'KARLAJULIS.QUEVEDORIOJ@minedu.edu.pe', 'QUEVEDO                            ', 'RIOJAS                             ', 'KARLA JULISSA                 ', '1557545', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46802116, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46802116.pdf'),
(725, '44321934', '934033902', 'ANITAFARRO.27@GMAIL.COM', 'ana.rodriguezfa@minedu.edu.pe', 'RODRIGUEZ                          ', 'FARRO                              ', 'ANA ROSA                      ', '0669903', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44321934, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44321934.pdf'),
(726, '46422214', '960401385', 'KARIELI23105@GMAIL.COM', 'KARINAELIZA.SANCHEZGELA@minedu.edu.pe', 'SANCHEZ                            ', 'GELACIO                            ', 'KARINA ELIZABETH              ', '1557669', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46422214, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46422214.pdf'),
(727, '45591399', '943690926', 'cinthya2410@outlook.com', 'cinthya.saonab@minedu.edu.pe', 'SAONA                              ', 'BARRIENTES                         ', 'CINTHYA JULIANA               ', '0344267', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45591399, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45591399.pdf'),
(728, '43651242', '965913030', 'FANYUGAZ@GMAIL.COM', 'FANYDEL.TORRESUGAZ@minedu.edu.pe', 'TORRES                             ', 'UGAZ                               ', 'FANY DEL CARMEN               ', '1469386', '', '', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43651242, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43651242.pdf'),
(730, '19248112', '966838616', 'wachava18@gmail.com', 'DAISYLILIA.CARBAJALCORR@minedu.edu.pe', 'CARBAJAL', 'CORRALES', 'DAISY LILIANA', '1459197', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 19248112, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '19248112.pdf'),
(732, '09446190', '925318236', 'jconversiont@gmail.com', 'JESUS.CONVERSIONTRUJ@minedu.edu.pe', 'CONVERSION                         ', 'TRUJILLO                           ', 'JESUS                         ', '1644582', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 9446190, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09446190.pdf'),
(734, '42109051', '973414276', 'seg_man83@hotmail.com', 'SEGUNDOMANUE.FAICHINJULC@minedu.edu.pe', 'FAICHIN                            ', 'JULCAMORO                          ', 'SEGUNDO MANUEL                ', '1700517', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42109051, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42109051.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(735, '40585210', '950005770', 'yessiaredo@hotmail.com', 'YESSICAJUDIT.GONZALESARED@minedu.edu.pe', 'GONZALES                           ', 'AREDO                              ', 'YESSICA JUDITH                ', '0577866', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40585210, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40585210.pdf'),
(737, '45297704', '995312254', 'yessica.merino.28@gmail.com', 'YESSICA.MERINOLLOC@minedu.edu.pe', 'MERINO                             ', 'LLOCLLA                            ', 'YESSICA                       ', '1017508', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45297704, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45297704.pdf'),
(741, '42345400', '995852102', 'vane_2641@hotmail.com', 'VANESSAELIZA.NOMBERACAMP@minedu.edu.pe', 'NOMBERA                            ', 'CAMPOS                             ', 'VANESSA ELIZABETH             ', '0452623', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42345400, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42345400.pdf'),
(742, '48006899', '947138030', 'deelvismre@gmail.com', 'MOISESDEELV.RUIZESPI@minedu.edu.pe', 'RUIZ                               ', 'ESPINOZA                           ', 'MOISES DEELVIS                ', '0611954', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 48006899, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48006899.pdf'),
(743, '48195179', '972578856', 'JUNIORALCIDESRUIZ@GMAIL.COM', 'JUNIORALCID.RUIZRODR@minedu.edu.pe', 'RUIZ                               ', 'RODRIGUEZ                          ', 'JUNIOR ALCIDES DEYNER         ', '0578146', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 48195179, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48195179.pdf'),
(747, '18076926', '942133108', 'mebb_70@hotmail.com', 'MARIAESTHE.BURGOSBACI@minedu.edu.pe', 'BURGOS                             ', 'BACILIO                            ', 'MARIA ESTHER                  ', '1456219', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18076926, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18076926.pdf'),
(750, '44281971', '923799657', 'victor.esquivel.morales@gmail.com', 'VICTOREDUAR.ESQUIVELMORA@minedu.edu.pe', 'ESQUIVEL                           ', 'MORALES                            ', 'VICTOR EDUARDO                ', '0475640', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44281971, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44281971.pdf'),
(751, '17543665', '988264764', 'JCOPTIMUS@GMAIL.COM', 'JUANCARLO.GRANDEZTUES@minedu.edu.pe', 'GRANDEZ                            ', 'TUESTA                             ', 'JUAN CARLOS                   ', '0669622', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 17543665, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17543665.pdf'),
(752, '18104750', '973777241', 'sigifredoherreracruz@hotmail.com', 'SIGIFREDO.HERRERACRUZ@minedu.edu.pe', 'HERRERA                            ', 'CRUZ                               ', 'SIGIFREDO                     ', '0526137', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 18104750, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18104750.pdf'),
(753, '16751675', '951043943', 'victor_javier_2876@hotmail.com', 'VICTORJAVIE.LAURENTEMALU@minedu.edu.pe', 'LAURENTE                           ', 'MALUQUIZ                           ', 'VICTOR JAVIER                 ', '1129972', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 16751675, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16751675.pdf'),
(754, '18138363', '938893606', 'LOURDESCALEPO@HOTMAIL.COM', 'LOURDESCATAL.LESCANOPORT@minedu.edu.pe', 'LESCANO                            ', 'PORTALES                           ', 'LOURDES CATALINA              ', '1211614', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 18138363, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18138363.pdf'),
(755, '17609793', '968296696', 'JOSE.MILLAN.MUSAYON@GMAIL.COM', 'JOSÉMANUE.MILLÁNMUSA@minedu.edu.pe', 'MILLÁN                             ', 'MUSAYÓN                            ', 'JOSÉ MANUEL                   ', '0453035', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 17609793, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17609793.pdf'),
(756, '43087125', '920206217', 'JULYNEY_82@HOTMAIL.COM', 'JULLIANA.NEYRADE@minedu.edu.pe', 'NEYRA                              ', 'DE LA CRUZ                         ', 'JULLIANA                      ', '0675074', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 43087125, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43087125.pdf'),
(757, '16787427', '992794508', 'MJPUICON@GMAIL.COM', 'MARIAJUANA.PUICONLLUE@minedu.edu.pe', 'PUICON                             ', 'LLUEN                              ', 'MARIA JUANA                   ', '1158328', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 16787427, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16787427.pdf'),
(758, '17997868', '948128339', 'GLORITA_LAREDO@HOTMAIL.COM', 'ELVAGLORI.RODRIGUEZAVIL@minedu.edu.pe', 'RODRIGUEZ                          ', 'AVILA                              ', 'ELVA GLORIA                   ', '1616259', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 17997868, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17997868.pdf'),
(760, '42021017', '978366936', 'jcvasgo@gmail.com', 'JULIOCESAR.VASQUEZGONZ@minedu.edu.pe', 'VASQUEZ                            ', 'GONZALES                           ', 'JULIO CESAR                   ', '1354158', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 42021017, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42021017.pdf'),
(761, '17895226', '945714524', 'liz04_lo@hotmail.com', 'MARYLIZ.VIGODE@minedu.edu.pe', 'VIGO                               ', 'DE LA TORRE                        ', 'MARY LIZ                      ', '0577973', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 17895226, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17895226.pdf'),
(762, '47223588', '942226853', 'mishellag@hotmail.com', 'ESTEFFANIMICHE.AGUILARMORE@minedu.edu.pe', 'AGUILAR                            ', 'MORENO                             ', 'ESTEFFANI MICHELLE            ', '1416924', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47223588, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47223588.pdf'),
(763, '43920760', '945964943', 'ivancernareyes@gmail.com', 'OSCARIVAN.CERNAREYE@minedu.edu.pe', 'CERNA                              ', 'REYES                              ', 'OSCAR IVAN                    ', '0577833', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43920760, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43920760.pdf'),
(764, '70506222', '921725539', 'cesia.chuquilin@gmail.com', 'cesia.chuquilinm@minedu.edu.pe', 'CHUQUILIN                          ', 'MUCHICA                            ', 'CESIA JAEL                    ', '1454891', '13', 'Proceso', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 70506222, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70506222.pdf'),
(765, '73474783', '916491743', 'anlly_leo12@hotmail.com', 'ANLLYCLAUD.CORNEJOCAST@minedu.edu.pe', 'CORNEJO                            ', 'CASTAÑEDA                          ', 'ANLLY CLAUDIA                 ', '1418425', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 73474783, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73474783.pdf'),
(766, '42913682', '949198078', 'lorenjanos@gmail.com', 'LORENYANIN.EUSEBIOESQU@minedu.edu.pe', 'EUSEBIO                            ', 'ESQUIVEL                           ', 'LOREN YANINA                  ', '1718964', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 42913682, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42913682.pdf'),
(767, '44251336', '991775272', 'kefuentesd30@gmail.com', 'KARLAEVELY.FUENTESDIOS@minedu.edu.pe', 'FUENTES                            ', 'DIOS                               ', 'KARLA EVELYN                  ', '1449040', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 44251336, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44251336.pdf'),
(768, '73230150', '903053330', 'JENIFFER.GARCESR@GMAIL.COM', 'candy.garcesr@minedu.edu.pe', 'GARCES                             ', 'RODRIGUEZ                          ', 'CANDY JENIFFER                ', '1170729', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 73230150, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73230150.pdf'),
(769, '45067567', '949517210', 'kleb.gra2@gmail.com', 'CALEB.GRADOSLICH@minedu.edu.pe', 'GRADOS                             ', 'LICHAM                             ', 'CALEB                         ', '0577908', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 45067567, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45067567.pdf'),
(770, '40934085', '961854874', 'janeth_3doc@hotmail.com', 'JANETHALEJA.HOYOSROSP@minedu.edu.pe', 'HOYOS                              ', 'ROSPIGLIOSI                        ', 'JANETH ALEJANDRINA            ', '0544361', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40934085, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40934085.pdf'),
(771, '18111257', '987730243', 'jalemx3@gmail.com', 'ELVAROSA.JARALEON@minedu.edu.pe', 'JARA                               ', 'LEON                               ', 'ELVA ROSA                     ', '0622043', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 18111257, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18111257.pdf'),
(772, '44061393', '961035253', 'clarosagalvez@outlook.com', 'CARLOSJHON.LAROSA@minedu.edu.pe', 'LA ROSA                            ', 'GALVEZ                             ', 'CARLOS JHON                   ', '1335595', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 44061393, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44061393.pdf'),
(773, '71522889', '955158657', 'sandrarf.95@hotmail.com', 'SANDRA.RAMOSFLOR@minedu.edu.pe', 'RAMOS                              ', 'FLORES                             ', 'SANDRA                        ', '0578146', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 71522889, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71522889.pdf'),
(774, '18132308', '984214212', 'JOSERODRIGUEZARMAS@GMAIL.COM', 'JOSEANTON.RODRIGUEZARMA@minedu.edu.pe', 'RODRIGUEZ                          ', 'ARMAS                              ', 'JOSE ANTONIO                  ', '1250943', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 18132308, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18132308.pdf'),
(775, '45441950', '957589606', 'carolije29@gmail.com', 'caroli.rodriguezs@minedu.edu.pe', 'RODRIGUEZ                          ', 'SANCHEZ                            ', 'CAROLI JENNIFER               ', '1157189', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 45441950, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45441950.pdf'),
(776, '41351423', '986748962', 'DORILA23@HOTMAIL.COM', 'DORILA.SANCHEZMARI@minedu.edu.pe', 'SANCHEZ                            ', 'MARIN                              ', 'DORILA                        ', '1559582', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 41351423, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41351423.pdf'),
(778, '40823839', '943646445', 'zaida_026@hotmail.com', 'ZAIDA.CHEROGONZ@minedu.edu.pe', 'CHERO                              ', 'GONZALES                           ', 'ZAIDA                         ', '0349704', '', '', 'Sin Calificar', '', '', 'Calificado', 48, 'Logrado', 1, 40823839, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40823839.pdf'),
(779, '43006847', '995780811', 'MILAGROSCHERRE-33@HOTMAIL.COM', 'MILAGROS.CHERREQUER@minedu.edu.pe', 'CHERRE                             ', 'QUEREVALU                          ', 'MILAGROS                      ', '1138502', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 43006847, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43006847.pdf'),
(780, '40486641', '965792712', 'shioming_27@hotmail.com', 'SHIOMINGSHIOS.CUTIPAPONG@minedu.edu.pe', 'CUTIPA                             ', 'PONGO                              ', 'SHIOMING SHIOSING             ', '1369552', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 40486641, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40486641.pdf'),
(781, '44658139', '901495630', 'RUTH1987AYQUI@GMAIL.COM', 'RUTH.GUTIERREZAYQU@minedu.edu.pe', 'GUTIERREZ                          ', 'AYQUI                              ', 'RUTH                          ', '1138502', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44658139, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44658139.pdf'),
(782, '40094666', '971712072', 'ruthinostroza15@hotmail.com', 'RUTHROXAN.HINOSTROZAHIDA@minedu.edu.pe', 'HINOSTROZA                         ', 'HIDALGO                            ', 'RUTH ROXANA                   ', '1369552', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40094666, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40094666.pdf'),
(783, '40533369', '950012250', 'vitajara05@gmail.com', 'ALBILDOR.JARAHURT@minedu.edu.pe', 'JARA                               ', 'HURTADO                            ', 'ALBILDOR                      ', '0349746', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 40533369, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40533369.pdf'),
(784, '40208465', '942415547', 'silviajimenezy@hotmail.com', 'SILVIAMILAG.JIMENEZYENG@minedu.edu.pe', 'JIMENEZ                            ', 'YENG                               ', 'SILVIA MILAGROS               ', '1138502', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40208465, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40208465.pdf'),
(785, '16756337', '954514733', 'liorva@hotmail.com', 'LIDIA.ORTIZVARG@minedu.edu.pe', 'ORTIZ                              ', 'VARGAS                             ', 'LIDIA                         ', '0354142', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 16756337, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16756337.pdf'),
(786, '42328303', '996172813', 'lidiaoha@hotmail.com', 'LIDIA.PANCCAOHA@minedu.edu.pe', 'PANCCA                             ', 'OHA                                ', 'LIDIA                         ', '0354159', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 42328303, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42328303.pdf'),
(787, '45401562', '945953091', 'FRUBIPAREDES@GMAIL.COM', 'FIORELLARUBI.PAREDESVELI@minedu.edu.pe', 'PAREDES                            ', 'VELIZ                              ', 'FIORELLA RUBI                 ', '1781855', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 45401562, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45401562.pdf'),
(788, '48039803', '965812370', 'katerinramval@gmail.com', 'KATERINSTEFF.RAMIREZVALD@minedu.edu.pe', 'RAMIREZ                            ', 'VALDIVIESO                         ', 'KATERIN STEFFANI              ', '0354142', '16', 'Suficiente', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 48039803, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48039803.pdf'),
(789, '40748483', '978943036', 'LORENARIVERAESPINOZA56@GMAIL.COM', 'LORENA.RIVERAESPI@minedu.edu.pe', 'RIVERA                             ', 'ESPINOZA                           ', 'LORENA                        ', '1260413', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40748483, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40748483.pdf'),
(790, '41434702', '973550529', 'julianacinthya2507@gmail.com', 'cinthya.seminariob@minedu.edu.pe', 'SEMINARIO                          ', 'BELUPU                             ', 'CINTHYA JULIANA               ', '0354217', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41434702, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41434702.pdf'),
(792, '47923351', '936560757', 'JERVI_14@HOTMAIL.COM', 'RUTHGABRI.VELASQUEZVELA@minedu.edu.pe', 'VELASQUEZ                          ', 'VELASQUEZ                          ', 'RUTH GABRIELA                 ', '0349712', '', '', 'Sin Calificar', '', '', 'Calificado', 48, 'Logrado', 1, 47923351, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47923351.pdf'),
(793, '40151254', '923752869', 'maribelzapataanastacio@gmail.com', 'ROXANAMARIB.ZAPATAANAS@minedu.edu.pe', 'ZAPATA                             ', 'ANASTACIO                          ', 'ROXANA MARIBEL                ', '1781855', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 40151254, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40151254.pdf'),
(794, '47417837', '948232534', 'madayjaziz27@gmail.com', 'MADAYJAZIZ.BLASALFA@minedu.edu.pe', 'BLAS                               ', 'ALFARO                             ', 'MADAY JAZIZ                   ', '0388959', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 47417837, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47417837.pdf'),
(795, '70678360', '955069508', 'BIANCABUNON@GMAIL.COM', 'BIANCAFIORE.BUÑONSANG@minedu.edu.pe', 'BUÑON                              ', 'SANGAY                             ', 'BIANCA FIORELLA               ', '0389338', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 70678360, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70678360.pdf'),
(796, '46301132', '941906314', 'ruth_anita90@hotmail.com', 'RUTHANALI.CUSTODIOROSA@minedu.edu.pe', 'CUSTODIO                           ', 'ROSAS                              ', 'RUTH ANALI                    ', '0367656', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 46301132, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46301132.pdf'),
(797, '70550564', '987725130', 'LUCERO.ARIES_97@HOTMAIL.COM', 'LUCEROESTEF.GOMEZQUIP@minedu.edu.pe', 'GOMEZ                              ', 'QUIPUZCOA                          ', 'LUCERO ESTEFANY               ', '1166636', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 70550564, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70550564.pdf'),
(798, '16787175', '979050964', 'SILVIATAURO17@GMAIL.COM', 'SILVIAMAGAL.LEGUIAMALD@minedu.edu.pe', 'LEGUIA                             ', 'MALDONADO                          ', 'SILVIA MAGALY                 ', '0346569', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 16787175, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16787175.pdf'),
(799, '16781738', '963668980', 'NELSONLLATASTORRES@GMAIL.COM', 'JOSENELSO.LLATASTORR@minedu.edu.pe', 'LLATAS                             ', 'TORRES                             ', 'JOSE NELSON                   ', '1347905', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 16781738, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16781738.pdf'),
(800, '16521115', '979571577', 'miliaseret2@hotmail.com', 'MILAGRITOSTERES.MARTINEZCHIC@minedu.edu.pe', 'MARTINEZ                           ', 'CHICOMA                            ', 'MILAGRITOS TERESA             ', '0346544', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 16521115, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16521115.pdf'),
(801, '76162315', '935898096', 'PRETELLLEON1997@GMAIL.COM', 'LUZANGEL.PRETELLEON@minedu.edu.pe', 'PRETEL                             ', 'LEON                               ', 'LUZ ANGELICA                  ', '0388975', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 76162315, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76162315.pdf'),
(802, '16728474', '993773151', 'miqui26@hotmail.com', 'LUCIADEL.QUIROZYANC@minedu.edu.pe', 'QUIROZ                             ', 'YANCUL                             ', 'LUCIA DEL MILAGRO             ', '0346494', '', '', 'Sin Calificar', '', '', 'Calificado', 52, 'Logrado', 1, 16728474, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16728474.pdf'),
(803, '16727300', '979542023', 'frenroel@hotmail.com', 'FRANZENZO.ROBLESVALD@minedu.edu.pe', 'ROBLES                             ', 'VALDIVIESO                         ', 'FRANZ ENZO                    ', '0669457', '', '', 'Calificado', '26', 'Proceso', 'Calificado', 52, 'Logrado', 1, 16727300, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16727300.pdf'),
(804, '48078748', '966327966', 'gallardo.30.11@gmail.com', 'MERLIARACE.RODRIGUEZGALL@minedu.edu.pe', 'RODRIGUEZ                          ', 'GALLARDO                           ', 'MERLI ARACELI                 ', '0212035', '', '', 'Borrador', '', '', 'Calificado', 56, 'Destacado', 1, 48078748, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48078748.pdf'),
(805, '46984882', '995862042', 'rossimari_20@hotmail.com', 'ROSSIMARIA.RODRIGUEZIBAÑ@minedu.edu.pe', 'RODRIGUEZ                          ', 'IBAÑEZ                             ', 'ROSSI MARIANNE                ', '0211763', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 46984882, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46984882.pdf'),
(806, '17457065', '950668274', 'rfvero@hotmail.com', 'ROSAVERON.ROSADOFIES@minedu.edu.pe', 'ROSADO                             ', 'FIESTAS                            ', 'ROSA VERONICA                 ', '0648030', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 17457065, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17457065.pdf'),
(807, '16736008', '976803196', 'jacky_saes78@hotmail.com', 'JACKELINEDEL.SABAESPI@minedu.edu.pe', 'SABA                               ', 'ESPINOZA                           ', 'JACKELINE DEL ROCIO           ', '0346197', '', '', 'Sin Calificar', '', '', 'Calificado', 52, 'Logrado', 1, 16736008, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16736008.pdf'),
(808, '16722148', '955875646', 'dannadelgadotorres52@gmail.com', 'SONIAADRIA.TORRESGALA@minedu.edu.pe', 'TORRES                             ', 'GALARCEP                           ', 'SONIA ADRIANA                 ', '1540608', '', '', 'Sin Calificar', '', '', 'Calificado', 52, 'Logrado', 1, 16722148, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16722148.pdf'),
(809, '16674629', '961092743', 'MONICADEMARCHAN@GMAIL.COM', 'MONICA.URBINAVARG@minedu.edu.pe', 'URBINA                             ', 'VARGAS                             ', 'MONICA                        ', '0491530', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 16674629, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16674629.pdf'),
(810, '71928537', '967209696', 'GSTEPHANY97@GMAIL.COM', 'GLORIASTEPH.VALLADARESAVAL@minedu.edu.pe', 'VALLADARES                         ', 'AVALOS                             ', 'GLORIA STEPHANY               ', '0211466', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 71928537, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71928537.pdf'),
(811, '42181419', '948584198', 'crvasquezs@hotmail.com', 'carmen.vasquezsan@minedu.edu.pe', 'VASQUEZ                            ', 'SANDOVAL                           ', 'CARMEN ROSA                   ', '0517706', '', '', 'Borrador', '', '', 'Calificado', 56, 'Destacado', 1, 42181419, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42181419.pdf'),
(812, '27429781', '937499725', 'marlarocio@hotmail.com', 'MARLADEL.ANAYAPERE@minedu.edu.pe', 'ANAYA                              ', 'PEREZ                              ', 'MARLA DEL ROCIO               ', '0616771', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 27429781, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '27429781.pdf'),
(813, '41620440', '939158845', 'rdchuquilin@gmail.com', 'ROYDELVE.CHUQUILINCHAV@minedu.edu.pe', 'CHUQUILIN                          ', 'CHAVARRY                           ', 'ROY DELVER                    ', '0350181', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 41620440, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41620440.pdf'),
(814, '02774988', '958551803', 'MONICA_CRES@HOTMAIL.COM', 'MONICAALICI.CRESPOOLAE@minedu.edu.pe', 'CRESPO                             ', 'OLAECHEA                           ', 'MONICA ALICIA                 ', '1017821', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 2774988, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02774988.pdf'),
(815, '40062339', '969241751', 'licrular@hotmail.com', 'LILIAMESTHE.CRUZLA@minedu.edu.pe', 'CRUZ                               ', 'LA ROSA                            ', 'LILIAM ESTHER                 ', '0349332', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 40062339, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40062339.pdf'),
(817, '71849241', '976921283', 'INGRIDJANNELLYFLORESRAMOS@GMAIL.COM', 'INGRIDJANNE.FLORESRAMO@minedu.edu.pe', 'FLORES                             ', 'RAMOS                              ', 'INGRID JANNELLY               ', '0350272', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 56, 'Destacado', 1, 71849241, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71849241.pdf'),
(818, '17640331', '980099957', 'ELIGARCIA010778@GMAIL.COM', 'ESTHERELIZA.GARCIACHAF@minedu.edu.pe', 'GARCIA                             ', 'CHAFLOQUE                          ', 'ESTHER ELIZABETH              ', '0350215', '', '', 'Borrador', '', '', 'Calificado', 52, 'Logrado', 1, 17640331, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17640331.pdf'),
(819, '41077411', '912671994', 'gladyskeli81@gmail.com', 'GLADYSKELI.HUARINGAMACH@minedu.edu.pe', 'HUARINGA                           ', 'MACHUCA                            ', 'GLADYS KELI                   ', '0351866', '13', 'Proceso', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41077411, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'No', 'Sí', 'Sí', 2, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41077411.pdf'),
(820, '45247917', '927722534', 'anamaria170788m@gmail.com', 'ana.mondragonr@minedu.edu.pe', 'MONDRAGON                          ', 'RODRIGUEZ                          ', 'ANA MARIA                     ', '0616748', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45247917, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45247917.pdf'),
(821, '43139968', '951044711', 'DEYSIPANTA10@GMAIL.COM', 'DEYSIMARLE.PANTAQUER@minedu.edu.pe', 'PANTA                              ', 'QUEREVALU                          ', 'DEYSI MARLENY                 ', '0350207', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43139968, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43139968.pdf'),
(822, '45993705', '973198740', 'virgo9_amor@hotmail.com', 'MERCEDESEUGEN.POSTIGOVALD@minedu.edu.pe', 'POSTIGO                            ', 'VALDIVIA                           ', 'MERCEDES EUGENIA              ', '0350215', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 45993705, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45993705.pdf'),
(823, '44095739', '961057065', 'lizdelrosario1987@gmail.com', 'LIZDEL.QUIROGARUIZ@minedu.edu.pe', 'QUIROGA                            ', 'RUIZ                               ', 'LIZ DEL ROSARIO               ', '1017821', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44095739, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44095739.pdf'),
(824, '29558022', '978493215', 'yuyos1971@gmail.com', 'JULIOHERNA.RODRIGUEZCUNO@minedu.edu.pe', 'RODRIGUEZ                          ', 'CUNO                               ', 'JULIO HERNAN                  ', '0916791', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 29558022, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29558022.pdf'),
(825, '45803705', '918531513', 'aries1989_2@hotmail.com', 'FLORDE.RUIZELIA@minedu.edu.pe', 'RUIZ                               ', 'ELIAS                              ', 'FLOR DE MARIA ISIDORA         ', '0350272', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 45803705, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45803705.pdf'),
(826, '47097936', '943665820', 'kelymar1602@hotmail.com', 'KELYJACKE.TIMANAPAZ@minedu.edu.pe', 'TIMANA                             ', 'PAZ                                ', 'KELY JACKELYNE                ', '0673723', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 47097936, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47097936.pdf'),
(827, '75344826', '942118321', 'janina-vidaurre@outlook.com', 'SILVIAJANIN.VENTURAVIDA@minedu.edu.pe', 'VENTURA                            ', 'VIDAURRE                           ', 'SILVIA JANINA                 ', '0350215', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 75344826, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75344826.pdf'),
(828, '61220126', '975639866', 'lizbeth_edu2012@hotmail.com', 'PATRICIALIZBE.ZAVALETAMORE@minedu.edu.pe', 'ZAVALETA                           ', 'MORENO                             ', 'PATRICIA LIZBETH              ', '0916791', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 61220126, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '61220126.pdf'),
(829, '47659604', '945440668', 'SOFIA.MARIANA1326@GMAIL.COM', 'SOFIA.BARRANZUELAARAU@minedu.edu.pe', 'BARRANZUELA                        ', 'ARAUJO                             ', 'SOFIA                         ', '0467605', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 47659604, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47659604.pdf'),
(830, '41998513', '988909236', 'cielbabecerra@gmail.com', 'cintia.becerraa@minedu.edu.pe', 'BECERRA                            ', 'ARRIETA                            ', 'CINTIA ELIZABETH              ', '0342998', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 41998513, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41998513.pdf'),
(831, '74488361', '921398592', 'zoilacv930@gmail.com', 'ZOILAEDISA.CALDERONVALD@minedu.edu.pe', 'CALDERON                           ', 'VALDIVIEZO                         ', 'ZOILA EDISA                   ', '0260166', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 74488361, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74488361.pdf'),
(832, '41776748', '957413465', 'lcanosiagie@gmail.com', 'LIZJAQUE.CANOMORA@minedu.edu.pe', 'CANO                               ', 'MORALES                            ', 'LIZ JAQUELINE                 ', '0350165', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 41776748, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41776748.pdf'),
(834, '40704789', '969913582', 'cleonemich@gmail.com', 'NELLYMILAG.CHEROCHAV@minedu.edu.pe', 'CHERO                              ', 'CHAVEZ                             ', 'NELLY MILAGROS                ', '0341800', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 40704789, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40704789.pdf'),
(835, '72669508', '968780724', 'EPMH_67@HOTMAIL.COM', 'DIANACAROL.DELROSA@minedu.edu.pe', 'DEL ROSARIO                        ', 'MENA                               ', 'DIANA CAROLINA                ', '0673772', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 72669508, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72669508.pdf'),
(836, '02844706', '944485254', 'LILLYFIESTASRUMICHE1974@GMAIL.COM', 'JUANALILLY.FIESTASRUMI@minedu.edu.pe', 'FIESTAS                            ', 'RUMICHE                            ', 'JUANA LILLY                   ', '0350165', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 2844706, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02844706.pdf'),
(837, '43167029', '972925068', 'milus_22@hotmail.com', 'MILUSKAYRENE.HERRERASIGÜ@minedu.edu.pe', 'HERRERA                            ', 'SIGUEÑAS                           ', 'MILUSKA YRENE DEL MILAGRO     ', '0866772', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 43167029, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43167029.pdf'),
(840, '16620180', '972604084', 'marialaura_1109@hotmail.com', 'MARIALAURA.NECIOSUPQUES@minedu.edu.pe', 'NECIOSUP                           ', 'QUESQUEN                           ', 'MARIA LAURA                   ', '1789312', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 16620180, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16620180.pdf'),
(842, '46815261', '925741289', 'devora_12_39@hotmail.com', 'DEVORA.ROMANDURA@minedu.edu.pe', 'ROMAN                              ', 'DURAND                             ', 'DEVORA                        ', '0342741', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 46815261, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46815261.pdf'),
(843, '48526972', '944863576', 'BSUAREZGU@GMAIL.COM', 'brayard.suarezg@minedu.edu.pe', 'SUAREZ                             ', 'GUERRERO                           ', 'BRAYARD CRUZ DE JESUS         ', '0343038', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 48526972, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48526972.pdf'),
(845, '71426434', '939396526', 'ISABEL.MVL.2211@OUTLOOK.ES', 'ISABELMERCE.VILCHEZLITA@minedu.edu.pe', 'VILCHEZ                            ', 'LITANO                             ', 'ISABEL MERCEDES               ', '0260166', '', '', 'Sin Calificar', '', '', 'Calificado', 60, 'Destacado', 1, 71426434, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71426434.pdf'),
(846, '02601233', '938349157', 'MAEACAS24@GMAIL.COM', 'MARIAEUGEN.AYALACAST@minedu.edu.pe', 'AYALA                              ', 'CASTRO                             ', 'MARIA EUGENIA                 ', '1715499', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 2601233, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02601233.pdf'),
(847, '75412329', '948132710', 'ALLISON_26_16@HOTMAIL.COM', 'ALLISONPOLET.BARRIENTOSCUÑE@minedu.edu.pe', 'BARRIENTOS                         ', 'CUÑE                               ', 'ALLISON POLET                 ', '0259853', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 75412329, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75412329.pdf'),
(848, '40116739', '943694417', 'ROCIOMBOZA@GMAIL.COM', 'ROCIOMILAG.BOZAMARR@minedu.edu.pe', 'BOZA                               ', 'MARROQUIN                          ', 'ROCIO MILAGROS                ', '1715713', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40116739, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40116739.pdf'),
(849, '71295078', '999309506', 'katy.b29@hotmail.com', 'JHAZMINKATTY.BRAVOBARD@minedu.edu.pe', 'BRAVO                              ', 'BARDALES                           ', 'JHAZMIN KATTY                 ', '1681204', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71295078, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71295078.pdf'),
(850, '05645530', '943204497', 'licarsip14_7@hotmail.com', 'CARMENLILIA.CASTROSIPI@minedu.edu.pe', 'CASTRO                             ', 'SIPION                             ', 'CARMEN LILIANA                ', '0571323', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 5645530, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '05645530.pdf'),
(851, '74305490', '970279674', 'scruzdelgad@gmail.com', 'SANDRA.CRUZDELG@minedu.edu.pe', 'CRUZ                               ', 'DELGADO                            ', 'SANDRA                        ', '1414176', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74305490, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74305490.pdf'),
(852, '43204420', '937736231', 'culquicondormaribel@gmail.com', 'MARIBEL.CULQUICONDORPALA@minedu.edu.pe', 'CULQUICONDOR                       ', 'PALACIOS                           ', 'MARIBEL                       ', '0688846', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43204420, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43204420.pdf'),
(853, '46930192', '995019026', 'natalie_530@hotmail.com', 'NATALIEMARY.CUSISULL@minedu.edu.pe', 'CUSI                               ', 'SULLCA                             ', 'NATALIE MARY                  ', '1745827', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46930192, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46930192.pdf'),
(854, '45000147', '951625118', 'MARIACF.1588@GMAIL.COM', 'MARIAISABE.CUSICHEFERN@minedu.edu.pe', 'CUSICHE                            ', 'FERNANDEZ                          ', 'MARIA ISABEL                  ', '1715598', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45000147, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45000147.pdf'),
(855, '44866279', '933779569', 'kristina.figueroah@gmail.com', 'MARIACRIST.FIGUEROAHERR@minedu.edu.pe', 'FIGUEROA                           ', 'HERRERA                            ', 'MARIA CRISTINA                ', '1557222', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 52, 'Logrado', 1, 44866279, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44866279.pdf'),
(856, '02862418', '969812948', 'arena2010@hotmail.com', 'carmen.florescall@minedu.edu.pe', 'FLORES                             ', 'CALLE                              ', 'CARMEN ROSA                   ', '1649409', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 2862418, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02862418.pdf'),
(857, '45198146', '912217433', 'mayraicanaque4@gmail.com', 'MAYRAELIZA.ICANAQUEANTO@minedu.edu.pe', 'ICANAQUE                           ', 'ANTON                              ', 'MAYRA ELIZABETH               ', '0535682', '', '', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45198146, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45198146.pdf'),
(858, '42023282', '942846736', 'lisvey04@gmail.com', 'LISVEYYACKE.JACINTOFLOR@minedu.edu.pe', 'JACINTO                            ', 'FLORES                             ', 'LISVEY YACKELINE              ', '0614263', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42023282, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42023282.pdf'),
(860, '43674429', '959737565', 'MISSFIORELLAPOMPILLA@GMAIL.COM', 'ROCIOFIORE.POMPILLAARON@minedu.edu.pe', 'POMPILLA                           ', 'ARONI                              ', 'ROCIO FIORELLA                ', '1588086', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43674429, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43674429.pdf'),
(861, '40203949', '961077622', 'MARITZAELIANAROJASMARCOS@GMAIL.COM', 'MARITZAELIAN.ROJASMARC@minedu.edu.pe', 'ROJAS                              ', 'MARCOS                             ', 'MARITZA ELIANA                ', '1419514', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40203949, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40203949.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(862, '42899771', '924151348', 'MSORALUZA@GMAIL.COM', 'MARIELLANOEMI.SORALUZAMAY@minedu.edu.pe', 'SORALUZ                            ', 'AMAYA                              ', 'MARIELLA NOEMI                ', '1681147', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42899771, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42899771.pdf'),
(863, '47563991', '988540687', 'CHRISMAR_103@HOTMAIL.COM', 'MARIELENAREICH.ALVAREZMONT@minedu.edu.pe', 'ALVAREZ                            ', 'MONTAÑEZ                           ', 'MARIELENA REICH               ', '1582774', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47563991, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47563991.pdf'),
(864, '76620104', '929265382', 'JBACILIOR1@UPAO.EDU.PE', 'JOHANAESTHE.BACILIOREYN@minedu.edu.pe', 'BACILIO                            ', 'REYNA                              ', 'JOHANA ESTHEFANY              ', '1545201', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 76620104, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76620104.pdf'),
(865, '45360571', '929864733', 'wynalroc@hotmail.com', 'DORADEL.CACHAYALAR@minedu.edu.pe', 'CACHAY                             ', 'ALARCON                            ', 'DORA DEL ROCIO                ', '1706746', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45360571, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45360571.pdf'),
(868, '46155467', '943202681', 'katherine_eyal22@hotmail.com', 'KATHERINEELIZA.GARCIALOLO@minedu.edu.pe', 'GARCIA                             ', 'LOLOY                              ', 'KATHERINE ELIZABETH           ', '1456128', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46155467, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46155467.pdf'),
(869, '46032623', '988186494', 'Y_ESENIA1@HOTMAIL.COM', 'YESENIADEL.GARCIAPIZA@minedu.edu.pe', 'GARCIA                             ', 'PIZAN                              ', 'YESENIA DEL CARMEN            ', '0418954', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 46032623, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46032623.pdf'),
(870, '76427790', '942692749', 'brigittegutierrezabanto@gmail.com', 'brigitte.gutierreza@minedu.edu.pe', 'GUTIERREZ                          ', 'ABANTO                             ', 'BRIGITTE GERALDINE            ', '0587733', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76427790, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76427790.pdf'),
(871, '32388763', '971373596', 'yesigrace@hotmail.com', 'YESENIAROSA.LIÑANCORD@minedu.edu.pe', 'LIÑAN                              ', 'CORDOVA                            ', 'YESENIA ROSA                  ', '1157163', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 32388763, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32388763.pdf'),
(872, '46080051', '952381476', 'ema154@hotmail.com', 'ELIZABETH.MESTASACEI@minedu.edu.pe', 'MESTAS                             ', 'ACEITUNO                           ', 'ELIZABETH                     ', '1685593', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46080051, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46080051.pdf'),
(873, '18180945', '933396370', 'celia2503.docente@gmail.com', 'celia.moranr@minedu.edu.pe', 'MORAN                              ', 'RAFAEL                             ', 'CELIA ROSA                    ', '0588632', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18180945, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18180945.pdf'),
(874, '47391025', '971140546', 'VANESSAORIHUELACUNAS@GMAIL.COM', 'VANESSAGLADY.ORIHUELACUÑA@minedu.edu.pe', 'ORIHUELA                           ', 'CUÑAS                              ', 'VANESSA GLADYS                ', '1456896', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47391025, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47391025.pdf'),
(875, '32945380', '962224785', 'MARITERE24@HOTMAIL.COM', 'MARIATERES.PEREZMEND@minedu.edu.pe', 'PEREZ                              ', 'MENDEZ                             ', 'MARIA TERESA                  ', '1584366', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 32945380, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32945380.pdf'),
(876, '45107450', '940164379', 'rosalia_25_5@hotmail.com', 'NELLYROSAL.RAMOSVARG@minedu.edu.pe', 'RAMOS                              ', 'VARGAS                             ', 'NELLY ROSALIA                 ', '1683234', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45107450, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45107450.pdf'),
(877, '17804242', '947050889', 'BETTYREATEGUIACOSTA@GMAIL.COM', 'BETTY.REATEGUIACOS@minedu.edu.pe', 'REATEGUI                           ', 'ACOSTA                             ', 'BETTY                         ', '0218560', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 17804242, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17804242.pdf'),
(878, '18202064', '968571292', 'maria_cheve@hotmail.com', 'JENNYBETSA.VASQUEZSAND@minedu.edu.pe', 'VASQUEZ                            ', 'SANDOVAL                           ', 'JENNY BETSABE                 ', '1584200', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 18202064, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18202064.pdf'),
(879, '18225670', '949188304', 'veruska911@hotmail.com', 'VERONICACRIST.VIGORUIZ@minedu.edu.pe', 'VIGO                               ', 'RUIZ                               ', 'VERONICA CRISTINA             ', '1545086', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 18225670, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18225670.pdf'),
(880, '72175809', '946293407', 'PRISSILADEAMAYA@GMAIL.COM', 'PRISSILAMICHE.ALVAREZAGUI@minedu.edu.pe', 'ALVAREZ                            ', 'AGUINAGA                           ', 'PRISSILA MICHELLE EMPERATRIZ  ', '0344267', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72175809, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72175809.pdf'),
(881, '73637414', '973430175', 'luae1509@gmail.com', 'LUZAUROR.ALVITESESPI@minedu.edu.pe', 'ALVITES                            ', 'ESPINOZA                           ', 'LUZ AURORA                    ', '0620302', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73637414, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73637414.pdf'),
(883, '77818368', '924856702', 'QUINDECKS@GMAIL.COM', 'KARENSTEFA.CABRERAQUIN@minedu.edu.pe', 'CABRERA                            ', 'QUINDE                             ', 'KAREN STEFANY                 ', '1674084', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77818368, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77818368.pdf'),
(884, '77483402', '945467597', 'MELISSA10_25@HOTMAIL.COM', 'MELISSASTEPH.CALDERONCARH@minedu.edu.pe', 'CALDERON                           ', 'CARHUATANTA                        ', 'MELISSA STEPHANY              ', '1595255', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77483402, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77483402.pdf'),
(885, '73974184', '936718746', 'ximenita170395@gmail.com', 'XIMENAFERNA.DAVILALOPE@minedu.edu.pe', 'DAVILA                             ', 'LOPEZ                              ', 'XIMENA FERNANDA               ', '1643535', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73974184, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73974184.pdf'),
(886, '73493448', '972199465', 'GARCILSM15@GMAIL.COM', 'SHEILAMARYL.GARCIASILV@minedu.edu.pe', 'GARCIA                             ', 'SILVA                              ', 'SHEILA MARYLA                 ', '1706993', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73493448, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73493448.pdf'),
(887, '73204893', '936025401', 'CYBELL.IO.19@GMAIL.COM', 'IOMAIRALOYDA.GONZALESSILV@minedu.edu.pe', 'GONZALES                           ', 'SILVA                              ', 'IOMAIRA LOYDA KENNETH         ', '1707132', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73204893, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73204893.pdf'),
(888, '72641575', '966948311', 'yamilegonzalessobrino@gmail.com', 'YAMILEANNAR.GONZALESSOBR@minedu.edu.pe', 'GONZALES                           ', 'SOBRINO                            ', 'YAMILE ANNARELLA              ', '0523910', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72641575, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72641575.pdf'),
(889, '74850677', '990827555', 'lic.jibaja@gmail.com', 'LIZETHKYMBE.JIBAJADE@minedu.edu.pe', 'JIBAJA                             ', 'DE LA CRUZ                         ', 'LIZETH KYMBERLYN              ', '1673722', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74850677, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74850677.pdf'),
(890, '72401229', '942103054', 'manayromeroclaudia@gmail.com', 'claudia.manayr@minedu.edu.pe', 'MANAY                              ', 'ROMERO                             ', 'CLAUDIA                       ', '0484899', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72401229, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72401229.pdf'),
(891, '74825709', '997372737', 'YOMAIRAORTIZPUPUCHE2912@GMAIL.COM', 'YOMAIRAYESAB.ORTIZDE@minedu.edu.pe', 'ORTIZ DE ZEVALLOS                  ', 'PUPUCHE                            ', 'YOMAIRA YESABELLA             ', '1673912', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74825709, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74825709.pdf'),
(892, '72147617', '924891036', 'INFANTESCARLA@GMAIL.COM', 'carla.perezi@minedu.edu.pe', 'PEREZ                              ', 'INFANTES                           ', 'CARLA ESTEFANY                ', '1557511', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72147617, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72147617.pdf'),
(893, '74537973', '956554788', 'YESI.SALV@GMAIL.COM', 'YESICAMARIQ.SALVADORSAAV@minedu.edu.pe', 'SALVADOR                           ', 'SAAVEDRA                           ', 'YESICA MARIQUEL               ', '1742964', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74537973, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74537973.pdf'),
(894, '72680041', '963595103', 'DIANUX-4@HOTMAIL.COM', 'DIANACAROL.SANDOVALRIOS@minedu.edu.pe', 'SANDOVAL                           ', 'RIOS                               ', 'DIANA CAROLINA                ', '1673896', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72680041, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72680041.pdf'),
(895, '73077508', '997412616', 'anny_02_93@hotmail.es', 'ANNYKATHE.SANDOVALYNOÑ@minedu.edu.pe', 'SANDOVAL                           ', 'YNOÑAN                             ', 'ANNY KATHERINE                ', '1157858', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73077508, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73077508.pdf'),
(896, '76854857', '933941311', 'JOSSELYNEYAJAIRASECLENDELGADO@GMAIL.COM', 'JOSSELYNEYAJAI.SECLENDELG@minedu.edu.pe', 'SECLEN                             ', 'DELGADO                            ', 'JOSSELYNE YAJAIRA             ', '1707041', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 76854857, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76854857.pdf'),
(897, '40318371', '945350869', 'DINAMARLENEALAVAL@GMAIL.COM', 'DINAMARLE.ALATAVALD@minedu.edu.pe', 'ALATA                              ', 'VALDIVIA                           ', 'DINA MARLENE                  ', '1096056', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 40318371, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40318371.pdf'),
(899, '32917824', '902697964', 'RBONILLADEPAZ@GMAIL.COM', 'RUTHELISA.BONILLADEPA@minedu.edu.pe', 'BONILLA                            ', 'DEPAZ                              ', 'RUTH ELISA                    ', '1095819', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 32917824, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32917824.pdf'),
(900, '44614907', '978102848', 'pilicar13@hotmail.com', 'PILAR.CARDENASGUEV@minedu.edu.pe', 'CARDENAS                           ', 'GUEVARA                            ', 'PILAR                         ', '0673939', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 44614907, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44614907.pdf'),
(901, '40539833', '916509734', 'YDAVILAESTEVES@GMAIL.COM', 'YESSENIAPAOLA.DAVILAESTE@minedu.edu.pe', 'DAVILA                             ', 'ESTEVES                            ', 'YESSENIA PAOLA                ', '0752733', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 40539833, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40539833.pdf'),
(902, '44424074', '983063090', 'nancygonzalescarrero@gmail.com', 'NANCY.GONZALESCARR@minedu.edu.pe', 'GONZALES                           ', 'CARRERO                            ', 'NANCY                         ', '0752741', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 44424074, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44424074.pdf'),
(903, '16788401', '926265108', 'GONZALESCLARA2008@GMAIL.COM', 'CLARALIDIA.GONZALESFERN@minedu.edu.pe', 'GONZALES                           ', 'FERNANDEZ                          ', 'CLARA LIDIA                   ', '0673939', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 16788401, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16788401.pdf'),
(904, '40477334', '936259793', 'carmenrosaia@hotmail.com', 'CARMENROSA.INOÑANAMAS@minedu.edu.pe', 'INOÑAN                             ', 'AMASIFUEN                          ', 'CARMEN ROSA                   ', '0349639', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 40477334, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40477334.pdf'),
(905, '21520461', '982409878', 'glorialarosa47@gmail.com', 'GLORIAROSAR.LAROSA@minedu.edu.pe', 'LA ROSA                            ', 'HUAMANI                            ', 'GLORIA ROSARIO                ', '0673939', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 21520461, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '21520461.pdf'),
(906, '46933666', '922209136', 'DALLETLB.14@GMAIL.COM', 'DALLETHORTE.LAGUNABOHO@minedu.edu.pe', 'LAGUNA                             ', 'BOHORQUEZ                          ', 'DALLET HORTENCIA              ', '0353680', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 46933666, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46933666.pdf'),
(907, '16795574', '962444215', 'MELYMACO2430@GMAIL.COM', 'MELYPATRI.MACOVASQ@minedu.edu.pe', 'MACO                               ', 'VASQUEZ                            ', 'MELY PATRICIA                 ', '0752766', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 16795574, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16795574.pdf'),
(908, '72752640', '934366524', 'cristianninovilchez@gmail.com', 'CRISTIANFELIX.NIÑOVILC@minedu.edu.pe', 'NIÑO                               ', 'VILCHEZ                            ', 'CRISTIAN FELIX                ', '0353268', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 72752640, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72752640.pdf'),
(909, '16791195', '979239985', 'florroalcaba@gmail.com', 'FLORDE.ROALCABASANC@minedu.edu.pe', 'ROALCABA                           ', 'SANCHEZ                            ', 'FLOR DE MARIA                 ', '0752758', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 16791195, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16791195.pdf'),
(910, '32131496', '939407989', 'JOEL806@HOTMAIL.COM', 'JOELERTITO.SUCAVASQ@minedu.edu.pe', 'SUCA                               ', 'VASQUEZ                            ', 'JOELER TITO                   ', '0848242', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 32131496, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32131496.pdf'),
(911, '29636791', '961766224', 'belucita.2@gmail.com', 'BELU.TRUJILLORAMI@minedu.edu.pe', 'TRUJILLO                           ', 'RAMIREZ                            ', 'BELU                          ', '0719534', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 29636791, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29636791.pdf'),
(912, '40612705', '959650873', 'rosi_2470@hotmail.com', 'ROSALYNNLILIA.VILLANUEVARODR@minedu.edu.pe', 'VILLANUEVA                         ', 'RODRIGUEZ                          ', 'ROSALYNN LILIA                ', '1095694', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 40612705, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40612705.pdf'),
(913, '46867254', '902106644', 'ander.ydrogo0890@gmail.com', 'anderson.ydrogoa@minedu.edu.pe', 'YDROGO                             ', 'ALEJANDRIA                         ', 'ANDERSON                      ', '0829895', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 46867254, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46867254.pdf'),
(914, '41787476', '971467991', 'SONYITA_2007@HOTMAIL.COM', 'SONIASUSAN.GOMEZMORA@minedu.edu.pe', 'GOMEZ                              ', 'MORALES                            ', 'SONIA SUSANA                  ', '1587849', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41787476, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41787476.pdf'),
(915, '75744845', '912201049', 'fn24hc@gmail.com', 'FLORNOHEM.HUERTASCORO@minedu.edu.pe', 'HUERTAS                            ', 'CORONADO                           ', 'FLOR NOHEMI                   ', '1016765', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 75744845, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75744845.pdf'),
(916, '43305265', '921151829', 'KIMBERLY05052011@GMAIL.COM', 'aracely.moscosor@minedu.edu.pe', 'MOSCOSO                            ', 'ROJAS                              ', 'ARACELY ELIABEL               ', '1137819', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 43305265, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'No', 5, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43305265.pdf'),
(917, '47128200', '916289060', 'MARI.IMDIAZ@GMAIL.COM', 'MARIAIRMA.MUÑOZDIAZ@minedu.edu.pe', 'MUÑOZ                              ', 'DIAZ                               ', 'MARIA IRMA                    ', '0750588', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47128200, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'No', 5, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47128200.pdf'),
(918, '03661108', '945387405', 'florolivasemi@hotmail.com', 'FLORDE.OLIVARESSEMI@minedu.edu.pe', 'OLIVARES                           ', 'SEMINARIO                          ', 'FLOR DE MARIA                 ', '0259762', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 3661108, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03661108.pdf'),
(919, '72351290', '939322969', 'larisaor93@hotmail.com', 'JUDITHLARIS.ORDINOLAINFA@minedu.edu.pe', 'ORDINOLA                           ', 'INFANTE                            ', 'JUDITH LARISA                 ', '1714302', '', '', 'No enviado', '', '', 'Calificado', 39, 'Proceso', 0, 72351290, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'NO APROBADO', '72351290.pdf'),
(920, '47039873', '935873759', 'TANIAPAMELAORTIZCORDOVA@GMAIL.COM', 'TANIAPAMEL.ORTIZCORD@minedu.edu.pe', 'ORTIZ                              ', 'CORDOVA                            ', 'TANIA PAMELA                  ', '1681345', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47039873, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47039873.pdf'),
(921, '45210853', '921778107', 'osccorojasis@gmail.com', 'ISABELSANTO.OSCCOROJA@minedu.edu.pe', 'OSCCO                              ', 'ROJAS                              ', 'ISABEL SANTONA                ', '1589522', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 45210853, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45210853.pdf'),
(922, '45563999', '929360302', 'TECNE.INGENIERIA@GMAIL.COM', 'ERICKALILIA.PAIVAMEND@minedu.edu.pe', 'PAIVA                              ', 'MENDOZA                            ', 'ERICKA LILIANA                ', '0718825', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 45563999, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45563999.pdf'),
(923, '47762536', '918835148', 'MILECHI161091@GMAIL.COM', 'MILAGRITOSALHEL.PEREZFARF@minedu.edu.pe', 'PEREZ                              ', 'FARFAN                             ', 'MILAGRITOS ALHELI             ', '0622761', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 47762536, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47762536.pdf'),
(924, '45975141', '987320429', 'PINGOCALDERONSHERLYMILAGROS@GMAIL.COM', 'SHERLYMILAG.PINGOCALD@minedu.edu.pe', 'PINGO                              ', 'CALDERON                           ', 'SHERLY MILAGROS               ', '0614099', '', '', 'No enviado', '', '', 'Calificado', 39, 'Proceso', 0, 45975141, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'NO APROBADO', '45975141.pdf'),
(927, '40599106', '995699411', 'norcatherin@hotmail.com', 'NORLEYCATHE.RUIZNUNU@minedu.edu.pe', 'RUIZ                               ', 'NUNURA                             ', 'NORLEY CATHERINE              ', '1018027', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 40599106, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40599106.pdf'),
(928, '02792436', '966532520', 'oscorrea17@hotmail.com', 'OFELIA.SAGUMACORR@minedu.edu.pe', 'SAGUMA                             ', 'CORREA                             ', 'OFELIA                        ', '1557230', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 2792436, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02792436.pdf'),
(929, '43111684', '927676067', 'yesenia.16.10@outlook.com', 'MARIAYESEN.SUAÑAFLOR@minedu.edu.pe', 'SUAÑA                              ', 'FLORES                             ', 'MARIA YESENIA                 ', '1138171', '', '', 'No enviado', '', '', 'Calificado', 39, 'Proceso', 0, 43111684, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'NO APROBADO', '43111684.pdf'),
(930, '44045967', '922573464', 'miss.karen_aguilar@hotmail.com', 'MARIAKAREN.AGUILARYANA@minedu.edu.pe', 'AGUILAR                            ', 'YANAC                              ', 'MARIA KAREN                   ', '1427160', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44045967, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44045967.pdf'),
(931, '43770219', '936873268', 'ALMI.PROF.IRIS@GMAIL.COM', 'IRISGENY.ALTAMIRANOMISA@minedu.edu.pe', 'ALTAMIRANO                         ', 'MISAHUAMAN DE INFANTES             ', 'IRIS GENY YANINA              ', '0690628', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43770219, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43770219.pdf'),
(932, '44252837', '929489553', 'yanethcahuaya16@gmail.com', 'OLINAYANET.CAHUAYATINT@minedu.edu.pe', 'CAHUAYA                            ', 'TINTAYA                            ', 'OLINA YANETH                  ', '0622787', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 44252837, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44252837.pdf'),
(933, '44577424', '977607965', 'lubelen18@hotmail.com', 'GISELLELIZA.CASTILLOPURI@minedu.edu.pe', 'CASTILLO                           ', 'PURIZACA                           ', 'GISELL ELIZABETH              ', '1464031', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44577424, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44577424.pdf'),
(934, '44856627', '942397684', 'yamilypaz2016@gmail.com', 'ERICKAYAMIL.CESPEDESPAZ@minedu.edu.pe', 'CESPEDES                           ', 'PAZ                                ', 'ERICKA YAMILY                 ', '1426345', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44856627, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44856627.pdf'),
(936, '45024425', '938657883', 'kchinchayan@gmail.com', 'KATHERINEMARIB.CHINCHAYANFERN@minedu.edu.pe', 'CHINCHAYAN                         ', 'FERNANDEZ                          ', 'KATHERINE MARIBEL             ', '0733196', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45024425, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45024425.pdf'),
(937, '44683189', '915354930', 'DARLING_LOVE1787@HOTMAIL.COM', 'SARAMILAG.CRUZVEGA@minedu.edu.pe', 'CRUZ                               ', 'VEGAS                              ', 'SARA MILAGROS                 ', '1494103', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 44683189, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44683189.pdf'),
(938, '43503061', '933145967', 'evelynff20@hotmail.com', 'YNGRIDEVELY.FERNANDEZFERN@minedu.edu.pe', 'FERNANDEZ                          ', 'FERNANDEZ                          ', 'YNGRID EVELYN                 ', '0548370', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43503061, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43503061.pdf'),
(939, '44937836', '993799117', 'vanessacristalgalvezrios@gmail.com', 'VANESSACRIST.GÁLVEZRÍOS@minedu.edu.pe', 'GÁLVEZ                             ', 'RÍOS                               ', 'VANESSA CRISTAL               ', '1418557', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44937836, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44937836.pdf'),
(940, '71996325', '952298007', 'GGR199516@GMAIL.COM', 'GABRIELA.GUZMANROSA@minedu.edu.pe', 'GUZMAN                             ', 'ROSAS                              ', 'GABRIELA                      ', '1426386', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71996325, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71996325.pdf'),
(941, '44464720', '982539467', 'MGALE_85@HOTMAIL.COM', 'ALIXANDRAJANIN.MELQUIADESGOME@minedu.edu.pe', 'MELQUIADES                         ', 'GOMERO                             ', 'ALIXANDRA JANINA SUSSY        ', '1427418', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 44464720, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44464720.pdf'),
(942, '72322819', '944894871', 'emonzonolivares@gmail.com', 'ESTHERELIZA.MONZONOLIV@minedu.edu.pe', 'MONZON                             ', 'OLIVARES                           ', 'ESTHER ELIZABETH              ', '1689892', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72322819, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72322819.pdf'),
(943, '44001164', '978993606', 'mari33.33pz@gmail.com', 'MARIELA.PEÑAPALI@minedu.edu.pe', 'PEÑA                               ', 'PALIZA                             ', 'MARIELA                       ', '1431337', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44001164, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44001164.pdf'),
(944, '45206192', '992905077', 'karole2403@hotmail.com', 'KATHERINLOREN.RODRIGUEZCAST@minedu.edu.pe', 'RODRIGUEZ                          ', 'CASTILLO                           ', 'KATHERIN LORENA               ', '1504984', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45206192, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45206192.pdf'),
(945, '44453266', '917670239', 'HTABOADAQ@GMAIL.COM', 'HEIDYJOHAN.TABOADAQUEZ@minedu.edu.pe', 'TABOADA                            ', 'QUEZADA                            ', 'HEIDY JOHANA                  ', '0802561', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44453266, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44453266.pdf'),
(946, '45972146', '944653643', 'YACKY.ZB@GMAIL.COM', 'YACKELYN.ZAVALETABACA@minedu.edu.pe', 'ZAVALETA                           ', 'BACA                               ', 'YACKELYN                      ', '1427301', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45972146, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45972146.pdf'),
(953, '40984893', '963664502', 'elmernoe1208@gmail.com', 'ELMERNOE.CRUZESQU@minedu.edu.pe', 'CRUZ                               ', 'ESQUIVEL                           ', 'ELMER NOE                     ', '0268227', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40984893, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40984893.pdf'),
(954, '44568714', '971737145', 'DELACC_13@HOTMAIL.COM', 'ELMERDANIE.DELA@minedu.edu.pe', 'DE LA CRUZ                         ', 'CARDENAS                           ', 'ELMER DANIEL                  ', '0267716', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44568714, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44568714.pdf'),
(955, '41349865', '963355849', 'kathi.delaguila@gmail.com', 'KATHERINE.DELAGUI@minedu.edu.pe', 'DEL AGUILA                         ', 'ALVARADO                           ', 'KATHERINE                     ', '1795087', '', '', 'Calificado', '40', 'Destacado', 'No enviado', 60, 'Destacado', 1, 41349865, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41349865.pdf'),
(956, '43541070', '930899015', 'oriales20@gmail.com', 'HEDITORIAL.GUTIERREZGARC@minedu.edu.pe', 'GUTIERREZ                          ', 'GARCIA                             ', 'HEDIT ORIALES                 ', '1167659', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43541070, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43541070.pdf'),
(957, '40490922', '988305393', 'carol_230@hotmail.com', 'carol.leytond@minedu.edu.pe', 'LEYTON                             ', 'DELGADILLO                         ', 'CAROL VANESSA                 ', '0267591', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 40490922, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40490922.pdf'),
(958, '40844361', '959499198', 'soledad201_81@hotmail.com', 'IRMA.LOPEZVILL@minedu.edu.pe', 'LOPEZ                              ', 'VILLEGAS                           ', 'IRMA                          ', '0269498', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 40844361, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40844361.pdf'),
(963, '75722387', '965039995', 'ANYTHA_D@HOTMAIL.COM', 'ana.capchad@minedu.edu.pe', 'CAPCHA                             ', 'DE LA CRUZ                         ', 'ANA ROXANA                    ', '0395327', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 75722387, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75722387.pdf'),
(964, '44860560', '954934969', 'lady_8813@hotmail.com', 'LEIDEROSME.ESCOBEDOCHAV@minedu.edu.pe', 'ESCOBEDO                           ', 'CHAVEZ                             ', 'LEIDE ROSMERY                 ', '0394791', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44860560, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44860560.pdf'),
(968, '40651874', '958564372', 'LUPITAROBERTC@GMAIL.COM', 'DAIXYKARIN.MARTINEZROJA@minedu.edu.pe', 'MARTINEZ                           ', 'ROJAS                              ', 'DAIXY KARINA                  ', '0467084', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40651874, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40651874.pdf'),
(971, '41591115', '951503877', 'LUISRENTERIACACHAY@GMAIL.COM', 'LUISCIRIA.RENTERIACACH@minedu.edu.pe', 'RENTERIA                           ', 'CACHAY                             ', 'LUIS CIRIACO                  ', '0626374', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41591115, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41591115.pdf'),
(972, '74158676', '941332120', 'CARLOSJHONNY1400@GMAIL.COM', 'JHONNYCARLO.SAGASTEGUIAGUI@minedu.edu.pe', 'SAGASTEGUI                         ', 'AGUILAR                            ', 'JHONNY CARLOS                 ', '0395137', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74158676, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74158676.pdf'),
(973, '46619823', '976096375', 'IESTP.ELA.JUANCARLOS@GMAIL.COM', 'JUANCARLO.SANTACRUZ@minedu.edu.pe', 'SANTA CRUZ                         ', 'SANCHEZ                            ', 'JUAN CARLOS                   ', '1159037', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46619823, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46619823.pdf'),
(974, '10285542', '942933342', 'lynire_06@hotmail.com', 'MARIAIRENE.SAYAVERDECARU@minedu.edu.pe', 'SAYAVERDE                          ', 'CARUAJULCA                         ', 'MARIA IRENE                   ', '0709493', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 10285542, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10285542.pdf'),
(976, '29736922', '959445776', 'AGUILA123@HOTMAIL.COM', 'JAVIERALONS.AGUILAR@minedu.edu.pe', 'AGUILAR                            ', 'NULL                               ', 'JAVIER ALONSO                 ', '0356675', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 29736922, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29736922.pdf'),
(977, '40800961', '984343209', 'juan_pablo_matematic@hotmail.com', 'JUANPABLO.BARRIENTOSPAYE@minedu.edu.pe', 'BARRIENTOS                         ', 'PAYE                               ', 'JUAN PABLO                    ', '0356246', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 40800961, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40800961.pdf'),
(978, '40639150', '974521425', 'jlcampos24@hotmail.com', 'JOSELUIS.CAMPOSAVEL@minedu.edu.pe', 'CAMPOS                             ', 'AVELLANEDA                         ', 'JOSE LUIS                     ', '0689083', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 40639150, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40639150.pdf'),
(979, '02878262', '969000737', 'jchoquehuancaa_73@hotmail.es', 'JAVIER.CHOQUEHUANCAAGUR@minedu.edu.pe', 'CHOQUEHUANCA                       ', 'AGURTO                             ', 'JAVIER                        ', '0570952', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 2878262, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02878262.pdf'),
(981, '41830490', '943905622', 'vigalan@gmail.com', 'VICTORARTUR.GALANLITA@minedu.edu.pe', 'GALAN                              ', 'LITANO                             ', 'VICTOR ARTURO                 ', '0591289', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 41830490, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41830490.pdf'),
(982, '45513974', '961530261', 'jillgonzaga@gmail.com', 'JILLCECY.GONZAGACAST@minedu.edu.pe', 'GONZAGA                            ', 'CASTILLO                           ', 'JILL CECY ELAINE              ', '0688507', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45513974, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45513974.pdf'),
(983, '002040503', '986275606', 'FRAKLINJHERNANDEZRO89@GMAIL.COM', 'FRANKLINJESUS.HERNANDEZROME@minedu.edu.pe', 'HERNANDEZ                          ', 'ROMERO                             ', 'FRANKLIN JESUS                ', '0570952', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 2040503, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '002040503.pdf'),
(984, '40902400', '966579198', 'BEATIFUL1000@HOTMAIL.COM', 'OLGAYOLAN.MARTINEZLEON@minedu.edu.pe', 'MARTINEZ                           ', 'LEON                               ', 'OLGA YOLANDA                  ', '0490383', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 40902400, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40902400.pdf'),
(985, '41661231', '978797224', 'jamumi186@hotmail.com', 'JAIME.MUROMILL@minedu.edu.pe', 'MURO                               ', 'MILLONES                           ', 'JAIME                         ', '0356147', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 41661231, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41661231.pdf'),
(986, '44722735', '951507795', 'JEFFREY.NAVARRO.VIERA@GMAIL.COM', 'JEFFREYSTEVE.NAVARROVIER@minedu.edu.pe', 'NAVARRO                            ', 'VIERA                              ', 'JEFFREY STEVE                 ', '0938662', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 44722735, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44722735.pdf'),
(987, '42928434', '994921423', 'SANDRIX2312@GMAIL.COM', 'SANDRAFLOR.OREDE@minedu.edu.pe', 'ORE                                ', 'DE LA CRUZ                         ', 'SANDRA FLOR                   ', '0356162', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 42928434, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42928434.pdf'),
(988, '44866602', '970604985', 'PEDRO.XPCX@GMAIL.COM', 'PEDROROLAN.PAREDESCHAV@minedu.edu.pe', 'PAREDES                            ', 'CHAVEZ                             ', 'PEDRO ROLANDO                 ', '1206382', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 44866602, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44866602.pdf'),
(989, '16748068', '958698419', 'MONYCE76@GMAIL.COM', 'MONICACECIL.RISCOFERN@minedu.edu.pe', 'RISCO                              ', 'FERNANDEZ                          ', 'MONICA CECILIA                ', '0737817', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 16748068, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16748068.pdf'),
(990, '75499817', '921063974', 'FABYRIVAS95@GMAIL.COM', 'MIRELLYFABIO.RIVASYARL@minedu.edu.pe', 'RIVAS                              ', 'YARLEQUE                           ', 'MIRELLY FABIOLA               ', '0737692', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 75499817, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75499817.pdf'),
(991, '44194303', '982251366', 'angelrocasiaden@gmail.com', 'angel.rocas@minedu.edu.pe', 'ROCA                               ', 'SIADEN                             ', 'ANGEL CESAR                   ', '1718675', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 44194303, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44194303.pdf'),
(992, '41652254', '931120187', 'SAAVTINEOSCAR@HOTMAIL.COM', 'OSCAR.SAAVEDRATINE@minedu.edu.pe', 'SAAVEDRA                           ', 'TINEO                              ', 'OSCAR                         ', '0572081', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 41652254, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41652254.pdf'),
(993, '43019187', '980707532', 'juanpa_1585@hotmail.com', 'JUANPABLO.VARACASO@minedu.edu.pe', 'VARA                               ', 'CASO                               ', 'JUAN PABLO                    ', '0355925', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 43019187, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43019187.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(994, '72383562', '940678748', 'ingridkatherynebs@gmail.com', 'INGRIDKATHE.BALVINSAAV@minedu.edu.pe', 'BALVIN                             ', 'SAAVEDRA                           ', 'INGRID KATHERYNE              ', '1528744', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 72383562, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72383562.pdf'),
(996, '45811529', '943615986', 'korina.bernaola@gmail.com', 'KORINALISSE.BERNAOLAMEND@minedu.edu.pe', 'BERNAOLA                           ', 'MENDOZA                            ', 'KORINA LISSETH                ', '0259895', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45811529, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45811529.pdf'),
(997, '71202444', '910557783', 'SANITACC@HOTMAIL.COM', 'NATALICIA.CARHUALLOCLLOCRUZ@minedu.edu.pe', 'CARHUALLOCLLO                      ', 'CRUZ                               ', 'NATALICIA                     ', '1558410', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 71202444, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71202444.pdf'),
(999, '40845871', '936589518', 'CARMENROSADELACRUZORTIZ274@GMAIL.COM', 'CARMENROSA.DELA@minedu.edu.pe', 'DE LA CRUZ                         ', 'ORTIZ                              ', 'CARMEN ROSA                   ', '1558501', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40845871, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40845871.pdf'),
(1000, '09882378', '980784433', 'MARTHADM34@GMAIL.COM', 'MARTHA.DELGADOMEZA@minedu.edu.pe', 'DELGADO                            ', 'MEZA                               ', 'MARTHA                        ', '1136571', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 9882378, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09882378.pdf'),
(1001, '42428154', '966376970', 'luhana128@gmail.com', 'RUTHFIORE.FLORESCHAU@minedu.edu.pe', 'FLORES                             ', 'CHAUCA                             ', 'RUTH FIORELLA                 ', '0916346', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42428154, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42428154.pdf'),
(1002, '45940248', '949386888', 'VIRGO_GUEVARA@HOTMAIL.COM', 'PETRONILA.GUEVARABAUT@minedu.edu.pe', 'GUEVARA                            ', 'BAUTISTA                           ', 'PETRONILA                     ', '1561109', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 45940248, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45940248.pdf'),
(1003, '71069621', '928677413', 'DORALIZAHUAMANCRUZ66@GMAIL.COM', 'DORALIZA.HUAMANCRUZ@minedu.edu.pe', 'HUAMAN                             ', 'CRUZ                               ', 'DORALIZA                      ', '1516749', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 71069621, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71069621.pdf'),
(1004, '70355236', '929151944', 'MILAGRITOSSCHAMBIZEA@GMAIL.COM', 'MILAGROSDEL.MARTINEZCHAM@minedu.edu.pe', 'MARTINEZ                           ', 'CHAMBIZEA                          ', 'MILAGROS DEL CARMEN           ', '1561083', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 70355236, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70355236.pdf'),
(1005, '40085294', '959627214', 'rossana.paricanaza@gmail.com', 'ROSSANAELVIR.PARICANAZATIPO@minedu.edu.pe', 'PARICANAZA                         ', 'TIPO                               ', 'ROSSANA ELVIRA                ', '1516707', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40085294, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40085294.pdf'),
(1006, '62335889', '979560576', 'LOZADAPASIGUAN@GMAIL.COM', 'KARINILIAN.PASIGUANLOZA@minedu.edu.pe', 'PASIGUAN                           ', 'LOZADA                             ', 'KARIN ILIANA                  ', '1558410', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 62335889, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '62335889.pdf'),
(1007, '74622893', '965607373', 'PINTADOHUANCASELVI@GMAIL.COM', 'MARIAELVIR.PINTADOHUAN@minedu.edu.pe', 'PINTADO                            ', 'HUANCAS                            ', 'MARIA ELVIRA                  ', '1558444', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74622893, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74622893.pdf'),
(1008, '10544082', '930117199', 'rojas.rita.chavez@gmail.com', 'RITAEDITH.ROJASCHAV@minedu.edu.pe', 'ROJAS                              ', 'CHAVEZ                             ', 'RITA EDITH                    ', '1561083', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 10544082, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10544082.pdf'),
(1009, '72190593', '956402365', 'TATISS100@GMAIL.COM', 'ANGIETATIA.SOLISSANC@minedu.edu.pe', 'SOLIS                              ', 'SANCHEZ                            ', 'ANGIE TATIANA                 ', '1561075', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72190593, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72190593.pdf'),
(1010, '29735236', '991337332', 'evatc.55@hotmail.com', 'EVAJUDIT.TURPOCALA@minedu.edu.pe', 'TURPO                              ', 'CALAPUJA                           ', 'EVA JUDITH                    ', '1589225', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 29735236, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29735236.pdf'),
(1011, '42441623', '952250491', 'ericka_a23@hotmail.com', 'ERICKAHAYDE.ADRIANZENDE@minedu.edu.pe', 'ADRIANZEN                          ', 'DE LA CRUZ                         ', 'ERICKA HAYDEE                 ', '1131747', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42441623, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42441623.pdf'),
(1012, '42843151', '933566273', 'vanecapug@gmail.com', 'VANESSASAVIN.CAPUÑAYGONZ@minedu.edu.pe', 'CAPUÑAY                            ', 'GONZALES                           ', 'VANESSA SAVINA                ', '0346486', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42843151, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42843151.pdf'),
(1013, '40420791', '979355399', 'juce0904@hotmail.com', 'GLADYSJULIA.CASTROALVA@minedu.edu.pe', 'CASTRO                             ', 'ALVAREZ                            ', 'GLADYS JULIANA                ', '0346239', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40420791, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40420791.pdf'),
(1014, '43004956', '943286535', 'DENISECHAVESTAREGALADO85@GMAIL.COM', 'DENISEELENA.CHAVESTAREGA@minedu.edu.pe', 'CHAVESTA                           ', 'REGALADO                           ', 'DENISE ELENA                  ', '0580316', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43004956, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43004956.pdf'),
(1015, '40701366', '979293931', 'KARICORONELU@GMAIL.COM', 'LISCETEKARIN.CORONELUGAZ@minedu.edu.pe', 'CORONEL                            ', 'UGAZ                               ', 'LISCETE KARINA                ', '0346692', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40701366, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40701366.pdf'),
(1016, '42671459', '993634203', 'LUINA_1309@HOTMAIL.COM', 'NANCYELENA.DAVILAYDRO@minedu.edu.pe', 'DAVILA                             ', 'YDROGO                             ', 'NANCY ELENA                   ', '0346551', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42671459, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42671459.pdf'),
(1017, '40611144', '970227724', 'YEME3031@GMAIL.COM', 'YOBANI.ESPINOZAMEGO@minedu.edu.pe', 'ESPINOZA                           ', 'MEGO                               ', 'YOBANI                        ', '1349901', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40611144, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40611144.pdf'),
(1018, '40242687', '966651229', 'yms_22_7_79@hotmail.com', 'YSABEL.MESTANZASAAV@minedu.edu.pe', 'MESTANZA                           ', 'SAAVEDRA                           ', 'YSABEL                        ', '0346221', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40242687, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40242687.pdf'),
(1019, '40459034', '980604122', 'kario1242@hotmail.com', 'KARINALISBE.OLAYASAMI@minedu.edu.pe', 'OLAYA                              ', 'SAMILLAN                           ', 'KARINA LISBETH                ', '0346221', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40459034, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40459034.pdf'),
(1020, '40568504', '979685042', 'laury-3@hotmail.com', 'LAURADEL.RAMIREZMEND@minedu.edu.pe', 'RAMIREZ                            ', 'MENDOZA                            ', 'LAURA DEL CARMEN              ', '1672690', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40568504, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40568504.pdf'),
(1021, '40469500', '959209588', 'JANETRISCOV@GMAIL.COM', 'MAGALYJANET.RISCOVASQ@minedu.edu.pe', 'RISCO                              ', 'VASQUEZ                            ', 'MAGALY JANET                  ', '0346312', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 40469500, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40469500.pdf'),
(1022, '40216299', '996077324', 'noruma26@gmail.com', 'NORAESTHE.RUIZMAZA@minedu.edu.pe', 'RUIZ                               ', 'MAZA                               ', 'NORA ESTHER                   ', '0543447', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40216299, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40216299.pdf'),
(1023, '42189076', '971968816', 'dkolores1@hotmail.com', 'MAGALYELIZA.SALDAÑAMEJI@minedu.edu.pe', 'SALDAÑA                            ', 'MEJIA                              ', 'MAGALY ELIZABETH              ', '0620039', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42189076, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42189076.pdf'),
(1024, '41743092', '955630181', 'yanina17_pilar@hotmail.com', 'YANINADEL.SANTISTEBANADRI@minedu.edu.pe', 'SANTISTEBAN                        ', 'ADRIANZEN                          ', 'YANINA DEL PILAR              ', '0346221', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41743092, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41743092.pdf'),
(1025, '41845867', '969180910', 'rocio_tati6@hotmail.com', 'SARAANTON.STUCCHICHAM@minedu.edu.pe', 'STUCCHI                            ', 'CHAMBA                             ', 'SARA ANTONIETA                ', '0346486', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41845867, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41845867.pdf'),
(1026, '43111421', '951413200', 'ing.dasv@gmail.com', 'MONICAROSAN.TAPIATORR@minedu.edu.pe', 'TAPIA                              ', 'TORRES                             ', 'MONICA ROSANA                 ', '0346775', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43111421, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43111421.pdf'),
(1027, '40620806', '956526315', 'liss9928@hotmail.com', 'LISSETHKARIN.VEGACHAV@minedu.edu.pe', 'VEGA                               ', 'CHAVEZ                             ', 'LISSETH KARINA                ', '1131747', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40620806, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40620806.pdf'),
(1028, '71623432', '925314654', 'BENANCIOAMADORMONZON@GMAIL.COM', 'JOSEBENAN.AMADORMONZ@minedu.edu.pe', 'AMADOR                             ', 'MONZON                             ', 'JOSE BENANCIO                 ', '0267591', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 71623432, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71623432.pdf'),
(1029, '40978617', '947245023', 'yuly.camposmarrufo@gmail.com', 'YULYYANET.CAMPOSMARR@minedu.edu.pe', 'CAMPOS                             ', 'MARRUFO                            ', 'YULY YANETH                   ', '0367573', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40978617, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40978617.pdf'),
(1030, '75798680', '960202515', 'thaly75798680@gmail.com', 'THALIAYUDIT.CASTILLOROBL@minedu.edu.pe', 'CASTILLO                           ', 'ROBLES                             ', 'THALIA YUDITH                 ', '0267658', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75798680, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75798680.pdf'),
(1032, '62513605', '993465209', 'KAREN_ALEGRIA_07@HOTMAIL.COM', 'KARENALEGR.CHUQUIMIGUELMANT@minedu.edu.pe', 'CHUQUIMIGUEL                       ', 'MANTILLA                           ', 'KAREN ALEGRIA                 ', '1167659', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 62513605, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '62513605.pdf'),
(1033, '47092363', '940934510', 'geral.herme@hotmail.com', 'SANDRAGERAL.HERMENEGILDOJARA@minedu.edu.pe', 'HERMENEGILDO                       ', 'JARA                               ', 'SANDRA GERALDINE              ', '0267591', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 47092363, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47092363.pdf'),
(1034, '71254339', '945796077', 'wendyyajairahc@gmail.com', 'WENDYYAJAI.HUATAYCAST@minedu.edu.pe', 'HUATAY                             ', 'CASTRO                             ', 'WENDY YAJAIRA                 ', '0267765', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 71254339, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71254339.pdf'),
(1035, '46640683', '922764944', 'noemijr89@hotmail.com', 'JACQUELINENOEMI.JULCAROME@minedu.edu.pe', 'JULCA                              ', 'ROMERO                             ', 'JACQUELINE NOEMI              ', '0267765', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46640683, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46640683.pdf'),
(1036, '47303907', '999053143', 'JUDITH.LOPEZ9204@GMAIL.COM', 'JUDITHMAGAL.LOPEZORBE@minedu.edu.pe', 'LOPEZ                              ', 'ORBEGOSO                           ', 'JUDITH MAGALY                 ', '0267658', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 47303907, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47303907.pdf'),
(1037, '44717620', '957345725', 'poa2087@hotmail.com', 'PEDRODAVID.OBANDOAZAÑ@minedu.edu.pe', 'OBANDO                             ', 'AZAÑEDO                            ', 'PEDRO DAVID                   ', '0631473', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44717620, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44717620.pdf'),
(1038, '40594349', '958975799', 'm28_nirma@hotmail.com', 'MILAGROSDEL.OBESORENG@minedu.edu.pe', 'OBESO                              ', 'RENGIFO                            ', 'MILAGROS DEL PILAR            ', '0267567', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40594349, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40594349.pdf'),
(1039, '70373382', '963477564', 'EVELYN_15_VIRGO@HOTMAIL.COM', 'EVELYNROXAN.OTINIANORUIZ@minedu.edu.pe', 'OTINIANO                           ', 'RUIZ                               ', 'EVELYN ROXANA                 ', '0690685', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70373382, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70373382.pdf'),
(1040, '44972884', '952343960', 'sandra_19r@hotmail.com', 'SANDRAELIZA.PAZRODR@minedu.edu.pe', 'PAZ                                ', 'RODRIGUEZ                          ', 'SANDRA ELIZABETH              ', '0214452', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44972884, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44972884.pdf'),
(1041, '48448426', '930686849', 'SOFIA16.12.94@GMAIL.COM', 'ANASOFIA.RODRIGUEZMERC@minedu.edu.pe', 'RODRIGUEZ                          ', 'MERCEDES                           ', 'ANA SOFIA                     ', '0212183', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 48448426, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48448426.pdf'),
(1042, '47160584', '988403202', 'suley_592@hotmail.com', 'SULEYMAIDA.SANCHEZVERA@minedu.edu.pe', 'SANCHEZ                            ', 'VERA                               ', 'SULEY MAIDA                   ', '0587451', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 47160584, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47160584.pdf'),
(1043, '74820133', '953915726', 'tefizita.1884@gmail.com', 'SINDYESTEP.VASQUEZMARQ@minedu.edu.pe', 'VASQUEZ                            ', 'MARQUINA                           ', 'SINDY ESTEPHANY               ', '1167410', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74820133, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74820133.pdf'),
(1044, '75094962', '988978324', 'GVEGA@UNITRU.EDU.PE', 'GRACYSTHEF.VEGAFRAN@minedu.edu.pe', 'VEGA                               ', 'FRANCO                             ', 'GRACY STHEFANY                ', '0802660', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75094962, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75094962.pdf'),
(1045, '18103396', '948989949', 'juveva_68@hotmail.com', 'JUDITHJANET.VEGAVALD@minedu.edu.pe', 'VEGA                               ', 'VALDERRAMA DE ZAVALETA             ', 'JUDITH JANET                  ', '0367508', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18103396, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18103396.pdf'),
(1046, '40459027', '979513032', 'ERIKAAGUILARCOSANATAN2@GMAIL.COM', 'ERIKAAGUED.AGUILARCOSA@minedu.edu.pe', 'AGUILAR                            ', 'COSANATÁN                          ', 'ERIKA AGUEDITA                ', '0213553', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 40459027, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40459027.pdf'),
(1047, '40206121', '995436580', 'jacky_36_2015@hotmail.com', 'JAQUELINELILY.ALCANTARASIPI@minedu.edu.pe', 'ALCANTARA                          ', 'SIPIRAN                            ', 'JAQUELINE LILY                ', '0213553', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 40206121, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40206121.pdf'),
(1048, '18122786', '973302300', 'gracielaalvarado@hotmail.com', 'MIRTHAGRACI.ALVARADOCHAV@minedu.edu.pe', 'ALVARADO                           ', 'CHAVEZ                             ', 'MIRTHA GRACIELA               ', '0213561', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18122786, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18122786.pdf'),
(1049, '46547891', '986379631', 'yova.al@hotmail.com', 'LIZBETHYOVAN.ARENASLIMA@minedu.edu.pe', 'ARENAS                             ', 'LIMAS                              ', 'LIZBETH YOVANA                ', '0212993', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46547891, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46547891.pdf'),
(1050, '18222121', '948246594', 'eniriscast2@gmail.com', 'ENIDAIRIS.CASTILLOCAST@minedu.edu.pe', 'CASTILLO                           ', 'CASTILLO                           ', 'ENIDA IRIS                    ', '0213363', '', '', 'No enviado', '', '', 'Calificado', 30, 'Deficiente', 0, 18222121, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'NO APROBADO', '18222121.pdf'),
(1051, '02899930', '925707674', 'silbanacastillomontenegro@hotmail.com', 'GLADYSSILBA.CASTILLOMONT@minedu.edu.pe', 'CASTILLO                           ', 'MONTENEGRO                         ', 'GLADYS SILBANA                ', '0260638', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 2899930, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02899930.pdf'),
(1052, '42318362', '942077855', 'cerdanbardalezfilmio@gmail.com', 'FILMIO.CERDANBARD@minedu.edu.pe', 'CERDAN                             ', 'BARDALEZ                           ', 'FILMIO                        ', '0350322', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42318362, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42318362.pdf'),
(1054, '19099362', '979122319', 'LUZARELA1@OUTLOOK.ES', 'LUZARELAANTIA.DELA@minedu.edu.pe', 'DE LA CRUZ                         ', 'DELGADO                            ', 'LUZARELA ANTIA                ', '0213553', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 19099362, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '19099362.pdf'),
(1055, '70653839', '960399890', 'GAMARRA.ABI.UNT@GMAIL.COM', 'OMAYRAABIGA.GAMARRADEL@minedu.edu.pe', 'GAMARRA                            ', 'DEL ROSARIO                        ', 'OMAYRA ABIGAIL                ', '0544262', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70653839, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70653839.pdf'),
(1056, '44749144', '921809739', 'KARENGARCIAVILLENA@GMAIL.COM', 'KARENNOELI.GARCIAVILL@minedu.edu.pe', 'GARCIA                             ', 'VILLENA                            ', 'KAREN NOELIA                  ', '0212878', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44749144, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44749144.pdf'),
(1058, '47531419', '958732312', 'misshelitaj92@gmail.com', 'MAGNAMISSH.LUISMACE@minedu.edu.pe', 'LUIS                               ', 'MACEN                              ', 'MAGNA MISSHEL                 ', '1532092', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47531419, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47531419.pdf'),
(1059, '40931654', '970204093', 'maria-flor16@hotmail.com', 'FLORDE.MENDOZALOZA@minedu.edu.pe', 'MENDOZA                            ', 'LOZANO                             ', 'FLOR DE MARIA                 ', '1164144', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 40931654, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40931654.pdf'),
(1060, '46291679', '942494449', 'azucena_20_4@hotmail.com', 'YURITAZUCE.MEREGILDORODR@minedu.edu.pe', 'MEREGILDO                          ', 'RODRIGUEZ                          ', 'YURIT AZUCENA                 ', '0212811', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46291679, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46291679.pdf'),
(1061, '19559369', '996775522', 'MERYQUISPE1371@GMAIL.COM', 'MERYERCEL.QUISPESANC@minedu.edu.pe', 'QUISPE                             ', 'SANCHEZ                            ', 'MERY ERCELIZ                  ', '0214049', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 19559369, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '19559369.pdf'),
(1063, '18889054', '964872496', 'ROCIO.EDU.2015@GMAIL.COM', 'ROCIOELIZA.VERAPARE@minedu.edu.pe', 'VERA                               ', 'PAREDES                            ', 'ROCIO ELIZABETH               ', '1644558', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18889054, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18889054.pdf'),
(1064, '40460809', '991818641', 'JOSELYNCORDEROGUILLINTA93@GMAIL.COM', 'ROMANDALMI.ANDIAECHE@minedu.edu.pe', 'ANDIA                              ', 'ECHEVARRIA                         ', 'ROMAN DALMIRO                 ', '1167188', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40460809, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40460809.pdf'),
(1066, '48169578', '931415671', 'MELISSA.SHALON.BV@GMAIL.COM', 'MELISSASHALO.BAZANVALV@minedu.edu.pe', 'BAZAN                              ', 'VALVERDE                           ', 'MELISSA SHALON                ', '0626374', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 48169578, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48169578.pdf'),
(1067, '41210337', '961528056', 'EDIGCAS21@GMAIL.COM', 'EDILBERTOIGNAC.CASTAÑEDAFLOR@minedu.edu.pe', 'CASTAÑEDA                          ', 'FLORES                             ', 'EDILBERTO IGNACIO             ', '1397991', '', '', 'No enviado', '', '', 'No enviado', 60, 'Destacado', 1, 41210337, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41210337.pdf'),
(1068, '76090878', '974860302', 'LUIS_PIANISTA@OUTLOOK.COM', 'JOSELUIS.CRUZTRUJ@minedu.edu.pe', 'CRUZ                               ', 'TRUJILLO                           ', 'JOSE LUIS                     ', '0635425', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76090878, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76090878.pdf'),
(1069, '18160626', '982286365', 'EVELGUTIERREZ666@GMAIL.COM', 'EVELDAYNE.GUTIERREZBELL@minedu.edu.pe', 'GUTIERREZ', 'BELLIDO', 'EVEL DAYNER', '0544965', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18160626, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18160626.pdf'),
(1070, '18068225', '979535402', 'hclc.26@gmail.com', 'HILDACARID.LINARESCRIB@minedu.edu.pe', 'LINARES                            ', 'CRIBILLEROS                        ', 'HILDA CARIDAD                 ', '1401447', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18068225, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18068225.pdf'),
(1071, '18212557', '950184940', 'vivicajenib@gmail.com', 'MARIAVIVIA.LINARESPANT@minedu.edu.pe', 'LINARES                            ', 'PANTA                              ', 'MARIA VIVIANA                 ', '0802736', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18212557, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18212557.pdf'),
(1072, '32939414', '995759580', 'BPCLUCAS23@HOTMAIL.COM', 'carlos.lucasp@minedu.edu.pe', 'LUCAS                              ', 'PUYCAN                             ', 'CARLOS ALBERTO                ', '1456607', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 32939414, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32939414.pdf'),
(1073, '02881217', '950021607', 'EPAIVAP@GMAIL.COM', 'EUMELIAROSAU.PAIVAPINC@minedu.edu.pe', 'PAIVA                              ', 'PINCHI                             ', 'EUMELIA ROSAURA               ', '1016823', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 2881217, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02881217.pdf'),
(1074, '40822927', '958812012', 'DAVIDPAREDESGUTIERREZ41@GMAIL.COM', 'DAVIDWILFR.PAREDESGUTI@minedu.edu.pe', 'PAREDES                            ', 'GUTIERREZ                          ', 'DAVID WILFREDO                ', '0395277', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40822927, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40822927.pdf'),
(1076, '41065971', '990406861', 'suarezmilian1607@gmail.com', 'SALVADOR.SUAREZMILI@minedu.edu.pe', 'SUAREZ                             ', 'MILIAN                             ', 'SALVADOR                      ', '0268243', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 41065971, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41065971.pdf'),
(1077, '42011298', '991641717', 'DTP_13_10@HOTMAIL.COM', 'DEIBERSIMEO.TAMIPALO@minedu.edu.pe', 'TAMI                               ', 'PALOMARES                          ', 'DEIBER SIMEON                 ', '0802728', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42011298, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42011298.pdf'),
(1078, '02860155', '952582573', 'JORGEVALDIVIEZOCRIOLLO@GMAIL.COM', 'JORGELUIS.VALDIVIEZOCRIO@minedu.edu.pe', 'VALDIVIEZO                         ', 'CRIOLLO                            ', 'JORGE LUIS                    ', '0490474', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'No enviado', 60, 'Destacado', 1, 2860155, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02860155.pdf'),
(1079, '41194956', '968464900', 'fbarranzuela@hotmail.com', 'DELIAFABIO.BARRANZUELACORN@minedu.edu.pe', 'BARRANZUELA                        ', 'CORNEJO                            ', 'DELIA FABIOLA                 ', '0613398', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 41194956, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41194956.pdf'),
(1080, '05643270', '993869877', 'vastiestela@hotmail.com', 'VASTIONEID.ESTELATALL@minedu.edu.pe', 'ESTELA                             ', 'TALLEDO                            ', 'VASTI ONEIDA                  ', '1745595', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 5643270, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '05643270.pdf'),
(1081, '75866069', '923466376', 'GJOYCEMAYRA@GMAIL.COM', 'JOYCEMAYRA.GUERRADE@minedu.edu.pe', 'GUERRA                             ', 'DE LA CRUZ                         ', 'JOYCE MAYRA                   ', '1588342', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 75866069, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75866069.pdf'),
(1082, '72092482', '926088553', 'MYRIAM.CHOQUE@GMAIL.COM', 'MYRIAMCLARA.GUILLERMOCHOQ@minedu.edu.pe', 'GUILLERMO                          ', 'CHOQUE                             ', 'MYRIAM CLARA                  ', '1414176', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72092482, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72092482.pdf'),
(1083, '74322837', '952254428', 'MOBEGUMA@GMAIL.COM', 'MONICABEATR.GUTIERREZMAMA@minedu.edu.pe', 'GUTIERREZ                          ', 'MAMANI                             ', 'MONICA BEATRIZ                ', '1560135', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 74322837, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74322837.pdf'),
(1084, '44265950', '929614018', 'FIORELITAIMAN@HOTMAIL.COM', 'MARIAFIORE.IMANSANT@minedu.edu.pe', 'IMAN                               ', 'SANTOS                             ', 'MARIA FIORELLA DEL SOCORRO    ', '0614099', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44265950, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44265950.pdf'),
(1085, '74443302', '931692879', 'MADELEINE.JZ22@GMAIL.COM', 'SARITAMADEL.JACINTOZETA@minedu.edu.pe', 'JACINTO                            ', 'ZETA                               ', 'SARITA MADELEINE              ', '0627026', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 74443302, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74443302.pdf'),
(1086, '23998762', '941021362', 'JAGIOVA23@GMAIL.COM', 'GIOVANNA.JAIMESMESC@minedu.edu.pe', 'JAIMES                             ', 'MESCO                              ', 'GIOVANNA                      ', '1588367', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 23998762, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '23998762.pdf'),
(1087, '40137857', '999533979', 'judithjusto@hotmail.com', 'JUDITH.JUSTORODR@minedu.edu.pe', 'JUSTO                              ', 'RODRIGUEZ                          ', 'JUDITH                        ', '1588110', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40137857, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40137857.pdf'),
(1088, '45441359', '937027787', 'CLAUDIAYESENIALESCANOHERRERA@GMAIL.COM', 'claudia.lescanoh@minedu.edu.pe', 'LESCANO                            ', 'HERRERA                            ', 'CLAUDIA YESENIA               ', '1589530', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45441359, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45441359.pdf'),
(1089, '03497855', '950837117', 'ELENALOAR05@GMAIL.COM', 'ELENA.LOPEZAREV@minedu.edu.pe', 'LOPEZ                              ', 'AREVALO                            ', 'ELENA                         ', '1136696', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 3497855, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03497855.pdf'),
(1090, '73783044', '932952063', 'LOPEZC150907@GMAIL.COM', 'JAELJAMIL.LOPEZCRUZ@minedu.edu.pe', 'LOPEZ                              ', 'CRUZ                               ', 'JAEL JAMILA                   ', '1017904', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73783044, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73783044.pdf'),
(1091, '77243067', '958261907', 'libre_gaviota12@hotmail.com', 'LEYDIEMPER.MAMANIFERN@minedu.edu.pe', 'MAMANI                             ', 'FERNANDEZ                          ', 'LEYDI EMPERATRIZ              ', '0627000', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 77243067, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77243067.pdf'),
(1092, '71424438', '970480731', 'YMARPE22@GMAIL.COM', 'YOHANALISET.MARTINEZPEÑA@minedu.edu.pe', 'MARTINEZ                           ', 'PEÑA                               ', 'YOHANA LISETT                 ', '0627034', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71424438, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71424438.pdf'),
(1093, '08835684', '998845664', 'PILARMEDSALINAS@GMAIL.COM', 'MARIADEL.MEDINASALI@minedu.edu.pe', 'MEDINA                             ', 'SALINAS                            ', 'MARIA DEL PILAR               ', '0627026', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 8835684, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '08835684.pdf'),
(1094, '44741946', '969715777', 'clauseli3@hotmail.com', 'claudia.morenoo@minedu.edu.pe', 'MORENO                             ', 'OBALLE                             ', 'CLAUDIA ELIZABETH             ', '1714260', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44741946, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44741946.pdf'),
(1095, '41541988', '993833928', 'patty_facebook@hotmail.com', 'PATTYSULEM.AGUILARZEVA@minedu.edu.pe', 'AGUILAR                            ', 'ZEVALLOS                           ', 'PATTY SULEMA                  ', '1685510', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 41541988, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41541988.pdf'),
(1096, '74123152', '960246548', 'ARANAHUILLCA@GMAIL.COM', 'MARIAJOAQU.ARANAHUIL@minedu.edu.pe', 'ARANA                              ', 'HUILLCA                            ', 'MARIA JOAQUINA                ', '1456896', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 74123152, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74123152.pdf'),
(1097, '75467557', '977874454', 'XIOMARACHAFLOQUEC@GMAIL.COM', 'XIOMARAJANIN.CHAFLOQUECAMU@minedu.edu.pe', 'CHAFLOQUE                          ', 'CAMUS                              ', 'XIOMARA JANINA                ', '1683226', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 75467557, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75467557.pdf'),
(1098, '76615837', '940585762', 'CLAUDIAMARLUVE@GMAIL.COM', 'CLAUDIAMARLU.FLORESZUÑI@minedu.edu.pe', 'FLORES                             ', 'ZUÑIGA                             ', 'CLAUDIA MARLUVE               ', '1706670', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 76615837, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76615837.pdf'),
(1099, '73260438', '949780547', 'GFLORP.14@GMAIL.COM', 'FLORMARCE.GALARZAPUMA@minedu.edu.pe', 'GALARZA                            ', 'PUMA                               ', 'FLOR MARCELA                  ', '1683234', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 73260438, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73260438.pdf'),
(1100, '74077199', '960422772', 'shey.garh@gmail.com', 'SHEYLAALEXA.GARCIAHERN@minedu.edu.pe', 'GARCIA                             ', 'HERNANDEZ                          ', 'SHEYLA ALEXANDRA              ', '1456961', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 74077199, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74077199.pdf'),
(1101, '72327313', '916739240', 'ANALIHUAMANIESPILLCO3@GMAIL.COM', 'anali.huamanie@minedu.edu.pe', 'HUAMANI                            ', 'ESPILLCO                           ', 'ANALI                         ', '1706787', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 72327313, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72327313.pdf'),
(1102, '40667995', '982130771', 'alise41_1@hotmail.com', 'alicia.martinezd@minedu.edu.pe', 'MARTINEZ                           ', 'DIAZ                               ', 'ALICIA ELIZABETH              ', '1455856', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40667995, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40667995.pdf'),
(1103, '41463159', '973605883', 'LEMYCAPCHA@HOTMAIL.COM', 'MARYLEMY.PAUCARCAPC@minedu.edu.pe', 'PAUCAR                             ', 'CAPCHA                             ', 'MARY LEMY                     ', '0803106', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 41463159, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41463159.pdf'),
(1104, '41704175', '957284313', 'KARINARQR@GMAIL.COM', 'KARINAROCIO.QUISPEROQU@minedu.edu.pe', 'QUISPE                             ', 'ROQUE                              ', 'KARINA ROCIO                  ', '1644657', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 41704175, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41704175.pdf'),
(1105, '71702216', '917742835', 'geraldineremachegaravito@gmail.com', 'GERALDINE.REMACHEGARA@minedu.edu.pe', 'REMACHE                            ', 'GARAVITO                           ', 'GERALDINE                     ', '1685601', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 71702216, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71702216.pdf'),
(1106, '72565446', '926483869', 'dcarol7023@gmail.com', 'DIANACAROL.RIVERAMOLI@minedu.edu.pe', 'RIVERA                             ', 'MOLINA                             ', 'DIANA CAROLINA                ', '1456151', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 72565446, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72565446.pdf'),
(1107, '71809586', '930611480', 'DEYCYRV@GMAIL.COM', 'DAYCYROSAR.RIVEROVILL@minedu.edu.pe', 'RIVERO                             ', 'VILLEGAS                           ', 'DAYCY ROSARIO                 ', '1456870', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 71809586, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71809586.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(1108, '72124209', '967871580', 'r.dulce180396@gmail.com', 'bertha.romerod@minedu.edu.pe', 'ROMERO                             ', 'DULCE                              ', 'BERTHA LUISA                  ', '1455930', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 72124209, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72124209.pdf'),
(1109, '80466689', '922756772', 'JANETH_MARI15@HOTMAIL.COM', 'JANETHMARIB.VILASQUEZ@minedu.edu.pe', 'VILAS                              ', 'QUEZADA                            ', 'JANETH MARIBEL                ', '0630848', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 80466689, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80466689.pdf'),
(1110, '76417008', '997844926', 'MIDEAVILLA2@GMAIL.COM', 'EUMELIAMIDEA.VILLACANT@minedu.edu.pe', 'VILLA                              ', 'CANTA                              ', 'EUMELIA MIDEA                 ', '1683184', '13', 'Proceso', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 76417008, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76417008.pdf'),
(1111, '46126931', '942520096', 'cristinacampos4612@gmail.com', 'CRISTINAMARTI.CAMPOSMUÑA@minedu.edu.pe', 'CAMPOS                             ', 'MUÑANTE                            ', 'CRISTINA MARTINA              ', '0613380', '13', 'Proceso', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 46126931, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46126931.pdf'),
(1112, '73937269', '928010475', 'LUZLUCANA.20@GMAIL.COM', 'LUZNERID.DELA@minedu.edu.pe', 'DE LA TORRE                        ', 'VELASQUEZ                          ', 'LUZ NERIDA                    ', '1558436', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73937269, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73937269.pdf'),
(1113, '72304898', '936614546', 'HAYDEESTALLACALISAYA@GMAIL.COM', 'HAYDE.ESTALLACALI@minedu.edu.pe', 'ESTALLA                            ', 'CALISAYA                           ', 'HAYDE                         ', '1558469', '13', 'Proceso', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 72304898, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72304898.pdf'),
(1114, '74730731', '919055424', 'FLORESZ30129@GMAIL.COM', 'ZELENIMILAG.FLORESQUEV@minedu.edu.pe', 'FLORES                             ', 'QUEVEDO                            ', 'ZELENI MILAGROS.              ', '0719021', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 74730731, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74730731.pdf'),
(1115, '73058184', '995259186', 'M23_CRAZY@HOTMAIL.COM', 'MARGARITA.GAMBOAGIRA@minedu.edu.pe', 'GAMBOA                             ', 'GIRALDO                            ', 'MARGARITA                     ', '1589241', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73058184, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73058184.pdf'),
(1116, '41744701', '950998673', 'GIOMARGUTIERREZPEREZ@GMAIL.COM', 'GIOMARROSAR.GUTIERREZPERE@minedu.edu.pe', 'GUTIERREZ                          ', 'PEREZ                              ', 'GIOMAR ROSARIO                ', '1589134', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 41744701, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41744701.pdf'),
(1117, '07858432', '988739239', 'ELIZABETHLOPEZSANTILLAN@GMAIL.COM', 'ELIZABETHTERES.LOPEZSANT@minedu.edu.pe', 'LOPEZ                              ', 'SANTILLAN                          ', 'ELIZABETH TERESA              ', '0571059', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 7858432, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '07858432.pdf'),
(1118, '45846129', '935207246', 'LOVON_17@HOTMAIL.COM', 'ERIKAODALI.LOVONQUIS@minedu.edu.pe', 'LOVON                              ', 'QUISPE                             ', 'ERIKA ODALIZ                  ', '0259655', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 45846129, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45846129.pdf'),
(1119, '15722453', '955459950', 'chavezmoy2210@hotmail.com', 'carmen.moyc@minedu.edu.pe', 'MOY                                ', 'CHAVEZ                             ', 'CARMEN ZORAIDA                ', '1796754', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 48, 'Logrado', 1, 15722453, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '15722453.pdf'),
(1120, '76260199', '918990722', 'YULYCARRILLO98@GMAIL.COM', 'JULLISA.PEÑACARR@minedu.edu.pe', 'PEÑA                               ', 'CARRILLO                           ', 'JULLISA                       ', '0674721', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76260199, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76260199.pdf'),
(1121, '70559527', '964009411', 'HMITZI_2096@HOTMAIL.COM', 'HEIDIMITZI.QUISPEQUIJ@minedu.edu.pe', 'QUISPE                             ', 'QUIJANO                            ', 'HEIDI MITZI                   ', '1516723', '16', 'Suficiente', 'Calificado', '26', 'Proceso', 'Calificado', 60, 'Destacado', 1, 70559527, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70559527.pdf'),
(1122, '71412133', '976649839', 'OLGAQUIVIO112@GMAIL.COM', 'OLGA.QUIVIOCONT@minedu.edu.pe', 'QUIVIO                             ', 'CONTRERAS                          ', 'OLGA                          ', '1589142', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71412133, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71412133.pdf'),
(1123, '71410938', '926443326', 'SOBEIDARIVERACALDERON8@GMAIL.COM', 'SOBEIDA.RIVERACALD@minedu.edu.pe', 'RIVERA                             ', 'CALDERON                           ', 'SOBEIDA                       ', '0259903', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71410938, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71410938.pdf'),
(1124, '41088843', '927074812', 'yorival08@gmail.com', 'YOVANA.RIVERAVALE@minedu.edu.pe', 'RIVERA                             ', 'VALENCIA                           ', 'YOVANA                        ', '0259655', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 41088843, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41088843.pdf'),
(1125, '73055667', '939666213', 'SUAREZCAMPOSESTELA@GMAIL.COM', 'ESTELA.SUAREZCAMP@minedu.edu.pe', 'SUAREZ                             ', 'CAMPOS                             ', 'ESTELA                        ', '1558436', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 73055667, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73055667.pdf'),
(1126, '07751050', '957238279', 'mary18563@hotmail.com', 'MARIAROSA.SUAREZCARB@minedu.edu.pe', 'SUAREZ                             ', 'CARBAJAL                           ', 'MARIA ROSA                    ', '0259655', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 7751050, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '07751050.pdf'),
(1127, '71833154', '944185873', 'chari.onepiece@gmail.com', 'YESSICARUT.UCHARICOITUS@minedu.edu.pe', 'UCHARICO                           ', 'ITUSACA                            ', 'YESSICA RUT                   ', '1589142', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71833154, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71833154.pdf'),
(1128, '03506305', '917476350', 'beti_2332@hotmail.com', 'BEATRIZ.CASTILLOMEDI@minedu.edu.pe', 'CASTILLO                           ', 'MEDINA                             ', 'BEATRIZ                       ', '0675017', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 3506305, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03506305.pdf'),
(1129, '80318933', '986253286', 'emilsen00.7@hotmail.com', 'EMILSENCAROL.DAVILASILV@minedu.edu.pe', 'DAVILA                             ', 'SILVA                              ', 'EMILSEN CAROLINA              ', '0260679', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 80318933, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80318933.pdf'),
(1130, '30427832', '978430999', 'CAMILAHUANCOLLOFALCON@GMAIL.COM', 'FLORROCIO.FALCONMEJI@minedu.edu.pe', 'FALCON                             ', 'MEJIA                              ', 'FLOR ROCIO                    ', '0675017', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 30427832, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '30427832.pdf'),
(1131, '47475650', '954877422', 'bty0617@gmail.com', 'betty.fiestaspi@minedu.edu.pe', 'FIESTAS                            ', 'PILCO                              ', 'BETTY HILDARA                 ', '0260679', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47475650, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47475650.pdf'),
(1132, '48383855', '945444098', 'WENGARCIAHUAMAN@GMAIL.COM', 'WENDYPAMEL.GARCIAHUAM@minedu.edu.pe', 'GARCIA                             ', 'HUAMAN                             ', 'WENY PAMELA                   ', '0260679', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 48383855, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48383855.pdf'),
(1133, '73277451', '955058690', 'MARIADELMAR.IBARRA@GMAIL.COM', 'MARIADEL.IBARRAGARC@minedu.edu.pe', 'IBARRA                             ', 'GARCIA                             ', 'MARIA DEL MAR                 ', '0260695', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 73277451, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73277451.pdf'),
(1134, '45243025', '997322008', 'JOELLANDA1005@GMAIL.COM', 'JOSEJOEL.LANDASIAN@minedu.edu.pe', 'LANDA                              ', 'SIANCAS                            ', 'JOSE JOEL                     ', '0260679', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45243025, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45243025.pdf'),
(1135, '73130950', '987676979', 'DENN_13_3@HOTMAIL.COM', 'DENNISJUNIO.MORENOPURI@minedu.edu.pe', 'MORENO                             ', 'PURIZACA                           ', 'DENNIS JUNIOR                 ', '0260679', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 73130950, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73130950.pdf'),
(1136, '16803165', '986757537', 'jeshaynub@hotmail.com', 'JESSICAHAYDE.NUÑEZBENA@minedu.edu.pe', 'NUÑEZ                              ', 'BENAVIDEZ                          ', 'JESSICA HAYDE                 ', '0354134', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16803165, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16803165.pdf'),
(1137, '42184027', '941951640', 'GIANNINA2405@HOTMAIL.COM', 'GIANNINALIZBE.PALOMINOINFA@minedu.edu.pe', 'PALOMINO                           ', 'INFANTE                            ', 'GIANNINA LIZBET               ', '0260653', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 42184027, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42184027.pdf'),
(1138, '03872842', '944300584', 'karinapantag@gmail.com', 'SILVIAKARIN.PANTAGUTI@minedu.edu.pe', 'PANTA                              ', 'GUTIERREZ                          ', 'SILVIA KARINA                 ', '0675017', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 3872842, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03872842.pdf'),
(1139, '46089849', '912220807', 'solisordinolasheyla@gmail.com', 'SHEYLAAZUCE.SOLISORDI@minedu.edu.pe', 'SOLIS                              ', 'ORDINOLA                           ', 'SHEYLA AZUCENA                ', '0675017', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46089849, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46089849.pdf'),
(1140, '21878096', '971361576', 'esoteloq@gmail.com', 'EMILIANASOLED.SOTELOQUIS@minedu.edu.pe', 'SOTELO                             ', 'QUISPE                             ', 'EMILIANA SOLEDAD              ', '0354134', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 21878096, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '21878096.pdf'),
(1141, '73101989', '929596842', 'sandra.yuleisi.03@gmail.com', 'SANDRAYULEI.SULLONAVIL@minedu.edu.pe', 'SULLON                             ', 'AVILA                              ', 'SANDRA YULEISI                ', '0260679', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 73101989, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73101989.pdf'),
(1142, '48554760', '995004488', 'yessy26_3@hotmail.com', 'YESICA.VALENTINTORR@minedu.edu.pe', 'VALENTIN                           ', 'TORRES                             ', 'YESICA                        ', '0675017', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48554760, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48554760.pdf'),
(1143, '03691086', '945562992', 'MARYA-2306@HOTMAIL.COM', 'MIRTHAMARIB.YACILACAÑO@minedu.edu.pe', 'YACILA                             ', 'CAÑOLA                             ', 'MIRTHA MARIBEL                ', '0354134', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 3691086, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03691086.pdf'),
(1144, '41053993', '968386981', 'osbita@hotmail.com', 'AUSBERTINA.ALVAREZAGUI@minedu.edu.pe', 'ALVAREZ                            ', 'AGUILAR                            ', 'AUSBERTINA                    ', '0352039', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41053993, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41053993.pdf'),
(1145, '42240595', '960495089', 'YENNYANGHELINACASTILLOJARA@GMAIL.COM', 'YENNYANGHE.CASTILLOJARA@minedu.edu.pe', 'CASTILLO                           ', 'JARA                               ', 'YENNY ANGHELINA               ', '0492702', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42240595, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42240595.pdf'),
(1146, '45542065', '923456638', 'janethchambicastelo@gmail.com', 'JANETH.CHAMBICAST@minedu.edu.pe', 'CHAMBI                             ', 'CASTELO                            ', 'JANETH                        ', '0352088', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 45542065, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45542065.pdf'),
(1147, '44792849', '939799456', 'ROSARIOEZZA@GMAIL.COM', 'ROSARIODEL.ESPINOZAZAPA@minedu.edu.pe', 'ESPINOZA                           ', 'ZAPATA                             ', 'ROSARIO DEL PILAR             ', '0350132', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 44792849, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44792849.pdf'),
(1149, '20106956', '974845821', 'HONVERJE@GMAIL.COM', 'candelario.honoriov@minedu.edu.pe', 'HONORIO                            ', 'VERA                               ', 'CANDELARIO DE JESUS           ', '0352013', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 20106956, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '20106956.pdf'),
(1150, '43538392', '950863598', 'profcondori@hotmail.com', 'DAVIDALBER.HUANACUNICOND@minedu.edu.pe', 'HUANACUNI                          ', 'CONDORI                            ', 'DAVID ALBERTO                 ', '0493908', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 43538392, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43538392.pdf'),
(1151, '43551619', '966519767', 'elsavictoria1973@hotmail.com', 'ELSAVICTO.LANZAMACH@minedu.edu.pe', 'LANZA                              ', 'MACHACA                            ', 'ELSA VICTORIA                 ', '0352088', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 43551619, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43551619.pdf'),
(1152, '41221992', '953262254', 'capricornio_82_26@hotmail.com', 'SANDYROSAL.LIZANOUMBO@minedu.edu.pe', 'LIZANO                             ', 'UMBO                               ', 'SANDY ROSALIN                 ', '0352096', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41221992, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'No', 2, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41221992.pdf'),
(1154, '16789454', '920266247', 'dorisnanfu@hotmail.com', 'DORISDEL.NANFUÑAYBARR@minedu.edu.pe', 'NANFUÑAY                           ', 'BARRIOS                            ', 'DORIS DEL CARMEN              ', '0688788', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 16789454, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16789454.pdf'),
(1157, '43698528', '985273346', 'silvia_nqp@hotmail.com', 'SILVIANATAL.QUISPEPHAL@minedu.edu.pe', 'QUISPE                             ', 'PHALA                              ', 'SILVIA NATALY                 ', '0352088', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43698528, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43698528.pdf'),
(1158, '46223313', '958875010', 'elevi_4@hotmail.com', 'GLEDYYUSUN.ROJASHOYO@minedu.edu.pe', 'ROJAS                              ', 'HOYOS                              ', 'GLEDY YUSUNY                  ', '0350207', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 48, 'Logrado', 1, 46223313, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46223313.pdf'),
(1159, '44104546', '918311864', 'SALOMONTARRILLOTORRES5@GMAIL.COM', 'SALOMÓN.TARRILLOTORR@minedu.edu.pe', 'TARRILLO                           ', 'TORRES                             ', 'SALOMÓN                       ', '1136704', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44104546, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44104546.pdf'),
(1160, '73132594', '945240057', 'patricia.yarlequeipanaque@gmail.com', 'PATRICIAATALI.YARLEQUEIPAN@minedu.edu.pe', 'YARLEQUE                           ', 'IPANAQUE                           ', 'PATRICIA ATALIA DEL ROCIO     ', '0350207', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73132594, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73132594.pdf'),
(1161, '40260220', '972613921', 'fernandopis@hotmail.com', 'LUISFERNA.AGUILARREYE@minedu.edu.pe', 'AGUILAR                            ', 'REYES                              ', 'LUIS FERNANDO                 ', '0720003', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 40260220, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40260220.pdf'),
(1162, '18143039', '978364901', 'ROXANBP@GMAIL.COM', 'ROXANAELIZA.BARRETOPEÑA@minedu.edu.pe', 'BARRETO                            ', 'PEÑA                               ', 'ROXANA ELIZABETH              ', '0356048', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18143039, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18143039.pdf'),
(1163, '71967277', '971440737', 'JOSEANDERSONBRAVOROJAS95@GMAIL.COM', 'JOSÉANDER.BRAVOROJA@minedu.edu.pe', 'BRAVO                              ', 'ROJAS                              ', 'JOSÉ ANDERSON                 ', '1308071', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 71967277, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71967277.pdf'),
(1164, '71886839', '927272005', '27CADEALHEX@GMAIL.COM', 'alex.cadenillasg@minedu.edu.pe', 'CADENILLAS                         ', 'GALVEZ                             ', 'ALEX YOVER                    ', '1539014', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 71886839, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71886839.pdf'),
(1165, '43320749', '952417338', 'edycap.jft@gmail.com', 'EDGAR.CAPQUEQUICAPQ@minedu.edu.pe', 'CAPQUEQUI                          ', 'CAPQUEQUI                          ', 'EDGAR                         ', '0356030', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 43320749, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43320749.pdf'),
(1166, '41595971', '985525527', 'ISABELCRISTINACELIZAPATA@GMAIL.COM', 'ISABELCRIST.CELIZAPA@minedu.edu.pe', 'CELI                               ', 'ZAPATA                             ', 'ISABEL CRISTINA               ', '0576819', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 41595971, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41595971.pdf'),
(1167, '44564765', '920008261', 'WILSONCHAVEZLUCANO@GMAIL.COM', 'WILSON.CHAVEZLUCA@minedu.edu.pe', 'CHAVEZ                             ', 'LUCANO                             ', 'WILSON                        ', '0356626', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 44564765, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44564765.pdf'),
(1168, '40692410', '963028583', 'pctcarla_2003@hotmail.com', 'carla.cruzt@minedu.edu.pe', 'CRUZ                               ', 'TIMOTEO                            ', 'CARLA PAOLA                   ', '0356246', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 40692410, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40692410.pdf'),
(1169, '71781437', '995867181', 'LIZ1996DIOS@HOTMAIL.COM', 'TATIANALIZ.DIOSCHIR@minedu.edu.pe', 'DIOS                               ', 'CHIRINOS                           ', 'TATIANA LIZ                   ', '0591313', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 71781437, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71781437.pdf'),
(1170, '42745979', '918851548', 'JUELDIVA24@GMAIL.COM', 'JULIAELIZA.DIOSESVALL@minedu.edu.pe', 'DIOSES                             ', 'VALLADARES                         ', 'JULIA ELIZABETH               ', '0327452', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 42745979, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42745979.pdf'),
(1171, '43419605', '965828262', 'KMORALESN77@GMAIL.COM', 'KARLAVANES.MORALESNIZA@minedu.edu.pe', 'MORALES                            ', 'NIZAMA                             ', 'KARLA VANESSA                 ', '1207901', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 43419605, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43419605.pdf'),
(1173, '44945371', '942997680', 'pedroricardo1988@hotmail.com', 'PEDRORICAR.VIERACAST@minedu.edu.pe', 'VIERA                              ', 'CASTILLO                           ', 'PEDRO RICARDO                 ', '0356261', '', '', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 44945371, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44945371.pdf'),
(1174, '42547440', '939481977', 'ajym84@gmail.com', 'anthony.yarlequem@minedu.edu.pe', 'YARLEQUE                           ', 'MATICORENA                         ', 'ANTHONY JOE                   ', '0356048', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42547440, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42547440.pdf'),
(1176, '42044434', '989221166', 'VICKYMARIBELAPAZA@GMAIL.COM', 'VIRGINIAMARIB.APAZAQUIS@minedu.edu.pe', 'APAZA                              ', 'QUISPE                             ', 'VIRGINIA MARIBEL              ', '0354316', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 42044434, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42044434.pdf'),
(1177, '42959327', '939698762', 'virginiabruncas22@gmail.com', 'MARIAVIRGI.BRUNOCAST@minedu.edu.pe', 'BRUNO                              ', 'CASTILLO                           ', 'MARIA VIRGINIA MERCEDES       ', '0260562', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42959327, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42959327.pdf'),
(1178, '42096558', '919646895', 'ROMICAMEL@HOTMAIL.COM', 'ROSARIOMILAG.CALEROMELG@minedu.edu.pe', 'CALERO                             ', 'MELGAR DE POLO                     ', 'ROSARIO MILAGROS              ', '0349795', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42096558, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42096558.pdf'),
(1179, '22302848', '949228087', 'doracruzado1203@hotmail.com', 'DORANICAS.CRUZADOGUTI@minedu.edu.pe', 'CRUZADO                            ', 'GUTIERREZ                          ', 'DORA NICASIA                  ', '0348664', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 22302848, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '22302848.pdf'),
(1180, '03652512', '975818513', 'auroragalvez2015@hotmail.com', 'aurora.galveza@minedu.edu.pe', 'GALVEZ                             ', 'ALVAREZ                            ', 'AURORA                        ', '0350736', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 3652512, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03652512.pdf'),
(1181, '43690151', '946531327', 'arielhj17@hotmail.com', 'MARIELLA.HIDALGOJARA@minedu.edu.pe', 'HIDALGO                            ', 'JARA                               ', 'MARIELLA                      ', '0260562', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 43690151, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43690151.pdf'),
(1182, '43341479', '961020206', 'clidy-huro@outlook.com', 'CLIDI.HUARCAYAROMA@minedu.edu.pe', 'HUARCAYA                           ', 'ROMAN                              ', 'CLIDI                         ', '0689232', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 43341479, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43341479.pdf'),
(1183, '03693534', '962085591', 'MERINORODRIGUEZMONICA0@GMAIL.COM', 'MONICADEL.MERINORODR@minedu.edu.pe', 'MERINO                             ', 'RODRIGUEZ                          ', 'MONICA DEL PILAR              ', '0835280', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 3693534, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03693534.pdf'),
(1184, '48397470', '900203052', 'zaydaortiz28@gmail.com', 'ZAYDARUTH.ORTIZROME@minedu.edu.pe', 'ORTIZ                              ', 'ROMERO                             ', 'ZAYDA RUTH                    ', '0354308', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48397470, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48397470.pdf'),
(1185, '43482666', '977248479', 'KPEALOPEZ@GMAIL.COM', 'KAROLIVONN.PEÑALOPE@minedu.edu.pe', 'PEÑA                               ', 'LOPEZ                              ', 'KAROL IVONNE                  ', '0490037', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43482666, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43482666.pdf'),
(1186, '41628309', '992314282', 'kathy_24_72@hotmail.com', 'KATHERINENILDA.PICKMANMALA@minedu.edu.pe', 'PICKMAN                            ', 'MALAGA DE OCHOA                    ', 'KATHERINE NILDA               ', '0350322', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41628309, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41628309.pdf'),
(1187, '80432105', '957922786', 'melissapozopintado@hotmail.com', 'KATTIEMELIS.POZOPINT@minedu.edu.pe', 'POZO                               ', 'PINTADO                            ', 'KATTIE MELISSA                ', '0348664', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 80432105, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80432105.pdf'),
(1188, '23991348', '983015610', 'NOELINOEMI111@GMAIL.COM', 'NOYMI.QUISPEQUIS@minedu.edu.pe', 'QUISPE                             ', 'QUISPE                             ', 'NOYMI                         ', '0354324', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 23991348, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '23991348.pdf'),
(1189, '73013570', '975606630', 'FIORELLAKASSANDRARAMOS@GMAIL.COM', 'FIORELLAKASSA.RAMOSJUAR@minedu.edu.pe', 'RAMOS                              ', 'JUAREZ                             ', 'FIORELLA KASSANDRA            ', '0490037', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 73013570, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73013570.pdf'),
(1190, '44592001', '988098466', 'CLAUDIA_T175@HOTMAIL.COM', 'claudia.torress@minedu.edu.pe', 'TORRES                             ', 'SUAREZ                             ', 'CLAUDIA VANESSA               ', '0348664', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44592001, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44592001.pdf'),
(1191, '40958264', '928899239', 'BERTHAZAPATA.RIS@GMAIL.COM', 'bertha.zapatari@minedu.edu.pe', 'ZAPATA                             ', 'RISCO                              ', 'BERTHA YANINA                 ', '0354894', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40958264, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40958264.pdf'),
(1192, '70295252', '920490620', 'mariacuario94@hotmail.com', 'MARIAELIZA.AGUILARQUIN@minedu.edu.pe', 'AQUILAR                            ', 'QUINTANA                           ', 'MARIA ELIZABETH               ', '1749118', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 70295252, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70295252.pdf'),
(1193, '45217730', '933872287', 'CUEVARODRIGUEZMARIBEL@GMAIL.COM', 'MARIBELYANEL.CUEVARODR@minedu.edu.pe', 'CUEVA                              ', 'RODRIGUEZ                          ', 'MARIBEL YANELY                ', '1749118', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 45217730, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45217730.pdf'),
(1194, '48158394', '931780755', 'viulitg@gmail.com', 'VIULIT.GARCIAREYE@minedu.edu.pe', 'GARCIA                             ', 'REYES                              ', 'VIULIT                        ', '0631283', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 48158394, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48158394.pdf'),
(1195, '70816883', '955188020', 'guzman0291@hotmail.com', 'GERALDINE.GUZMANCORT@minedu.edu.pe', 'GUZMAN                             ', 'CORTEZ                             ', 'GERALDINE                     ', '0697334', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70816883, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70816883.pdf'),
(1196, '71051790', '958438630', 'VANESSALUNA0519@GMAIL.COM', 'KATIAVANES.LUNAMEND@minedu.edu.pe', 'LUNA                               ', 'MENDOZA                            ', 'KATIA VANESSA                 ', '0690438', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 71051790, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71051790.pdf'),
(1197, '70978958', '946948961', 'yusaraa3@gmail.com', 'YUSARA.MARTINEZNUÑE@minedu.edu.pe', 'MARTINEZ                           ', 'NUÑEZ                              ', 'YUSARA                        ', '1749118', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70978958, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70978958.pdf'),
(1198, '70864087', '945248340', 'KARENLU3196@GMAIL.COM', 'KARENLUCIA.MENDOZAVEGA@minedu.edu.pe', 'MENDOZA                            ', 'VEGA                               ', 'KAREN LUCIA                   ', '1164664', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 70864087, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70864087.pdf'),
(1199, '18214658', '949489115', 'aryam12_05@hotmail.com', 'MAYRAARACE.MEZAAFA@minedu.edu.pe', 'MEZA                               ', 'AFA                                ', 'MAYRA ARACELI                 ', '0690438', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 18214658, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18214658.pdf'),
(1200, '48292747', '990573842', 'MARILURAMIREZ94@GMAIL.COM', 'MARILUROXAN.RAMIREZRAMI@minedu.edu.pe', 'RAMIREZ                            ', 'RAMIREZ                            ', 'MARILU ROXANA                 ', '0822171', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48292747, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48292747.pdf'),
(1201, '47191815', '949410104', 'anacely_rodriguez@hotmail.com', 'KARENANACE.RODRIGUEZAGUI@minedu.edu.pe', 'RODRIGUEZ                          ', 'AGUILAR                            ', 'KAREN ANACELI                 ', '0367565', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47191815, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47191815.pdf'),
(1202, '41891132', '959669774', 'FRANK.ROJASLUJAN@GMAIL.COM', 'FRANCISCOMIGUE.ROJASLUJA@minedu.edu.pe', 'ROJAS                              ', 'LUJAN                              ', 'FRANCISCO MIGUEL              ', '0367508', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41891132, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41891132.pdf'),
(1203, '44154793', '971243930', 'lucecita_23_03@hotmail.com', 'SUSYJACKE.ROJASRUIZ@minedu.edu.pe', 'ROJAS                              ', 'RUIZ                               ', 'SUSY JACKELINE                ', '0622878', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44154793, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44154793.pdf'),
(1204, '44844414', '938100096', 'spardeys_mirs1@hotmail.com', 'IRISDEISY.SALINASPARE@minedu.edu.pe', 'SALINAS                            ', 'PAREDES                            ', 'IRIS DEISY                    ', '0367565', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 44844414, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44844414.pdf'),
(1205, '44029808', '955707617', 'carmen.sanchezd86@gmail.com', 'carmen.sanchezdo@minedu.edu.pe', 'SANCHEZ                            ', 'DOMINGUEZ                          ', 'CARMEN EMPERATRIZ             ', '0631283', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44029808, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44029808.pdf'),
(1206, '72541095', '913198984', 'KJSANDOVALTOMAS@GMAIL.COM', 'KERLYJUDIT.SANDOVALTOMA@minedu.edu.pe', 'SANDOVAL                           ', 'TOMAS                              ', 'KERLY JUDITH                  ', '1272368', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 72541095, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72541095.pdf'),
(1207, '40334393', '991510201', 'vero_24xy@hotmail.com', 'VERONICA.SEGURAVERD@minedu.edu.pe', 'SEGURA                             ', 'VERDE                              ', 'VERONICA                      ', '1749118', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40334393, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40334393.pdf'),
(1208, '48021353', '945669572', 'judith_marilu8@hotmail.com', 'JUDITHMARIL.VARONHERN@minedu.edu.pe', 'VARON                              ', 'HERNANDEZ                          ', 'JUDITH MARILU                 ', '0622639', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48021353, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48021353.pdf'),
(1209, '07510489', '923532725', 'yeneamorinamao@gmail.com', 'YENEMARDO.AMORINAMAO@minedu.edu.pe', 'AMORIN                             ', 'AMAO                               ', 'YENE MARDONIA                 ', '1455773', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 7510489, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '07510489.pdf'),
(1210, '44745901', '903083891', 'ASCAMAROJAST@GMAIL.COM', 'MEYBOLTANEY.ASCAMAROJA@minedu.edu.pe', 'ASCAMA                             ', 'ROJAS                              ', 'MEYBOL TANEY                  ', '1685700', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44745901, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44745901.pdf'),
(1211, '00495047', '952663976', 'nanci_avalos@hotmail.com', 'NANCI.AVALOSNINA@minedu.edu.pe', 'AVALOS                             ', 'NINA                               ', 'NANCI                         ', '1456961', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 495047, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00495047.pdf'),
(1212, '42525837', '902001365', 'YEILIZCC@HOTMAIL.COM', 'LIJIAMAYRA.CALDERONQUIR@minedu.edu.pe', 'CALDERON                           ', 'QUIROZ                             ', 'LIJIA MAYRA JUDITH            ', '1683192', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42525837, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42525837.pdf'),
(1213, '41972553', '968251960', 'MARLENICS03@GMAIL.COM', 'MARLENI.CUETOSULC@minedu.edu.pe', 'CUETO                              ', 'SULCA                              ', 'MARLENI                       ', '1685528', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41972553, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41972553.pdf'),
(1214, '10353672', '972767414', 'yolandacurto2211@gmail.com', 'YOLANDAMARGA.CURTOCAST@minedu.edu.pe', 'CURTO                              ', 'CASTEL                             ', 'YOLANDA MARGARITA             ', '1582808', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 10353672, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10353672.pdf'),
(1215, '45986648', '940534566', 'CARITO_32_14@HOTMAIL.COM', 'NATHALYLISSE.DIAZHUAM@minedu.edu.pe', 'DIAZ                               ', 'HUAMAN                             ', 'NATHALY LISSET                ', '1589431', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45986648, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45986648.pdf'),
(1216, '15358401', '979740960', 'DIAZROMEROALEJANDRA73@GMAIL.COM', 'ALEJANDRA.DIAZROME@minedu.edu.pe', 'DIAZ                               ', 'ROMERO                             ', 'ALEJANDRA                     ', '1706746', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 15358401, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '15358401.pdf'),
(1217, '77069599', '915386943', '1996FERVERO@GMAIL.COM', 'VERONICA.FERNANDEZFERN@minedu.edu.pe', 'FERNANDEZ                          ', 'FERNANDEZ                          ', 'VERONICA                      ', '1618446', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 77069599, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77069599.pdf'),
(1218, '43596150', '964669941', 'MILAGROSLUJAN2019@HOTMAIL.COM', 'MILAGROSDEL.LUJANAPOL@minedu.edu.pe', 'LUJAN                              ', 'APOLINARIO                         ', 'MILAGROS DEL PILAR            ', '1456037', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43596150, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43596150.pdf'),
(1219, '42072576', '953428310', 'ROSAMAQUERAZAMBRANO@GMAIL.COM', 'ROSAELVIR.MAQUERAZAMB@minedu.edu.pe', 'MAQUERA                            ', 'ZAMBRANO                           ', 'ROSA ELVIRA                   ', '1455955', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42072576, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42072576.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(1220, '72461813', '970856278', 'LEMR1316@GMAIL.COM', 'LESLYELIZA.MUÑOZROJA@minedu.edu.pe', 'MUÑOZ                              ', 'ROJAS                              ', 'LESLY ELIZABETH               ', '1427426', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72461813, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72461813.pdf'),
(1221, '42447092', '970761175', 'lisbethmariel120026@gmail.com', 'LIZBETHMARIE.PISCCOBARR@minedu.edu.pe', 'PISCCO                             ', 'BARRIENTOS                         ', 'LIZBETH MARIEL                ', '1456037', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42447092, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42447092.pdf'),
(1222, '41971965', '973986775', 'daysi_ronceros3@outlook.com', 'DAYSIAMELI.RONCEROSCASM@minedu.edu.pe', 'RONCEROS                           ', 'CASMA DE SILVA                     ', 'DAYSI AMELIA                  ', '1683192', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41971965, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41971965.pdf'),
(1223, '43980041', '960359205', 'cynthiasergar@gmail.com', 'CYNTHIAJAKEL.SERNAQUEGARC@minedu.edu.pe', 'SERNAQUE                           ', 'GARCIA                             ', 'CYNTHIA JAKELINE              ', '1455955', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43980041, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43980041.pdf'),
(1224, '43868704', '957942004', 'BLANCA_ATR@HOTMAIL.COM', 'BLANCAANGEL.TANTAROJA@minedu.edu.pe', 'TANTA                              ', 'ROJAS                              ', 'BLANCA ANGELA                 ', '1456953', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43868704, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43868704.pdf'),
(1225, '09452273', '942418753', 'mapimaira@hotmail.com', 'PATRICIAJUANA.TERRAZOSYANC@minedu.edu.pe', 'TERRAZOS                           ', 'YANCE                              ', 'PATRICIA JUANA                ', '0630830', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 9452273, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09452273.pdf'),
(1226, '43574167', '961781463', 'CAMELHI6@GMAIL.COM', 'MELINALAURA.VALLADARESGONZ@minedu.edu.pe', 'VALLADARES                         ', 'GONZALES                           ', 'MELINA LAURA                  ', '1456920', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43574167, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43574167.pdf'),
(1227, '41266043', '921722845', 'vivita333@hotmail.com', 'VIVIANA.BARAZORDACALD@minedu.edu.pe', 'BARAZORDA                          ', 'CALDERON                           ', 'VIVIANA                       ', '1648781', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 41266043, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41266043.pdf'),
(1228, '42814157', '938166050', 'e_ruty19@hotmail.com', 'RUTHELIZA.BERECHEGORD@minedu.edu.pe', 'BERECHE                            ', 'GORDILLO                           ', 'RUTH ELIZABETH                ', '1560739', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42814157, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42814157.pdf'),
(1229, '41083845', '956359686', 'MARIELBERP@GMAIL.COM', 'MARIALUCIL.BERRIOSPARE@minedu.edu.pe', 'BERRIOS                            ', 'PAREDES                            ', 'MARIA LUCILA                  ', '1560879', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41083845, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41083845.pdf'),
(1230, '75503497', '961020909', 'BUSTAMANTEGAMARRAYAJAIRA5@GMAIL.COM', 'YAJAIRAYSABE.BUSTAMANTEGAMA@minedu.edu.pe', 'BUSTAMANTE                         ', 'GAMARRA                            ', 'YAJAIRA YSABEL                ', '1775105', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 75503497, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75503497.pdf'),
(1231, '73204899', '945712751', 'fiorellakatty_@hotmail.com', 'FIORELLAKATHE.CABALLEROHUAM@minedu.edu.pe', 'CABALLERO                          ', 'HUAMAN                             ', 'FIORELLA KATHERINE            ', '1096734', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73204899, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73204899.pdf'),
(1232, '70290037', '951090910', 'anarodrig175@gmail.com', 'ROXANA.COLQUEHUANCARODR@minedu.edu.pe', 'COLQUEHUANCA                       ', 'RODRIGO                            ', 'ROXANA                        ', '1560754', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70290037, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70290037.pdf'),
(1233, '41568993', '993775614', 'MARIAISABEL41568993@GMAIL.COM', 'MARIAISABE.GONZALESSALA@minedu.edu.pe', 'GONZALES                           ', 'SALAS                              ', 'MARIA ISABEL                  ', '2636317', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41568993, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41568993.pdf'),
(1234, '00249485', '943129588', 'J-ROSIELENA@HOTMAIL.COM', 'ROSAELENA.JUAREZPASA@minedu.edu.pe', 'JUAREZ                             ', 'PASACHE                            ', 'ROSA ELENA                    ', '1566231', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 249485, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00249485.pdf'),
(1235, '76839828', '951167240', 'rocio.purca@gmail.com', 'ROCIODEL.MAMANIPURC@minedu.edu.pe', 'MAMANI                             ', 'PURCA                              ', 'ROCIO DEL PILAR               ', '1560754', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 76839828, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76839828.pdf'),
(1236, '48617808', '913373294', 'rosita_17_lugasi@hotmail.com', 'SHIRILEYSONROSIT.MANYARIVIVA@minedu.edu.pe', 'MANYARI                            ', 'VIVAS                              ', 'SHIRILEYSON ROSITA            ', '1746247', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 48617808, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48617808.pdf'),
(1237, '41244277', '987100611', 'paolinibe5@hotmail.com', 'PAOLALISSE.NIEVESBERN@minedu.edu.pe', 'NIEVES                             ', 'BERNAL                             ', 'PAOLA LISSET                  ', '1560960', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41244277, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41244277.pdf'),
(1238, '47353597', '939938626', 'JARELYOC2@GMAIL.COM', 'MONICASUSAN.ORDOÑEZCISN@minedu.edu.pe', 'ORDOÑEZ                            ', 'CISNEROS                           ', 'MONICA SUSANA                 ', '1746205', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47353597, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47353597.pdf'),
(1239, '41073961', '968002351', 'rossmeryotero.07@hotmail.com', 'ROSSMERY.OTEROCIEN@minedu.edu.pe', 'OTERO                              ', 'CIENFUEGOS                         ', 'ROSSMERY                      ', '0938738', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41073961, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41073961.pdf'),
(1240, '45608890', '959874853', 'ROMYCOQUETA_18@HOTMAIL.COM', 'ROSMERYIVETH.PUPUCHECUEV@minedu.edu.pe', 'PUPUCHE                            ', 'CUEVA                              ', 'ROSMERY IVETH                 ', '1096411', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45608890, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45608890.pdf'),
(1241, '42356132', '963679898', 'quicadi@outlook.com', 'JUANA.QUIÑONESCCAS@minedu.edu.pe', 'QUIÑONES                           ', 'CCASA                              ', 'JUANA                         ', '1560796', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42356132, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42356132.pdf'),
(1242, '71958455', '929048913', 'yesicaquispe71958455@gmail.com', 'YESICA.QUISPECAYL@minedu.edu.pe', 'QUISPE                             ', 'CAYLLAHUA                          ', 'YESICA                        ', '1561018', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 71958455, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71958455.pdf'),
(1243, '42274900', '934920480', 'SUAREZCHANDUVIFABIOLA@GMAIL.COM', 'FABIOLA.SUAREZCHAN@minedu.edu.pe', 'SUAREZ                             ', 'CHANDUVI                           ', 'FABIOLA                       ', '1680867', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42274900, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42274900.pdf'),
(1244, '40784094', '979675528', 'LUZ290580@GMAIL.COM', 'MARIALUZ.AGUILARVIGO@minedu.edu.pe', 'AGUILAR                            ', 'VIGO                               ', 'MARIA LUZ                     ', '0342568', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 40784094, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40784094.pdf'),
(1245, '03369783', '978567125', 'rociocunamas@gmail.com', 'ROCIODEL.ATARAMAESCO@minedu.edu.pe', 'ATARAMA                            ', 'ESCOBAR                            ', 'ROCIO DEL PILAR               ', '0342535', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 3369783, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03369783.pdf'),
(1247, '41038357', '942906417', 'elviraisabelcahuana@gmail.com', 'ELVIRAISABE.CAHUANAPUZA@minedu.edu.pe', 'CAHUANA                            ', 'PUZAGLIA                           ', 'ELVIRA ISABEL                 ', '0849018', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 41038357, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41038357.pdf'),
(1248, '42253499', '973130185', 'karina_cat26@hotmail.com', 'ELIZABETHKARIN.CHALCOCATC@minedu.edu.pe', 'CHALCO                             ', 'CATCOPARCO                         ', 'ELIZABETH KARINA              ', '0349415', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 42253499, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42253499.pdf'),
(1249, '17896122', '950631694', 'CRISBE_82@HOTMAIL.COM', 'CRISTINABEATR.CHERRESCALD@minedu.edu.pe', 'CHERRES                            ', 'CALDERON                           ', 'CRISTINA BEATRIZ              ', '0351387', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 17896122, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17896122.pdf'),
(1250, '40851096', '921410838', 'ESPERANZAVASQUEZ100481@GMAIL.COM', 'MIRIANESPER.DIAZVASQ@minedu.edu.pe', 'DIAZ                               ', 'VASQUEZ                            ', 'MIRIAN ESPERANZA              ', '0674184', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 40851096, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40851096.pdf'),
(1251, '41816167', '969833435', 'lindauratinoco29@outlook.com', 'LINDAURA.MADRIDTINO@minedu.edu.pe', 'MADRID                             ', 'TINOCO                             ', 'LINDAURA                      ', '0349373', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 41816167, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41816167.pdf'),
(1253, '40491848', '944673365', 'rapa_30@hotmail.com', 'RAULALEJA.PENADILLOARQU@minedu.edu.pe', 'PENADILLO                          ', 'ARQUINIGO                          ', 'RAUL ALEJANDRO                ', '0342576', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 40491848, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40491848.pdf'),
(1255, '42735594', '921770411', 'denisse_rodriguezc@outlook.com', 'DENISSECARMI.RODRIGUEZCAST@minedu.edu.pe', 'RODRIGUEZ                          ', 'CASTAÑEDA                          ', 'DENISSE CARMINA               ', '0349381', '', '', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 42735594, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42735594.pdf'),
(1256, '41635620', '968115223', 'girupa25@hotmail.com', 'GIANNINA.RUIZPALA@minedu.edu.pe', 'RUIZ                               ', 'PALACIOS                           ', 'GIANNINA                      ', '0342527', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 41635620, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41635620.pdf'),
(1257, '44731153', '955093422', 'NATALIA18_97@OUTLOOK.ES', 'RAQUELNATAL.SANTACRUZ@minedu.edu.pe', 'SANTA CRUZ                         ', 'SUAREZ                             ', 'RAQUEL NATALY                 ', '0354092', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 44731153, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44731153.pdf'),
(1258, '73205506', '922013186', 'noelia07.1994@gmail.com', 'NOELIAKARIN.SILVACHUI@minedu.edu.pe', 'SILVA                              ', 'CHUICA                             ', 'NOELIA KARIN                  ', '0342568', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 73205506, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73205506.pdf'),
(1259, '41961415', '943787461', 'gina_any@hotmail.com', 'GINAJACKE.TORRESCORD@minedu.edu.pe', 'TORRES                             ', 'CORDOVA                            ', 'GINA JACKELINE                ', '0342485', '', '', 'Sin Calificar', '', '', 'Calificado', 56, 'Destacado', 1, 41961415, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41961415.pdf'),
(1260, '75457172', '964470666', 'ISABEL.071196@GMAIL.COM', 'MIRELLAISABE.CAICEDOSANC@minedu.edu.pe', 'CAICEDO                            ', 'SANCHEZ                            ', 'MIRELLA ISABEL                ', '1588235', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 75457172, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75457172.pdf'),
(1261, '09586087', '936279821', 'eufe2011@hotmail.com', 'EUFEMIA.CONDORIQUIS@minedu.edu.pe', 'CONDORI                            ', 'QUISPE                             ', 'EUFEMIA                       ', '1560028', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 9586087, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09586087.pdf'),
(1262, '70355936', '925466747', 'XENA64715@GMAIL.COM', 'VANESSAXENA.DELCAST@minedu.edu.pe', 'DEL CASTILLO                       ', 'COTRINA                            ', 'VANESSA XENA                  ', '1588326', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70355936, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70355936.pdf'),
(1263, '44492641', '977439104', 'FLORVIOLETAFC@GMAIL.COM', 'FLORVIOLE.FLORESCARR@minedu.edu.pe', 'FLORES                             ', 'CARRILLO                           ', 'FLOR VIOLETA                  ', '0571935', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44492641, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44492641.pdf'),
(1264, '46368636', '933455797', 'johanna_mrg2@hotmail.com', 'JOHANNAYLSSY.HERNANDEZMART@minedu.edu.pe', 'HERNANDEZ                          ', 'MARTINEZ                           ', 'JOHANNA YLSSY                 ', '1587047', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46368636, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46368636.pdf'),
(1265, '41844886', '972621906', 'drinaromero_777@outlook.es', 'MARIAALEJA.JARAROME@minedu.edu.pe', 'JARA                               ', 'ROMERO                             ', 'MARIA ALEJANDRINA             ', '1587047', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41844886, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41844886.pdf'),
(1266, '70360801', '920044672', 'juarezgastuloclaudia@gmail.com', 'claudia.juarezga@minedu.edu.pe', 'JUAREZ                             ', 'GASTULO                            ', 'CLAUDIA ELIZABETH             ', '1649201', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70360801, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70360801.pdf'),
(1267, '76581563', '927602562', 'YOHIIPURISACA@GMAIL.COM', 'brenilda.purisacar@minedu.edu.pe', 'PURISACA                           ', 'RAMIREZ                            ', 'BRENILDA YOHANNI              ', '1649185', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 76581563, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76581563.pdf'),
(1268, '74209072', '970544263', 'chelito_14_17@hotmail.com', 'MARTHABEATR.SAAVEDRALLUÉ@minedu.edu.pe', 'SAAVEDRA                           ', 'LLUÉN                              ', 'MARTHA BEATRIZ                ', '1649235', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 74209072, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74209072.pdf'),
(1269, '44562390', '929597991', 'sandia_graciela87@hotmail.com', 'GRACIELA.SANDIAAJAH@minedu.edu.pe', 'SANDIA                             ', 'AJAHUANA                           ', 'GRACIELA                      ', '1560044', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44562390, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44562390.pdf'),
(1270, '70058484', '947448473', 'erikalizbethsucasacasanca@gmail.com', 'ERIKALIZBE.SUCASACASANC@minedu.edu.pe', 'SUCASACA                           ', 'SANCA                              ', 'ERIKA LIZBETH                 ', '1714211', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70058484, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70058484.pdf'),
(1271, '46616951', '941259510', 'luzmaria27123@hotmail.com', 'LUZMARIN.TORRESNINA@minedu.edu.pe', 'TORRES                             ', 'NINAHUILLCA                        ', 'LUZ MARINA                    ', '1575455', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 46616951, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46616951.pdf'),
(1272, '42388056', '945199847', 'marivl_1@hotmail.com', 'MARIAMAGDA.VARONALEYV@minedu.edu.pe', 'VARONA                             ', 'LEYVA                              ', 'MARIA MAGDALENA               ', '0673632', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42388056, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42388056.pdf'),
(1273, '44307628', '993017881', 'mavi1709@hotmail.com', 'MARIADEL.VILLEGASRODR@minedu.edu.pe', 'VILLEGAS                           ', 'RODRIGUEZ                          ', 'MARIA DEL ROSARIO             ', '0629253', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44307628, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44307628.pdf'),
(1274, '21819327', '956584461', 'teresa_11.223@hotmail.com', 'OLGATERES.YALLEROND@minedu.edu.pe', 'YALLE                              ', 'RONDON                             ', 'OLGA TERESA                   ', '1559996', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 21819327, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '21819327.pdf'),
(1275, '72714221', '983635184', 'mari16_sagitario@hotmail.com', 'MARIANELLADEL.ZAMORAVIDA@minedu.edu.pe', 'ZAMORA                             ', 'VIDARTE                            ', 'MARIANELLA DEL ROSARIO        ', '0719518', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 72714221, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72714221.pdf'),
(1276, '44733326', '952472730', 'jhuvyanmar@hotmail.com', 'JUDITHVICTO.ANTONMARC@minedu.edu.pe', 'ANTON                              ', 'MARCIAL                            ', 'JUDITH VICTORIA               ', '0614149', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44733326, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44733326.pdf'),
(1277, '46626854', '957400149', 'ANYBJ.PIA@GMAIL.COM', 'ana.belloj@minedu.edu.pe', 'BELLO                              ', 'JIMENEZ                            ', 'ANA RITA                      ', '1018027', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46626854, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46626854.pdf'),
(1278, '45510635', '947803865', 'SHIRLEYCHAVEZRAMIREZ5@GMAIL.COM', 'SHIRLEYJACKE.CHAVEZRAMI@minedu.edu.pe', 'CHAVEZ                             ', 'RAMIREZ                            ', 'SHIRLEY JACKELINY             ', '0627026', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45510635, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45510635.pdf'),
(1279, '48140108', '948292549', 'patriciaflorecinalcala@gmail.com', 'PATRICIADIANA.FLORECINALCA@minedu.edu.pe', 'FLORECIN                           ', 'ALCALÁ                             ', 'PATRICIA DIANA                ', '1588367', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48140108, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48140108.pdf'),
(1280, '72096106', '917843794', 'HERMELINDAGARCIA_18@HOTMAIL.COM', 'HERMELINDA.GARCIACONC@minedu.edu.pe', 'GARCIA                             ', 'CONCHA                             ', 'HERMELINDA                    ', '1237999', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72096106, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72096106.pdf'),
(1281, '44885187', '951122849', 'VG134938@GMAIL.COM', 'VIVIANAPATRI.GUZMANCOND@minedu.edu.pe', 'GUZMAN                             ', 'CONDORI                            ', 'VIVIANA PATRICIA              ', '0718817', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44885187, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44885187.pdf'),
(1282, '80474547', '910913763', 'MARLIPANAQUE04@GMAIL.COM', 'YOVANIMARLE.IPANAQUECOVE@minedu.edu.pe', 'IPANAQUE                           ', 'COVEÑAS                            ', 'YOVANI MARLENI                ', '1237999', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 80474547, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80474547.pdf'),
(1283, '75465593', '945811342', 'ROMI-LIBRA17@HOTMAIL.COM', 'SANDRAROMIN.JIMENEZRIVE@minedu.edu.pe', 'JIMENEZ                            ', 'RIVERA                             ', 'SANDRA ROMINA                 ', '1419498', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75465593, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75465593.pdf'),
(1284, '41910792', '943591321', 'YENMY_28@HOTMAIL.COM', 'YENMYELIZA.LEONVILL@minedu.edu.pe', 'LEÓN                               ', 'VILLAR DE RIOS                     ', 'YENMY ELIZABETH               ', '1715804', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41910792, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41910792.pdf'),
(1285, '76477222', '959732817', 'THALY_30_26@HOTMAIL.COM', 'alondra.medinad@minedu.edu.pe', 'MEDINA                             ', 'DIAZ                               ', 'ALONDRA THALIA                ', '1236835', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 76477222, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76477222.pdf'),
(1286, '72781813', '981619317', 'MISSJULEIZI18@GMAIL.COM', 'JULEIZISUSIR.MORALESCAST@minedu.edu.pe', 'MORALES                            ', 'CASTILLO                           ', 'JULEIZI SUSIRE                ', '1017961', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72781813, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72781813.pdf'),
(1287, '76785472', '968583856', 'ISABELPEREZVALENCIA@HOTMAIL.COM', 'ANAISABE.PÉREZVALE@minedu.edu.pe', 'PEREZ                              ', 'VALENCIA                           ', 'ANA ISABEL                    ', '1745447', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 76785472, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76785472.pdf'),
(1288, '03386996', '944962899', 'JULISSA_TAVARA@HOTMAIL.COM', 'JANETJULIS.TAVARANAVA@minedu.edu.pe', 'TAVARA                             ', 'NAVARRO                            ', 'JANET JULISSA                 ', '1715804', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 3386996, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03386996.pdf'),
(1289, '72878996', '945627070', 'STEFANY.VALLADARES1909@GMAIL.COM', 'KARINASTEFA.VALLADARESGARC@minedu.edu.pe', 'VALLADARES                         ', 'GARCIA                             ', 'KARINA STEFANY                ', '1237767', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72878996, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72878996.pdf'),
(1290, '73464203', '962948785', 'LESLIEVG293@HOTMAIL.COM', 'LESLIEJOSSE.VENTURAGRAN@minedu.edu.pe', 'VENTURA                            ', 'GRANADOS                           ', 'LESLIE JOSSELLIN              ', '1236835', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 73464203, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73464203.pdf'),
(1291, '07643192', '951694795', 'jessymodas@hotmail.com', 'RUTH.VILLEGASMORA@minedu.edu.pe', 'VILLEGAS                           ', 'MORALES DE SALAS                   ', 'RUTH                          ', '0675272', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 7643192, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '07643192.pdf'),
(1292, '16721131', '950075092', 'vecariana@hotmail.com', 'VERONIKA.ALVAREZGONZ@minedu.edu.pe', 'ALVAREZ                            ', 'GONZALES                           ', 'VERONICA                      ', '1158203', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16721131, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16721131.pdf'),
(1293, '70409729', '917169563', 'LUCIANA.PAITAN10@GMAIL.COM', 'LUCIANASOFIA.ANGULOPAIT@minedu.edu.pe', 'ANGULO                             ', 'PAITAN                             ', 'LUCIANA SOFIA                 ', '1450337', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70409729, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70409729.pdf'),
(1294, '76440233', '920529937', 'MILIBERTH.9624@GMAIL.COM', 'BERTHAMILAG.AZABACHEMART@minedu.edu.pe', 'AZABACHE                           ', 'MARTINEZ                           ', 'BERTHA MILAGROS               ', '1450360', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 76440233, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76440233.pdf'),
(1295, '16698520', '966793572', 'luzcarpior@hotmail.com', 'LUZESTHE.CARPIOREBA@minedu.edu.pe', 'CARPIO                             ', 'REBAZA                             ', 'LUZ ESTHER                    ', '0344317', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16698520, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16698520.pdf'),
(1296, '41729788', '965382669', 'mayeci190@hotmail.com', 'MARJORIEOLENK.CHACALIAZAMAZA@minedu.edu.pe', 'CHACALIAZA                         ', 'MAZA                               ', 'MARJORIE OLENKA               ', '1649896', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41729788, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41729788.pdf'),
(1297, '18146056', '948056020', 'sumaesco80@hotmail.com', 'SUSANAMARIB.ESCOBEDOAGUI@minedu.edu.pe', 'ESCOBEDO                           ', 'AGUIRRE                            ', 'SUSANA MARIBEL                ', '1552603', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 18146056, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18146056.pdf'),
(1298, '45844684', '984470304', 'YOSSY20051989@GMAIL.COM', 'YOSELINAESPER.FLORIANSAUC@minedu.edu.pe', 'FLORIAN                            ', 'SAUCEDO                            ', 'YOSELINA ESPERANZA            ', '1552603', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45844684, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45844684.pdf'),
(1299, '46874759', '917849729', 'YUVI_2412@HOTMAIL.COM', 'SILVIAYUVIL.GAMARRARAMI@minedu.edu.pe', 'GAMARRA                            ', 'RAMIREZ                            ', 'SILVIA YUVILA                 ', '1552587', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 46874759, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46874759.pdf'),
(1300, '16720561', '979080509', 'miodela@hotmail.com', 'MARYYSABE.ORDOÑEZDEL@minedu.edu.pe', 'ORDOÑEZ                            ', 'DEL AGUILA                         ', 'MARY YSABEL                   ', '1557503', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16720561, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16720561.pdf'),
(1301, '43968049', '961045045', 'solfeny26@gmail.com', 'LIZETTNOEMI.OSORIOSALV@minedu.edu.pe', 'OSORIO                             ', 'SALVADOR                           ', 'LIZETT NOEMI FLOR ELIZABETH   ', '1450329', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 43968049, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43968049.pdf'),
(1302, '44114427', '978753473', 'PKARITO67@GMAIL.COM', 'KARITOLISBE.PAREDESZAVA@minedu.edu.pe', 'PAREDES                            ', 'ZAVALETA                           ', 'KARITO LISBET                 ', '1488683', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44114427, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44114427.pdf'),
(1303, '75219796', '925207942', 'LEKA201098@GMAIL.COM', 'LEIDYKARIN.ROSALESVASQ@minedu.edu.pe', 'ROSALES                            ', 'VASQUEZ                            ', 'LEIDY KARINA                  ', '1744903', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75219796, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75219796.pdf'),
(1304, '16720198', '985182007', 'doramsanchezdiaz@hotmail.com', 'DORAMONIC.SANCHEZDIAZ@minedu.edu.pe', 'SANCHEZ                            ', 'DIAZ                               ', 'DORA MONICA                   ', '1557594', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 16720198, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16720198.pdf'),
(1305, '75683619', '913011942', 'AYURQUIZAL@GMAIL.COM', 'ANGIEYALU.URQUIZALOPE@minedu.edu.pe', 'URQUIZA                            ', 'LOPEZ                              ', 'ANGIE YALU                    ', '1156587', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 75683619, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75683619.pdf'),
(1306, '72925476', '937110489', 'juvame35@hotmail.com', 'ISELAMARIT.VALLADARESVALV@minedu.edu.pe', 'VALLADARES                         ', 'VALVERDE                           ', 'ISELA MARITZA                 ', '1411503', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 72925476, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72925476.pdf'),
(1307, '47971231', '968187662', 'thaliavallegonzales@gmail.com', 'DIANATHALI.VALLEGONZ@minedu.edu.pe', 'VALLE                              ', 'GONZALES                           ', 'DIANA THALIA                  ', '1594761', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47971231, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47971231.pdf'),
(1309, '41116797', '947965686', 'karycv37@gmail.com', 'KARINALIZBE.CABRERAVELA@minedu.edu.pe', 'CABRERA                            ', 'VELASQUEZ                          ', 'KARINA LIZBETH                ', '1528314', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41116797, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41116797.pdf'),
(1310, '75409852', '943043055', 'AMALIACARRASCO270@GMAIL.COM', 'amalia.carrascov@minedu.edu.pe', 'CARRASCO                           ', 'VINCES                             ', 'AMALIA FELIMER                ', '0803445', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 75409852, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75409852.pdf'),
(1311, '41741215', '995470426', 'cinqui21@hotmail.com', 'CINTIAJOHAN.CHAVEZQUIÑ@minedu.edu.pe', 'CHAVEZ                             ', 'QUIÑONES                           ', 'CINTIA JOHANA                 ', '0574038', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41741215, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41741215.pdf'),
(1312, '41107334', '976199721', 'NANCIMAGALY@GMAIL.COM', 'NANCYMAGAL.CORNEJOOBAN@minedu.edu.pe', 'CORNEJO                            ', 'OBANDO                             ', 'NANCY MAGALY                  ', '0572677', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 41107334, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41107334.pdf'),
(1313, '45080891', '964725514', 'leidy_dm@hotmail.com', 'LEIDYELIZA.DIAZMONC@minedu.edu.pe', 'DIAZ                               ', 'MONCHON                            ', 'LEIDY ELIZABETH               ', '0344556', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45080891, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45080891.pdf'),
(1316, '44953386', '922293945', 'catherine.moncada@hotmail.com', 'catherine.moncadaa@minedu.edu.pe', 'MONCADA                            ', 'ALBITRES                           ', 'CATHERINE ESTHER              ', '0646125', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 44953386, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44953386.pdf'),
(1317, '46448932', '971142329', 'EMITATI22_7@HOTMAIL.COM', 'EMILYTATIA.MONDRAGONESPI@minedu.edu.pe', 'MONDRAGON                          ', 'ESPINOZA                           ', 'EMILY TATIANA                 ', '1730761', '13', 'Proceso', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46448932, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46448932.pdf'),
(1318, '47456613', '948308368', 'STEPHANY.PENALVA@CEIBOS.EDU.PE', 'LESLIESTEPH.PEÑALVACABE@minedu.edu.pe', 'PEÑALVA                            ', 'CABEZAS                            ', 'LESLIE STEPHANY               ', '0753251', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 47456613, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47456613.pdf'),
(1322, '77299811', '915945176', 'irenia_17@hotmail.com', 'IRENIALLUBR.SOLORZANOVILL@minedu.edu.pe', 'SOLORZANO                          ', 'VILLACORTA                         ', 'IRENIA LLUBRITZA              ', '0803312', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 77299811, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77299811.pdf'),
(1323, '45849534', '934296337', 'karithoc_18@hotmail.com', 'KARENANGEL.TEPECARM@minedu.edu.pe', 'TEPE                               ', 'CARMEN                             ', 'KAREN ANGELICA                ', '0344556', '13', 'Proceso', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45849534, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45849534.pdf'),
(1324, '40846533', '944801596', 'lilyr_23@hotmail.com', 'LILYROSAR.TOCTOSALA@minedu.edu.pe', 'TOCTO                              ', 'SALAS                              ', 'LILY ROSARIO                  ', '1528256', '13', 'Proceso', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 40846533, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40846533.pdf'),
(1327, '41398342', '927477491', 'lucerito__71280@hotmail.com', 'FERNANDOJAVIE.BALTAZARAGUI@minedu.edu.pe', 'BALTAZAR                           ', 'AGUILAR                            ', 'FERNANDO JAVIER               ', '1164904', '', '', 'Calificado', '26', 'Proceso', 'Calificado', 45, 'Logrado', 1, 41398342, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41398342.pdf'),
(1328, '70936989', '931287226', 'adan.valvin@gmail.com', 'adan.caunac@minedu.edu.pe', 'CAUNA                              ', 'CHIPANA                            ', 'ADAN ISAI                     ', '1456474', '', '', 'Calificado', '26', 'Proceso', 'Calificado', 45, 'Logrado', 1, 70936989, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70936989.pdf'),
(1330, '16706611', '979454864', 'bochiniti@hotmail.com', 'carlos.diazba@minedu.edu.pe', 'DIAZ                               ', 'BARRANTES                          ', 'CARLOS ENRIQUE                ', '0344846', '', '', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 16706611, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16706611.pdf'),
(1332, '42121720', '936490200', 'REYMARFQ13@GMAIL.COM', 'MARIAANGEL.FELIPAQUIS@minedu.edu.pe', 'FELIPA                             ', 'QUISPE                             ', 'MARIA ANGELICA                ', '1456441', '', '', 'Calificado', '29', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 42121720, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42121720.pdf'),
(1333, '42991201', '990053022', 'FERNANDEZ.GONZALESJE@GMAIL.COM', 'JULIOEDILB.FERNANDEZGONZ@minedu.edu.pe', 'FERNANDEZ                          ', 'GONZALES                           ', 'JULIO EDILBERTO               ', '0484840', '', '', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 42991201, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42991201.pdf'),
(1336, '44462405', '999048334', 'kalor_444@hotmail.com', 'LUISGERSO.LUZQUIÑOSSILV@minedu.edu.pe', 'LUZQUIÑOS                          ', 'SILVA                              ', 'LUIS GERSONN                  ', '0456467', '', '', 'No enviado', '', '', 'Calificado', 45, 'Logrado', 1, 44462405, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44462405.pdf'),
(1338, '09221745', '924290894', 'FRANCOJEDAOBIAGA@GMAIL.COM', 'charles.ojedag@minedu.edu.pe', 'OJEDA                              ', 'GOVEA                              ', 'CHARLES STEVES                ', '0661413', '', '', 'No enviado', '', '', 'Calificado', 45, 'Logrado', 1, 9221745, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '09221745.pdf'),
(1343, '73182175', '933015190', 'gaby.vasza@hotmail.com', 'carmen.vasquezz@minedu.edu.pe', 'VASQUEZ                            ', 'ZAVALETA                           ', 'CARMEN GABRIELA               ', '0345017', '', '', 'Calificado', '23', 'Proceso', 'Calificado', 45, 'Logrado', 1, 73182175, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73182175.pdf'),
(1344, '47928104', '942484008', 'vaniacabrerarodriguez@gmail.com', 'VANIAJERAL.CABRERARODR@minedu.edu.pe', 'CABRERA                            ', 'RODRÍGUEZ                          ', 'VANIA JERALDI                 ', '1165851', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47928104, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47928104.pdf'),
(1345, '18204333', '948352511', 'lince56_4@hotmail.com', 'JAVIERISIDR.CAMPOSROME@minedu.edu.pe', 'CAMPOS                             ', 'ROMERO                             ', 'JAVIER ISIDRO                 ', '0212183', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18204333, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18204333.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(1346, '46238686', '977235811', 'yenipj19@hotmail.com', 'YENIALICI.CASTILLOVASQ@minedu.edu.pe', 'CASTILLO                           ', 'VASQUEZ                            ', 'YENI ALICIA                   ', '0213520', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46238686, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46238686.pdf'),
(1347, '74707169', '943667632', 'sandra.121996@hotmail.es', 'SANDRAMILAG.CHAVEZCHIG@minedu.edu.pe', 'CHAVEZ                             ', 'CHIGNE                             ', 'SANDRA MILAGRITOS             ', '0213553', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 74707169, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74707169.pdf'),
(1348, '46764862', '957117207', 'VANESSAFLORIAN480@GMAIL.COM', 'VANESSAGISEL.FLORIANESPI@minedu.edu.pe', 'FLORIAN                            ', 'ESPINOZA                           ', 'VANESSA GISELA                ', '1164144', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46764862, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46764862.pdf'),
(1349, '18901541', '949537239', 'yovi_02_08@hotmail.com', 'DAYSIYOVAN.GARCIARODR@minedu.edu.pe', 'GARCIA                             ', 'RODRIGUEZ                          ', 'DAYSI YOVANA                  ', '0211888', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 18901541, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18901541.pdf'),
(1350, '48460258', '934299185', 'gastelo1204@gmail.com', 'JESSENIAGUADA.GASTELORODR@minedu.edu.pe', 'GASTELO                            ', 'RODRIGUEZ                          ', 'JESSENIA GUADALUPE            ', '0588129', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 48460258, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48460258.pdf'),
(1351, '47014051', '941594329', 'PISCIS_15M@HOTMAIL.COM', 'EVELINLUZMA.GOMEZASUN@minedu.edu.pe', 'GOMEZ                              ', 'ASUNCION                           ', 'EVELIN LUZMARINA              ', '0213561', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47014051, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47014051.pdf'),
(1352, '45444969', '918169401', 'fannyj_8@hotmail.com', 'FANNYJOSEF.JUAREZHUAR@minedu.edu.pe', 'JUAREZ                             ', 'HUARIPATA                          ', 'FANNY JOSEFINA                ', '0213983', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45444969, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45444969.pdf'),
(1353, '73451100', '998680167', 'thefihe@gmail.com', 'ESTHEFANICRIST.LEONHILA@minedu.edu.pe', 'LEON                               ', 'HILARIO                            ', 'ESTHEFANI CRISTINA            ', '0214064', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 73451100, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73451100.pdf'),
(1354, '44987533', '949398999', 'saramv19@hotmail.com', 'SARITASULEM.MARQUINAVILL@minedu.edu.pe', 'MARQUINA                           ', 'VILLANUEVA                         ', 'SARITA SULEMA                 ', '0213942', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44987533, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44987533.pdf'),
(1355, '72944065', '978700021', '978700021liz@gmail.com', 'LIZETHNAITH.OTINIANOTACA@minedu.edu.pe', 'OTINIANO                           ', 'TACANGA                            ', 'LIZETH NAITH                  ', '0213595', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 72944065, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72944065.pdf'),
(1356, '46030406', '922577225', 'jessica_432_@hotmail.com', 'JESSICAYANIN.SIGUENZAHERR@minedu.edu.pe', 'SIGUENZA                           ', 'HERRERA                            ', 'JESSICA YANINA                ', '1780386', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 46030406, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46030406.pdf'),
(1357, '47606717', '940987250', 'ubillus_9215@hotmail.com', 'LOURDESISABE.UBILLUSUBIL@minedu.edu.pe', 'UBILLUS                            ', 'UBILLUS                            ', 'LOURDES ISABEL                ', '0214064', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 47606717, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47606717.pdf'),
(1358, '70189000', '949897026', 'estefany_12ep@hotmail.com', 'LEIDYESTEF.VARGASEUST@minedu.edu.pe', 'VARGAS                             ', 'EUSTAQUIO                          ', 'LEIDY ESTEFANI DEL CARMEN     ', '0213561', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 70189000, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70189000.pdf'),
(1360, '03853917', '938154836', 'mariadelpilararevaloarevalo5@gmail.com', 'MARIADEL.AREVALOAREV@minedu.edu.pe', 'AREVALO                            ', 'AREVALO                            ', 'MARIA DEL PILAR               ', '0860411', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Borrador Calificado', 60, 'Destacado', 1, 3853917, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03853917.pdf'),
(1361, '71412659', '912994954', 'nathy.asuncion@hotmail.com', 'DIANANATHA.ASUNCIONVELA@minedu.edu.pe', 'ASUNCION                           ', 'VELASQUEZ                          ', 'DIANA NATHALY                 ', '0349860', '20', 'Destacado', 'Borrador Calificado', '40', 'Destacado', 'Borrador Calificado', 60, 'Destacado', 1, 71412659, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71412659.pdf'),
(1363, '40514908', '934613914', 'bcp2015_pao@hotmail.com', 'PAOLAMILAG.BETETACAST@minedu.edu.pe', 'BETETA                             ', 'CASTILLO                           ', 'PAOLA MILAGROS                ', '0348714', '20', 'Destacado', 'Borrador', '', '', 'Calificado', 56, 'Destacado', 1, 40514908, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40514908.pdf'),
(1365, '45859048', '924641502', 'reynerimilagrosgarciamarchan@gmail.com', 'REYNERIMILAG.GARCIAMARC@minedu.edu.pe', 'GARCIA                             ', 'MARCHAN                            ', 'REYNERI MILAGROS              ', '0349811', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45859048, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45859048.pdf'),
(1366, '42044322', '948426726', 'maryje174@hotmail.com', 'MARTHAMERCE.GONZALESCAST@minedu.edu.pe', 'GONZALES                           ', 'CASTILLO                           ', 'MARTHA MERCEDES               ', '0348714', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42044322, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42044322.pdf'),
(1367, '44177160', '964569301', 'AURORA22_86@HOTMAIL.COM', 'AURORAMARIA.PEÑAADRI@minedu.edu.pe', 'PEÑA                               ', 'ADRIANZEN                          ', 'AURORA MARIA                  ', '0260604', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44177160, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44177160.pdf'),
(1368, '44792107', '928162661', 'LADYQUINO@GMAIL.COM', 'LADYNOEMI.QUINOAGUR@minedu.edu.pe', 'QUINO                              ', 'AGURTO                             ', 'LADY NOEMI                    ', '0260620', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44792107, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44792107.pdf'),
(1369, '03879212', '952850353', 'GUISENICE@HOTMAIL.COM', 'FABIOLAGUISE.RUJELESPI@minedu.edu.pe', 'RUJEL                              ', 'ESPINOZA                           ', 'FABIOLA GUISELA               ', '0349860', '20', 'Destacado', 'Borrador Calificado', '36', 'Destacado', 'Borrador Calificado', 60, 'Destacado', 1, 3879212, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03879212.pdf'),
(1370, '40957151', '990930838', 'mari_81d@yahoo.es', 'MARIAMILAG.SARAVIAATUN@minedu.edu.pe', 'SARAVIA                            ', 'ATUNCAR                            ', 'MARIA MILAGROS                ', '0348714', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40957151, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40957151.pdf'),
(1371, '72409375', '958591302', 'mexe272015@gmail.com', 'MARIAMERCE.VALDIVIAAGAP@minedu.edu.pe', 'VALDIVIA                           ', 'AGAPITO                            ', 'MARIA MERCEDES                ', '0260620', '20', 'Destacado', 'Sin Calificar', '', '', 'Calificado', 52, 'Logrado', 1, 72409375, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72409375.pdf'),
(1372, '76441867', '959683141', 'xiomaravite17@gmail.com', 'XIOMARALISBE.VITETOCT@minedu.edu.pe', 'VITE                               ', 'TOCTO                              ', 'XIOMARA LISBETH               ', '0260596', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 76441867, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76441867.pdf'),
(1373, '74900877', '944840567', 'KAROLAY_JACKELINE_1930@HOTMAIL.COM', 'KAROLAYJACKE.YOVERACAST@minedu.edu.pe', 'YOVERA                             ', 'CASTILLO                           ', 'KAROLAY JACKELINE             ', '0349522', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 74900877, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74900877.pdf'),
(1374, '44522629', '950685602', 'MAYITOZEVAL1@GMAIL.COM', 'MARYURYMELIS.ZEVALLOSCHAL@minedu.edu.pe', 'ZEVALLOS                           ', 'CHALEN                             ', 'MARYURY MELISSA               ', '0349803', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44522629, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44522629.pdf'),
(1375, '41185419', '992560843', 'labenites_s@hotmail.com', 'LAURAANGEL.ASMADBENI@minedu.edu.pe', 'ASMAD                              ', 'BENITES                            ', 'LAURA ANGELICA                ', '1444025', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41185419, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41185419.pdf'),
(1377, '47260262', '959030073', 'karla_06_9@hotmail.com', 'KARLAMARIL.CHASQUIBOLAGUI@minedu.edu.pe', 'CHASQUIBOL                         ', 'AGUILAR                            ', 'KARLA MARILYN                 ', '1545516', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47260262, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47260262.pdf'),
(1378, '42773521', '923166064', 'medalicorazon@hotmail.com', 'ana.garridog@minedu.edu.pe', 'GARRIDO                            ', 'GUTIERREZ                          ', 'ANA MEDALI                    ', '1187723', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 42773521, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42773521.pdf'),
(1380, '45355555', '980802850', 'TABITAHARO@GMAIL.COM', 'TABITABEATR.HAROLLAN@minedu.edu.pe', 'HARO                               ', 'LLANOS                             ', 'TABITA BEATRIZ                ', '1436351', '', '', 'Sin Calificar', '', '', 'Calificado', 48, 'Logrado', 1, 45355555, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45355555.pdf'),
(1381, '47156667', '943433346', 'meryros25.k@gmail.com', 'ROSMERYKATEL.PINOZANA@minedu.edu.pe', 'PINO                               ', 'ZANABRIA                           ', 'ROSMERY KATELYN               ', '1449834', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 47156667, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47156667.pdf'),
(1382, '70284633', '948357348', 'maria_aries.32@hotmail.com', 'MARIATERES.REYESSARE@minedu.edu.pe', 'REYES                              ', 'SARE                               ', 'MARIA TERESA                  ', '1444090', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 70284633, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70284633.pdf'),
(1383, '45688776', '910318290', 'lurdes11289@gmail.com', 'LOURDESNOHEL.RISCOCUMP@minedu.edu.pe', 'RISCO                              ', 'CUMPA                              ', 'LOURDES NOHELY                ', '0802579', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 45688776, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45688776.pdf'),
(1384, '71643111', '944196494', 'JASMIN_ESCORPIO.11@HOTMAIL.COM', 'adela.rodriguezf@minedu.edu.pe', 'RODRÍGUEZ                          ', 'FABIAN                             ', 'ADELA JAZMIN                  ', '1686047', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 71643111, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71643111.pdf'),
(1385, '43734627', '927310928', 'rocio_2386@hotmail.com', 'ROCIOARACE.SEGURACHIC@minedu.edu.pe', 'SEGURA                             ', 'CHICLAYO                           ', 'ROCIO ARACELI                 ', '1449875', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 43734627, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43734627.pdf'),
(1386, '48772741', '924669105', 'jacky27sj@gmail.com', 'JACKELINECRISE.VALDIVIEZOPELA@minedu.edu.pe', 'VALDIVIEZO                         ', 'PELAEZ                             ', 'JACKELINE CRISEL              ', '1436351', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 48772741, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48772741.pdf'),
(1387, '47614676', '929920494', 'lizania_1992@hotmail.com', 'LIZANIAELIZA.VALENCIADELG@minedu.edu.pe', 'VALENCIA                           ', 'DELGADO                            ', 'LIZANIA ELIZABETH             ', '1545516', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 47614676, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47614676.pdf'),
(1389, '44310593', '996621627', 'GISEVT2007@GMAIL.COM', 'GISELLA.VILLALOBOSTORR@minedu.edu.pe', 'VILLALOBOS                         ', 'TORRES                             ', 'GISELLA                       ', '1449750', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 44310593, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44310593.pdf'),
(1390, '47064998', '922212583', 'fiorella.yepez1@gmail.com', 'FIORELLANOEMÍ.YÉPEZCAST@minedu.edu.pe', 'YÉPEZ                              ', 'CASTAÑEDA                          ', 'FIORELA NOEMÍ                 ', '0512707', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 47064998, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47064998.pdf'),
(1391, '76810229', '948842762', 'tefiibenavides@gmail.com', 'ESTEFANILISBE.BENAVIDESZULO@minedu.edu.pe', 'BENAVIDES                          ', 'ZULOETA                            ', 'ESTEFANI LISBETH              ', '0346494', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 76810229, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76810229.pdf'),
(1392, '72845413', '957805592', 'LINACARPIO94@GMAIL.COM', 'LINALIZET.CARPIOSAND@minedu.edu.pe', 'CARPIO                             ', 'SANDOVAL                           ', 'LINA LIZETH                   ', '0619551', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 72845413, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72845413.pdf'),
(1393, '76447202', '948884132', 'FIO.201995@GMAIL.COM', 'DALIFIORE.CULQUICONDORRODA@minedu.edu.pe', 'CULQUICONDOR                       ', 'RODAS                              ', 'DALI  FIORELA                 ', '0446898', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 76447202, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76447202.pdf'),
(1394, '73334561', '947502321', 'cinthiacustodiogonzales@gmail.com', 'cinthia.custodiog@minedu.edu.pe', 'CUSTODIO                           ', 'GONZALES                           ', 'CINTHIA MARGARITA             ', '0346056', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 73334561, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73334561.pdf'),
(1395, '72218517', '940207311', 'ale.12.meda@gmail.com', 'alexandra.gonzalesf@minedu.edu.pe', 'GONZALES                           ', 'FLORES                             ', 'ALEXANDRA MEDALI              ', '0346205', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 72218517, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72218517.pdf'),
(1396, '75068533', '920129403', 'NAPPIESCD@GMAIL.COM', 'JUANCARLO.GUILLENABAD@minedu.edu.pe', 'GUILLEN                            ', 'ABAD                               ', 'JUAN CARLOS                   ', '0346999', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 75068533, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75068533.pdf'),
(1397, '80217973', '943912236', 'ba_0115@hotmail.com', 'GERALDINEGRISE.LEGUIASALA@minedu.edu.pe', 'LEGUIA                             ', 'SALAZAR                            ', 'GERALDINE GRISELDA            ', '0620096', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 80217973, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80217973.pdf'),
(1398, '73545262', '950128209', 'MARICARMENLLEMS@GMAIL.COM', 'MARICARMEN.LLEMPENSALD@minedu.edu.pe', 'LLEMPEN                            ', 'SALDIVAR                           ', 'MARICARMEN                    ', '0466748', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 73545262, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73545262.pdf'),
(1399, '72676112', '943004232', 'KARENANTUANEMARTINEZZEA@GMAIL.COM', 'KARENANTUA.MARTINEZZEA@minedu.edu.pe', 'MARTINEZ                           ', 'ZEA                                ', 'KAREN ANTUANE                 ', '0346361', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 72676112, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72676112.pdf'),
(1400, '48281212', '947034443', 'keyusama_07@hotmail.com', 'YESENIASTEFA.MASABELSILV@minedu.edu.pe', 'MASABEL                            ', 'SILVA                              ', 'YESENIA STEFANI               ', '0346361', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 48281212, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48281212.pdf'),
(1401, '77470312', '915155771', 'MARBELYRIOSALDANA@GMAIL.COM', 'MARBELYZARAL.RIOSALDA@minedu.edu.pe', 'RIOS                               ', 'ALDANA                             ', 'MARBELY ZARALI                ', '0345405', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 77470312, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77470312.pdf'),
(1402, '47893889', '971254638', 'anna_sp28@hotmail.com', 'ana.sullonp@minedu.edu.pe', 'SULLON                             ', 'PEREZ                              ', 'ANA PATRICIA                  ', '0648014', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 47893889, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47893889.pdf'),
(1403, '74590900', '961501067', 'ESCORPIO_MAR24@HOTMAIL.COM', 'JHENJHOAN.TORRESVIDA@minedu.edu.pe', 'TORRES                             ', 'VIDAL                              ', 'JHEN JHOANA                   ', '0346841', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 74590900, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74590900.pdf'),
(1404, '73183446', '988156775', 'JENNI_13_03@HOTMAIL.COM', 'JENNIFERVIVIA.UCHOFENNEYR@minedu.edu.pe', 'UCHOFEN                            ', 'NEYRA                              ', 'JENNIFER VIVIANA              ', '0619551', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 73183446, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73183446.pdf'),
(1405, '75716942', '932218152', 'urby.mjuf@gmail.com', 'MARIAJULIA.URBINAFLOR@minedu.edu.pe', 'URBINA                             ', 'FLORES                             ', 'MARIA JULIA                   ', '0446989', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 75716942, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75716942.pdf'),
(1406, '73974563', '934184478', 'svs_19931@hotmail.com', 'SANDRASONIA.VELÁSQUEZSALA@minedu.edu.pe', 'VELASQUEZ                          ', 'SALAZAR                            ', 'SANDRA SONIA VERONICA         ', '0702191', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 52, 'Logrado', 1, 73974563, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73974563.pdf'),
(1407, '73200698', '950662488', 'vanessaagurto@hotmail.com', 'VANESSADANIE.AGURTOAGUR@minedu.edu.pe', 'AGURTO                             ', 'AGURTO                             ', 'VANESSA DANIELLA              ', '1180082', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 73200698, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73200698.pdf'),
(1408, '70004708', '926193714', 'APOLO-99-02@HOTMAIL.COM', 'LEIDYXIOMA.APOLOGRAN@minedu.edu.pe', 'APOLO                              ', 'GRANDA                             ', 'LEIDY XIOMARA                 ', '0259853', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70004708, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70004708.pdf'),
(1409, '72297222', '969345595', 'SHEYLIB01107@GMAIL.COM', 'SHEYLAALISS.ARCOSNIÑO@minedu.edu.pe', 'ARCOS                              ', 'NIÑO                               ', 'SHEYLA ALISSON                ', '0490151', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 72297222, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72297222.pdf'),
(1410, '40734478', '992258824', 'libra479@hotmail.com', 'MEDALITMARIB.BUSTAMANTESAND@minedu.edu.pe', 'BUSTAMANTE                         ', 'SANDOVAL                           ', 'MEDALIT MARIBEL               ', '1406016', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40734478, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40734478.pdf'),
(1411, '05640520', '954466315', 'JEMICODI_26@HOTMAIL.COM', 'JESUSMIROS.COLUMBUSDIAZ@minedu.edu.pe', 'COLUMBUS                           ', 'DIAZ                               ', 'JESUS MIROSLAVA               ', '0259523', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 5640520, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '05640520.pdf'),
(1412, '44141649', '968624556', 'silvy-leo@hotmail.com', 'MARYCARME.DÁVILAANTÓ@minedu.edu.pe', 'DAVILA                             ', 'ANTON                              ', 'MARY CARMEN                   ', '0259531', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44141649, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44141649.pdf'),
(1413, '71080111', '969579026', 'VIANCA.FALLA22@GMAIL.COM', 'VIANCAESTEF.FALLASANT@minedu.edu.pe', 'FALLA                              ', 'SANTOS                             ', 'VIANCA ESTEFANI               ', '1715606', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71080111, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71080111.pdf'),
(1414, '03665762', '994520355', 'TECHIMONTALBAN8@GMAIL.COM', 'TELSIDA.MONTALBANTACU@minedu.edu.pe', 'MONTALBAN                          ', 'TACURE                             ', 'TELSIDA                       ', '1206689', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 3665762, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03665762.pdf'),
(1415, '70053127', '987795884', 'BNNUNEZM@GMAIL.COM', 'BRENDANOELI.NUÑEZMART@minedu.edu.pe', 'NUÑEZ                              ', 'MARTINEZ                           ', 'BRENDA NOELIA                 ', '0939181', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70053127, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70053127.pdf'),
(1416, '71205134', '949563772', 'monisabel345@gmail.com', 'MONICAISABE.OCAÑAMONT@minedu.edu.pe', 'OCAÑA                              ', 'MONTALVO                           ', 'MONICA ISABEL                 ', '0535781', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 71205134, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71205134.pdf'),
(1417, '70907892', '923936530', 'KATHERINEORCR06@GMAIL.COM', 'KATHERINEJUDIT.ORDINOLACRUZ@minedu.edu.pe', 'ORDINOLA                           ', 'CRUZ                               ', 'KATHERINE JUDITH              ', '1238070', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70907892, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70907892.pdf'),
(1418, '76264125', '987882791', '1996orosco@gmail.com', 'chelsy.oroscon@minedu.edu.pe', 'OROSCO                             ', 'NONALAYA                           ', 'CHELSY NELLY                  ', '1681303', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76264125, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76264125.pdf'),
(1419, '46650091', '984228907', 'zandrix_15@outlook.com', 'MAURASANDR.PAREDESPERA@minedu.edu.pe', 'PAREDES                            ', 'PERALES                            ', 'MAURA SANDRA                  ', '1715473', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 46650091, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46650091.pdf'),
(1420, '44884000', '985495349', 'KPENA909@GMAIL.COM', 'KARINAELIZA.PEÑACAMP@minedu.edu.pe', 'PEÑA                               ', 'CAMPOS                             ', 'KARINA ELIZABETH              ', '0613828', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 44884000, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44884000.pdf'),
(1421, '29660218', '987881254', 'gabipdelgado@hotmail.com', 'GABRIELANELLY.PEÑADELG@minedu.edu.pe', 'PEÑA                               ', 'DELGADO                            ', 'GABRIELA NELLY                ', '0938977', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 29660218, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29660218.pdf'),
(1422, '60176417', '983782558', 'KIARAYASMINSANCHOMAMANI@GMAIL.COM', 'KIARAYASMI.SANCHOMAMA@minedu.edu.pe', 'SANCHO                             ', 'MAMANI                             ', 'KIARA YASMIN                  ', '1681238', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 60176417, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '60176417.pdf'),
(1423, '42956044', '955474034', 'magaly.serrano.msv@gmail.com', 'MAGALYELIZA.SERRANOVILC@minedu.edu.pe', 'SERRANO                            ', 'VILCA                              ', 'MAGALY ELIZABETH              ', '0737759', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42956044, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42956044.pdf'),
(1424, '73420419', '965060107', 'DANIELAKALAMAROMERO@GMAIL.COM', 'DANIELAKATIC.ALAMAROME@minedu.edu.pe', 'ALAMA                              ', 'ROMERO                             ', 'DANIELA KATICZA               ', '1467596', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 73420419, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73420419.pdf'),
(1425, '46715772', '947728183', 'katia_13_01@hotmail.com', 'KATIAELIZA.ALVAMORE@minedu.edu.pe', 'ALVA                               ', 'MORENO                             ', 'KATIA ELIZABETH               ', '1467612', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 46715772, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46715772.pdf'),
(1426, '47006590', '939684960', 'susiamayaromero@hotmail.com', 'SUSANTATIA.AMAYAROME@minedu.edu.pe', 'AMAYA                              ', 'ROMERO                             ', 'SUSAN TATIANA                 ', '1545219', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 47006590, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47006590.pdf'),
(1427, '70971344', '941125223', 'naydubazanvillanueva@gmail.com', 'NAYDUCARME.BAZANVILL@minedu.edu.pe', 'BAZAN                              ', 'VILLANUEVA                         ', 'NAYDU CARMENCITA              ', '1545292', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70971344, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70971344.pdf'),
(1428, '74814394', '974039228', 'MERCEDESCONSUELOC@GMAIL.COM', 'MERCEDESCONSU.CASTILLOGARC@minedu.edu.pe', 'CASTILLO                           ', 'GARCIA                             ', 'MERCEDES CONSUELO             ', '1545102', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74814394, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74814394.pdf'),
(1429, '71276800', '975986343', 'CORTIJOYANELA@GMAIL.COM', 'YANELAYENIF.CORTIJOALFA@minedu.edu.pe', 'CORTIJO                            ', 'ALFARO                             ', 'YANELA YENIFER                ', '0724062', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 71276800, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71276800.pdf'),
(1430, '45398629', '965356882', 'DMELIHQ26@HOTMAIL.COM', 'MELISSAMARIL.HERRERAQUIÑ@minedu.edu.pe', 'HERRERA                            ', 'QUIÑONES                           ', 'MELISSA MARILYN               ', '1545110', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 45398629, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45398629.pdf'),
(1431, '42634665', '956568086', 'JLB_ANITA@HOTMAIL.COM', 'JENNIFERANITA.LAZAROVENA@minedu.edu.pe', 'LAZARO                             ', 'VENAUTE                            ', 'JENNIFER ANITA                ', '1584283', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42634665, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42634665.pdf'),
(1432, '74397646', '926306629', 'DELIATALIALEYVA.GOMEZ@GMAIL.COM', 'DELIATALIA.LEYVAGOME@minedu.edu.pe', 'LEYVA                              ', 'GOMEZ                              ', 'DELIA TALIA                   ', '1545219', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 74397646, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74397646.pdf'),
(1433, '41933233', '979355440', 'patricksa48@hotmail.com', 'PATRICIALILIA.MARREROSSALD@minedu.edu.pe', 'MARREROS                           ', 'SALDARRIAGA                        ', 'PATRICIA LILIANA              ', '1742980', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41933233, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41933233.pdf'),
(1434, '41399627', '956413859', 'pesantesgraosk@gmail.com', 'KARINLETIC.PESANTESGRAO@minedu.edu.pe', 'PESANTES                           ', 'GRAOS                              ', 'KARIN LETICIA                 ', '1467646', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41399627, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41399627.pdf'),
(1435, '70745519', '939838558', 'GINAROSAS674@GMAIL.COM', 'GINAMARIA.ROSASMERC@minedu.edu.pe', 'ROSAS                              ', 'MERCADO                            ', 'GINA MARIAELENA               ', '1467612', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70745519, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70745519.pdf'),
(1436, '46310203', '976288049', 'CINDYRJ23@GMAIL.COM', 'CINDYPAMEL.RUIZJAIC@minedu.edu.pe', 'RUIZ                               ', 'JAICO                              ', 'CINDY PAMELA                  ', '1467653', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 46310203, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46310203.pdf'),
(1437, '75008788', '957437820', 'karina_aries_09@hotmail.com', 'KARINANOHEM.SANCHEZRUIZ@minedu.edu.pe', 'SANCHEZ                            ', 'RUIZ                               ', 'KARINA NOHEMI                 ', '1674167', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75008788, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75008788.pdf'),
(1438, '45550741', '992516050', 'ZTORRES@SJO.EDU.PE', 'ZORAIDAGENOV.TORRESSILV@minedu.edu.pe', 'TORRES                             ', 'SILVA                              ', 'ZORAIDA GENOVEVA              ', '1647957', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 45550741, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45550741.pdf'),
(1439, '75478230', '915925011', 'AYSBELLVALERIANOT@GMAIL.COM', 'EYMMYAYSBE.VALERIANOTORO@minedu.edu.pe', 'VALERIANO                          ', 'TORO                               ', 'EYMMY AYSBELL                 ', '1557545', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 75478230, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75478230.pdf'),
(1440, '75177997', '936705197', 'MONAZA529@GMAIL.COM', 'YADIRANATAL.VILLANUEVALOBA@minedu.edu.pe', 'VILLANUEVA                         ', 'LOBATON                            ', 'YADIRA NATALI                 ', '1584432', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 75177997, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75177997.pdf'),
(1442, '40020495', '991582059', 'silll_2826@hotmail.com', 'SILVIAANGEL.AMAYAVILL@minedu.edu.pe', 'AMAYA                              ', 'VILLALOBOS                         ', 'SILVIA ANGELICA               ', '1710227', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40020495, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40020495.pdf'),
(1443, '77150648', '991116883', 'SAZHI.21@GMAIL.COM', 'SANDRAGIANE.BUENODIAZ@minedu.edu.pe', 'BUENO                              ', 'DIAZ                               ', 'SANDRA GIANELLA               ', '1418920', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 77150648, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77150648.pdf'),
(1444, '44891113', '995530642', 'CINDY.CALERO29@GMAIL.COM', 'cindy.caleroz@minedu.edu.pe', 'CALERO                             ', 'ZAPATA                             ', 'CINDY                         ', '1656016', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44891113, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44891113.pdf'),
(1446, '18133684', '948322636', 'sococe@hotmail.com', 'SOCORRODEL.CARDENASESPI@minedu.edu.pe', 'CARDENAS                           ', 'ESPINO                             ', 'SOCORRO DEL PILAR             ', '1685742', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 18133684, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18133684.pdf'),
(1447, '60587100', '942225806', 'luzchimuflores@hotmail.com', 'LUZANGEL.CHIMUFLOR@minedu.edu.pe', 'CHIMU                              ', 'FLORES                             ', 'LUZ ANGELICA                  ', '1645878', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 60587100, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '60587100.pdf'),
(1448, '71597139', '969598189', 'mariacruzadop@hotmail.com', 'MARIADE.CRUZADOPARE@minedu.edu.pe', 'CRUZADO                            ', 'PAREDES                            ', 'MARIA DE LOS ANGELES          ', '0366872', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 71597139, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71597139.pdf'),
(1449, '70164985', '971650325', 'CATTYFS12@GMAIL.COM', 'arling.floress@minedu.edu.pe', 'FLORES                             ', 'SANDOVAL                           ', 'ARLING CATHERINE              ', '1710219', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70164985, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70164985.pdf'),
(1450, '41370145', '986292747', 'elvitajuarez46@gmail.com', 'ELVA.JUAREZAVAL@minedu.edu.pe', 'JUAREZ                             ', 'AVALOS                             ', 'ELVA                          ', '1165257', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41370145, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41370145.pdf'),
(1451, '70297878', '958768166', 'ivonedith29@gmail.com', 'IVONEDITH.LIZAMARC@minedu.edu.pe', 'LIZA                               ', 'MARCELO                            ', 'IVON EDITH CILIBETH           ', '1404656', '20', 'Destacado', 'Borrador', '', '', 'Calificado', 52, 'Logrado', 1, 70297878, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70297878.pdf'),
(1452, '74619365', '900777980', 'ANNIEESTEFANIP11@GMAIL.COM', 'annie.paredesc@minedu.edu.pe', 'PAREDES                            ', 'CAMAN                              ', 'ANNIE ESTEFANI                ', '1416825', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 74619365, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74619365.pdf'),
(1453, '70071244', '999050346', 'NFPB0507@GMAIL.COM', 'NORMAFIORE.POMAYAYBRAV@minedu.edu.pe', 'POMAYAY                            ', 'BRAVO                              ', 'NORMA FIORELLA                ', '0417972', '', '', 'Borrador', '', '', 'Calificado', 48, 'Logrado', 1, 70071244, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70071244.pdf'),
(1454, '45973956', '925635402', 'KRYSTELLGATIBB@GMAIL.COM', 'ROSACELIA.RODRIGUEZAYAL@minedu.edu.pe', 'RODRIGUEZ                          ', 'AYALA                              ', 'ROSA CELIA                    ', '0366872', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 45973956, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45973956.pdf'),
(1455, '46154046', '983636739', 'BETHISANCHEZ159@GMAIL.COM', 'bethi.sanchezm@minedu.edu.pe', 'SANCHEZ                            ', 'MEDINA                             ', 'BETHI ANALY                   ', '1170885', '', '', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46154046, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46154046.pdf'),
(1456, '73027999', '976607854', 'DELIASEVILLA97@GMAIL.COM', 'DELIAROSA.SEVILLAROME@minedu.edu.pe', 'SEVILLA                            ', 'ROMERO                             ', 'DELIA ROSA                    ', '1650282', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 73027999, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73027999.pdf'),
(1457, '19254133', '993129031', 'haydeegiovanatorov@hotmail.com', 'HAYDEEGIOVA.TOROVERA@minedu.edu.pe', 'TORO                               ', 'VERASTEGUI                         ', 'HAYDEE GIOVANA                ', '1167543', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 19254133, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '19254133.pdf'),
(1458, '80400737', '948584993', 'claudiagat2@hotmail.com', 'claudia.vasquezd@minedu.edu.pe', 'VASQUEZ                            ', 'DIAZ                               ', 'CLAUDIA CECILIA PATRICIA      ', '1710201', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 80400737, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80400737.pdf'),
(1459, '75349784', '944401251', 'OLENKATISNADO@GMAIL.COM', 'OLENKAXIOMA.ALVAREZTISN@minedu.edu.pe', 'ALVAREZ                            ', 'TISNADO                            ', 'OLENKA XIOMARA                ', '1566447', '20', 'Destacado', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 75349784, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'No', 'Sí', 'Sí', 2, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75349784.pdf'),
(1461, '45553340', '926728879', 'lisseth.ce@gmail.com', 'brenda.charcapee@minedu.edu.pe', 'CHARCAPE                           ', 'ESPEJO                             ', 'BRENDA LISSETH                ', '0475806', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 45553340, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45553340.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(1463, '45760684', '948806875', 'KATHY.OTINIANO@GMAIL.COM', 'KATERINYOHAN.OTINIANODELG@minedu.edu.pe', 'OTINIANO                           ', 'DELGADO                            ', 'KATERIN YOHANA                ', '1706563', '20', 'Destacado', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 45760684, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45760684.pdf'),
(1467, '70278678', '942845280', 'lucerodelpilar28@gmail.com', 'LUCERODEL.QUIPUZCOAQUI@minedu.edu.pe', 'QUIPUZCO                           ', 'AQUINO                             ', 'LUCERO DEL PILAR              ', '0367094', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70278678, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70278678.pdf'),
(1469, '44077553', '979614828', 'lore_rr20@yahoo.es', 'LORENADEL.RODRIGUEZREYE@minedu.edu.pe', 'RODRIGUEZ                          ', 'REYES                              ', 'LORENA DEL PILAR              ', '0367151', '20', 'Destacado', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 44077553, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44077553.pdf'),
(1471, '10603278', '959597319', 'kelly77_friendly@hotmail.com', 'KELLYCONSU.SAAVEDRAGAMB@minedu.edu.pe', 'SAAVEDRA                           ', 'GAMBOA                             ', 'KELLY CONSUELO                ', '0218610', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 10603278, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '10603278.pdf'),
(1473, '46847128', '990088264', 'victoriasangay@hotmail.com', 'VICTORIAESTHE.SANGAYASMA@minedu.edu.pe', 'SANGAY                             ', 'ASMAT                              ', 'VICTORIA ESTHEFHANY           ', '1638212', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46847128, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46847128.pdf'),
(1474, '72843695', '983471133', 'ANITALUJAN.21@HOTMAIL.COM', 'ANAMARIA.VARGASLUJA@minedu.edu.pe', 'VARGAS                             ', 'LUJAN                              ', 'ANA MARIA                     ', '1411008', '20', 'Destacado', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 72843695, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72843695.pdf'),
(1478, '41006536', '962739228', 'alonso_c_m@hotmail.com', 'ALONSO.CORREAMUÑO@minedu.edu.pe', 'CORREA                             ', 'MUÑOZ                              ', 'ALONSO                        ', '0544965', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41006536, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'No', 'Sí', 'Sí', 2, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41006536.pdf'),
(1480, '16800806', '943126170', 'kellysudiaz@hotmail.com', 'KELLYSUGEY.DIAZMONT@minedu.edu.pe', 'DIAZ                               ', 'MONTENEGRO                         ', 'KELLY SUGEY                   ', '0753368', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16800806, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16800806.pdf'),
(1482, '45667878', '950261818', 'dennys194@hotmail.com', 'MANUELDENNY.MENDOZAREYE@minedu.edu.pe', 'MENDOZA                            ', 'REYES                              ', 'MANUEL DENNYS                 ', '1455823', '', '', 'Borrador', '', '', 'Calificado', 60, 'Destacado', 1, 45667878, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45667878.pdf'),
(1483, '43295944', '947701545', 'ESTRELLA.MIRANDA@INNOVASCHOOLS.EDU.PE', 'ESTRELLANOEMI.MIRANDABAZA@minedu.edu.pe', 'MIRANDA                            ', 'BAZALAR                            ', 'ESTRELLA NOEMI                ', '0544916', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43295944, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43295944.pdf'),
(1485, '16752218', '981707619', 'xora400@hotmail.com', 'ROXANA.QUINTANACAST@minedu.edu.pe', 'QUINTANA                           ', 'CASTRO                             ', 'ROXANA                        ', '0452599', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16752218, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16752218.pdf'),
(1490, '72947713', '940790653', 'TANYAFERNANDAV@GMAIL.COM', 'TANYAFERNA.VALERALOPE@minedu.edu.pe', 'VALERA                             ', 'LOPEZ                              ', 'TANYA FERNANDA                ', '1157288', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 72947713, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72947713.pdf'),
(1491, '00253824', '972857377', 'katherynn_23@hotmail.com', 'ELDAKARIN.BACAALEM@minedu.edu.pe', 'BACA                               ', 'ALEMAN                             ', 'ELDA KARINA                   ', '0572610', '20', 'Destacado', 'Calificado', '29', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 253824, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00253824.pdf'),
(1492, '44910742', '926885300', 'KATYLOURBG9@GMAIL.COM', 'KATHERYNLOURD.BOYERGARC@minedu.edu.pe', 'BOYER                              ', 'GARCIA                             ', 'KATHERYN LOURDES              ', '0348193', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 44910742, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44910742.pdf'),
(1493, '46578703', '942556726', 'arabellymercedes@outlook.com', 'arabelly.elizalder@minedu.edu.pe', 'ELIZALDE                           ', 'RUJEL                              ', 'ARABELLY MERCEDES             ', '0572610', '20', 'Destacado', 'Calificado', '26', 'Proceso', 'Calificado', 46, 'Logrado', 1, 46578703, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46578703.pdf'),
(1494, '46566967', '989684636', 'pao_01setp@hotmail.com', 'PAOLACONCE.HINOJOZACAYC@minedu.edu.pe', 'HINOJOZA                           ', 'CAYCHO                             ', 'PAOLA CONCEPCION              ', '0613851', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 46566967, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46566967.pdf'),
(1495, '41570191', '949381200', 'vitijosua2012@outlook.es', 'VICKYISABE.HUANACUNICRUZ@minedu.edu.pe', 'HUANACUNI                          ', 'CRUZ                               ', 'VICKY ISABEL                  ', '0937870', '', '', 'Calificado', '32', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 41570191, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41570191.pdf'),
(1496, '41472588', '963389766', 'krmencita_ucv@hotmail.com', 'carmen.infanteg@minedu.edu.pe', 'INFANTE                            ', 'GARRIDO                            ', 'CARMEN ELENA                  ', '1017185', '20', 'Destacado', 'Calificado', '29', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 41472588, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41472588.pdf'),
(1497, '74973617', '989603537', 'INFANTERAMIREZ97@GMAIL.COM', 'GLORIASTEFA.INFANTERAMI@minedu.edu.pe', 'INFANTE                            ', 'RAMIREZ                            ', 'GLORIA ESTEFANY               ', '1138155', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 74973617, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74973617.pdf'),
(1498, '41674496', '981398809', 'maricielo126@hotmail.com', 'ELENAROSME.LARRAINMORA@minedu.edu.pe', 'LARRAIN                            ', 'MORALES                            ', 'ELENA ROSMERY                 ', '1745686', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41674496, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41674496.pdf'),
(1500, '74026620', '935825442', 'noelia.mailla@gmail.com', 'NOELIA.MAMANIILLA@minedu.edu.pe', 'MAMANI                             ', 'ILLACHURA                          ', 'NOELIA                        ', '0675231', '20', 'Destacado', 'Calificado', '29', 'Suficiente', 'Calificado', 49, 'Logrado', 1, 74026620, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74026620.pdf'),
(1501, '41230807', '958903638', 'danitzammm@gmail.com', 'DANITZAMAGNO.MORANMUÑO@minedu.edu.pe', 'MORAN                              ', 'MUÑOZ                              ', 'DANITZA MAGNOLIA              ', '1136605', '16', 'Suficiente', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41230807, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41230807.pdf'),
(1502, '77913953', '969298173', 'YI1508NA@HOTMAIL.COM', 'CLAUDIALISET.PEÑAROME@minedu.edu.pe', 'PEÑA                               ', 'ROMERO                             ', 'CLAUDIA LISETTE               ', '1138155', '20', 'Destacado', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 77913953, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77913953.pdf'),
(1503, '00325455', '967031392', 'rosaibethramirezramirez7@gmail.com', 'ROSAIBETH.RAMIREZRAMI@minedu.edu.pe', 'RAMIREZ                            ', 'RAMIREZ                            ', 'ROSA IBETH                    ', '1522663', '20', 'Destacado', 'Borrador Calificado', '29', 'Suficiente', 'Calificado', 52, 'Logrado', 1, 325455, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '00325455.pdf'),
(1504, '42552586', '982691156', 'ERIKASAAVEDRANOEL@GMAIL.COM', 'ERIKAMILAG.SAAVEDRANOEL@minedu.edu.pe', 'SAAVEDRA                           ', 'NOEL                               ', 'ERIKA MILAGROS                ', '3904118', '', '', 'Borrador Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 42552586, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42552586.pdf'),
(1505, '70282907', '963040982', 'CARLARENESEVERINOMEDINA@GMAIL.COM', 'carla.severinom@minedu.edu.pe', 'SEVERINO                           ', 'MEDINA                             ', 'CARLA RENE                    ', '0572800', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 53, 'Destacado', 1, 70282907, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70282907.pdf'),
(1506, '42796197', '955628887', 'ARELYLICETT@GMAIL.COM', 'ARELYLICET.SILVAZARA@minedu.edu.pe', 'SILVA                              ', 'ZARATE                             ', 'ARELY LICETT                  ', '3904118', '16', 'Suficiente', 'Calificado', '29', 'Suficiente', 'Calificado', 45, 'Logrado', 1, 42796197, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42796197.pdf'),
(1507, '75075283', '974969346', 'ZKARENKATHERINE@GMAIL.COM', 'KARENKATHE.ZAPATAVILL@minedu.edu.pe', 'ZAPATA                             ', 'VILLEGAS                           ', 'KAREN KATHERINE               ', '1328681', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 75075283, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75075283.pdf'),
(1508, '42301244', '902021693', 'AJANETDELPILAR@GMAIL.COM', 'JANETDEL.AQUINOVILL@minedu.edu.pe', 'AQUINO                             ', 'VILLEGAS                           ', 'JANET DEL PILAR               ', '0350603', '20', 'Destacado', 'Borrador Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42301244, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42301244.pdf'),
(1510, '18122633', '948882431', 'dcha31@hotmail.com', 'DEISYMARIB.CHAVEZAMAY@minedu.edu.pe', 'CHAVEZ                             ', 'AMAYA                              ', 'DEISY MARIBEL                 ', '0260372', '20', 'Destacado', 'No enviado', '', '', 'Calificado', 56, 'Destacado', 1, 18122633, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18122633.pdf'),
(1511, '47338776', '973470897', 'TAMIEFFIO24@GMAIL.COM', 'MARIANATAMAR.EFFIOUCHO@minedu.edu.pe', 'EFFIO                              ', 'UCHOFEN                            ', 'MARIANA TAMARA                ', '0350660', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47338776, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47338776.pdf'),
(1512, '70036277', '959211725', 'DOCENTE_ANGIE@HOTMAIL.COM', 'angie.fernandezp@minedu.edu.pe', 'FERNANDEZ                          ', 'POVIS                              ', 'ANGIE WENDY                   ', '0350538', '20', 'Destacado', 'Borrador Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70036277, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70036277.pdf'),
(1513, '42402237', '945539555', 'edwin_100488@hotmail.com', 'SIRKIADEYSS.GARCIACAST@minedu.edu.pe', 'GARCIA                             ', 'CASTRO                             ', 'SIRKIA DEYSSI                 ', '0350678', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 42402237, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42402237.pdf'),
(1515, '43130230', '917606221', 'juro7000@gmail.com', 'JUANRODOL.HERNANDEZJUAR@minedu.edu.pe', 'HERNANDEZ                          ', 'JUAREZ                             ', 'JUAN RODOLFO                  ', '0350546', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 43130230, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43130230.pdf'),
(1516, '40748283', '956879223', 'yaqui_huamani_0280@hotmail.com', 'YAQUELINEVANES.HUAMANIARON@minedu.edu.pe', 'HUAMANI                            ', 'ARONI                              ', 'YAQUELINE VANESSA             ', '0350538', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40748283, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40748283.pdf'),
(1517, '42261712', '955660138', 'MALQON@HOTMAIL.COM', 'EDDYARCAN.LAURAQUIS@minedu.edu.pe', 'LAURA                              ', 'QUISPE                             ', 'EDDY ARCANGEL                 ', '0350538', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 42261712, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42261712.pdf'),
(1518, '48001875', '980555157', 'gfelixj6@gmail.com', 'LUISALBER.MAMANIFLOR@minedu.edu.pe', 'MAMANI                             ', 'FLORES                             ', 'LUIS ALBERTO                  ', '0350678', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 52, 'Logrado', 1, 48001875, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48001875.pdf'),
(1519, '41020490', '935281769', 'MARITA.MOGOLLON02@GMAIL.COM', 'MARITAAMALI.MOGOLLONPANT@minedu.edu.pe', 'MOGOLLON                           ', 'PANTA                              ', 'MARITA AMALIA                 ', '0350660', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 41020490, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41020490.pdf'),
(1520, '72185599', '961875321', 'karlaa1997@hotmail.com', 'KARLAALEJA.RAMOSLIEN@minedu.edu.pe', 'RAMOS                              ', 'LIENDO                             ', 'KARLA ALEJANDRA               ', '0350561', '20', 'Destacado', 'Borrador Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 72185599, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72185599.pdf'),
(1521, '46079693', '930486175', 'diana04_11@hotmail.com', 'DIANA.RAMOSMEND@minedu.edu.pe', 'RAMOS                              ', 'MENDOZA                            ', 'DIANA                         ', '0490482', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46079693, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46079693.pdf'),
(1522, '44467093', '966176645', 'ruthrivasmena@gmail.com', 'RUTHELIZA.RIVASMENA@minedu.edu.pe', 'RIVAS                              ', 'MENA                               ', 'RUTH ELIZABETH                ', '0260372', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 44467093, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44467093.pdf'),
(1523, '16786397', '947563610', 'cribs_04@hotmail.com', 'ROSADONAT.SECLENVERG@minedu.edu.pe', 'SECLEN                             ', 'VERGARA                            ', 'ROSA DONATILA                 ', '0467449', '16', 'Suficiente', 'Borrador Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 16786397, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16786397.pdf'),
(1524, '40029833', '959046741', 'melissabc9@hotmail.com', 'MELISSAGLORI.VARGASAVEN@minedu.edu.pe', 'VARGAS                             ', 'AVENDAÑO                           ', 'MELISSA GLORIA                ', '0467217', '20', 'Destacado', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40029833, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40029833.pdf'),
(1525, '75875464', '928148590', 'araceli.dya.97@gmail.com', 'DEISIARACE.ALAMARODR@minedu.edu.pe', 'ALAMA                              ', 'RODRÍGUEZ                          ', 'DEISI ARACELI                 ', '1686328', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 75875464, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75875464.pdf'),
(1526, '47890986', '915248905', 'fati.tauro.1993@gmail.com', 'FATIMAJUDIT.ANHUAMANORBE@minedu.edu.pe', 'ANHUAMAN                           ', 'ORBEGOSO                           ', 'FATIMA JUDITH                 ', '1686328', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47890986, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47890986.pdf'),
(1527, '40725576', '955897741', 'escarllette@hotmail.com', 'angelita.castilloa@minedu.edu.pe', 'CASTILLO                           ', 'AVALOS                             ', 'ANGELITA LOREN                ', '1645878', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40725576, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40725576.pdf'),
(1528, '40343524', '966183762', 'luzdavila2018@gmail.com', 'LUZESTER.DAVILAGUTI@minedu.edu.pe', 'DAVILA                             ', 'GUTIERREZ                          ', 'LUZ ESTER                     ', '1742782', '20', 'Destacado', 'Borrador Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 40343524, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40343524.pdf'),
(1529, '74909126', '970110656', 'YURICO.ROMERO27@GMAIL.COM', 'YURICOMARGA.DIAZROME@minedu.edu.pe', 'DIAZ                               ', 'ROMERO                             ', 'YURICO MARGARITA              ', '1646421', '20', 'Destacado', 'Borrador Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 74909126, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74909126.pdf'),
(1530, '47872059', '993214140', 'fanely_aries@hotmail.com', 'FANNYELIZA.GELDRESURQU@minedu.edu.pe', 'GELDRES                            ', 'URQUIZO                            ', 'FANNY ELIZABETH               ', '1686310', '16', 'Suficiente', 'Borrador Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47872059, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47872059.pdf'),
(1531, '72305188', '937511888', 'solhernandez_1213@hotmail.com', 'SOLGABRI.HERNANDEZSAIR@minedu.edu.pe', 'HERNÁNDEZ                          ', 'SAIRA                              ', 'SOL GABRIELA                  ', '1741321', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 72305188, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72305188.pdf'),
(1532, '45633722', '925471191', 'poletlazaro27@hotmail.com', 'POLETDEL.LAZAROZAVA@minedu.edu.pe', 'LAZARO                             ', 'ZAVALETA                           ', 'POLET DEL ROSARIO             ', '1591023', '16', 'Suficiente', 'Borrador Calificado', '40', 'Destacado', 'Calificado', 52, 'Logrado', 1, 45633722, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45633722.pdf'),
(1533, '18169633', '933846946', 'ANGELA.874@HOTMAIL.COM', 'LUZANGEL.LUJANPARE@minedu.edu.pe', 'LUJAN                              ', 'PAREDES                            ', 'LUZ ANGELICA                  ', '1742774', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 18169633, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18169633.pdf'),
(1534, '46777441', '986288851', 'esmeralda_17_90@hotmail.com', 'JULIARUTH.MARTINEZMIRA@minedu.edu.pe', 'MARTINEZ                           ', 'MIRANDA                            ', 'JULIA RUTH                    ', '1638691', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 46777441, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46777441.pdf'),
(1535, '48067407', '974498484', 'snegrerosjuarez@gmail.com', 'SANDRADENNI.NEGREROSJUAR@minedu.edu.pe', 'NEGREROS                           ', 'JUAREZ                             ', 'SANDRA DENNIS                 ', '1742774', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 48067407, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48067407.pdf'),
(1536, '74542017', '924023602', 'JRAMONH@UPAO.EDU.PE', 'JAZMINYELIT.RAMONHUAY@minedu.edu.pe', 'RAMON                              ', 'HUAYTALLA                          ', 'JAZMIN YELITZA                ', '0690446', '20', 'Destacado', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 74542017, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74542017.pdf'),
(1537, '74909143', '957610979', 'lizeth_19_leo@hotmail.com', 'LESLYLIZET.RIVASPLATACUBA@minedu.edu.pe', 'RIVASPLATA                         ', 'CUBA                               ', 'LESLY LIZETH                  ', '1686302', '20', 'Destacado', 'Borrador Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 74909143, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74909143.pdf'),
(1538, '40565482', '959259499', 'KYRM_30@HOTMAIL.COM', 'KARLAYVONN.ROBLESMELO@minedu.edu.pe', 'ROBLES                             ', 'MELOSEVICH                         ', 'KARLA YVONNE                  ', '0757682', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 40565482, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40565482.pdf'),
(1539, '70515654', '917712615', 'JOSYSALINASARANDAJYM15@GMAIL.COM', 'JOSSELYN.SALINASARAN@minedu.edu.pe', 'SALINAS                            ', 'ARANDA                             ', 'JOSSELYN                      ', '1210897', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70515654, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70515654.pdf'),
(1540, '77817574', '977560051', 'sofia.97.saona@gmail.com', 'GREYSSOFIA.SAONAYBAÑ@minedu.edu.pe', 'SAONA                              ', 'YBAÑEZ                             ', 'GREYS SOFIA                   ', '1686252', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 77817574, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77817574.pdf'),
(1541, '42643794', '968379361', 'YDIEL_SR@HOTMAIL.COM', 'LEIDYPATRI.SIGÜEÑASRODR@minedu.edu.pe', 'SIGÛEÑAS                           ', 'RODRÍGUEZ                          ', 'LEIDY PATRICIA                ', '1686344', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 56, 'Destacado', 1, 42643794, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42643794.pdf'),
(1542, '70932885', '947652887', 'dey_kadek24@hotmail.com', 'DAISYAIDA.LOPEZMARC@minedu.edu.pe', 'LOPEZ                              ', 'MARCELO                            ', 'DAISY AIDA                    ', '1706852', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70932885, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70932885.pdf'),
(1543, '40133711', '952990428', 'MAMANIQUISPEDINAAYDEE@GMAIL.COM', 'DINAAYDEE.MAMANIQUIS@minedu.edu.pe', 'MAMANI                             ', 'QUISPE                             ', 'DINA AYDEE                    ', '1655968', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40133711, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40133711.pdf'),
(1544, '70009584', '998833818', 'franzzuamarquina29@hotmail.com', 'ESTHEFANNYFRANZ.MARQUINAMORA@minedu.edu.pe', 'MARQUINA                           ', 'MORALES                            ', 'ESTHEFANNY FRANZZUA           ', '1706803', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70009584, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70009584.pdf'),
(1545, '70015808', '930598721', 'kmelo2403@gmail.com', 'KATHERINENORMA.MELOHUAM@minedu.edu.pe', 'MELO                               ', 'HUAMAN                             ', 'KATHERINE NORMA               ', '1415462', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70015808, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70015808.pdf'),
(1546, '41070013', '948099488', 'lorenanunezrosario@gmail.com', 'LORENALISBE.NUÑEZROSA@minedu.edu.pe', 'NUÑEZ                              ', 'ROSARIO                            ', 'LORENA LISBETH                ', '1427319', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41070013, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41070013.pdf'),
(1547, '40878039', '903554038', 'KARENNL_22@HOTMAIL.COM', 'KARENPAOLA.NUÑIVEROLEON@minedu.edu.pe', 'NUÑIVERO                           ', 'LEON                               ', 'KAREN PAOLA                   ', '1494061', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40878039, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40878039.pdf'),
(1548, '70259355', '935468693', 'sheila_libra_16@hotmail.com', 'SHEILAFIAMA.PALOMINOCUEV@minedu.edu.pe', 'PALOMINO                           ', 'CUEVA                              ', 'SHEILA FIAMA                  ', '1426311', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70259355, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70259355.pdf'),
(1549, '70109164', '923321745', 'ada_tlv_23@hotmail.com', 'ada.paria@minedu.edu.pe', 'PARI                               ', 'APAZA                              ', 'ADA EDITH                     ', '1690130', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70109164, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70109164.pdf'),
(1550, '32965045', '986584543', 'mary_isa_014@hotmail.com', 'MARIAISABE.QUIÑONESVARG@minedu.edu.pe', 'QUIÑONES                           ', 'VARGAS                             ', 'MARIA ISABEL                  ', '1550557', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 32965045, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '32965045.pdf'),
(1551, '40175649', '946198457', 'GIOVISSRC@HOTMAIL.COM', 'GIOVANNABEATR.RODRIGUEZCAMP@minedu.edu.pe', 'RODRIGUEZ                          ', 'CAMPOS                             ', 'GIOVANNA BEATRIZ              ', '1616077', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 40175649, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40175649.pdf'),
(1552, '29233135', '958162255', 'ROMANRAFAELROSAVIRGINIA@GMAIL.COM', 'ROSAVIRGI.ROMANRAFA@minedu.edu.pe', 'ROMAN                              ', 'RAFAEL                             ', 'ROSA VIRGINIA                 ', '1494152', '20', 'Destacado', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 29233135, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '29233135.pdf'),
(1553, '70279740', '951404150', 'SOLORZANOARACELY54@GMAIL.COM', 'aracely.solorzanoa@minedu.edu.pe', 'SOLORZANO                          ', 'AVALOS                             ', 'ARACELY GERALDINE             ', '1788017', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70279740, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70279740.pdf'),
(1554, '70581681', '965437168', 'caro_1451@hotmail.com', 'CARMENROSA.TOMASNARV@minedu.edu.pe', 'TOMAS                              ', 'NARVAEZ                            ', 'CARMEN ROSA                   ', '1742576', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70581681, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70581681.pdf'),
(1555, '70001781', '961483661', 'katia1096@hotmail.com', 'KATIAMARIA.TRUJILLOGOYC@minedu.edu.pe', 'TRUJILLO                           ', 'GOYCOCHEA                          ', 'KATIA MARIA                   ', '1426345', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 70001781, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70001781.pdf'),
(1556, '70117182', '929665757', 'TEPHAVALVERDE@GMAIL.COM', 'STEPHANYCECIL.VALVERDEROBL@minedu.edu.pe', 'VALVERDE                           ', 'ROBLES                             ', 'STEPHANY CECILIA              ', '1426329', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70117182, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70117182.pdf'),
(1557, '70360919', '975862153', 'andreitha.1991@outlook.es', 'andrea.vasquezm@minedu.edu.pe', 'VASQUEZ                            ', 'MALAGA                             ', 'ANDREA                        ', '1777671', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70360919, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70360919.pdf'),
(1558, '21464695', '924327253', 'NARDAVELASQUEZORDERIQUE@GMAIL.COM', 'NARDAANGEL.VELASQUEZORDE@minedu.edu.pe', 'VELASQUEZ                          ', 'ORDERIQUE DE GAMBOA                ', 'NARDA ANGELICA                ', '1427442', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 21464695, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '21464695.pdf'),
(1559, '43509248', '957204058', 'rossalva1209@gmail.com', 'ROSANIMIA.ALVARADOARBI@minedu.edu.pe', 'ALVARADO                           ', 'ARBILDO                            ', 'ROSA NIMIA                    ', '1332832', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43509248, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43509248.pdf'),
(1560, '46824215', '949774131', 'GABE.AG91@GMAIL.COM', 'MYRIAMGABRI.ANGULOGUEV@minedu.edu.pe', 'ANGULO                             ', 'GUEVARA                            ', 'MYRIAM GABRIELA               ', '0395236', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46824215, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46824215.pdf'),
(1561, '44764515', '963962120', 'celyn356@hotmail.com', 'ZOILAEVELY.CASTROMOSC@minedu.edu.pe', 'CASTRO                             ', 'MOSCOL                             ', 'ZOILA EVELYN                  ', '1158880', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44764515, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44764515.pdf'),
(1562, '16802181', '967344018', 'SILVIDEA@HOTMAIL.COM', 'SILVIAMEDAL.DEJOAGUI@minedu.edu.pe', 'DEJO                               ', 'AGUINAGA                           ', 'SILVIA MEDALIT                ', '0452623', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16802181, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16802181.pdf'),
(1563, '19104289', '982169639', 'MERLIN_5_13@HOTMAIL.COM', 'MERLINLIZET.DIAZNARR@minedu.edu.pe', 'DIAZ                               ', 'NARRO                              ', 'MERLIN LIZETH                 ', '1157650', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 19104289, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '19104289.pdf'),
(1564, '47635309', '942124016', 'rubi_fer_8e@hotmail.com', 'claudia.fernandezv@minedu.edu.pe', 'FERNANDEZ                          ', 'VILLA                              ', 'CLAUDIA RUBBI                 ', '1348648', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 47635309, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47635309.pdf'),
(1565, '73873696', '971455608', 'JUVER.JOAO@GMAIL.COM', 'JUVERJOAO.FLORESREYE@minedu.edu.pe', 'FLORES                             ', 'REYES                              ', 'JUVER JOAO                    ', '0395442', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 73873696, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73873696.pdf'),
(1566, '46890529', '992719314', 'dc_uceda@hotmail.com', 'DIANACAROL.FLORESUCED@minedu.edu.pe', 'FLORES                             ', 'UCEDA                              ', 'DIANA CAROLINA                ', '1351667', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46890529, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46890529.pdf'),
(1567, '16798531', '922496175', 'teacherhugo_12@hotmail.com', 'HUGO.ILATOMAMEND@minedu.edu.pe', 'ILATOMA                            ', 'MENDOZA                            ', 'HUGO                          ', '0582973', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16798531, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16798531.pdf'),
(1568, '46363995', '976797638', 'cintia_1726@hotmail.com', 'CINTIAGRACI.ÑUÑUVERAARRO@minedu.edu.pe', 'ÑUÑUVERA                           ', 'ARROYO                             ', 'CINTIA GRACIELA               ', '1167550', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46363995, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46363995.pdf'),
(1569, '46329812', '979623778', 'GIULIANA.ORS@GMAIL.COM', 'GIULIANA.ORRILLOSALA@minedu.edu.pe', 'ORRILLO                            ', 'SALAZAR                            ', 'GIULIANA                      ', '0672600', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 46329812, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '46329812.pdf'),
(1570, '70558280', '933869634', 'glopeno@hotmail.com', 'GLORIAEDILM.PEÑANOVO@minedu.edu.pe', 'PEÑA                               ', 'NOVOA                              ', 'GLORIA EDILMA                 ', '1167907', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 70558280, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70558280.pdf'),
(1571, '44524317', '986351485', 'MIGUELPH18@HOTMAIL.COM', 'MIGUELJONAT.PORTOCARREROHERN@minedu.edu.pe', 'PORTOCARRERO                       ', 'HERNANDEZ                          ', 'MIGUEL JONATHAN               ', '0394197', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44524317, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44524317.pdf'),
(1573, '42127827', '920375823', 'BRENLOSSIO@HOTMAIL.COM', 'BRENDAMARIA.RENGIFOLOSS@minedu.edu.pe', 'RENGIFO                            ', 'LOSSIO                             ', 'BRENDA MARIA                  ', '0394262', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42127827, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42127827.pdf'),
(1574, '73036966', '921540196', 'vroqc.2.5@gmail.com', 'VIVIANAJAHAI.ROQUECANT@minedu.edu.pe', 'ROQUE                              ', 'CANTINETT                          ', 'VIVIANA JAHAIRA               ', '0394197', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 73036966, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73036966.pdf'),
(1575, '44370393', '987193628', 'rocio20_71@hotmail.com', 'ROCIODEL.ROSASREYE@minedu.edu.pe', 'ROSAS                              ', 'REYES                              ', 'ROCIO DEL PILAR               ', '0394452', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44370393, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44370393.pdf'),
(1576, '45265482', '984448028', 'cami012014@gmail.com', 'MARYYOVAN.ROSASTANT@minedu.edu.pe', 'ROSAS                              ', 'TANTAQUISPE                        ', 'MARY YOVANNA                  ', '1167626', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45265482, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45265482.pdf'),
(1592, '16802191', '987548590', 'geminisc66@hotmail.com', 'GIANNACATHE.ALCALDEGALL@minedu.edu.pe', 'ALCALDE                            ', 'GALLARDO                           ', 'GIANNA CATHERINE              ', '0350389', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16802191, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16802191.pdf'),
(1593, '03886669', '971460263', 'GLORIACANALESRAMIREZ13@GMAIL.COM', 'GLORIA.CANALESRAMI@minedu.edu.pe', 'CANALES                            ', 'RAMIREZ                            ', 'GLORIA                        ', '0860411', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 3886669, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '03886669.pdf'),
(1594, '45574231', '930878513', 'milagros_4_86@hotmail.com', 'CECILIAMILAG.CONTRERASCASA@minedu.edu.pe', 'CONTRERAS                          ', 'CASAS                              ', 'CECILIA MILAGROS              ', '0349886', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45574231, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45574231.pdf'),
(1595, '42767369', '978925571', 'monidelmi@gmail.com', 'MONICADEL.CUSTODIOPUIC@minedu.edu.pe', 'CUSTODIO', 'PUICON', 'MONICA DEL MILAGRO', '0840686', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 42767369, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42767369.pdf'),
(1596, '72123678', '952331039', 'marjorie31g@gmail.com', 'MARJORIEGERAL.DOLORESALEG@minedu.edu.pe', 'DOLORES                            ', 'ALEGRE                             ', 'MARJORIE GERALDINE            ', '0350371', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 72123678, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72123678.pdf'),
(1597, '44774484', '954377971', 'nuri_farfan@hotmail.com', 'NURIDEL.FARFANLUNA@minedu.edu.pe', 'FARFAN                             ', 'LUNA                               ', 'NURI DEL PILAR                ', '0260406', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 44774484, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44774484.pdf'),
(1598, '41423976', '983740176', 'mguzm3013@gmail.com', 'MARIAANGEL.GUZMANMEND@minedu.edu.pe', 'GUZMAN                             ', 'MENDOZA                            ', 'MARIA ANGELICA                ', '0260356', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 41423976, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41423976.pdf'),
(1599, '43076140', '979208979', 'EYMI_17_4@HOTMAIL.COM', 'ELITHYAQUE.MORALESNEIR@minedu.edu.pe', 'MORALES                            ', 'NEIRA                              ', 'ELITH YAQUELINA               ', '0350454', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 43076140, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43076140.pdf'),
(1600, '17448740', '978955492', 'arayeletza5@hotmail.com', 'MONICAARACE.NUÑEZMEJI@minedu.edu.pe', 'NUÑEZ                              ', 'MEJIA                              ', 'MONICA ARACELY                ', '0860353', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 17448740, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '17448740.pdf'),
(1601, '45522192', '915054851', 'esejota2701@gmail.com', 'SANDRAJOHAN.PACHERRESMUÑO@minedu.edu.pe', 'PACHERRES', 'MUÑOZ', 'SANDRA JOHANA', '0350348', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45522192, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45522192.pdf'),
(1602, '16686324', '942489726', 'ROSHIPIZARROP@GMAIL.COM', 'ROXANADEL.PIZARROPAST@minedu.edu.pe', 'PIZARRO                            ', 'PASTOR                             ', 'ROXANA DEL SOCORRO            ', '0350371', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 16686324, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16686324.pdf'),
(1603, '41975177', '927690494', 'pattys06@hotmail.com', 'PATRICIA.QUESÑAYTIPI@minedu.edu.pe', 'QUESÑAY                            ', 'TIPIANI                            ', 'PATRICIA                      ', '0860353', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 41975177, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41975177.pdf'),
(1604, '40165212', '973671322', 'lucysanga@hotmail.com', 'LUCYPAULI.SANGASUCA@minedu.edu.pe', 'SANGA                              ', 'SUCASACA                           ', 'LUCY PAULINA                  ', '0349886', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40165212, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40165212.pdf');
INSERT INTO `students` (`id`, `dni`, `celular`, `email`, `email_minedu`, `ape_paterno`, `ape_materno`, `nombres`, `cod_mod`, `NOTA_DO`, `RUBRICA_DO`, `ESTADO_ME`, `NOTA_ME`, `RUBRICA_ME`, `ESTADO_FIN`, `NOTA_FIN`, `rubrica_fin`, `COMPONENTE 1`, `DNI otro`, `ASESORÍA 01`, `ASESORÍA 02`, `ASESORÍA 03`, `ASESORÍA 04`, `ASESORÍA 05`, `ASESORÍA 06`, `N_ASESORIA`, `GIA 01`, `GIA 02`, `GIA 03`, `N_GIA`, `CURSO 01`, `CURSO 02`, `CURSO 03`, `CURSO 04`, `CURSO 05`, `N_CURSO`, `COMPONENTE 2`, `situacion_final`, `archivo`) VALUES
(1606, '80364346', '950151959', 'GRACIELA20VG@GMAIL.COM', 'GRACIELADEL.VILLEGASGARC@minedu.edu.pe', 'VILLEGAS                           ', 'GARCIA                             ', 'GRACIELA DEL CARMEN           ', '0350439', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 80364346, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80364346.pdf'),
(1607, '02852130', '942418257', 'pili.soco@hotmail.com', 'SOCORRODEL.VILLEGASMARQ@minedu.edu.pe', 'VILLEGAS                           ', 'MARQUEZ                            ', 'SOCORRO DEL PILAR             ', '0260356', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 2852130, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '02852130.pdf'),
(1608, '45792012', '925794850', 'MARY_20_67@HOTMAIL.COM', 'MARICELAJACKE.ZEÑAFIES@minedu.edu.pe', 'ZEÑA                               ', 'FIESTAS                            ', 'MARICELA JACKELINE            ', '0350371', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 45792012, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45792012.pdf'),
(1609, '73301116', '974324406', 'kayjoshelyn26@gmail.com', 'KAYJOSHE.ALLCASALA@minedu.edu.pe', 'ALLCA                              ', 'SALAS                              ', 'KAY JOSHELYN                  ', '1690049', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 73301116, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '73301116.pdf'),
(1610, '77389246', '910671138', 'arihuanccolilianerika@gmail.com', 'LILIANERIKA.ARIHUAN@minedu.edu.pe', 'ARI                                ', 'HUANCCO                            ', 'LILIAN ERIKA                  ', '1168137', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 77389246, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77389246.pdf'),
(1611, '74739062', '931505743', 'elizeth.blas.1998@hotmail.com', 'ELIZETPRECI.BLASSAAV@minedu.edu.pe', 'BLAS                               ', 'SAAVEDRA                           ', 'ELIZET PRECILIANA             ', '1651298', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74739062, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74739062.pdf'),
(1612, '76738726', '933663672', 'yaira_6_28@hotmail.com', 'MAYURIYAHAI.CAMPOSVIDA@minedu.edu.pe', 'CAMPOS                             ', 'VIDAL                              ', 'MAYURI YAHAIRA                ', '1550334', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 76738726, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76738726.pdf'),
(1614, '72862249', '961581009', 'diani.paola27@gmail.com', 'DIANAPAOLA.GARCIAGARC@minedu.edu.pe', 'GARCIA                             ', 'GARCIA                             ', 'DIANA PAOLA                   ', '0690552', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 72862249, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72862249.pdf'),
(1615, '72582638', '951738412', 'star_w15@hotmail.com', 'SHIRLEYWENDY.JOAQUINSALD@minedu.edu.pe', 'JOAQUIN                            ', 'SALDAÑA                            ', 'SHIRLEY WENDY                 ', '1431311', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 72582638, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72582638.pdf'),
(1616, '40949469', '917199618', 'banessa_llaury@hotmail.com', 'DALILABANES.LLAURYAGUI@minedu.edu.pe', 'LLAURY                             ', 'AGUILAR                            ', 'DALILA BANESSA                ', '1591106', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 40949469, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40949469.pdf'),
(1617, '75527180', '912143385', 'lozanobacalizethalina@gmail.com', 'LIZETHALINA.LOZANOBACA@minedu.edu.pe', 'LOZANO                             ', 'BACA                               ', 'LIZETH ALINA                  ', '1654391', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75527180, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75527180.pdf'),
(1618, '80156835', '995874809', 'dayana_me27@hotmail.com', 'GLADYSLILIA.MENDOZAESQU@minedu.edu.pe', 'MENDOZA                            ', 'ESQUIVEL                           ', 'GLADYS LILIANA                ', '0734574', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 80156835, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '80156835.pdf'),
(1619, '74750896', '954439986', 'PAREDESPMARIA17@GMAIL.COM', 'MARIAELIZA.PAREDESPARE@minedu.edu.pe', 'PAREDES                            ', 'PAREDES                            ', 'MARIA ELIZABETH               ', '1644756', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74750896, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74750896.pdf'),
(1620, '77327102', '970115613', 'HIROMI.RV.02@GMAIL.COM', 'HIROMIANABE.ROQUEVALV@minedu.edu.pe', 'ROQUE                              ', 'VALVERDE                           ', 'HIROMI ANABEL                 ', '1431386', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 77327102, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77327102.pdf'),
(1621, '75944673', '957454585', 'lucysegura1996@gmail.com', 'MARIALUCIL.SEGURASAMA@minedu.edu.pe', 'SEGURA                             ', 'SAMANA                             ', 'MARIA LUCILA                  ', '0630814', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75944673, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75944673.pdf'),
(1622, '74478847', '915151052', 'medalittz_1512@hotmail.com', 'ENMAMEDAL.TOMASZAVA@minedu.edu.pe', 'TOMAS                              ', 'ZAVALETA                           ', 'ENMA MEDALIT                  ', '0622613', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 74478847, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '74478847.pdf'),
(1623, '40927013', '985953645', 'BARBOZA0329@GMAIL.COM', 'GLADYS.VASQUEZBARB@minedu.edu.pe', 'VASQUEZ                            ', 'BARBOZA                            ', 'GLADYS                        ', '1444082', '', '', 'No enviado', '', '', 'Calificado', 48, 'Logrado', 1, 40927013, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40927013.pdf'),
(1624, '75549129', '901101724', 'jesselyy.01@gmail.com', 'YESSENIAJESSE.ZAVALAPRIE@minedu.edu.pe', 'ZAVALA                             ', 'PRIETO                             ', 'YESSENIA JESSELY              ', '1654441', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 75549129, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75549129.pdf'),
(1625, '77564399', '996655963', 'lisbethzavaletaquiroz@gmail.com', 'LISBETHMARIS.ZAVALETAQUIR@minedu.edu.pe', 'ZAVALETA                           ', 'QUIROZ                             ', 'LISBETH MARISOL               ', '1706829', '', '', 'No enviado', '', '', 'Calificado', 60, 'Destacado', 1, 77564399, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '77564399.pdf'),
(1626, '70893470', '934015577', 'DIANIS211991@GMAIL.COM', 'DIANAIRIS.ALVAREZSALI@minedu.edu.pe', 'ALVAREZ                            ', 'SALINAS                            ', 'DIANA IRIS                    ', '1582774', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70893470, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70893470.pdf'),
(1627, '70332103', '982572971', 'florsbc03@gmail.com', 'FLORMARIA.BELTRANCAST@minedu.edu.pe', 'BELTRAN                            ', 'CASTILLO                           ', 'FLOR MARIA                    ', '1456821', '16', 'Suficiente', 'Calificado', '40', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70332103, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70332103.pdf'),
(1628, '70122537', '976652478', 'ROSMERYCARDENAS1089@GMAIL.COM', 'MARIZABETHROSME.CARDENASFLOR@minedu.edu.pe', 'CARDENAS                           ', 'FLORES                             ', 'MARIZABETH ROSMERY            ', '1582691', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70122537, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70122537.pdf'),
(1629, '70267920', '986784184', 'iandrac417@gmail.com', 'IANDRAMARGO.CASTILLOPOLO@minedu.edu.pe', 'CASTILLO                           ', 'POLO                               ', 'IANDRA MARGOTH                ', '1683176', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70267920, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70267920.pdf'),
(1630, '70133374', '938570954', 'cyntia.280792@gmail.com', 'CYNTIALILIA.COCHACHINFLOR@minedu.edu.pe', 'COCHACHIN                          ', 'FLORES                             ', 'CYNTIA LILIANA                ', '1455922', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70133374, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70133374.pdf'),
(1631, '70156605', '985137586', 'INESFERMINPAZ@HOTMAIL.COM', 'INESSANDY.FERMINPAZ@minedu.edu.pe', 'FERMIN                             ', 'PAZ                                ', 'INES SANDY                    ', '1456953', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70156605, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70156605.pdf'),
(1632, '44765322', '949824069', 'YAMINZIVAN@GMAIL.COM', 'YAMINNOEMI.GARRAGATEPALO@minedu.edu.pe', 'GARRAGATE                          ', 'PALOMINO                           ', 'YAMIN NOEMI                   ', '1589621', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 44765322, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44765322.pdf'),
(1633, '71393720', '926009501', 'QUIQUIO_AHOME_26@HOTMAIL.COM', 'IRISMARIA.LOPEZCAST@minedu.edu.pe', 'LOPEZ                              ', 'CASTRO                             ', 'IRIS MARIA                    ', '1455948', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 71393720, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71393720.pdf'),
(1634, '71112044', '964447367', 'lopez_hl-95@hotmail.com', 'HERIBERMAIN.LOPEZLIÑA@minedu.edu.pe', 'LOPEZ                              ', 'LIÑAN                              ', 'HERIBER MARIN                 ', '1644624', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71112044, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71112044.pdf'),
(1635, '70332982', '932803394', 'natycarmen24@hotmail.com', 'NATALYCARME.MEDINAALVA@minedu.edu.pe', 'MEDINA                             ', 'ALVARO                             ', 'NATALY CARMEN                 ', '1706720', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 70332982, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70332982.pdf'),
(1636, '48433348', '973716465', 'SHERYMV.20@GMAIL.COM', 'SHERIDANMICAL.MORALESVALV@minedu.edu.pe', 'MORALES                            ', 'VALVERDE                           ', 'SHERIDAN MICAL                ', '1456045', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48433348, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48433348.pdf'),
(1637, '47746267', '918407506', 'MAYTEVA123@GMAIL.COM', 'carolina.ninam@minedu.edu.pe', 'NINA                               ', 'MAYORGA                            ', 'CAROLINA                      ', '1455922', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 47746267, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '47746267.pdf'),
(1638, '45881891', '928447253', 'CATAPO.1989@GMAIL.COM', 'INESCATAL.PONCEANAM@minedu.edu.pe', 'PONCE                              ', 'ANAMPA                             ', 'INES CATALINA                 ', '1415454', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 45881891, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '45881891.pdf'),
(1639, '70315249', '991633140', 'ROSSREAP@GMAIL.COM', 'ROSSMERY.REAPMONT@minedu.edu.pe', 'REAP                               ', 'MONTES                             ', 'ROSS MERY                     ', '0587824', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 70315249, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70315249.pdf'),
(1640, '71491464', '920632305', 'DIOLINDA.MIRTHA@GMAIL.COM', 'DIOLINDAMIRTH.TRUJILLORABI@minedu.edu.pe', 'TRUJILLO                           ', 'RABINES                            ', 'DIOLINDA MIRTHA               ', '1685569', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 71491464, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '71491464.pdf'),
(1641, '48519528', '935967860', 'JAHAIRAABI.30@GMAIL.COM', 'ABIGAILJAHAI.VILLANUEVATELL@minedu.edu.pe', 'VILLANUEVA                         ', 'TELLO                              ', 'ABIGAIL JAHAIRA               ', '1455955', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 60, 'Destacado', 1, 48519528, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48519528.pdf'),
(1642, '48339820', '973770774', 'MEVIOLETA80@GMAIL.COM', 'GLORIAVIOLE.ZUÑIGAMELG@minedu.edu.pe', 'ZUÑIGA                             ', 'MELGAREJO                          ', 'GLORIA VIOLETA                ', '1652874', '16', 'Suficiente', 'Calificado', '36', 'Destacado', 'Calificado', 56, 'Destacado', 1, 48339820, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '48339820.pdf'),
(1643, '75656676', '934690059', 'gersondavidarquerosprado@gmail.com', 'GERSONDAVID.ARQUEROSPRAD@minedu.edu.pe', 'ARQUEROS                           ', 'PRADO                              ', 'GERSON DAVID                  ', '0394239', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 75656676, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '75656676.pdf'),
(1644, '72247697', '993288657', 'avidanasto@gmail.com', 'EDWINAVIDA.ASTOPOLO@minedu.edu.pe', 'ASTO                               ', 'POLO                               ', 'EDWIN AVIDAN                  ', '1375047', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 72247697, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '72247697.pdf'),
(1645, '18196188', '954445680', 'aiapaec7@hotmail.com', 'MARTINRICAR.CHAVARRYCAPR@minedu.edu.pe', 'CHAVARRY                           ', 'CAPRISTAN                          ', 'MARTIN RICARDO                ', '1167626', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18196188, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18196188.pdf'),
(1646, '76690664', '978227818', 'CHAYANNE268@GMAIL.COM', 'CHAYANNEPIERE.GÁLVEZCORO@minedu.edu.pe', 'GÁLVEZ                             ', 'CORONEL                            ', 'CHAYANNE PIERE                ', '1666288', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 76690664, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '76690664.pdf'),
(1647, '44456579', '962301935', 'nilu_16_1@hotmail.com', 'alvaro.galvezo@minedu.edu.pe', 'GALVEZ                             ', 'OBLITAS                            ', 'ALVARO NILTON                 ', '0493601', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 44456579, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '44456579.pdf'),
(1648, '42911723', '980039921', 'SINTIA.LEON.SL@GMAIL.COM', 'SINTIASMIT.LEÓNLEÓN@minedu.edu.pe', 'LEÓN                               ', 'LEÓN                               ', 'SINTIA SMIT                   ', '1167550', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 42911723, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '42911723.pdf'),
(1649, '70665743', '986481170', 'mikeriosmedina@outlook.com', 'MIKEBRYAM.RIOSMEDI@minedu.edu.pe', 'RIOS                               ', 'MEDINA                             ', 'MIKE BRYAM                    ', '1166412', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 56, 'Destacado', 1, 70665743, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70665743.pdf'),
(1650, '16727634', '948287623', 'patty-rcastro@hotmail.com', 'ROXANAPATRI.RODRIGUEZCAST@minedu.edu.pe', 'RODRIGUEZ                          ', 'CASTRO                             ', 'ROXANA PATRICIA               ', '0545509', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 16727634, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '16727634.pdf'),
(1651, '40182783', '944459178', 'jessica_olazabal@hotmail.com', 'JESSICADENIS.RODRÍGUEZOLAZ@minedu.edu.pe', 'RODRÍGUEZ                          ', 'OLAZÁBAL                           ', 'JESSICA DENISSE               ', '0758060', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 40182783, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '40182783.pdf'),
(1653, '70398010', '921208795', 'LUCELIZA1196@GMAIL.COM', 'LUCEROELIZA.ROMEROSACH@minedu.edu.pe', 'ROMERO                             ', 'SACHUN                             ', 'LUCERO ELIZABETH              ', '1459171', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 70398010, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '70398010.pdf'),
(1655, '18215461', '956327348', 'patricia_tejada@hotmail.com', 'PATRICIADEL.TEJADAVASQ@minedu.edu.pe', 'TEJADA                             ', 'VASQUEZ                            ', 'PATRICIA DEL ROCIO            ', '1533595', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 18215461, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18215461.pdf'),
(1657, '18168104', '963823820', 'elfilipino912@hotmail.com', 'EDWINALBER.URBINAAGUI@minedu.edu.pe', 'URBINA                             ', 'AGUIRRE                            ', 'EDWIN ALBERTO                 ', '1157668', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 18168104, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '18168104.pdf'),
(1658, '43679490', '953707362', 'ronald1619@hotmail.com', 'RONALD.VARGASISLA@minedu.edu.pe', 'VARGAS                             ', 'ISLA                               ', 'RONALD                        ', '1157148', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 60, 'Destacado', 1, 43679490, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '43679490.pdf'),
(1659, '41852957', '948820536', 'josezambranob@gmail.com', 'JOSEANTON.ZAMBRANOBRIC@minedu.edu.pe', 'ZAMBRANO                           ', 'BRICEÑO                            ', 'JOSE ANTONIO                  ', '0394213', '16', 'Suficiente', 'Calificado', '32', 'Suficiente', 'Calificado', 48, 'Logrado', 1, 41852957, 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 'Sí', 6, 'Sí', 'Sí', 'Sí', 3, 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 'APROBADO', 5, 1, 'APROBADO', '41852957.pdf'),
(1660, '45645359', NULL, 'melany.d.ch.p@gmail.com', NULL, 'CHAVESTA', 'PEÑA', 'DEYMI MELANY', '0330330', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Logrado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '45645359.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students1`
--

CREATE TABLE `students1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `puesto` varchar(200) NOT NULL,
  `inicio1` date DEFAULT NULL,
  `final1` date DEFAULT NULL,
  `inicio2` date DEFAULT NULL,
  `final2` date DEFAULT NULL,
  `qr` char(20) NOT NULL,
  `modalidad` char(20) NOT NULL,
  `textofinal` varchar(150) NOT NULL,
  `dni` char(8) NOT NULL DEFAULT '0',
  `archivo` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `students1`
--

INSERT INTO `students1` (`id`, `nombre`, `puesto`, `inicio1`, `final1`, `inicio2`, `final2`, `qr`, `modalidad`, `textofinal`, `dni`, `archivo`, `email`, `telefono`) VALUES
(1, 'JANET ALCÁNTARA MASÍAS', 'JEFE DE PROYECTO ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JAMPID2024', 'VIRTUAL', 'desde 02 de mayo al 31 de diciembre 2024, en la modalidad virtual.', '0', 'JANET ALCÁNTARA MASÍAS.pdf', '', ''),
(2, 'ROSA DOLORES CASTRO TESÉN', 'COORDINADORA ACADÉMICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RDCTEPID2024', 'VIRTUAL', 'desde 02 de mayo al 31 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA DOLORES CASTRO TESÉN.pdf', '', ''),
(3, 'MARÍA ISIDORA PALACIOS FARÍAS', 'ADMINISTRADORA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MIPFPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'MARÍA ISIDORA PALACIOS FARÍAS.pdf', '', ''),
(4, 'IRIS VERÓNICA LA CHIRA JULIÁN', 'ASISTENTE ADMINISTRATIVA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'IVLCJPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'IRIS VERÓNICA LA CHIRA JULIÁN.pdf', '', ''),
(5, 'JOHN DAVIE SANTOS CLEMENTE', 'ESPECIALISTA EN LOGÍSTICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JDSCPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'JOHN DAVIE SANTOS CLEMENTE.pdf', '', ''),
(6, 'KATRIEL VALDIR SERNAQUÉ MADRID', 'ESPECIALISTA EN LOGÍSTICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'KVSMPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'KATRIEL VALDIR SERNAQUÉ MADRID.pdf', '', ''),
(7, 'KARINA GABRIELA CASTILLO SEMINARIO', 'ESPECIALISTA EN LOGÍSTICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'KGCSPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'KARINA GABRIELA CASTILLO SEMINARIO.pdf', '', ''),
(8, 'ERICKSON RAPHAEL SERNAQUÉ PIZARRO', 'ESPECIALISTA EN LOGÍSTICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ERSEPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'ERICKSON RAPHAEL SERNAQUÉ PIZARRO.pdf', '', ''),
(9, 'MARTÍN SOSA AQUINO', 'ESPECIALISTA EN LOGÍSTICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MSAPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'MARTÍN SOSA AQUINO.pdf', '', ''),
(10, 'SUSAN CECIBEL RAMÍREZ CASTILLO', 'ESPECIALISTA EN LOGÍSTICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SCRCPID2024', 'PRESENCIAL', 'desde 02 de mayo al 31 de diciembre 2024.', '0', 'SUSAN CECIBEL RAMÍREZ CASTILLO.pdf', '', ''),
(11, 'CARLOS ALBERTO CHINININ CHAMBA', 'ESPECIALISTA TECNOLOGICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CACCPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CARLOS ALBERTO CHINININ CHAMBA.pdf', '', ''),
(12, 'ROLANDO ELIAS IPANAQUÉ SILVA', 'ESPECIALISTA TECNOLOGICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'REISPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROLANDO ELIAS IPANAQUÉ SILVA.pdf', '', ''),
(13, 'DIANA INGRID GALLO AGURTO ', 'ASISTENTE INFORMATICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'DIGAPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'DIANA INGRID GALLO AGURTO .pdf', '', ''),
(14, 'IVAN DANELGI IMÁN AGURTO', 'ASISTENTE INFORMATICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'IDIAPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'IVAN DANELGI IMÁN AGURTO.pdf', '', ''),
(15, 'CARLOS MIGUEL QUIROZ TÁVARA', 'ASISTENTE INFORMATICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CMQTPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CARLOS MIGUEL QUIROZ TÁVARA.pdf', '', ''),
(16, 'LUIS ARMANDO SAAVEDRA YARLEQUÉ', 'ASISTENTE INFORMATICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LASYPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LUIS ARMANDO SAAVEDRA YARLEQUÉ.pdf', '', ''),
(17, 'BERTHA ARAMINTA DEL SOCORRO TALLEDO TORRES', 'COORDINADORA MACROREGIONAL', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'BADSTTPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'BERTHA ARAMINTA DEL SOCORRO TALLEDO TORRES.pdf', '', ''),
(18, 'CECILIA DEL PILAR VÁSQUEZ MONDRAGÓN', 'COORDINADORA MACROREGIONAL', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CDPVMPID2024', 'VIRTUAL', 'desde 15 de mayo al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CECILIA DEL PILAR VÁSQUEZ MONDRAGÓN.pdf', '', ''),
(19, ' BETTY MARÍA DEL SOCORRO MENDOZA DE LAMA', 'ASESORA PEDAGÓGICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'BMDSMDLPID2024', 'VIRTUAL', 'desde 01 de junio al 31 de diciembre 2024, en la modalidad virtual.', '0', 'BETTY MARÍA DEL SOCORRO MENDOZA DE LAMA.pdf', '', ''),
(20, 'CLEOTILDE FELIPA DIOSES ACARO', 'ASESORA PEDAGÓGICA', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CFDAPID2024', 'VIRTUAL', 'desde 01 de junio al 31 de diciembre 2024, en la modalidad virtual.', '0', 'CLEOTILDE FELIPA DIOSES ACARO.pdf', '', ''),
(21, 'JOSÉ AUGUSTO BENITES LÓPEZ', 'ASESOR PEDAGÓGICO', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JABLPID2024', 'VIRTUAL', 'desde 01 de junio al 31 de diciembre 2024, en la modalidad virtual.', '0', 'JOSÉ AUGUSTO BENITES LÓPEZ.pdf', '', ''),
(22, ' FERNANDO IVÁN ELÉSPURU LANDA ', 'ESPECIALISTA EN SEGUIMIENTO Y EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'FIELPID2024', 'VIRTUAL', 'desde 01 de junio al 31 de diciembre 2024, en la modalidad virtual.', '0', 'FERNANDO IVÁN ELÉSPURU LANDA.pdf', '', ''),
(23, 'RUBY SILVANA AGURTO COBEÑAS', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RSACPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'RUBY SILVANA AGURTO COBEÑAS.pdf', '', ''),
(24, 'ÁNGELA ESTHER ALBÁN BERMEJO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'AEABPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ÁNGELA ESTHER ALBÁN BERMEJO.pdf', '', ''),
(25, 'MARÍA LULA ALBERCA ADRIANZEN', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MLAAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARÍA LULA ALBERCA ADRIANZEN.pdf', '', ''),
(26, 'MARIBEL  ALBURQUEQUE ABAD', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MAAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARIBEL  ALBURQUEQUE ABAD.pdf', '', ''),
(27, 'JESSICA ISABEL ALVA CHAVEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JIACPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'JESSICA ISABEL ALVA CHAVEZ.pdf', '', ''),
(28, 'EVER ABDIAS ALVA JARA', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'EAAJPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'EVER ABDIAS ALVA JARA.pdf', '', ''),
(29, 'MERCEDES MARIANELLA ANDRADE NAVARRO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MMANPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MERCEDES MARIANELLA ANDRADE NAVARRO.pdf', '', ''),
(30, 'CELIA YANINA ANDRADE SANDOVAL', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CYASPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CELIA YANINA ANDRADE SANDOVAL.pdf', '', ''),
(31, 'SILVIA ROSA AQUINO GODIÑO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SRAGPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SILVIA ROSA AQUINO GODIÑO.pdf', '', ''),
(32, 'MARINO CESAR ARANDA RIVERA', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MCARPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARINO CESAR ARANDA RIVERA.pdf', '', ''),
(33, 'SOCORRO KARINA ARÉVALO VÍLCHEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SKAVPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SOCORRO KARINA ARÉVALO VÍLCHEZ.pdf', '', ''),
(34, 'MONICA PATRICIA ARIAS MUÑOZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MPAMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MONICA PATRICIA ARIAS MUÑOZ.pdf', '', ''),
(35, 'JUANA NOELLIA ARRIETA NIÑO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JNANPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'JUANA NOELLIA ARRIETA NIÑO.pdf', '', ''),
(36, 'IVAN BARTON ATARAMA GONZALES', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'IBAGPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'IVAN BARTON ATARAMA GONZALES.pdf', '', ''),
(37, 'KARINA ELIZABETH BAUTISTA HEREDIA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'KEBHPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'KARINA ELIZABETH BAUTISTA HEREDIA.pdf', '', ''),
(38, 'VIRGINIA CECILIA BECERRA CARMONA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'VCBCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'VIRGINIA CECILIA BECERRA CARMONA.pdf', '', ''),
(39, 'ZAYDA TEOTISTA BENITES ZAPATA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ZTBZPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ZAYDA TEOTISTA BENITES ZAPATA.pdf', '', ''),
(40, 'MARÍA  BRAVO TELLO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MBTPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARÍA  BRAVO TELLO.pdf', '', ''),
(41, 'ELMER  BURGA MONTENEGRO', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'EBMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ELMER  BURGA MONTENEGRO.pdf', '', ''),
(42, 'REYNA DEL PILAR BURGOS TALLEDO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RDPBTPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'REYNA DEL PILAR BURGOS TALLEDO.pdf', '', ''),
(43, 'TANIA IDELSA CABRERA LARREATEGUI', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'TICLPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'TANIA IDELSA CABRERA LARREATEGUI.pdf', '', ''),
(44, 'CARLOS ENRIQUE CALDERÓN CALDERÓN', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CECCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CARLOS ENRIQUE CALDERÓN CALDERÓN.pdf', '', ''),
(45, 'MILAGROS DEL SOCORRO CALERO PINTA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MDSCPPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MILAGROS DEL SOCORRO CALERO PINTA.pdf', '', ''),
(46, 'SILVIA VIOLETA CASAVERDE CARRANZA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SVCCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SILVIA VIOLETA CASAVERDE CARRANZA.pdf', '', ''),
(47, 'CECILIA  CASTRO CRISOSTOMO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CCCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CECILIA  CASTRO CRISOSTOMO.pdf', '', ''),
(48, 'ROSA ELENA CASTRO LUDEÑA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RECLPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA ELENA CASTRO LUDEÑA.pdf', '', ''),
(49, 'JORGE LUIS CHAMBA VILCHEZ', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JLCVPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'JORGE LUIS CHAMBA VILCHEZ.pdf', '', ''),
(50, 'HILDEBRANDO  CHAPILLIQUEN CHUNGA', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'HCCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'HILDEBRANDO  CHAPILLIQUEN CHUNGA.pdf', '', ''),
(51, 'ROSA YSABEL CORONADO MOLERO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RYCMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA YSABEL CORONADO MOLERO.pdf', '', ''),
(52, 'FANNY RAQUEL CRISANTO PALACIOS', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'FRCPPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'FANNY RAQUEL CRISANTO PALACIOS.pdf', '', ''),
(53, 'MAYDA YESSENIA CRUZADO NUÑEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MYCNPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MAYDA YESSENIA CRUZADO NUÑEZ.pdf', '', ''),
(54, 'ROSA  CRUZALEGUI DELGADO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RCDPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA  CRUZALEGUI DELGADO.pdf', '', ''),
(55, 'GERSON PAUL CUADROS PAUCAR', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'GPCPPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'GERSON PAUL CUADROS PAUCAR.pdf', '', ''),
(56, 'MERCEDES CECILIA DE LAMA INFANTE', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MCDLIPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MERCEDES CECILIA DE LAMA INFANTE.pdf', '', ''),
(57, 'CESAR ENRIQUE DEGOLLAR HUAMAN', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CEDHPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CESAR ENRIQUE DEGOLLAR HUAMAN.pdf', '', ''),
(58, 'MILAGROS FARFAN ARÉVALO DE ESPINOZA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MFADEPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MILAGROS FARFAN ARÉVALO DE ESPINOZA.pdf', '', ''),
(59, 'ESPERANZA BERTHA FELICIANO CERNA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'EBFCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ESPERANZA BERTHA FELICIANO CERNA.pdf', '', ''),
(60, 'NORA FIESTAS SUÁREZ DE RAMIREZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'NFSDRPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'NORA FIESTAS SUÁREZ DE RAMIREZ.pdf', '', ''),
(61, 'ELIZABETH CRISTINA FLORES HERRERA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ECFHPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ELIZABETH CRISTINA FLORES HERRERA.pdf', '', ''),
(62, 'TERESA DE JESUS FLORES RENTERÍA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'TDJFRPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'TERESA DE JESUS FLORES RENTERÍA.pdf', '', ''),
(63, 'ROSA FLOR GOMEZ RISCO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RFGRPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA FLOR GOMEZ RISCO.pdf', '', ''),
(64, 'FLOR DEL SOCORRO GONZALES ZURITA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'FDSGZPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'FLOR DEL SOCORRO GONZALES ZURITA.pdf', '', ''),
(65, 'FRIDA DEL PILAR GUERRERO FARFAN', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'FDPGFPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'FRIDA DEL PILAR GUERRERO FARFAN.pdf', '', ''),
(66, 'LESLY CAROL HERRERA LÓPEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LCHLPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LESLY CAROL HERRERA LÓPEZ.pdf', '', ''),
(67, 'ANABELA DEL ROCIO HOYOS VILLAVICENCIO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ADRHVPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ANABELA DEL ROCIO HOYOS VILLAVICENCIO.pdf', '', ''),
(68, 'ROSA IRENE HUACCHILLO CALLE', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RIHCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA IRENE HUACCHILLO CALLE.pdf', '', ''),
(69, 'ANNA EDITH HUACHES LLACSAHUACHE', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'AEHLPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ANNA EDITH HUACHES LLACSAHUACHE.pdf', '', ''),
(70, 'VANESSA LORENA HUIMAN CASTRO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'VLHCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'VANESSA LORENA HUIMAN CASTRO.pdf', '', ''),
(71, 'ALEJANDRA LUCIA HURTADO MAZEYRA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ALHMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ALEJANDRA LUCIA HURTADO MAZEYRA.pdf', '', ''),
(72, 'CARLOS MODESTO JUAREZ CARBAJAL', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CMJCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CARLOS MODESTO JUAREZ CARBAJAL.pdf', '', ''),
(73, 'ISABEL  JUAREZ GALLO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'IJGPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ISABEL  JUAREZ GALLO.pdf', '', ''),
(74, 'MARIA LEONOR LOPEZ GONZALES', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MLLGPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARIA LEONOR LOPEZ GONZALES.pdf', '', ''),
(75, 'LUIS ANGEL MANRIQUE CALERO', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LAMCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LUIS ANGEL MANRIQUE CALERO.pdf', '', ''),
(76, 'IRENE DEL PILAR MATICORENA CAMPOS', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'IDPMCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'IRENE DEL PILAR MATICORENA CAMPOS.pdf', '', ''),
(77, 'MADI ZULEMA MATTOS MENA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MZMMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MADI ZULEMA MATTOS MENA.pdf', '', ''),
(78, 'HOSMA EDITH MENDOZA AMAYA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'HEMAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'HOSMA EDITH MENDOZA AMAYA.pdf', '', ''),
(79, 'OLGA ESTELA MENDOZA LEÓN', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'OEMLPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'OLGA ESTELA MENDOZA LEÓN.pdf', '', ''),
(80, 'ROSA MARIA MERCADO ALVARADO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RMMAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROSA MARIA MERCADO ALVARADO.pdf', '', ''),
(81, 'MARIBEL YESSENIA MONSALVE MIL', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MYMMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARIBEL YESSENIA MONSALVE MIL.pdf', '', ''),
(82, 'ELIZA DEL SOCORRO  MONTALVAN NUÑEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'EDSMNPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ELIZA DEL SOCORRO  MONTALVAN NUÑEZ.pdf', '', ''),
(83, 'MERCEDES ELIZABETH NAVARRETE MERINO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MENMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MERCEDES ELIZABETH NAVARRETE MERINO.pdf', '', ''),
(84, 'EUNICE ROXANA NAVARRO SOSA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ERNSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'EUNICE ROXANA NAVARRO SOSA.pdf', '', ''),
(85, 'ELIZABETH  OLAYA ZETA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'EOZPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ELIZABETH  OLAYA ZETA.pdf', '', ''),
(86, 'DEYSI MARCELINA PALACIOS CALDERON', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'DMPCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'DEYSI MARCELINA PALACIOS CALDERON.pdf', '', ''),
(87, 'BETTY ELIZABETH PANTA SALAZAR', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'BEPSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'BETTY ELIZABETH PANTA SALAZAR.pdf', '', ''),
(88, 'LESLIE DIANA PASTOR AQUINO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LDPAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LESLIE DIANA PASTOR AQUINO.pdf', '', ''),
(89, 'MARIBEL ROXANA PEREZ ARMENDARIZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MRPAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARIBEL ROXANA PEREZ ARMENDARIZ.pdf', '', ''),
(90, 'CELINA  PÉREZ MENA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CPMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CELINA  PÉREZ MENA.pdf', '', ''),
(91, 'DAVID WILFREDO PIEDRA CÓRDOVA', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'DWPCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'DAVID WILFREDO PIEDRA CÓRDOVA.pdf', '', ''),
(92, 'ERIKA GIULLIANA PORTOCARRERO VALDIVIEZO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'EGPVPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ERIKA GIULLIANA PORTOCARRERO VALDIVIEZO.pdf', '', ''),
(93, 'MARYSHULE HELDY QUIROZ PACHERRE', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MHQPPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARYSHULE HELDY QUIROZ PACHERRE.pdf', '', ''),
(94, 'DENYS  RAMOS CORREA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'DRCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'DENYS  RAMOS CORREA.pdf', '', ''),
(95, 'SILVIA PETRONILA REAL SARAVIA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SPRSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SILVIA PETRONILA REAL SARAVIA.pdf', '', ''),
(96, 'PAUL REMY RIOS MACEDO', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'PRRMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'PAUL REMY RIOS MACEDO.pdf', '', ''),
(97, 'LUCY ESTHER RIVERA CEVALLOS', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LERCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LUCY ESTHER RIVERA CEVALLOS.pdf', '', ''),
(98, 'ADIT ANGELICA RIVERA RAMIREZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'AARRPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ADIT ANGELICA RIVERA RAMIREZ.pdf', '', ''),
(99, 'LUCY ANTONIETA RIVERA SILUPU', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LARSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LUCY ANTONIETA RIVERA SILUPU.pdf', '', ''),
(100, 'VILMA  RODRIGUEZ CÓRDOVA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'VRCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'VILMA  RODRIGUEZ CÓRDOVA.pdf', '', ''),
(101, 'MARGARITA ISABEL ROJAS PALACIOS', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MIRPPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARGARITA ISABEL ROJAS PALACIOS.pdf', '', ''),
(102, 'ROBINSON  SAAVEDRA SILVA', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RSSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROBINSON  SAAVEDRA SILVA.pdf', '', ''),
(103, 'ROCIO  SALAZAR CAMPOS', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RSCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ROCIO  SALAZAR CAMPOS.pdf', '', ''),
(104, 'JUANA SILVIA ELENA SANCHEZ BRICEÑO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JSESBPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'JUANA SILVIA ELENA SANCHEZ BRICEÑO.pdf', '', ''),
(105, 'AIKO AURORA SÁNCHEZ RUESTA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'AASRPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'AIKO AURORA SÁNCHEZ RUESTA.pdf', '', ''),
(106, 'MARIA JULIA SÁNCHEZ SÁNCHEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MJSSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARIA JULIA SÁNCHEZ SÁNCHEZ.pdf', '', ''),
(107, 'JACKELINE DEL MILAGRO SANTA CRUZ SEMINARIO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JDMSCSPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'JACKELINE DEL MILAGRO SANTA CRUZ SEMINARIO.pdf', '', ''),
(108, 'OLGA CONSUELO SEMINARIO MOGOLLON', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'OCSMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'OLGA CONSUELO SEMINARIO MOGOLLON.pdf', '', ''),
(109, 'FELIX HARLE SILUPU RAMIREZ', 'PROFESOR MENTOR', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'FHSRPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'FELIX HARLE SILUPU RAMIREZ.pdf', '', ''),
(110, 'YANETH YACKELINE SILVA MERCADO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'YYSMPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'YANETH YACKELINE SILVA MERCADO.pdf', '', ''),
(111, 'SUSANA EVANGELINA VALENCIA VILLAGOMEZ', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SEVVPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SUSANA EVANGELINA VALENCIA VILLAGOMEZ.pdf', '', ''),
(112, 'IRIS LILIANA VÁSQUEZ ALBURQUEQUE', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ILVAPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'IRIS LILIANA VÁSQUEZ ALBURQUEQUE.pdf', '', ''),
(113, 'CARMEN LETICIA VEGA QUISPE', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CLVQPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'CARMEN LETICIA VEGA QUISPE.pdf', '', ''),
(114, 'NELLY  YACTAYO LEVANO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'NYLPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'NELLY  YACTAYO LEVANO.pdf', '', ''),
(115, 'MARÍA FLOR YANGUA CUNYA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MFYCPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARÍA FLOR YANGUA CUNYA.pdf', '', ''),
(116, 'ANA CONSUELO YOVERA ESPINOZA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ACYEPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'ANA CONSUELO YOVERA ESPINOZA.pdf', '', ''),
(117, 'SONIA SHIRLY SOLANO QUINTANA', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SSSQPID2024', 'VIRTUAL', 'desde 01 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SONIA SHIRLY SOLANO QUINTANA.pdf', '', ''),
(118, 'SARA MABEL FIESTAS QUITO', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SMFQPID2024', 'VIRTUAL', 'desde 07 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'SARA MABEL FIESTAS QUITO.pdf', '', ''),
(119, 'MARIANELLA DEL CARMEN CÁCERES MONDRAGÓN', 'PROFESORA MENTORA ', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MDCCMPID2024', 'VIRTUAL', 'desde 14 de julio al 15 de diciembre 2024, en la modalidad virtual.', '0', 'MARIANELLA DEL CARMEN CÁCERES MONDRAGÓN.pdf', '', ''),
(120, 'MAGDALENA  ALBURQUEQUE ABAD ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MAAPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'MAGDALENA  ALBURQUEQUE ABAD.pdf', '', ''),
(121, 'SANTIAGO  ARAUJO SALINAS ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SASPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'SANTIAGO  ARAUJO SALINAS.pdf', '', ''),
(122, 'ZORAIDA ELIZABETH ARÉVALO VÍLCHEZ ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ZEAVPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'ZORAIDA ELIZABETH ARÉVALO VÍLCHEZ.pdf', '', ''),
(123, 'BLANCA SONIA BÁRCENA REYES ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'BSBRPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'BLANCA SONIA BÁRCENA REYES.pdf', '', ''),
(124, 'HAYDEÉ  BARRETO CÓRDOVA ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'HBCPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'HAYDEÉ  BARRETO CÓRDOVA.pdf', '', ''),
(125, 'RAÚL ALBERTO BEDREGAL MANRIQUE ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RABMPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'RAÚL ALBERTO BEDREGAL MANRIQUE.pdf', '', ''),
(126, 'JANET PATRICIA BENITES CASARIEGO ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JPBCPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'JANET PATRICIA BENITES CASARIEGO.pdf', '', ''),
(127, 'JUAN MANUEL CHANDUVÍ RIVERA ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JMCRPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'JUAN MANUEL CHANDUVÍ RIVERA.pdf', '', ''),
(128, 'RAFAEL ALEJANDRO CLAUDIO ATANACIO ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'RACAPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'RAFAEL ALEJANDRO CLAUDIO ATANACIO.pdf', '', ''),
(129, 'MARILÚ ROSARIO CRUZ BLAS ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MRCBPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'MARILÚ ROSARIO CRUZ BLAS.pdf', '', ''),
(130, 'TRIXIE  TELLEZ MORENO ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'TTMPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'TRIXIE  TELLEZ MORENO.pdf', '', ''),
(131, 'MÉLIDA ORFELINDA GUERRERO LABÁN ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MOGLPID2024', 'VIRTUAL', 'del 01 al 30 de agosto de 2024, en la modalidad virtual.', '0', 'MÉLIDA ORFELINDA GUERRERO LABÁN.pdf', '', ''),
(132, 'HENRY AQUILES JORGE LEÓN ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'HAJLPID2024', 'VIRTUAL', 'del 01 al 30 de agosto de 2024, en la modalidad virtual.', '0', 'HENRY AQUILES JORGE LEÓN.pdf', '', ''),
(133, 'HELEN DOROTHY LARROCA SAAVEDRA ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'HDLSPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'HELEN DOROTHY LARROCA SAAVEDRA.pdf', '', ''),
(134, 'JOSÉ ANTONIO MENDOZA PAUTA ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JAMPPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'JOSÉ ANTONIO MENDOZA PAUTA.pdf', '', ''),
(135, 'CARMEN ROSA MENDOZA AMAYA ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CRMAPID2024', 'VIRTUAL', 'del 01 al 30 de agosto de 2024, en la modalidad virtual.', '0', 'CARMEN ROSA MENDOZA AMAYA.pdf', '', ''),
(136, 'MANUEL JORGE NIZAMA TORRES ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'MJNTPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'MANUEL JORGE NIZAMA TORRES.pdf', '', ''),
(137, 'SILVIA CAROLINA NOLE GARCÍA ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'SCNGPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'SILVIA CAROLINA NOLE GARCÍA.pdf', '', ''),
(138, 'JORGE MANUEL PEÑA PUENTE ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'JMPPPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'JORGE MANUEL PEÑA PUENTE.pdf', '', ''),
(139, 'INÉS TERESA TISSIERES ORTIZ ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ITTOPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'INÉS TERESA TISSIERES ORTIZ.pdf', '', ''),
(140, 'PATRICIA MERCEDES VARGAS ALCÁNTARA ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'PMVAPID2024', 'VIRTUAL', 'del 01 al 30 de agosto y desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'PATRICIA MERCEDES VARGAS ALCÁNTARA.pdf', '', ''),
(141, 'CARLOS  HUACHES DIAS', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'CHDPID2024', 'VIRTUAL', 'desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'CARLOS  HUACHES DIAS.pdf', '', ''),
(142, 'LILIANA ISABEL LACHIRA PRIETO ', 'MONITORA EXTERNA PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LILPPID2024', 'VIRTUAL', 'desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'LILIANA ISABEL LACHIRA PRIETO.pdf', '', ''),
(143, 'LUIS ARNALDO CRUZ GARCÍA ', 'MONITOR EXTERNO PARA EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'LACGPID2024', 'VIRTUAL', 'desde el 11 de noviembre al 11 de diciembre de 2024, en la modalidad virtual.', '0', 'LUIS ARNALDO CRUZ GARCÍA.pdf', '', ''),
(144, ' IRENE CECILIA YARLEQUÉ CAMACHO ', 'SUPERVISORA DE EVALUACIÓN', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ICYCPID2024', 'VIRTUAL', 'del 17 de julio al 15 de setiembre y desde el 11 de noviembre al 30 de diciembre de 2024, en la modalidad virtual.', '0', 'IRENE CECILIA YARLEQUÉ CAMACHO.pdf', '', ''),
(145, 'LORENA DEL PILAR LESCANO CHIROQUE', 'PROFESORA MENTORA ', '2024-08-01', '2024-12-15', '2025-02-25', '2025-02-25', 'LDPLCPID2024', 'VIRTUAL', 'desde el 01 de agosto al 15 de diciembre 2024, en la modalidad virtual.', '0', 'LORENA DEL PILAR LESCANO CHIROQUE.pdf', '', ''),
(146, 'WALTER OSWALDO CASAS GARCÍA', 'PROFESOR MENTOR', '2025-02-25', '2025-02-25', '2025-02-25', '2025-02-25', 'WOCGPID2024', 'VIRTUAL', 'desde el 01 de agosto al 15 de diciembre 2024, en la modalidad virtual.', '0', 'WALTER OSWALDO CASAS GARCÍA.pdf', '', ''),
(147, 'KARLA DENISE CUEVA RODRÍGUEZ', 'PROFESORA MENTORA ', '2025-02-25', '2025-02-25', '2025-02-25', '2025-02-25', 'KDCRPID2024', 'VIRTUAL', 'desde el 17 de agosto al 15 de diciembre 2024, en la modalidad virtual.', '0', 'KARLA DENISE CUEVA RODRÍGUEZ.pdf', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students2`
--

CREATE TABLE `students2` (
  `id` int(11) NOT NULL,
  `dni` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `students2`
--

INSERT INTO `students2` (`id`, `dni`) VALUES
(1, '001754884'),
(2, '00201329'),
(3, '002040503'),
(4, '002271948'),
(5, '00237528'),
(6, '00240738'),
(7, '00246575'),
(8, '00249485'),
(9, '00253824'),
(10, '00256841'),
(11, '00256849'),
(12, '00257293'),
(13, '00325455'),
(14, '003314993'),
(15, '00370151'),
(16, '00401762'),
(17, '00495047'),
(18, '00498936'),
(19, '00795011'),
(20, '01296699'),
(21, '01323596'),
(22, '01324412'),
(23, '01327345'),
(24, '02045586'),
(25, '02601233'),
(26, '02774988'),
(27, '02784406'),
(28, '02792436'),
(29, '02817020'),
(30, '02820121'),
(31, '02827905'),
(32, '02830914'),
(33, '02835338'),
(34, '02844706'),
(35, '02852130'),
(36, '02852150'),
(37, '02854900'),
(38, '02856651'),
(39, '02860155'),
(40, '02861936'),
(41, '02862418'),
(42, '02878262'),
(43, '02881217'),
(44, '02899795'),
(45, '02899930'),
(46, '03365511'),
(47, '03369783'),
(48, '03386996'),
(49, '03497855'),
(50, '03506305'),
(51, '03575983'),
(52, '03589151'),
(53, '03643396'),
(54, '03652512'),
(55, '03661108'),
(56, '03665762'),
(57, '03672421'),
(58, '03673313'),
(59, '03675631'),
(60, '03679028'),
(61, '03680105'),
(62, '03691086'),
(63, '03693534'),
(64, '03695127'),
(65, '03853917'),
(66, '03869086'),
(67, '03872842'),
(68, '03879212'),
(69, '03886572'),
(70, '03886669'),
(71, '03888414'),
(72, '04440137'),
(73, '04644572'),
(74, '04645145'),
(75, '05640520'),
(76, '05641241'),
(77, '05643270'),
(78, '05645455'),
(79, '05645530'),
(80, '06793984'),
(81, '07510489'),
(82, '07643192'),
(83, '07751050'),
(84, '07858432'),
(85, '08677772'),
(86, '08835684'),
(87, '09221745'),
(88, '09446190'),
(89, '09452273'),
(90, '09466337'),
(91, '09526889'),
(92, '09586087'),
(93, '09763209'),
(94, '09863650'),
(95, '09882378'),
(96, '09885252'),
(97, '09904528'),
(98, '10004070'),
(99, '10076411'),
(100, '10122523'),
(101, '10285542'),
(102, '10353672'),
(103, '10476320'),
(104, '10544082'),
(105, '10594412'),
(106, '10603278'),
(107, '10791747'),
(108, '10815200'),
(109, '15358401'),
(110, '15722453'),
(111, '15738573'),
(112, '15760616'),
(113, '16447978'),
(114, '16521115'),
(115, '16583795'),
(116, '16620180'),
(117, '16664522'),
(118, '16668558'),
(119, '16669890'),
(120, '16674180'),
(121, '16674629'),
(122, '16678229'),
(123, '16686324'),
(124, '16698520'),
(125, '16698906'),
(126, '16702403'),
(127, '16702514'),
(128, '16705085'),
(129, '16705462'),
(130, '16706611'),
(131, '16711502'),
(132, '16717496'),
(133, '16718613'),
(134, '16720198'),
(135, '16720561'),
(136, '16721131'),
(137, '16722148'),
(138, '16722575'),
(139, '16727300'),
(140, '16727634'),
(141, '16728474'),
(142, '16733306'),
(143, '16733967'),
(144, '16735647'),
(145, '16736008'),
(146, '16746557'),
(147, '16748068'),
(148, '16749457'),
(149, '16750300'),
(150, '16751581'),
(151, '16751675'),
(152, '16752218'),
(153, '16752640'),
(154, '16753457'),
(155, '16756337'),
(156, '16758458'),
(157, '16763323'),
(158, '16764750'),
(159, '16770987'),
(160, '16773692'),
(161, '16781738'),
(162, '16786397'),
(163, '16787098'),
(164, '16787175'),
(165, '16787427'),
(166, '16788401'),
(167, '16789454'),
(168, '16791195'),
(169, '16791605'),
(170, '16795259'),
(171, '16795574'),
(172, '16796255'),
(173, '16798531'),
(174, '16800376'),
(175, '16800806'),
(176, '16802181'),
(177, '16802191'),
(178, '16803165'),
(179, '17448740'),
(180, '17457065'),
(181, '17543665'),
(182, '17609793'),
(183, '17614461'),
(184, '17635383'),
(185, '17638491'),
(186, '17640331'),
(187, '17804242'),
(188, '17895226'),
(189, '17896122'),
(190, '17997868'),
(191, '18036902'),
(192, '18068225'),
(193, '18076926'),
(194, '18103396'),
(195, '18104750'),
(196, '18111257'),
(197, '18122633'),
(198, '18122786'),
(199, '18132308'),
(200, '18133684'),
(201, '18138363'),
(202, '18138937'),
(203, '18143039'),
(204, '18146056'),
(205, '18150023'),
(206, '18160626'),
(207, '18162991'),
(208, '18168104'),
(209, '18169633'),
(210, '18171520'),
(211, '18177575'),
(212, '18180945'),
(213, '18181571'),
(214, '18196188'),
(215, '18197422'),
(216, '18202064'),
(217, '18204333'),
(218, '18212525'),
(219, '18212557'),
(220, '18214658'),
(221, '18215461'),
(222, '18216689'),
(223, '18222121'),
(224, '18225670'),
(225, '18889054'),
(226, '18901541'),
(227, '19099362'),
(228, '19104289'),
(229, '19248112'),
(230, '19254133'),
(231, '19332333'),
(232, '19559369'),
(233, '20035751'),
(234, '20106956'),
(235, '21464695'),
(236, '21520461'),
(237, '21565520'),
(238, '21574153'),
(239, '21819327'),
(240, '21878096'),
(241, '22302848'),
(242, '23991348'),
(243, '23998762'),
(244, '25763218'),
(245, '25790675'),
(246, '26718698'),
(247, '26732293'),
(248, '27081648'),
(249, '27418954'),
(250, '27429781'),
(251, '27751644'),
(252, '27990503'),
(253, '28131024'),
(254, '28274557'),
(255, '29233135'),
(256, '29531104'),
(257, '29558022'),
(258, '29604247'),
(259, '29629285'),
(260, '29636791'),
(261, '29644096'),
(262, '29645571'),
(263, '29660218'),
(264, '29735236'),
(265, '29736922'),
(266, '30427657'),
(267, '30427832'),
(268, '30835987'),
(269, '30850157'),
(270, '30854711'),
(271, '32124158'),
(272, '32131496'),
(273, '32139403'),
(274, '32388763'),
(275, '32734674'),
(276, '32825404'),
(277, '32917824'),
(278, '32939414'),
(279, '32945380'),
(280, '32965045'),
(281, '33952112'),
(282, '40004088'),
(283, '40019402'),
(284, '40020495'),
(285, '40025208'),
(286, '40029833'),
(287, '40062339'),
(288, '40074888'),
(289, '40085294'),
(290, '40092324'),
(291, '40094666'),
(292, '40095848'),
(293, '40106536'),
(294, '40116739'),
(295, '40127484'),
(296, '40131700'),
(297, '40133711'),
(298, '40137857'),
(299, '40148288'),
(300, '40151254'),
(301, '40165212'),
(302, '40173672'),
(303, '40175649'),
(304, '40182783'),
(305, '40203949'),
(306, '40206121'),
(307, '40208465'),
(308, '40216299'),
(309, '40217558'),
(310, '40227187'),
(311, '40242687'),
(312, '40260220'),
(313, '40261343'),
(314, '40261554'),
(315, '40264979'),
(316, '40279558'),
(317, '40294724'),
(318, '40318371'),
(319, '40327326'),
(320, '40334224'),
(321, '40334393'),
(322, '40342907'),
(323, '40343524'),
(324, '40359280'),
(325, '40373749'),
(326, '40373977'),
(327, '40382144'),
(328, '40420791'),
(329, '40421859'),
(330, '40425372'),
(331, '40429008'),
(332, '40432864'),
(333, '40437667'),
(334, '40459027'),
(335, '40459034'),
(336, '40460809'),
(337, '40469500'),
(338, '40475459'),
(339, '40477334'),
(340, '40486641'),
(341, '40490922'),
(342, '40491848'),
(343, '40514908'),
(344, '40515430'),
(345, '40527728'),
(346, '40533369'),
(347, '40539833'),
(348, '40545639'),
(349, '40565482'),
(350, '40568504'),
(351, '40569366'),
(352, '40571600'),
(353, '40573905'),
(354, '40577372'),
(355, '40585210'),
(356, '40594349'),
(357, '40599106'),
(358, '40602188'),
(359, '40611144'),
(360, '40611532'),
(361, '40612705'),
(362, '40620806'),
(363, '40631341'),
(364, '40636161'),
(365, '40639150'),
(366, '40642818'),
(367, '40651874'),
(368, '40667995'),
(369, '40675140'),
(370, '40681956'),
(371, '40692410'),
(372, '40697421'),
(373, '40701366'),
(374, '40702679'),
(375, '40704789'),
(376, '40709544'),
(377, '40721558'),
(378, '40723532'),
(379, '40725576'),
(380, '40730241'),
(381, '40734478'),
(382, '40748283'),
(383, '40748483'),
(384, '40755136'),
(385, '40761894'),
(386, '40766503'),
(387, '40784094'),
(388, '40784652'),
(389, '40800961'),
(390, '40822927'),
(391, '40823839'),
(392, '40844361'),
(393, '40845871'),
(394, '40846533'),
(395, '40851096'),
(396, '40866509'),
(397, '40878039'),
(398, '40879032'),
(399, '40897714'),
(400, '40898581'),
(401, '40902400'),
(402, '40908886'),
(403, '40927013'),
(404, '40931654'),
(405, '40934085'),
(406, '40938143'),
(407, '40949469'),
(408, '40957151'),
(409, '40958264'),
(410, '40959645'),
(411, '40978617'),
(412, '40984893'),
(413, '40989852'),
(414, '40997127'),
(415, '41006536'),
(416, '41020490'),
(417, '41035272'),
(418, '41038357'),
(419, '41053993'),
(420, '41065971'),
(421, '41070013'),
(422, '41073734'),
(423, '41073961'),
(424, '41074491'),
(425, '41077411'),
(426, '41083845'),
(427, '41088843'),
(428, '41105109'),
(429, '41107334'),
(430, '41116797'),
(431, '41140992'),
(432, '41185419'),
(433, '41194956'),
(434, '41195210'),
(435, '41200245'),
(436, '41207524'),
(437, '41210337'),
(438, '41221992'),
(439, '41226318'),
(440, '41228001'),
(441, '41230807'),
(442, '41244277'),
(443, '41266043'),
(444, '41280334'),
(445, '41324793'),
(446, '41347706'),
(447, '41349865'),
(448, '41351423'),
(449, '41353014'),
(450, '41357336'),
(451, '41362971'),
(452, '41370145'),
(453, '41373274'),
(454, '41375753'),
(455, '41383550'),
(456, '41387230'),
(457, '41398342'),
(458, '41399627'),
(459, '41408975'),
(460, '41416305'),
(461, '41422166'),
(462, '41423976'),
(463, '41434702'),
(464, '41456835'),
(465, '41463159'),
(466, '41472588'),
(467, '41480211'),
(468, '41513677'),
(469, '41523490'),
(470, '41525315'),
(471, '41532352'),
(472, '41535256'),
(473, '41541988'),
(474, '41553821'),
(475, '41568993'),
(476, '41570191'),
(477, '41575831'),
(478, '41578600'),
(479, '41589137'),
(480, '41591115'),
(481, '41595971'),
(482, '41598216'),
(483, '41619941'),
(484, '41620440'),
(485, '41623816'),
(486, '41628309'),
(487, '41635620'),
(488, '41644298'),
(489, '41652254'),
(490, '41661231'),
(491, '41664162'),
(492, '41674496'),
(493, '41704175'),
(494, '41729788'),
(495, '41730441'),
(496, '41731334'),
(497, '41741215'),
(498, '41743092'),
(499, '41743889'),
(500, '41744701'),
(501, '41748065'),
(502, '41776748'),
(503, '41778165'),
(504, '41786663'),
(505, '41787476'),
(506, '41816167'),
(507, '41830490'),
(508, '41843754'),
(509, '41844886'),
(510, '41845867'),
(511, '41852957'),
(512, '41891132'),
(513, '41892018'),
(514, '41910792'),
(515, '41915201'),
(516, '41928390'),
(517, '41932387'),
(518, '41933051'),
(519, '41933233'),
(520, '41943266'),
(521, '41961415'),
(522, '41961627'),
(523, '41971965'),
(524, '41972553'),
(525, '41975177'),
(526, '41977356'),
(527, '41985370'),
(528, '41998513'),
(529, '42011298'),
(530, '42021017'),
(531, '42023282'),
(532, '42043506'),
(533, '42044322'),
(534, '42044434'),
(535, '42061329'),
(536, '42072576'),
(537, '42079810'),
(538, '42084312'),
(539, '42095581'),
(540, '42096558'),
(541, '42096978'),
(542, '42105338'),
(543, '42109051'),
(544, '42121720'),
(545, '42127827'),
(546, '42140918'),
(547, '42166038'),
(548, '42181419'),
(549, '42184027'),
(550, '42189076'),
(551, '42191591'),
(552, '42199027'),
(553, '42240595'),
(554, '42253499'),
(555, '42257110'),
(556, '42261712'),
(557, '42274900'),
(558, '42294969'),
(559, '42301244'),
(560, '42318362'),
(561, '42320437'),
(562, '42322745'),
(563, '42328303'),
(564, '42345400'),
(565, '42356132'),
(566, '42376188'),
(567, '42388056'),
(568, '42402237'),
(569, '42428154'),
(570, '42441623'),
(571, '42447092'),
(572, '42450209'),
(573, '42450438'),
(574, '42456235'),
(575, '42477792'),
(576, '42486848'),
(577, '42504101'),
(578, '42508643'),
(579, '42525837'),
(580, '42526076'),
(581, '42547440'),
(582, '42552586'),
(583, '42570694'),
(584, '42588091'),
(585, '42634665'),
(586, '42643794'),
(587, '42661865'),
(588, '42667695'),
(589, '42671459'),
(590, '42706105'),
(591, '42720337'),
(592, '42735594'),
(593, '42745979'),
(594, '42751633'),
(595, '42767369'),
(596, '42773521'),
(597, '42784347'),
(598, '42796197'),
(599, '42811902'),
(600, '42813391'),
(601, '42814157'),
(602, '42843151'),
(603, '42848214'),
(604, '42858506'),
(605, '42899771'),
(606, '42911723'),
(607, '42913682'),
(608, '42928434'),
(609, '42949602'),
(610, '42956044'),
(611, '42959327'),
(612, '42962490'),
(613, '42972326'),
(614, '42980512'),
(615, '42991201'),
(616, '43004956'),
(617, '43006847'),
(618, '43016122'),
(619, '43017403'),
(620, '43019187'),
(621, '43020636'),
(622, '43054652'),
(623, '43076140'),
(624, '43087125'),
(625, '43104335'),
(626, '43111421'),
(627, '43111684'),
(628, '43130230'),
(629, '43134338'),
(630, '43139968'),
(631, '43167029'),
(632, '43194604'),
(633, '43204420'),
(634, '43209814'),
(635, '43242207'),
(636, '43246814'),
(637, '43261316'),
(638, '43271994'),
(639, '43295944'),
(640, '43305265'),
(641, '43320749'),
(642, '43341479'),
(643, '43411750'),
(644, '43419605'),
(645, '43447516'),
(646, '43482666'),
(647, '43503061'),
(648, '43505500'),
(649, '43509248'),
(650, '43512467'),
(651, '43525684'),
(652, '43526076'),
(653, '43538392'),
(654, '43541070'),
(655, '43551619'),
(656, '43555922'),
(657, '43556986'),
(658, '43574167'),
(659, '43581888'),
(660, '43590813'),
(661, '43596150'),
(662, '43619741'),
(663, '43651242'),
(664, '43652747'),
(665, '43654422'),
(666, '43658503'),
(667, '43674429'),
(668, '43679490'),
(669, '43690151'),
(670, '43693309'),
(671, '43698528'),
(672, '43714475'),
(673, '43734627'),
(674, '43735309'),
(675, '43742253'),
(676, '43757339'),
(677, '43770219'),
(678, '43774292'),
(679, '43824195'),
(680, '43831655'),
(681, '43841831'),
(682, '43848131'),
(683, '43849230'),
(684, '43868704'),
(685, '43901072'),
(686, '43904767'),
(687, '43907423'),
(688, '43911090'),
(689, '43920760'),
(690, '43926201'),
(691, '43943193'),
(692, '43965223'),
(693, '43968049'),
(694, '43970515'),
(695, '43976320'),
(696, '43980041'),
(697, '43984318'),
(698, '44001164'),
(699, '44029808'),
(700, '44034640'),
(701, '44045967'),
(702, '44047419'),
(703, '44061393'),
(704, '44069901'),
(705, '44075229'),
(706, '44077553'),
(707, '44095739'),
(708, '44104546'),
(709, '44114427'),
(710, '44132840'),
(711, '44141649'),
(712, '44154793'),
(713, '44155597'),
(714, '44173693'),
(715, '44177160'),
(716, '44194303'),
(717, '44198364'),
(718, '44251336'),
(719, '44252837'),
(720, '44259041'),
(721, '44263461'),
(722, '44265950'),
(723, '44281971'),
(724, '44288122'),
(725, '44307628'),
(726, '44310593'),
(727, '44310605'),
(728, '44310867'),
(729, '44321934'),
(730, '44370393'),
(731, '44402324'),
(732, '44424074'),
(733, '44431345'),
(734, '44437498'),
(735, '44453266'),
(736, '44456579'),
(737, '44462405'),
(738, '44464720'),
(739, '44467093'),
(740, '44492641'),
(741, '44496763'),
(742, '44521877'),
(743, '44522629'),
(744, '44524317'),
(745, '44529240'),
(746, '44532638'),
(747, '44562390'),
(748, '44564765'),
(749, '44568714'),
(750, '44577424'),
(751, '44592001'),
(752, '44614907'),
(753, '44622261'),
(754, '44658139'),
(755, '44683189'),
(756, '44717620'),
(757, '44722735'),
(758, '44731153'),
(759, '44732464'),
(760, '44733326'),
(761, '44738749'),
(762, '44741946'),
(763, '44745901'),
(764, '44749144'),
(765, '44749257'),
(766, '44754236'),
(767, '44763025'),
(768, '44764515'),
(769, '44765322'),
(770, '44774484'),
(771, '44782625'),
(772, '44784131'),
(773, '44792107'),
(774, '44792849'),
(775, '44844414'),
(776, '44845705'),
(777, '44856627'),
(778, '44860560'),
(779, '44866279'),
(780, '44866602'),
(781, '44881037'),
(782, '44882864'),
(783, '44884000'),
(784, '44885187'),
(785, '44891113'),
(786, '44910742'),
(787, '44911203'),
(788, '44935005'),
(789, '44937836'),
(790, '44940848'),
(791, '44945371'),
(792, '44953386'),
(793, '44958475'),
(794, '44972884'),
(795, '44976882'),
(796, '44987533'),
(797, '44998062'),
(798, '45000147'),
(799, '45006446'),
(800, '45024425'),
(801, '45067567'),
(802, '45075618'),
(803, '45080891'),
(804, '45082801'),
(805, '45107450'),
(806, '45146887'),
(807, '45198146'),
(808, '45206149'),
(809, '45206192'),
(810, '45210853'),
(811, '45212332'),
(812, '45214944'),
(813, '45217102'),
(814, '45217730'),
(815, '45221840'),
(816, '45240108'),
(817, '45243025'),
(818, '45247917'),
(819, '45253548'),
(820, '45265482'),
(821, '45265844'),
(822, '45275852'),
(823, '45297704'),
(824, '45355555'),
(825, '45360571'),
(826, '45388290'),
(827, '45398629'),
(828, '45401562'),
(829, '45441359'),
(830, '45441950'),
(831, '45444969'),
(832, '45486743'),
(833, '45506952'),
(834, '45510635'),
(835, '45513359'),
(836, '45513974'),
(837, '45522192'),
(838, '45536482'),
(839, '45542065'),
(840, '45544376'),
(841, '45550741'),
(842, '45553089'),
(843, '45553340'),
(844, '45556515'),
(845, '45563999'),
(846, '45574231'),
(847, '45591399'),
(848, '45608890'),
(849, '45609378'),
(850, '45633722'),
(851, '45667878'),
(852, '45688776'),
(853, '45752010'),
(854, '45760684'),
(855, '45792012'),
(856, '45803705'),
(857, '45811529'),
(858, '45824219'),
(859, '45832653'),
(860, '45844684'),
(861, '45846129'),
(862, '45849534'),
(863, '45859048'),
(864, '45870658'),
(865, '45881891'),
(866, '45919045'),
(867, '45934059'),
(868, '45939799'),
(869, '45940248'),
(870, '45946223'),
(871, '45961499'),
(872, '45972146'),
(873, '45973956'),
(874, '45975141'),
(875, '45986648'),
(876, '45993705'),
(877, '45998064'),
(878, '46030406'),
(879, '46032623'),
(880, '46059499'),
(881, '46079693'),
(882, '46080051'),
(883, '46089849'),
(884, '46126931'),
(885, '46153834'),
(886, '46154046'),
(887, '46155467'),
(888, '46217267'),
(889, '46223313'),
(890, '46234969'),
(891, '46238686'),
(892, '46276244'),
(893, '46290753'),
(894, '46291679'),
(895, '46301132'),
(896, '46310203'),
(897, '46329812'),
(898, '46329926'),
(899, '46344111'),
(900, '46363995'),
(901, '46368636'),
(902, '46392283'),
(903, '46422214'),
(904, '46448932'),
(905, '46467506'),
(906, '46498408'),
(907, '46534542'),
(908, '46543330'),
(909, '46545793'),
(910, '46547099'),
(911, '46547891'),
(912, '46556110'),
(913, '46566967'),
(914, '46578703'),
(915, '46616951'),
(916, '46619823'),
(917, '46626854'),
(918, '46636535'),
(919, '46640683'),
(920, '46650091'),
(921, '46656055'),
(922, '46715772'),
(923, '46764862'),
(924, '46774574'),
(925, '46777441'),
(926, '46791756'),
(927, '46802116'),
(928, '46815261'),
(929, '46824215'),
(930, '46832690'),
(931, '46847128'),
(932, '46867254'),
(933, '46874759'),
(934, '46890529'),
(935, '46901611'),
(936, '46930192'),
(937, '46933666'),
(938, '46970175'),
(939, '46982411'),
(940, '46984882'),
(941, '46987219'),
(942, '47006590'),
(943, '47014051'),
(944, '47039873'),
(945, '47047688'),
(946, '47057613'),
(947, '47064998'),
(948, '47092363'),
(949, '47093696'),
(950, '47097936'),
(951, '47098085'),
(952, '47100563'),
(953, '47128200'),
(954, '47148353'),
(955, '47156667'),
(956, '47160584'),
(957, '47191815'),
(958, '47204814'),
(959, '47223588'),
(960, '47260262'),
(961, '47303907'),
(962, '47338776'),
(963, '47352962'),
(964, '47353597'),
(965, '47391025'),
(966, '47412384'),
(967, '47417837'),
(968, '47422433'),
(969, '47456613'),
(970, '47461139'),
(971, '47466221'),
(972, '47475650'),
(973, '47531419'),
(974, '47563991'),
(975, '47564566'),
(976, '47605941'),
(977, '47606717'),
(978, '47614676'),
(979, '47620769'),
(980, '47632624'),
(981, '47634064'),
(982, '47635309'),
(983, '47659604'),
(984, '47721748'),
(985, '47746267'),
(986, '47762536'),
(987, '47818254'),
(988, '47835307'),
(989, '47848454'),
(990, '47859173'),
(991, '47862495'),
(992, '47872059'),
(993, '47884379'),
(994, '47890986'),
(995, '47893889'),
(996, '47905918'),
(997, '47923351'),
(998, '47928104'),
(999, '47931067'),
(1000, '47940277'),
(1001, '47971231'),
(1002, '47997963'),
(1003, '47998975'),
(1004, '48001875'),
(1005, '48006899'),
(1006, '48021353'),
(1007, '48039803'),
(1008, '48040283'),
(1009, '48052173'),
(1010, '48062981'),
(1011, '48065193'),
(1012, '48067407'),
(1013, '48078748'),
(1014, '48140108'),
(1015, '48158394'),
(1016, '48169578'),
(1017, '48195179'),
(1018, '48198882'),
(1019, '48201663'),
(1020, '48232157'),
(1021, '48252803'),
(1022, '48281212'),
(1023, '48284592'),
(1024, '48292747'),
(1025, '48311590'),
(1026, '48339820'),
(1027, '48383855'),
(1028, '48397470'),
(1029, '48417458'),
(1030, '48433348'),
(1031, '48448426'),
(1032, '48460258'),
(1033, '48470591'),
(1034, '48503302'),
(1035, '48514391'),
(1036, '48519528'),
(1037, '48526972'),
(1038, '48554760'),
(1039, '48617808'),
(1040, '48772741'),
(1041, '60176417'),
(1042, '60587100'),
(1043, '61220126'),
(1044, '62335889'),
(1045, '62513605'),
(1046, '70001781'),
(1047, '70004708'),
(1048, '70009584'),
(1049, '70015808'),
(1050, '70036277'),
(1051, '70053127'),
(1052, '70058484'),
(1053, '70071244'),
(1054, '70072714'),
(1055, '70106390'),
(1056, '70109164'),
(1057, '70117182'),
(1058, '70122537'),
(1059, '70133374'),
(1060, '70152361'),
(1061, '70155247'),
(1062, '70156357'),
(1063, '70156605'),
(1064, '70164985'),
(1065, '70174162'),
(1066, '70177640'),
(1067, '70189000'),
(1068, '70212547'),
(1069, '70226771'),
(1070, '70230744'),
(1071, '70258510'),
(1072, '70259355'),
(1073, '70267920'),
(1074, '70278678'),
(1075, '70278680'),
(1076, '70278744'),
(1077, '70279740'),
(1078, '70282907'),
(1079, '70284633'),
(1080, '70290037'),
(1081, '70293474'),
(1082, '70295252'),
(1083, '70297878'),
(1084, '70313852'),
(1085, '70315249'),
(1086, '70331426'),
(1087, '70332103'),
(1088, '70332982'),
(1089, '70337255'),
(1090, '70355236'),
(1091, '70355936'),
(1092, '70360801'),
(1093, '70360919'),
(1094, '70373382'),
(1095, '70398010'),
(1096, '70409729'),
(1097, '70452498'),
(1098, '70473516'),
(1099, '70506222'),
(1100, '70515654'),
(1101, '70549379'),
(1102, '70550564'),
(1103, '70558280'),
(1104, '70559527'),
(1105, '70581681'),
(1106, '70600422'),
(1107, '70653839'),
(1108, '70665743'),
(1109, '70678360'),
(1110, '70690667'),
(1111, '70745125'),
(1112, '70745519'),
(1113, '70779707'),
(1114, '70801256'),
(1115, '70816883'),
(1116, '70854618'),
(1117, '70864087'),
(1118, '70893470'),
(1119, '70905219'),
(1120, '70907892'),
(1121, '70912750'),
(1122, '70932885'),
(1123, '70936989'),
(1124, '70971344'),
(1125, '70978958'),
(1126, '71051790'),
(1127, '71057755'),
(1128, '71060445'),
(1129, '71069621'),
(1130, '71070480'),
(1131, '71080111'),
(1132, '71112044'),
(1133, '71202444'),
(1134, '71205134'),
(1135, '71254339'),
(1136, '71256296'),
(1137, '71275033'),
(1138, '71276800'),
(1139, '71295078'),
(1140, '71374958'),
(1141, '71393720'),
(1142, '71410938'),
(1143, '71412133'),
(1144, '71412659'),
(1145, '71424438'),
(1146, '71426434'),
(1147, '71430135'),
(1148, '71458607'),
(1149, '71479924'),
(1150, '71491464'),
(1151, '71522889'),
(1152, '71597139'),
(1153, '71606060'),
(1154, '71608389'),
(1155, '71623432'),
(1156, '71624792'),
(1157, '71643111'),
(1158, '71702216'),
(1159, '71781437'),
(1160, '71790027'),
(1161, '71809586'),
(1162, '71811043'),
(1163, '71833154'),
(1164, '71835676'),
(1165, '71849241'),
(1166, '71857636'),
(1167, '71886839'),
(1168, '71920698'),
(1169, '71928537'),
(1170, '71942945'),
(1171, '71958455'),
(1172, '71967277'),
(1173, '71996325'),
(1174, '72020863'),
(1175, '72021429'),
(1176, '72092482'),
(1177, '72096106'),
(1178, '72123678'),
(1179, '72124209'),
(1180, '72147617'),
(1181, '72175809'),
(1182, '72185599'),
(1183, '72190593'),
(1184, '72196102'),
(1185, '72218517'),
(1186, '72247697'),
(1187, '72297222'),
(1188, '72304898'),
(1189, '72305188'),
(1190, '72322819'),
(1191, '72327313'),
(1192, '72351290'),
(1193, '72360569'),
(1194, '72383562'),
(1195, '72399183'),
(1196, '72401229'),
(1197, '72409375'),
(1198, '72425232'),
(1199, '72435309'),
(1200, '72461813'),
(1201, '72467626'),
(1202, '72488189'),
(1203, '72492825'),
(1204, '72496161'),
(1205, '72541095'),
(1206, '72560154'),
(1207, '72565446'),
(1208, '72582638'),
(1209, '72641575'),
(1210, '72651736'),
(1211, '72669508'),
(1212, '72676112'),
(1213, '72678378'),
(1214, '72680041'),
(1215, '72697544'),
(1216, '72714221'),
(1217, '72728083'),
(1218, '72752640'),
(1219, '72778005'),
(1220, '72781813'),
(1221, '72805325'),
(1222, '72843695'),
(1223, '72845413'),
(1224, '72847365'),
(1225, '72862249'),
(1226, '72878996'),
(1227, '72925476'),
(1228, '72944065'),
(1229, '72947713'),
(1230, '72973093'),
(1231, '72996033'),
(1232, '73013570'),
(1233, '73027999'),
(1234, '73036966'),
(1235, '73055667'),
(1236, '73058184'),
(1237, '73077508'),
(1238, '73101989'),
(1239, '73130950'),
(1240, '73132594'),
(1241, '73176994'),
(1242, '73182175'),
(1243, '73183446'),
(1244, '73200698'),
(1245, '73204893'),
(1246, '73204899'),
(1247, '73205506'),
(1248, '73214134'),
(1249, '73230150'),
(1250, '73234612'),
(1251, '73260438'),
(1252, '73277451'),
(1253, '73301116'),
(1254, '73334561'),
(1255, '73420419'),
(1256, '73451100'),
(1257, '73464203'),
(1258, '73472531'),
(1259, '73474783'),
(1260, '73481052'),
(1261, '73493448'),
(1262, '73545262'),
(1263, '73582766'),
(1264, '73628492'),
(1265, '73637414'),
(1266, '73645477'),
(1267, '73664081'),
(1268, '73685733'),
(1269, '73746826'),
(1270, '73777822'),
(1271, '73783044'),
(1272, '73785350'),
(1273, '73873696'),
(1274, '73937269'),
(1275, '73946591'),
(1276, '73974184'),
(1277, '73974563'),
(1278, '74021552'),
(1279, '74026620'),
(1280, '74077199'),
(1281, '74121876'),
(1282, '74123152'),
(1283, '74133372'),
(1284, '74134734'),
(1285, '74158676'),
(1286, '74163291'),
(1287, '74209072'),
(1288, '74305490'),
(1289, '74322837'),
(1290, '74397646'),
(1291, '74413116'),
(1292, '74429489'),
(1293, '74443302'),
(1294, '74478847'),
(1295, '74488361'),
(1296, '74537973'),
(1297, '74542017'),
(1298, '74590900'),
(1299, '74609493'),
(1300, '74619365'),
(1301, '74622893'),
(1302, '74707169'),
(1303, '74730731'),
(1304, '74739062'),
(1305, '74750896'),
(1306, '74814394'),
(1307, '74820133'),
(1308, '74825709'),
(1309, '74850677'),
(1310, '74900877'),
(1311, '74909126'),
(1312, '74909143'),
(1313, '74914419'),
(1314, '74927954'),
(1315, '74935715'),
(1316, '74947456'),
(1317, '74973617'),
(1318, '75008788'),
(1319, '75068533'),
(1320, '75075283'),
(1321, '75080256'),
(1322, '75094962'),
(1323, '75177997'),
(1324, '75178453'),
(1325, '75219796'),
(1326, '75226392'),
(1327, '75344826'),
(1328, '75349784'),
(1329, '75385380'),
(1330, '75409852'),
(1331, '75412329'),
(1332, '75424339'),
(1333, '75457172'),
(1334, '75465593'),
(1335, '75467557'),
(1336, '75478230'),
(1337, '75490667'),
(1338, '75499817'),
(1339, '75503497'),
(1340, '75527180'),
(1341, '75549129'),
(1342, '75656676'),
(1343, '75662271'),
(1344, '75683619'),
(1345, '75716023'),
(1346, '75716942'),
(1347, '75717246'),
(1348, '75722387'),
(1349, '75744845'),
(1350, '75744846'),
(1351, '75798680'),
(1352, '75866069'),
(1353, '75875464'),
(1354, '75944673'),
(1355, '75949845'),
(1356, '75972237'),
(1357, '76008595'),
(1358, '76090359'),
(1359, '76090878'),
(1360, '76162315'),
(1361, '76260199'),
(1362, '76264125'),
(1363, '76417008'),
(1364, '76427790'),
(1365, '76432082'),
(1366, '76440233'),
(1367, '76441867'),
(1368, '76447202'),
(1369, '76465059'),
(1370, '76469441'),
(1371, '76474648'),
(1372, '76477222'),
(1373, '76503756'),
(1374, '76533880'),
(1375, '76546080'),
(1376, '76581563'),
(1377, '76615837'),
(1378, '76620104'),
(1379, '76659614'),
(1380, '76690664'),
(1381, '76730879'),
(1382, '76738726'),
(1383, '76741262'),
(1384, '76785472'),
(1385, '76810229'),
(1386, '76819888'),
(1387, '76827946'),
(1388, '76839828'),
(1389, '76854857'),
(1390, '76863394'),
(1391, '77050325'),
(1392, '77053459'),
(1393, '77069599'),
(1394, '77074184'),
(1395, '77145689'),
(1396, '77150648'),
(1397, '77162643'),
(1398, '77172537'),
(1399, '77208199'),
(1400, '77243067'),
(1401, '77299811'),
(1402, '77300028'),
(1403, '77327102'),
(1404, '77347410'),
(1405, '77389246'),
(1406, '77470312'),
(1407, '77483402'),
(1408, '77564399'),
(1409, '77576421'),
(1410, '77672074'),
(1411, '77817574'),
(1412, '77818368'),
(1413, '77913953'),
(1414, '80156835'),
(1415, '80167688'),
(1416, '80213018'),
(1417, '80217973'),
(1418, '80263744'),
(1419, '80318933'),
(1420, '80364346'),
(1421, '80400737'),
(1422, '80410527'),
(1423, '80432105'),
(1424, '80466689'),
(1425, '80474547'),
(1426, '80480092'),
(1427, '80490276'),
(1428, '80598295'),
(1429, '80615618'),
(1430, '80666847');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc_identidad`
--

CREATE TABLE `tipo_doc_identidad` (
  `id` int(11) NOT NULL,
  `codigo` char(1) NOT NULL,
  `descripcion` char(50) NOT NULL,
  `abrev` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_doc_identidad`
--

INSERT INTO `tipo_doc_identidad` (`id`, `codigo`, `descripcion`, `abrev`) VALUES
(1, '7', 'Pasaporte', 'PAS'),
(2, '1', 'Documento Nacional de Identidad', 'DNI'),
(3, '4', 'Carnet de extranjería', 'CEX'),
(4, 'A', 'Cédula Diplomática de identidad', 'CDI'),
(5, 'E', 'TAM- Tarjeta Andina de Migración', 'TAM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `empresa_id`) VALUES
(1, 'Segismundo Alzamora', 'salzamora@gmail.com', NULL, '$2y$12$iojPaNfeEKQIx0LR3OvPWO6xuPE7D2rgQ7YLlIzY02cuUbbv6mhYC', 'ppbUZJT5xCl4UkJnp8Q9lg5MAZnhucud4lkrotj7YJHMtftAxoeKmbNY7ox4', '2024-08-27 20:01:35', '2024-08-27 20:01:35', 1),
(2, 'Counter', 'counter@evolution.com', NULL, '$2y$10$23B7t1TbmZHxDu/aTZCuG.Z/F2Ee6jU4uPoNifSKW.xGpV7.t7RfS', NULL, '2024-10-14 19:44:43', '2024-10-14 19:44:43', 1),
(3, 'Consultorio', 'consultorio@evolution.com', NULL, '$2y$12$.gLxVo0hsxV1pHTTNEQPrumsfvnapSdquXDmQWo18SOvVSlEtbsge', 'tQTok5CjLBTaOw6ULDOaXBRy44qmEMjZwpGI5hljVXQt6co1NRZB4HPrfYCi', '2024-08-28 23:50:46', '2024-08-28 23:50:46', 1),
(5, 'Medico', 'medico@evolution.com', NULL, '$2y$10$UqWzlktdbY8zC3LPvhH3ueQw1WQJecwVgqeEWlqttgPBj4IhF9wXW', NULL, '2024-10-14 19:14:36', '2024-10-14 19:14:36', 1),
(7, 'Demo', 'demo@allmundotech.com', NULL, '$2y$10$rLtv8lQh5dq.xVL3PejU2OemuSdzC8onwnUT1PAovndanVSLNdiUu', NULL, '2024-10-16 07:47:34', '2024-10-16 07:47:34', 1),
(8, 'user de prueba', 'user1@gmail.com', NULL, '$2y$10$h5yUIq/EobEbOnFLKPy2P.FIzr/33xYLNdysN.2G9cxUXAyhF3s1m', NULL, '2025-07-13 20:40:20', '2025-07-13 20:40:20', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actividades_empresa_id_foreign` (`empresa_id`),
  ADD KEY `actividades_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `actividades_paciente`
--
ALTER TABLE `actividades_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actividades_paciente_user_id_foreign` (`user_id`),
  ADD KEY `actividades_paciente_empresa_id_foreign` (`empresa_id`),
  ADD KEY `actividades_paciente_servicio_id_foreign` (`servicio_id`),
  ADD KEY `actividades_paciente_detalle_presupuesto_id_foreign` (`detalle_presupuesto_id`);

--
-- Indices de la tabla `actividades_por_tratamiento`
--
ALTER TABLE `actividades_por_tratamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actividades_por_servicio_servicio_id_foreign` (`servicio_id`),
  ADD KEY `actividades_por_servicio_empresa_id_foreign` (`empresa_id`),
  ADD KEY `actividades_por_servicio_user_id_foreign` (`user_id`),
  ADD KEY `actividades_por_servicio_tratamiento_id_foreign` (`tratamiento_id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citas_empresa_id_foreign` (`empresa_id`),
  ADD KEY `citas_id_medico_foreign` (`id_medico`),
  ADD KEY `citas_id_paciente_foreign` (`id_paciente`),
  ADD KEY `citas_id_servicio_foreign` (`id_servicio`),
  ADD KEY `citas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruc` (`ruc`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `detalle_facturacion`
--
ALTER TABLE `detalle_facturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturaciones_id` (`facturaciones_id`),
  ADD KEY `detalle_facturacion_tratamiento_id_foreign` (`tratamiento_id`),
  ADD KEY `detalle_facturacion_procedimiento_id_foreign` (`procedimiento_id`);

--
-- Indices de la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_presupuesto_presupuesto_id_foreign` (`presupuesto_id`),
  ADD KEY `detalle_presupuesto_tratamiento_id_foreign` (`tratamiento_id`),
  ADD KEY `detalle_presupuesto_empresa_id_foreign` (`empresa_id`),
  ADD KEY `detalle_presupuesto_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `facturaciones`
--
ALTER TABLE `facturaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturaciones_paciente_id_foreign` (`paciente_id`),
  ADD KEY `facturaciones_medico_tratante_id_foreign` (`medico_tratante_id`),
  ADD KEY `facturaciones_medico_factura_id_foreign` (`medico_factura_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `empresa_id` (`empresa_id`),
  ADD KEY `facturaciones_presupuesto_id_foreign` (`presupuesto_id`),
  ADD KEY `fk_facturador` (`facturador_id`);

--
-- Indices de la tabla `facturadores`
--
ALTER TABLE `facturadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `historias_clinicas_v2`
--
ALTER TABLE `historias_clinicas_v2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historias_clinicas_v2_paciente_id_foreign` (`paciente_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicos_user_id_foreign` (`user_id`),
  ADD KEY `medicos_empresa_id_foreign` (`empresa_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `movimientos_almacen`
--
ALTER TABLE `movimientos_almacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimientos_almacen_producto_id_foreign` (`producto_id`),
  ADD KEY `movimientos_almacen_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `nota_credito`
--
ALTER TABLE `nota_credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_facturador_nota_credito` (`facturador_id`);

--
-- Indices de la tabla `odontogramas_detalle`
--
ALTER TABLE `odontogramas_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `odontogramas_detalle_historia_clinica_id_foreign` (`historia_clinica_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pacientes_empresa_id_foreign` (`empresa_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `paciente_enfermedad`
--
ALTER TABLE `paciente_enfermedad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_enfermedad_paciente_id_foreign` (`paciente_id`),
  ADD KEY `paciente_enfermedad_enfermedad_id_foreign` (`enfermedad_id`),
  ADD KEY `paciente_enfermedad_historia_clinica_id_foreign` (`historia_clinica_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presupuestos_paciente_id_foreign` (`paciente_id`),
  ADD KEY `presupuestos_medico_id_foreign` (`medico_id`),
  ADD KEY `presupuestos_empresa_id_foreign` (`empresa_id`),
  ADD KEY `presupuestos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `productos_almacen`
--
ALTER TABLE `productos_almacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_almacen_usuario_id_foreign` (`usuario_id`),
  ADD KEY `fk_ultimo_movimiento` (`ultimo_movimiento_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicios_empresa_id_foreign` (`empresa_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students1`
--
ALTER TABLE `students1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students2`
--
ALTER TABLE `students2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_doc_identidad`
--
ALTER TABLE `tipo_doc_identidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_empresa_id_foreign` (`empresa_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `actividades_paciente`
--
ALTER TABLE `actividades_paciente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `actividades_por_tratamiento`
--
ALTER TABLE `actividades_por_tratamiento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1315;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_facturacion`
--
ALTER TABLE `detalle_facturacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `facturaciones`
--
ALTER TABLE `facturaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `facturadores`
--
ALTER TABLE `facturadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas_v2`
--
ALTER TABLE `historias_clinicas_v2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `movimientos_almacen`
--
ALTER TABLE `movimientos_almacen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `nota_credito`
--
ALTER TABLE `nota_credito`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `odontogramas_detalle`
--
ALTER TABLE `odontogramas_detalle`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1716;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5045;

--
-- AUTO_INCREMENT de la tabla `paciente_enfermedad`
--
ALTER TABLE `paciente_enfermedad`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `productos_almacen`
--
ALTER TABLE `productos_almacen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1661;

--
-- AUTO_INCREMENT de la tabla `students1`
--
ALTER TABLE `students1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `students2`
--
ALTER TABLE `students2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1431;

--
-- AUTO_INCREMENT de la tabla `tipo_doc_identidad`
--
ALTER TABLE `tipo_doc_identidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `actividades_paciente`
--
ALTER TABLE `actividades_paciente`
  ADD CONSTRAINT `actividades_paciente_detalle_presupuesto_id_foreign` FOREIGN KEY (`detalle_presupuesto_id`) REFERENCES `detalle_presupuesto` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_paciente_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_paciente_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_paciente_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `actividades_por_tratamiento`
--
ALTER TABLE `actividades_por_tratamiento`
  ADD CONSTRAINT `actividades_por_servicio_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_por_servicio_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_por_servicio_tratamiento_id_foreign` FOREIGN KEY (`tratamiento_id`) REFERENCES `actividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `actividades_por_servicio_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_id_medico_foreign` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_id_paciente_foreign` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_id_servicio_foreign` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `clientes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `detalle_facturacion`
--
ALTER TABLE `detalle_facturacion`
  ADD CONSTRAINT `detalle_facturacion_facturaciones_id_foreign` FOREIGN KEY (`facturaciones_id`) REFERENCES `facturaciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_facturacion_procedimiento_id_foreign` FOREIGN KEY (`procedimiento_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_facturacion_tratamiento_id_foreign` FOREIGN KEY (`tratamiento_id`) REFERENCES `actividades` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  ADD CONSTRAINT `detalle_presupuesto_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_presupuesto_presupuesto_id_foreign` FOREIGN KEY (`presupuesto_id`) REFERENCES `presupuestos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_presupuesto_tratamiento_id_foreign` FOREIGN KEY (`tratamiento_id`) REFERENCES `actividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_presupuesto_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `facturaciones`
--
ALTER TABLE `facturaciones`
  ADD CONSTRAINT `facturaciones_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `facturaciones_medico_factura_id_foreign` FOREIGN KEY (`medico_factura_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `facturaciones_medico_tratante_id_foreign` FOREIGN KEY (`medico_tratante_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `facturaciones_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `facturaciones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_facturador` FOREIGN KEY (`facturador_id`) REFERENCES `facturadores` (`id`);

--
-- Filtros para la tabla `facturadores`
--
ALTER TABLE `facturadores`
  ADD CONSTRAINT `facturadores_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Filtros para la tabla `historias_clinicas_v2`
--
ALTER TABLE `historias_clinicas_v2`
  ADD CONSTRAINT `historias_clinicas_v2_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medicos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `movimientos_almacen`
--
ALTER TABLE `movimientos_almacen`
  ADD CONSTRAINT `movimientos_almacen_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos_almacen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movimientos_almacen_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `nota_credito`
--
ALTER TABLE `nota_credito`
  ADD CONSTRAINT `fk_facturador_nota_credito` FOREIGN KEY (`facturador_id`) REFERENCES `facturadores` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `odontogramas_detalle`
--
ALTER TABLE `odontogramas_detalle`
  ADD CONSTRAINT `odontogramas_detalle_historia_clinica_id_foreign` FOREIGN KEY (`historia_clinica_id`) REFERENCES `historias_clinicas_v2` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pacientes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `paciente_enfermedad`
--
ALTER TABLE `paciente_enfermedad`
  ADD CONSTRAINT `paciente_enfermedad_enfermedad_id_foreign` FOREIGN KEY (`enfermedad_id`) REFERENCES `enfermedades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paciente_enfermedad_historia_clinica_id_foreign` FOREIGN KEY (`historia_clinica_id`) REFERENCES `historias_clinicas_v2` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paciente_enfermedad_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD CONSTRAINT `presupuestos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presupuestos_medico_id_foreign` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presupuestos_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presupuestos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos_almacen`
--
ALTER TABLE `productos_almacen`
  ADD CONSTRAINT `fk_ultimo_movimiento` FOREIGN KEY (`ultimo_movimiento_id`) REFERENCES `movimientos_almacen` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productos_almacen_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `servicios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
