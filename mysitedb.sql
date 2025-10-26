-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2025 a las 15:31:54
-- Versión del servidor: 12.0.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mysitedb`
--
DROP DATABASE IF EXISTS `mysitedb`;
CREATE DATABASE IF NOT EXISTS `mysitedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `mysitedb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomentarios`
--

DROP TABLE IF EXISTS `tcomentarios`;
CREATE TABLE `tcomentarios` (
  `id` int(11) NOT NULL,
  `comentario` varchar(2000) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `juego_id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `tcomentarios`
--

INSERT INTO `tcomentarios` (`id`, `comentario`, `usuario_id`, `juego_id`, `fecha`) VALUES
(1, 'Mundo futurista inmersivo con narrativa compleja y gameplay mejorado tras actualizaciones.', 1, 1, '2025-10-15 19:01:55'),
(2, 'Aventura abierta que reinventa la exploración con libertad y creatividad.', 2, 2, '2025-10-15 19:01:55'),
(3, 'Acción épica y emotiva con una historia que profundiza en la mitología nórdica.', 3, 3, '2025-10-15 19:01:55'),
(4, 'Shooter clásico con campaña sólida y multijugador competitivo.', 4, 4, '2025-10-15 19:01:55'),
(5, 'Juego social divertido que mezcla colaboración y engaño en partidas rápidas.', 5, 5, '2025-10-15 19:01:55'),
(6, 'Muy buen juego, lo he jugado en Nintendo Switch 2', NULL, 2, '2025-10-15 19:01:55'),
(7, 'muy bueno\r\n', 9, 1, '2025-10-26 09:35:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tjuegos`
--

DROP TABLE IF EXISTS `tjuegos`;
CREATE TABLE `tjuegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `url_imagen` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `plataforma` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `tjuegos`
--

INSERT INTO `tjuegos` (`id`, `nombre`, `url_imagen`, `descripcion`, `plataforma`) VALUES
(1, 'Cyberpunk 2077', 'https://image.api.playstation.com/vulcan/ap/rnd/202008/0416/6Bo40lnWU0BhgrOUm7Cb6by3.png', 'Un RPG futurista con un mundo abierto impresionante y una historia profunda, que ha mejorado mucho desde su lanzamiento inicial.', 'PC'),
(2, 'The Legend of Zelda: Breath of the Wild', 'https://www.nintendo.com/eu/media/images/10_share_images/games_15/wiiu_14/SI_WiiU_TheLegendOfZeldaBreathOfTheWild_image1600w.jpg', 'Una aventura épica que redefine la exploración en un mundo abierto lleno de secretos y desafíos creativos.', 'Nintendo Switch'),
(3, 'God of War Ragnarok', 'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2322010/header.jpg?t=1750909504', 'Una secuela espectacular con una narrativa poderosa y combates intensos, que continúa la historia de Kratos y Atreus.', 'PS5'),
(4, 'Halo Infinite', 'https://images.sftcdn.net/images/t_app-icon-m/p/a7dd82fb-5566-4f58-93bb-f5718dd913f9/2996025137/halo-infinite-download-halo-infinite.jpg', 'El regreso clásico de Master Chief con una campaña sólida y un multijugador muy entretenido y competitivo.', 'Xbox Series X'),
(5, 'Among Us', 'https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_AmongUs.jpg', 'Un juego social de deducción donde la comunicación y la traición son clave para sobrevivir y descubrir al impostor.', 'iOS/Android');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
CREATE TABLE `tusuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contraseña` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `tusuarios`
--

INSERT INTO `tusuarios` (`id`, `nombre`, `apellidos`, `email`, `contraseña`) VALUES
(1, 'Xian', 'Leon', 'xian@gmail.com', '1234'),
(2, 'Valentina', 'Ramirez', 'vramirez@gmail.com', '1234'),
(3, 'Mateo', 'Fernandez', 'mfernandez@gmail.com', '1234'),
(4, 'Camila', 'Torres', 'ctorres@gmail.com', '1234'),
(5, 'Santiago', 'Morales', 'smorales@gmail.com', '1234'),
(6, 'prueba', 'fatal', 'pruebafatal@gmail.com', '$2y$10$EqD9jHoGkRJnV75Np5BIBOyPMhx8E3Kdov7KmPBtNPEw5j3bqz6Da'),
(7, 'prueba2', 'fatal2', 'pruebafatal2@gmail.com', '$2y$10$SQnpnpI40xCU8Nb3lLAeY.HUVBtKx89IgU1l1e/YaMmeM.GX7HcQO'),
(8, 'uno', 'dos', 'unodos@gmail.com', '$2y$10$fFhALN1qDvdXoqDFUgUG1.OojQpRd1I2NG7GjuB/zXQ9hMx8KbvhG'),
(9, 'xian', 'leon', 'xian2@gmail.com', '$2y$10$KMSprt.J5u5DcvwhZcuVuOxX4MkQsU8KG2oOlNvXm6WKpLhJsIkty');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tcomentarios`
--
ALTER TABLE `tcomentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `libro_id` (`juego_id`);

--
-- Indices de la tabla `tjuegos`
--
ALTER TABLE `tjuegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tcomentarios`
--
ALTER TABLE `tcomentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tjuegos`
--
ALTER TABLE `tjuegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tusuarios`
--
ALTER TABLE `tusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tcomentarios`
--
ALTER TABLE `tcomentarios`
  ADD CONSTRAINT `tComentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `tusuarios` (`id`),
  ADD CONSTRAINT `tComentarios_ibfk_2` FOREIGN KEY (`juego_id`) REFERENCES `tjuegos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
