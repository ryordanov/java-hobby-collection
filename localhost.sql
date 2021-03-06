-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 15, 2016 at 10:30 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;

--
-- Database: `hobbycollections`
--
CREATE DATABASE IF NOT EXISTS `hobbycollections` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hobbycollections`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) NOT NULL COMMENT '�����, ��-���, ...',
  `type` int(2) unsigned NOT NULL COMMENT 'parent',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='��������� ���������� ������ �� ����� ���' AUTO_INCREMENT=29 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `label`, `type`) VALUES
(1, 'Turbo', 1),
(2, 'Turbo sport', 1),
(3, 'Turbo classic', 1),
(4, 'Turbo 2000', 1),
(5, 'Turbo sport 2000', 1),
(6, 'Turbo 2014', 1),
(7, 'Bi-bib', 1),
(8, 'Oto moto', 1),
(9, 'Lazer', 1),
(10, 'Love is�', 1),
(11, 'Ask melegi', 1),
(12, 'Bombibom', 1),
(13, 'Guiness records', 1),
(14, 'Cola', 1),
(15, 'Cola kent', 1),
(16, 'Cin Cin', 1),
(17, 'Minti', 1),
(18, 'Kobra', 1),
(19, 'TIPI TIP', 1),
(20, 'unknown', 1),
(21, 'Roben', 1),
(22, 'Flintstone', 1),
(23, 'Kent super star', 1),
(24, 'Patbom', 1),
(25, 'Pembo', 1),
(26, 'Rock & Bubble', 1),
(27, '����� ���', 1),
(28, '�������� "����"', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item` int(4) unsigned DEFAULT NULL,
  `fromCollection` int(3) unsigned NOT NULL COMMENT 'parent is subcategory id',
  `countOfThisItem` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '������ �� ���������� ����� ��������, ��������...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemfromcollection` (`item`,`fromCollection`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1610 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item`, `fromCollection`, `countOfThisItem`) VALUES
(1, 21, 1, 1),
(2, 22, 1, 1),
(3, 45, 1, 1),
(4, 50, 1, 1),
(5, 51, 2, 2),
(6, 52, 2, 1),
(7, 53, 2, 1),
(8, 54, 2, 1),
(9, 55, 2, 2),
(10, 56, 2, 2),
(11, 57, 2, 2),
(12, 58, 2, 1),
(13, 59, 2, 1),
(14, 60, 2, 2),
(15, 61, 2, 1),
(16, 62, 2, 1),
(17, 63, 2, 1),
(18, 64, 2, 1),
(19, 65, 2, 1),
(20, 66, 2, 1),
(21, 67, 2, 1),
(22, 68, 2, 1),
(23, 69, 2, 1),
(24, 70, 2, 1),
(25, 71, 2, 3),
(26, 72, 2, 1),
(27, 73, 2, 3),
(28, 74, 2, 1),
(29, 75, 2, 1),
(30, 76, 2, 1),
(31, 77, 2, 1),
(32, 78, 2, 1),
(33, 79, 2, 1),
(34, 80, 2, 1),
(35, 81, 2, 2),
(36, 82, 2, 1),
(37, 83, 2, 1),
(38, 84, 2, 1),
(39, 85, 2, 2),
(40, 86, 2, 2),
(41, 87, 2, 1),
(42, 88, 2, 2),
(43, 89, 2, 1),
(44, 90, 2, 3),
(45, 91, 2, 1),
(46, 92, 2, 1),
(47, 93, 2, 1),
(48, 94, 2, 1),
(49, 95, 2, 1),
(50, 96, 2, 1),
(51, 97, 2, 1),
(52, 98, 2, 1),
(53, 99, 2, 1),
(54, 100, 2, 1),
(55, 101, 2, 1),
(56, 102, 2, 1),
(57, 103, 2, 1),
(58, 104, 2, 1),
(59, 105, 2, 1),
(60, 106, 2, 1),
(61, 107, 2, 1),
(62, 108, 2, 1),
(63, 109, 2, 1),
(64, 110, 2, 1),
(65, 111, 2, 1),
(66, 112, 2, 1),
(67, 113, 2, 1),
(68, 114, 2, 1),
(69, 115, 2, 1),
(70, 116, 2, 1),
(71, 117, 2, 1),
(72, 118, 2, 1),
(73, 119, 2, 1),
(74, 120, 2, 1),
(75, 121, 3, 1),
(76, 122, 3, 1),
(77, 123, 3, 1),
(78, 124, 3, 1),
(79, 125, 3, 1),
(80, 126, 3, 1),
(81, 127, 3, 1),
(82, 128, 3, 1),
(83, 129, 3, 1),
(84, 130, 3, 1),
(85, 131, 3, 1),
(86, 132, 3, 1),
(87, 133, 3, 1),
(88, 134, 3, 1),
(89, 135, 3, 1),
(90, 136, 3, 1),
(91, 137, 3, 1),
(92, 138, 3, 1),
(93, 139, 3, 1),
(94, 140, 3, 1),
(95, 141, 3, 1),
(96, 142, 3, 1),
(97, 143, 3, 2),
(98, 144, 3, 1),
(99, 145, 3, 1),
(100, 146, 3, 2),
(101, 147, 3, 1),
(102, 148, 3, 1),
(103, 149, 3, 1),
(104, 150, 3, 2),
(105, 151, 3, 1),
(106, 152, 3, 1),
(107, 153, 3, 1),
(108, 154, 3, 1),
(109, 155, 3, 1),
(110, 156, 3, 1),
(111, 157, 3, 1),
(112, 158, 3, 1),
(113, 159, 3, 1),
(114, 160, 3, 1),
(115, 161, 3, 1),
(116, 162, 3, 1),
(117, 163, 3, 1),
(118, 164, 3, 2),
(119, 165, 3, 1),
(120, 166, 3, 1),
(121, 167, 3, 1),
(122, 168, 3, 1),
(123, 169, 3, 1),
(124, 170, 3, 1),
(125, 171, 3, 1),
(126, 172, 3, 1),
(127, 173, 3, 1),
(128, 174, 3, 2),
(129, 175, 3, 1),
(130, 176, 3, 1),
(131, 177, 3, 1),
(132, 178, 3, 1),
(133, 179, 3, 1),
(134, 180, 3, 3),
(135, 181, 3, 2),
(136, 182, 3, 1),
(137, 183, 3, 1),
(138, 184, 3, 1),
(139, 185, 3, 1),
(140, 186, 3, 1),
(141, 187, 3, 1),
(142, 188, 3, 1),
(143, 189, 3, 1),
(144, 190, 3, 1),
(145, 191, 4, 1),
(146, 192, 4, 1),
(147, 193, 4, 1),
(148, 194, 4, 1),
(149, 195, 4, 1),
(150, 196, 4, 1),
(151, 197, 4, 1),
(152, 198, 4, 1),
(153, 199, 4, 1),
(154, 200, 4, 1),
(155, 201, 4, 1),
(156, 202, 4, 1),
(157, 203, 4, 1),
(158, 204, 4, 1),
(159, 205, 4, 1),
(160, 206, 4, 1),
(161, 207, 4, 2),
(162, 208, 4, 1),
(163, 209, 4, 1),
(164, 210, 4, 1),
(165, 211, 4, 1),
(166, 212, 4, 1),
(167, 213, 4, 1),
(168, 214, 4, 1),
(169, 215, 4, 1),
(170, 216, 4, 1),
(171, 217, 4, 1),
(172, 218, 4, 1),
(173, 219, 4, 1),
(174, 220, 4, 1),
(175, 221, 4, 1),
(176, 222, 4, 1),
(177, 223, 4, 1),
(178, 224, 4, 1),
(179, 225, 4, 1),
(180, 226, 4, 1),
(181, 227, 4, 1),
(182, 228, 4, 1),
(183, 229, 4, 1),
(184, 230, 4, 1),
(185, 231, 4, 1),
(186, 232, 4, 1),
(187, 233, 4, 1),
(188, 234, 4, 1),
(189, 235, 4, 2),
(190, 236, 4, 1),
(191, 237, 4, 1),
(192, 238, 4, 1),
(193, 239, 4, 1),
(194, 240, 4, 1),
(195, 241, 4, 1),
(196, 242, 4, 1),
(197, 243, 4, 1),
(198, 244, 4, 1),
(199, 245, 4, 1),
(200, 246, 4, 1),
(201, 247, 4, 1),
(202, 248, 4, 1),
(203, 249, 4, 1),
(204, 250, 4, 1),
(205, 251, 4, 1),
(206, 252, 4, 1),
(207, 253, 4, 1),
(208, 254, 4, 1),
(209, 255, 4, 1),
(210, 256, 4, 1),
(211, 257, 4, 1),
(212, 258, 4, 1),
(213, 259, 4, 1),
(214, 260, 4, 1),
(215, 261, 5, 1),
(216, 262, 5, 1),
(217, 263, 5, 1),
(218, 264, 5, 1),
(219, 265, 5, 1),
(220, 266, 5, 1),
(221, 267, 5, 1),
(222, 268, 5, 1),
(223, 269, 5, 1),
(224, 270, 5, 1),
(225, 271, 5, 1),
(226, 272, 5, 1),
(227, 273, 5, 1),
(228, 274, 5, 1),
(229, 275, 5, 2),
(230, 276, 5, 1),
(231, 277, 5, 2),
(232, 278, 5, 1),
(233, 279, 5, 1),
(234, 280, 5, 1),
(235, 281, 5, 1),
(236, 282, 5, 1),
(237, 283, 5, 1),
(238, 284, 5, 1),
(239, 285, 5, 1),
(240, 286, 5, 1),
(241, 287, 5, 1),
(242, 288, 5, 1),
(243, 289, 5, 1),
(244, 290, 5, 1),
(245, 291, 5, 1),
(246, 292, 5, 1),
(247, 293, 5, 1),
(248, 294, 5, 2),
(249, 295, 5, 1),
(250, 296, 5, 1),
(251, 297, 5, 1),
(252, 298, 5, 1),
(253, 299, 5, 1),
(254, 300, 5, 1),
(255, 301, 5, 2),
(256, 302, 5, 1),
(257, 303, 5, 1),
(258, 304, 5, 1),
(259, 305, 5, 1),
(260, 306, 5, 1),
(261, 307, 5, 1),
(262, 308, 5, 1),
(263, 309, 5, 1),
(264, 310, 5, 1),
(265, 311, 5, 2),
(266, 312, 5, 1),
(267, 313, 5, 1),
(268, 314, 5, 1),
(269, 315, 5, 1),
(270, 316, 5, 1),
(271, 317, 5, 1),
(272, 318, 5, 1),
(273, 319, 5, 1),
(274, 320, 5, 1),
(275, 321, 5, 1),
(276, 322, 5, 1),
(277, 323, 5, 1),
(278, 324, 5, 1),
(279, 325, 5, 1),
(280, 326, 5, 1),
(281, 327, 5, 1),
(282, 328, 5, 1),
(283, 329, 5, 1),
(284, 330, 5, 1),
(285, 331, 6, 1),
(286, 332, 6, 1),
(287, 333, 6, 1),
(288, 334, 6, 1),
(289, 335, 6, 1),
(290, 336, 6, 1),
(291, 337, 6, 1),
(292, 338, 6, 1),
(293, 339, 6, 1),
(294, 340, 6, 1),
(295, 341, 6, 1),
(296, 342, 6, 1),
(297, 343, 6, 1),
(298, 344, 6, 1),
(299, 345, 6, 1),
(300, 346, 6, 1),
(301, 347, 6, 1),
(302, 348, 6, 1),
(303, 349, 6, 1),
(304, 350, 6, 1),
(305, 351, 6, 1),
(306, 352, 6, 1),
(307, 353, 6, 1),
(308, 354, 6, 1),
(309, 355, 6, 1),
(310, 356, 6, 1),
(311, 357, 6, 1),
(312, 358, 6, 1),
(313, 359, 6, 1),
(314, 360, 6, 1),
(315, 361, 6, 1),
(316, 362, 6, 1),
(317, 363, 6, 1),
(318, 364, 6, 1),
(319, 365, 6, 1),
(320, 366, 6, 1),
(321, 367, 6, 1),
(322, 368, 6, 1),
(323, 369, 6, 1),
(324, 370, 6, 1),
(325, 371, 6, 1),
(326, 372, 6, 1),
(327, 373, 6, 1),
(328, 374, 6, 1),
(329, 375, 6, 1),
(330, 376, 6, 1),
(331, 377, 6, 1),
(332, 378, 6, 1),
(333, 379, 6, 1),
(334, 380, 6, 1),
(335, 381, 6, 1),
(336, 382, 6, 1),
(337, 383, 6, 1),
(338, 384, 6, 1),
(339, 385, 6, 1),
(340, 386, 6, 1),
(341, 387, 6, 1),
(342, 388, 6, 1),
(343, 389, 6, 1),
(344, 390, 6, 1),
(345, 391, 6, 1),
(346, 392, 6, 2),
(347, 393, 6, 1),
(348, 394, 6, 1),
(349, 395, 6, 1),
(350, 396, 6, 1),
(351, 397, 6, 2),
(352, 398, 6, 2),
(353, 399, 6, 1),
(354, 400, 6, 2),
(355, 401, 7, 1),
(356, 402, 7, 1),
(357, 403, 7, 1),
(358, 404, 7, 1),
(359, 405, 7, 1),
(360, 406, 7, 1),
(361, 407, 7, 1),
(362, 408, 7, 1),
(363, 409, 7, 1),
(364, 410, 7, 1),
(365, 411, 7, 1),
(366, 412, 7, 1),
(367, 413, 7, 1),
(368, 414, 7, 1),
(369, 415, 7, 1),
(370, 416, 7, 1),
(371, 417, 7, 1),
(372, 418, 7, 1),
(373, 419, 7, 1),
(374, 420, 7, 1),
(375, 421, 7, 1),
(376, 422, 7, 1),
(377, 423, 7, 1),
(378, 424, 7, 1),
(379, 425, 7, 1),
(380, 426, 7, 1),
(381, 427, 7, 1),
(382, 428, 7, 1),
(383, 429, 7, 1),
(384, 430, 7, 1),
(385, 431, 7, 1),
(386, 432, 7, 1),
(387, 433, 7, 1),
(388, 434, 7, 1),
(389, 435, 7, 1),
(390, 436, 7, 1),
(391, 437, 7, 1),
(392, 438, 7, 1),
(393, 439, 7, 1),
(394, 440, 7, 1),
(395, 441, 7, 1),
(396, 442, 7, 1),
(397, 443, 7, 1),
(398, 444, 7, 1),
(399, 445, 7, 2),
(400, 446, 7, 1),
(401, 447, 7, 1),
(402, 448, 7, 1),
(403, 449, 7, 1),
(404, 450, 7, 1),
(405, 451, 7, 1),
(406, 452, 7, 1),
(407, 453, 7, 1),
(408, 454, 7, 1),
(409, 455, 7, 1),
(410, 456, 7, 2),
(411, 457, 7, 1),
(412, 458, 7, 1),
(413, 459, 7, 1),
(414, 460, 7, 2),
(415, 461, 7, 1),
(416, 462, 7, 1),
(417, 463, 7, 1),
(418, 464, 7, 1),
(419, 465, 7, 1),
(420, 466, 7, 1),
(421, 467, 7, 1),
(422, 468, 7, 1),
(423, 469, 7, 1),
(424, 470, 7, 1),
(425, 471, 8, 1),
(426, 472, 8, 1),
(427, 473, 8, 1),
(428, 474, 8, 1),
(429, 475, 8, 1),
(430, 476, 8, 1),
(431, 477, 8, 1),
(432, 478, 8, 1),
(433, 479, 8, 1),
(434, 480, 8, 1),
(435, 481, 8, 1),
(436, 482, 8, 1),
(437, 483, 8, 1),
(438, 484, 8, 1),
(439, 485, 8, 1),
(440, 486, 8, 1),
(441, 487, 8, 1),
(442, 488, 8, 1),
(443, 489, 8, 1),
(444, 490, 8, 1),
(445, 491, 8, 1),
(446, 492, 8, 1),
(447, 493, 8, 1),
(448, 494, 8, 1),
(449, 495, 8, 1),
(450, 496, 8, 1),
(451, 497, 8, 1),
(452, 498, 8, 1),
(453, 499, 8, 1),
(454, 500, 8, 1),
(455, 501, 8, 1),
(456, 502, 8, 1),
(457, 503, 8, 1),
(458, 504, 8, 1),
(459, 505, 8, 1),
(460, 506, 8, 1),
(461, 507, 8, 1),
(462, 508, 8, 1),
(463, 509, 8, 1),
(464, 510, 8, 1),
(465, 511, 8, 1),
(466, 512, 8, 1),
(467, 513, 8, 1),
(468, 514, 8, 1),
(469, 515, 8, 1),
(470, 516, 8, 1),
(471, 517, 8, 1),
(472, 518, 8, 1),
(473, 519, 8, 1),
(474, 520, 8, 1),
(475, 521, 8, 1),
(476, 522, 8, 1),
(477, 523, 8, 1),
(478, 524, 8, 1),
(479, 525, 8, 1),
(480, 526, 8, 1),
(481, 527, 8, 1),
(482, 528, 8, 1),
(483, 529, 8, 1),
(484, 530, 8, 1),
(485, 531, 8, 1),
(486, 532, 8, 1),
(487, 533, 8, 1),
(488, 534, 8, 1),
(489, 535, 8, 1),
(490, 536, 8, 1),
(491, 537, 8, 1),
(492, 538, 8, 1),
(493, 539, 8, 1),
(494, 540, 8, 1),
(495, 1, 9, 1),
(496, 2, 9, 1),
(497, 3, 9, 1),
(498, 4, 9, 1),
(499, 5, 9, 1),
(500, 6, 9, 1),
(501, 7, 9, 1),
(502, 8, 9, 1),
(503, 9, 9, 1),
(504, 10, 9, 1),
(505, 11, 9, 1),
(506, 12, 9, 1),
(507, 13, 9, 1),
(508, 14, 9, 1),
(509, 15, 9, 1),
(510, 16, 9, 1),
(511, 17, 9, 1),
(512, 18, 9, 1),
(513, 19, 9, 1),
(514, 20, 9, 1),
(515, 21, 9, 1),
(516, 22, 9, 1),
(517, 23, 9, 1),
(518, 24, 9, 1),
(519, 25, 9, 1),
(520, 26, 9, 2),
(521, 27, 9, 2),
(522, 28, 9, 1),
(523, 29, 9, 1),
(524, 30, 9, 1),
(525, 31, 9, 1),
(526, 32, 9, 1),
(527, 33, 9, 1),
(528, 34, 9, 1),
(529, 35, 9, 1),
(530, 36, 9, 1),
(531, 37, 9, 1),
(532, 38, 9, 1),
(533, 39, 9, 1),
(534, 40, 9, 2),
(535, 41, 9, 1),
(536, 42, 9, 1),
(537, 43, 9, 1),
(538, 44, 9, 1),
(539, 45, 9, 1),
(540, 46, 9, 1),
(541, 47, 9, 1),
(542, 48, 9, 1),
(543, 49, 9, 1),
(544, 50, 9, 1),
(545, 51, 9, 1),
(546, 52, 9, 1),
(547, 53, 9, 1),
(548, 54, 9, 1),
(549, 55, 9, 1),
(550, 56, 9, 1),
(551, 57, 9, 1),
(552, 58, 9, 1),
(553, 59, 9, 1),
(554, 60, 9, 1),
(555, 61, 9, 1),
(556, 62, 9, 1),
(557, 63, 9, 2),
(558, 64, 9, 1),
(559, 65, 9, 1),
(560, 66, 9, 1),
(561, 67, 9, 1),
(562, 68, 9, 1),
(563, 69, 9, 1),
(564, 70, 9, 2),
(565, 71, 10, 1),
(566, 72, 10, 1),
(567, 73, 10, 1),
(568, 74, 10, 1),
(569, 75, 10, 1),
(570, 76, 10, 1),
(571, 77, 10, 1),
(572, 78, 10, 1),
(573, 79, 10, 1),
(574, 80, 10, 1),
(575, 81, 10, 1),
(576, 82, 10, 1),
(577, 83, 10, 1),
(578, 84, 10, 1),
(579, 85, 10, 1),
(580, 86, 10, 1),
(581, 87, 10, 1),
(582, 88, 10, 1),
(583, 89, 10, 1),
(584, 91, 10, 1),
(585, 93, 10, 1),
(586, 94, 10, 1),
(587, 95, 10, 1),
(588, 96, 10, 1),
(589, 97, 10, 1),
(590, 98, 10, 1),
(591, 100, 10, 1),
(592, 101, 10, 1),
(593, 102, 10, 1),
(594, 103, 10, 1),
(595, 105, 10, 1),
(596, 106, 10, 1),
(597, 107, 10, 1),
(598, 108, 10, 1),
(599, 109, 10, 1),
(600, 110, 10, 1),
(601, 112, 10, 1),
(602, 113, 10, 1),
(603, 114, 10, 1),
(604, 115, 10, 1),
(605, 116, 10, 1),
(606, 117, 10, 1),
(607, 120, 10, 1),
(608, 121, 10, 1),
(609, 122, 10, 1),
(610, 124, 10, 1),
(611, 125, 10, 1),
(612, 126, 10, 1),
(613, 127, 10, 1),
(614, 128, 10, 1),
(615, 129, 10, 1),
(616, 130, 10, 1),
(617, 131, 10, 1),
(618, 132, 10, 1),
(619, 133, 10, 1),
(620, 134, 10, 1),
(621, 135, 10, 1),
(622, 136, 10, 1),
(623, 137, 10, 1),
(624, 139, 10, 1),
(625, 140, 10, 1),
(626, 141, 11, 1),
(627, 142, 11, 1),
(628, 143, 11, 1),
(629, 144, 11, 1),
(630, 145, 11, 1),
(631, 146, 11, 1),
(632, 147, 11, 1),
(633, 148, 11, 1),
(634, 149, 11, 1),
(635, 150, 11, 1),
(636, 151, 11, 1),
(637, 152, 11, 1),
(638, 153, 11, 1),
(639, 154, 11, 1),
(640, 155, 11, 1),
(641, 156, 11, 1),
(642, 157, 11, 1),
(643, 158, 11, 1),
(644, 159, 11, 1),
(645, 160, 11, 1),
(646, 161, 11, 1),
(647, 162, 11, 1),
(648, 163, 11, 1),
(649, 164, 11, 1),
(650, 165, 11, 1),
(651, 166, 11, 1),
(652, 167, 11, 1),
(653, 168, 11, 1),
(654, 169, 11, 1),
(655, 170, 11, 1),
(656, 171, 11, 1),
(657, 172, 11, 1),
(658, 173, 11, 1),
(659, 174, 11, 1),
(660, 175, 11, 1),
(661, 176, 11, 1),
(662, 177, 11, 2),
(663, 178, 11, 1),
(664, 179, 11, 1),
(665, 180, 11, 1),
(666, 181, 11, 1),
(667, 182, 11, 2),
(668, 183, 11, 1),
(669, 184, 11, 1),
(670, 185, 11, 1),
(671, 186, 11, 1),
(672, 187, 11, 1),
(673, 188, 11, 1),
(674, 189, 11, 1),
(675, 190, 11, 1),
(676, 191, 11, 1),
(677, 192, 11, 1),
(678, 193, 11, 1),
(679, 194, 11, 1),
(680, 195, 11, 2),
(681, 196, 11, 1),
(682, 197, 11, 1),
(683, 198, 11, 1),
(684, 199, 11, 1),
(685, 200, 11, 1),
(686, 201, 11, 1),
(687, 202, 11, 1),
(688, 203, 11, 1),
(689, 204, 11, 1),
(690, 205, 11, 1),
(691, 206, 11, 1),
(692, 207, 11, 1),
(693, 208, 11, 1),
(694, 209, 11, 1),
(695, 210, 11, 2),
(696, 1, 12, 1),
(697, 2, 12, 1),
(698, 3, 12, 1),
(699, 4, 12, 1),
(700, 5, 12, 1),
(701, 6, 12, 1),
(702, 7, 12, 1),
(703, 8, 12, 1),
(704, 9, 12, 1),
(705, 10, 12, 1),
(706, 11, 12, 1),
(707, 12, 12, 1),
(708, 13, 12, 1),
(709, 14, 12, 1),
(710, 15, 12, 1),
(711, 16, 12, 1),
(712, 17, 12, 1),
(713, 18, 12, 1),
(714, 19, 12, 1),
(715, 20, 12, 1),
(716, 21, 12, 1),
(717, 22, 12, 1),
(718, 23, 12, 1),
(719, 24, 12, 1),
(720, 25, 12, 1),
(721, 26, 12, 1),
(722, 27, 12, 2),
(723, 28, 12, 1),
(724, 29, 12, 1),
(725, 30, 12, 1),
(726, 31, 12, 1),
(727, 33, 12, 1),
(728, 34, 12, 1),
(729, 35, 12, 1),
(730, 36, 12, 1),
(731, 37, 12, 1),
(732, 38, 12, 2),
(733, 39, 12, 1),
(734, 40, 12, 1),
(735, 41, 12, 1),
(736, 42, 12, 1),
(737, 43, 12, 1),
(738, 44, 12, 1),
(739, 45, 12, 1),
(740, 46, 12, 1),
(741, 47, 12, 1),
(742, 48, 12, 1),
(743, 49, 12, 1),
(744, 50, 12, 1),
(745, 51, 12, 1),
(746, 52, 12, 1),
(747, 53, 12, 1),
(748, 54, 12, 1),
(749, 55, 12, 1),
(750, 56, 12, 1),
(751, 57, 12, 1),
(752, 58, 12, 1),
(753, 59, 12, 1),
(754, 60, 12, 1),
(755, 61, 12, 1),
(756, 62, 12, 1),
(757, 63, 12, 1),
(758, 64, 12, 1),
(759, 65, 12, 1),
(760, 66, 12, 1),
(761, 67, 12, 2),
(762, 68, 12, 1),
(763, 69, 12, 1),
(764, 70, 12, 1),
(765, 72, 13, 1),
(766, 77, 13, 1),
(767, 80, 13, 1),
(768, 81, 13, 1),
(769, 82, 13, 1),
(770, 86, 13, 1),
(771, 94, 13, 1),
(772, 95, 13, 1),
(773, 99, 13, 1),
(774, 100, 13, 1),
(775, 103, 13, 1),
(776, 104, 13, 1),
(777, 105, 13, 1),
(778, 106, 13, 1),
(779, 113, 13, 1),
(780, 116, 13, 1),
(781, 120, 13, 1),
(782, 125, 13, 1),
(783, 128, 13, 1),
(784, 131, 13, 1),
(785, 133, 13, 1),
(786, 134, 13, 1),
(787, 81, 14, 1),
(788, 86, 14, 1),
(789, 107, 14, 1),
(790, 123, 14, 1),
(791, 128, 14, 1),
(792, 228, 15, 1),
(793, 271, 15, 1),
(794, 272, 15, 1),
(795, 275, 15, 1),
(796, 23, 16, 1),
(797, 55, 16, 1),
(798, 1, 17, 1),
(799, 2, 17, 2),
(800, 4, 17, 1),
(801, 5, 17, 1),
(802, 6, 17, 1),
(803, 7, 17, 1),
(804, 8, 17, 1),
(805, 9, 17, 1),
(806, 10, 17, 1),
(807, 11, 17, 1),
(808, 12, 17, 1),
(809, 13, 17, 1),
(810, 14, 17, 2),
(811, 15, 17, 1),
(812, 16, 17, 1),
(813, 17, 17, 1),
(814, 18, 17, 1),
(815, 19, 17, 1),
(816, 20, 17, 1),
(817, 21, 17, 1),
(818, 22, 17, 1),
(819, 23, 17, 1),
(820, 24, 17, 2),
(821, 26, 17, 1),
(822, 27, 17, 1),
(823, 28, 17, 1),
(824, 29, 17, 1),
(825, 30, 17, 1),
(826, 31, 17, 1),
(827, 32, 17, 1),
(828, 33, 17, 1),
(829, 34, 17, 1),
(830, 35, 17, 1),
(831, 36, 17, 1),
(832, 37, 17, 1),
(833, 38, 17, 1),
(834, 39, 17, 1),
(835, 40, 17, 1),
(836, 41, 17, 1),
(837, 42, 17, 1),
(838, 43, 17, 1),
(839, 44, 17, 1),
(840, 45, 17, 1),
(841, 46, 17, 1),
(842, 47, 17, 1),
(843, 48, 17, 1),
(844, 49, 17, 1),
(845, 50, 17, 2),
(846, 51, 17, 1),
(847, 52, 17, 1),
(848, 53, 17, 1),
(849, 54, 17, 1),
(850, 55, 17, 1),
(851, 57, 17, 1),
(852, 58, 17, 1),
(853, 59, 17, 2),
(854, 60, 17, 1),
(855, 61, 17, 1),
(856, 62, 17, 1),
(857, 63, 17, 1),
(858, 64, 17, 1),
(859, 65, 17, 1),
(860, 66, 17, 1),
(861, 67, 17, 2),
(862, 69, 17, 1),
(863, 71, 17, 1),
(864, 72, 17, 1),
(865, 73, 17, 1),
(866, 74, 17, 1),
(867, 75, 17, 1),
(868, 77, 17, 1),
(869, 78, 17, 1),
(870, 79, 17, 1),
(871, 80, 17, 1),
(872, 81, 17, 1),
(873, 83, 17, 1),
(874, 84, 17, 2),
(875, 87, 17, 1),
(876, 88, 17, 1),
(877, 89, 17, 1),
(878, 90, 17, 1),
(879, 91, 17, 1),
(880, 92, 17, 2),
(881, 93, 17, 1),
(882, 94, 17, 1),
(883, 95, 17, 1),
(884, 96, 17, 1),
(885, 99, 17, 1),
(886, 100, 17, 1),
(887, 101, 17, 1),
(888, 102, 17, 2),
(889, 103, 17, 1),
(890, 104, 17, 1),
(891, 105, 17, 1),
(892, 106, 17, 2),
(893, 107, 17, 2),
(894, 108, 17, 1),
(895, 111, 17, 1),
(896, 112, 17, 2),
(897, 113, 17, 3),
(898, 114, 17, 1),
(899, 115, 17, 2),
(900, 116, 17, 2),
(901, 117, 17, 1),
(902, 118, 17, 1),
(903, 119, 17, 1),
(904, 120, 17, 1),
(905, 123, 17, 2),
(906, 124, 17, 2),
(907, 125, 17, 2),
(908, 126, 17, 3),
(909, 127, 17, 1),
(910, 128, 17, 1),
(911, 129, 17, 2),
(912, 130, 17, 2),
(913, 131, 17, 1),
(914, 132, 17, 2),
(915, 135, 17, 1),
(916, 136, 17, 3),
(917, 137, 17, 2),
(918, 138, 17, 2),
(919, 139, 17, 3),
(920, 140, 17, 1),
(921, 141, 17, 1),
(922, 142, 17, 1),
(923, 143, 17, 3),
(924, 144, 17, 1),
(925, 147, 17, 1),
(926, 148, 17, 1),
(927, 149, 17, 1),
(928, 150, 17, 1),
(929, 151, 17, 2),
(930, 152, 17, 1),
(931, 153, 17, 1),
(932, 154, 17, 2),
(933, 155, 17, 1),
(934, 156, 17, 1),
(935, 159, 17, 1),
(936, 160, 17, 1),
(937, 161, 17, 1),
(938, 162, 17, 3),
(939, 163, 17, 2),
(940, 164, 17, 2),
(941, 165, 17, 1),
(942, 166, 17, 1),
(943, 167, 17, 2),
(944, 168, 17, 2),
(945, 1, 18, 1),
(946, 2, 18, 1),
(947, 3, 18, 1),
(948, 4, 18, 1),
(949, 5, 18, 3),
(950, 6, 18, 1),
(951, 7, 18, 1),
(952, 8, 18, 1),
(953, 9, 18, 1),
(954, 10, 18, 1),
(955, 11, 18, 1),
(956, 12, 18, 1),
(957, 13, 18, 1),
(958, 14, 18, 1),
(959, 15, 18, 1),
(960, 16, 18, 1),
(961, 17, 18, 1),
(962, 18, 18, 1),
(963, 19, 18, 1),
(964, 20, 18, 1),
(965, 21, 18, 1),
(966, 22, 18, 1),
(967, 24, 18, 2),
(968, 25, 18, 1),
(969, 26, 18, 1),
(970, 27, 18, 1),
(971, 28, 18, 1),
(972, 29, 18, 1),
(973, 30, 18, 1),
(974, 32, 18, 1),
(975, 33, 18, 1),
(976, 34, 18, 1),
(977, 35, 18, 1),
(978, 36, 18, 1),
(979, 37, 18, 1),
(980, 38, 18, 1),
(981, 39, 18, 2),
(982, 40, 18, 2),
(983, 41, 18, 1),
(984, 42, 18, 3),
(985, 43, 18, 1),
(986, 44, 18, 2),
(987, 45, 18, 2),
(988, 46, 18, 2),
(989, 47, 18, 1),
(990, 48, 18, 1),
(991, 49, 18, 2),
(992, 50, 18, 3),
(993, 51, 18, 2),
(994, 52, 18, 1),
(995, 53, 18, 1),
(996, 54, 18, 1),
(997, 55, 18, 1),
(998, 56, 18, 1),
(999, 59, 18, 2),
(1000, 60, 18, 2),
(1001, 63, 18, 1),
(1002, 64, 18, 1),
(1003, 66, 18, 1),
(1004, 67, 18, 1),
(1005, 68, 18, 1),
(1006, 70, 18, 1),
(1007, 71, 18, 1),
(1008, 72, 18, 1),
(1009, 73, 18, 3),
(1010, 74, 18, 1),
(1011, 75, 18, 1),
(1012, 76, 18, 1),
(1013, 77, 18, 1),
(1014, 78, 18, 1),
(1015, 79, 18, 1),
(1016, 80, 18, 1),
(1017, 81, 18, 1),
(1018, 82, 18, 1),
(1019, 83, 18, 1),
(1020, 84, 18, 1),
(1021, 85, 18, 3),
(1022, 86, 18, 2),
(1023, 87, 18, 2),
(1024, 88, 18, 1),
(1025, 89, 18, 1),
(1026, 90, 18, 2),
(1027, 91, 18, 1),
(1028, 92, 18, 1),
(1029, 93, 18, 1),
(1030, 94, 18, 1),
(1031, 95, 18, 1),
(1032, 96, 18, 1),
(1033, 97, 18, 1),
(1034, 98, 18, 1),
(1035, 99, 18, 1),
(1036, 100, 18, 1),
(1037, 1, 19, 1),
(1038, 2, 19, 1),
(1039, 3, 19, 1),
(1040, 4, 19, 1),
(1041, 5, 19, 2),
(1042, 8, 19, 1),
(1043, 9, 19, 1),
(1044, 10, 19, 2),
(1045, 11, 19, 1),
(1046, 12, 19, 1),
(1047, 13, 19, 1),
(1048, 14, 19, 1),
(1049, 15, 19, 1),
(1050, 16, 19, 1),
(1051, 17, 19, 1),
(1052, 18, 19, 1),
(1053, 19, 19, 1),
(1054, 20, 19, 1),
(1055, 21, 19, 1),
(1056, 22, 19, 1),
(1057, 24, 19, 1),
(1058, 25, 19, 1),
(1059, 26, 19, 1),
(1060, 27, 19, 1),
(1061, 29, 19, 1),
(1062, 30, 19, 1),
(1063, 32, 19, 1),
(1064, 33, 19, 1),
(1065, 36, 19, 1),
(1066, 37, 19, 1),
(1067, 38, 19, 1),
(1068, 39, 19, 1),
(1069, 41, 19, 1),
(1070, 42, 19, 1),
(1071, 43, 19, 1),
(1072, 44, 19, 1),
(1073, 45, 19, 1),
(1074, 46, 19, 1),
(1075, 47, 19, 1),
(1076, 48, 19, 1),
(1077, 49, 19, 1),
(1078, 50, 19, 1),
(1079, 51, 19, 1),
(1080, 52, 19, 1),
(1081, 53, 19, 1),
(1082, 54, 19, 1),
(1083, 55, 19, 1),
(1084, 56, 19, 1),
(1085, 57, 19, 1),
(1086, 58, 19, 1),
(1087, 59, 19, 1),
(1088, 60, 19, 1),
(1089, 61, 19, 1),
(1090, 62, 19, 1),
(1091, 63, 19, 1),
(1092, 64, 19, 1),
(1093, 65, 19, 1),
(1094, 66, 19, 1),
(1095, 67, 19, 1),
(1096, 68, 19, 2),
(1097, 69, 19, 1),
(1098, 70, 19, 2),
(1099, 1, 20, 1),
(1100, 2, 20, 1),
(1101, 5, 20, 1),
(1102, 8, 20, 1),
(1103, 10, 20, 1),
(1104, 11, 20, 1),
(1105, 20, 20, 1),
(1106, 21, 20, 1),
(1107, 45, 20, 1),
(1108, 53, 20, 1),
(1109, 55, 20, 1),
(1110, 56, 20, 1),
(1111, 58, 20, 1),
(1112, 60, 20, 1),
(1113, 67, 20, 1),
(1114, 68, 20, 1),
(1115, 7, 21, 1),
(1116, 30, 22, 1),
(1117, 1, 23, 3),
(1118, 2, 23, 1),
(1119, 3, 23, 1),
(1120, 4, 23, 1),
(1121, 5, 23, 1),
(1122, 6, 23, 1),
(1123, 7, 23, 1),
(1124, 8, 23, 1),
(1125, 9, 23, 1),
(1126, 10, 23, 1),
(1127, 11, 23, 1),
(1128, 12, 23, 1),
(1129, 13, 23, 1),
(1130, 14, 23, 1),
(1131, 15, 23, 1),
(1132, 16, 23, 1),
(1133, 17, 23, 1),
(1134, 18, 23, 1),
(1135, 19, 23, 1),
(1136, 20, 23, 1),
(1137, 21, 23, 1),
(1138, 22, 23, 1),
(1139, 23, 23, 1),
(1140, 24, 23, 2),
(1141, 25, 23, 1),
(1142, 26, 23, 1),
(1143, 27, 23, 2),
(1144, 28, 23, 2),
(1145, 29, 23, 1),
(1146, 30, 23, 1),
(1147, 31, 23, 1),
(1148, 32, 23, 1),
(1149, 33, 23, 1),
(1150, 34, 23, 1),
(1151, 35, 23, 1),
(1152, 36, 23, 1),
(1153, 37, 23, 2),
(1154, 38, 23, 1),
(1155, 39, 23, 1),
(1156, 40, 23, 1),
(1157, 41, 23, 1),
(1158, 42, 23, 1),
(1159, 43, 23, 1),
(1160, 44, 23, 1),
(1161, 45, 23, 1),
(1162, 46, 23, 1),
(1163, 47, 23, 1),
(1164, 48, 23, 1),
(1165, 49, 23, 2),
(1166, 50, 23, 1),
(1167, 51, 23, 2),
(1168, 52, 23, 2),
(1169, 53, 23, 2),
(1170, 54, 23, 1),
(1171, 55, 23, 2),
(1172, 56, 23, 1),
(1173, 57, 23, 1),
(1174, 58, 23, 1),
(1175, 59, 23, 1),
(1176, 60, 23, 2),
(1177, 1, 24, 2),
(1178, 2, 24, 1),
(1179, 3, 24, 1),
(1180, 4, 24, 1),
(1181, 5, 24, 1),
(1182, 6, 24, 2),
(1183, 7, 24, 1),
(1184, 8, 24, 1),
(1185, 9, 24, 1),
(1186, 10, 24, 1),
(1187, 11, 24, 1),
(1188, 12, 24, 1),
(1189, 13, 24, 1),
(1190, 14, 24, 1),
(1191, 15, 24, 2),
(1192, 16, 24, 1),
(1193, 17, 24, 1),
(1194, 18, 24, 2),
(1195, 19, 24, 1),
(1196, 21, 24, 1),
(1197, 22, 24, 1),
(1198, 23, 24, 1),
(1199, 24, 24, 1),
(1200, 25, 24, 2),
(1201, 26, 24, 1),
(1202, 27, 24, 1),
(1203, 28, 24, 1),
(1204, 29, 24, 2),
(1205, 30, 24, 1),
(1206, 31, 24, 1),
(1207, 32, 24, 1),
(1208, 33, 24, 1),
(1209, 34, 24, 1),
(1210, 35, 24, 1),
(1211, 36, 24, 1),
(1212, 37, 24, 1),
(1213, 38, 24, 2),
(1214, 39, 24, 2),
(1215, 40, 24, 1),
(1216, 41, 24, 1),
(1217, 42, 24, 1),
(1218, 43, 24, 1),
(1219, 44, 24, 1),
(1220, 45, 24, 1),
(1221, 46, 24, 1),
(1222, 47, 24, 1),
(1223, 48, 24, 2),
(1224, 49, 24, 1),
(1225, 50, 24, 2),
(1226, 51, 24, 1),
(1227, 52, 24, 1),
(1228, 53, 24, 1),
(1229, 54, 24, 1),
(1230, 55, 24, 1),
(1231, 56, 24, 1),
(1232, 57, 24, 1),
(1233, 58, 24, 2),
(1234, 59, 24, 1),
(1235, 60, 24, 2),
(1236, 61, 24, 1),
(1237, 62, 24, 2),
(1238, 63, 24, 1),
(1239, 64, 24, 2),
(1240, 65, 24, 1),
(1241, 66, 24, 1),
(1242, 67, 24, 1),
(1243, 68, 24, 1),
(1244, 69, 24, 1),
(1245, 70, 24, 1),
(1246, 71, 24, 1),
(1247, 72, 24, 1),
(1248, 73, 24, 2),
(1249, 74, 24, 1),
(1250, 75, 24, 2),
(1251, 76, 24, 1),
(1252, 77, 24, 2),
(1253, 78, 24, 2),
(1254, 79, 24, 2),
(1255, 80, 24, 1),
(1256, 81, 24, 2),
(1257, 82, 24, 1),
(1258, 84, 24, 2),
(1259, 85, 24, 1),
(1260, 86, 24, 1),
(1261, 87, 24, 1),
(1262, 89, 24, 2),
(1263, 90, 24, 1),
(1264, 33, 25, 1),
(1265, 36, 25, 1),
(1266, 37, 25, 1),
(1267, 38, 25, 1),
(1268, 80, 25, 1),
(1269, 15, 26, 1),
(1270, 5, 27, 1),
(1271, 7, 28, 1),
(1272, 13, 28, 1),
(1273, 16, 28, 1),
(1274, 19, 28, 1),
(1275, 23, 28, 1),
(1276, 36, 28, 1),
(1277, 1, 29, 1),
(1278, 2, 29, 1),
(1279, 3, 29, 1),
(1280, 4, 29, 1),
(1281, 5, 29, 1),
(1282, 6, 29, 2),
(1283, 7, 29, 2),
(1284, 8, 29, 2),
(1285, 9, 29, 2),
(1286, 10, 29, 2),
(1287, 11, 29, 2),
(1288, 12, 29, 3),
(1289, 13, 29, 2),
(1290, 14, 29, 2),
(1291, 15, 29, 3),
(1292, 16, 29, 1),
(1293, 17, 29, 2),
(1294, 18, 29, 3),
(1295, 19, 29, 3),
(1296, 20, 29, 1),
(1297, 21, 29, 2),
(1298, 22, 29, 1),
(1299, 23, 29, 2),
(1300, 24, 29, 1),
(1301, 25, 29, 1),
(1302, 26, 29, 2),
(1303, 27, 29, 1),
(1304, 28, 29, 1),
(1305, 29, 29, 1),
(1306, 30, 29, 2),
(1307, 31, 29, 2),
(1308, 32, 29, 2),
(1309, 33, 29, 1),
(1310, 34, 29, 1),
(1311, 35, 29, 2),
(1312, 36, 29, 1),
(1313, 37, 29, 1),
(1314, 38, 29, 1),
(1315, 39, 29, 2),
(1316, 40, 29, 1),
(1317, 42, 29, 1),
(1318, 44, 29, 1),
(1319, 45, 29, 1),
(1320, 46, 29, 2),
(1321, 48, 29, 1),
(1322, 49, 29, 1),
(1323, 50, 29, 2),
(1324, 51, 29, 1),
(1325, 56, 29, 1),
(1326, 59, 29, 1),
(1327, 61, 29, 1),
(1328, 63, 29, 2),
(1329, 64, 29, 1),
(1330, 65, 29, 1),
(1331, 66, 29, 2),
(1332, 67, 29, 1),
(1333, 68, 29, 1),
(1334, 69, 29, 1),
(1335, 48, 30, 1),
(1336, 55, 30, 1),
(1337, 65, 30, 1),
(1338, 11, 31, 1),
(1339, 39, 31, 1),
(1340, 45, 31, 1),
(1341, 35, 32, 1),
(1342, 38, 32, 1),
(1343, 42, 32, 1),
(1344, 10, 33, 1),
(1345, 17, 33, 1),
(1346, 22, 33, 1),
(1347, 43, 33, 1),
(1348, 98, 33, 1),
(1349, 89, 34, 1),
(1350, 3, 35, 1),
(1351, 17, 35, 1),
(1352, 22, 35, 1),
(1353, 26, 35, 1),
(1354, 30, 35, 1),
(1355, 39, 35, 1),
(1356, 41, 35, 1),
(1357, 43, 35, 1),
(1358, 47, 35, 1),
(1359, 49, 35, 1),
(1360, 69, 35, 1),
(1361, 91, 35, 1),
(1362, 92, 35, 1),
(1363, 98, 35, 1),
(1364, 110, 36, 1),
(1365, 116, 36, 1),
(1366, 118, 36, 1),
(1367, 120, 36, 1),
(1368, 121, 36, 1),
(1369, 123, 36, 1),
(1370, 141, 36, 2),
(1371, 145, 36, 2),
(1372, 159, 36, 1),
(1373, 170, 36, 1),
(1374, 174, 36, 1),
(1375, 186, 36, 1),
(1376, 60, 37, 1),
(1377, 88, 37, 1),
(1378, 89, 37, 1),
(1379, 18, 38, 1),
(1380, 53, 38, 1),
(1381, 60, 38, 1),
(1382, 68, 38, 1),
(1383, 117, 39, 1),
(1384, 142, 40, 1),
(1385, 143, 40, 1),
(1386, 144, 40, 1),
(1387, 145, 40, 1),
(1388, 146, 40, 1),
(1389, 147, 40, 1),
(1390, 148, 40, 1),
(1391, 150, 40, 1),
(1392, 151, 40, 1),
(1393, 152, 40, 1),
(1394, 154, 40, 1),
(1395, 155, 40, 1),
(1396, 156, 40, 1),
(1397, 157, 40, 1),
(1398, 158, 40, 3),
(1399, 159, 40, 1),
(1400, 160, 40, 2),
(1401, 162, 40, 1),
(1402, 163, 40, 1),
(1403, 164, 40, 1),
(1404, 165, 40, 1),
(1405, 166, 40, 1),
(1406, 167, 40, 2),
(1407, 168, 40, 1),
(1408, 169, 40, 1),
(1409, 170, 40, 1),
(1410, 171, 40, 1),
(1411, 173, 40, 1),
(1412, 175, 40, 1),
(1413, 176, 40, 1),
(1414, 177, 40, 1),
(1415, 178, 40, 1),
(1416, 179, 40, 2),
(1417, 181, 40, 1),
(1418, 182, 40, 1),
(1419, 188, 40, 1),
(1420, 189, 40, 1),
(1421, 191, 40, 1),
(1422, 192, 40, 2),
(1423, 193, 40, 1),
(1424, 194, 40, 1),
(1425, 195, 40, 1),
(1426, 198, 40, 1),
(1427, 199, 40, 1),
(1428, 202, 40, 1),
(1429, 203, 40, 1),
(1430, 205, 40, 1),
(1431, 206, 40, 1),
(1432, 209, 40, 1),
(1433, 210, 40, 1),
(1434, 213, 40, 1),
(1435, 216, 40, 1),
(1436, 54, 41, 1),
(1437, 77, 41, 1),
(1438, 13, 42, 1),
(1439, 6, 43, 1),
(1440, 14, 43, 1),
(1441, 39, 43, 2),
(1442, 50, 43, 1),
(1443, 71, 43, 1),
(1444, 72, 43, 1),
(1445, 74, 43, 1),
(1446, 86, 43, 1),
(1447, 371, 44, 1),
(1448, 438, 45, 1),
(1449, 590, 46, 1),
(1450, 609, 46, 1),
(1451, 692, 47, 1),
(1452, 701, 48, 1),
(1453, 702, 48, 1),
(1454, 703, 48, 1),
(1455, 704, 48, 1),
(1456, 706, 48, 1),
(1457, 707, 48, 1),
(1458, 710, 48, 1),
(1459, 711, 48, 1),
(1460, 712, 48, 1),
(1461, 713, 48, 1),
(1462, 714, 48, 1),
(1463, 715, 48, 1),
(1464, 716, 48, 1),
(1465, 717, 48, 1),
(1466, 718, 48, 1),
(1467, 719, 48, 1),
(1468, 720, 48, 1),
(1469, 721, 48, 1),
(1470, 722, 48, 1),
(1471, 723, 48, 1),
(1472, 724, 48, 1),
(1473, 725, 48, 1),
(1474, 726, 48, 1),
(1475, 727, 48, 1),
(1476, 728, 48, 1),
(1477, 729, 48, 1),
(1478, 730, 48, 1),
(1479, 731, 48, 1),
(1480, 732, 48, 1),
(1481, 733, 48, 1),
(1482, 734, 48, 1),
(1483, 735, 48, 1),
(1484, 736, 48, 1),
(1485, 737, 48, 1),
(1486, 738, 48, 1),
(1487, 739, 48, 1),
(1488, 741, 48, 1),
(1489, 742, 48, 1),
(1490, 743, 48, 1),
(1491, 744, 48, 1),
(1492, 745, 48, 1),
(1493, 747, 48, 2),
(1494, 748, 48, 2),
(1495, 749, 48, 1),
(1496, 750, 48, 2),
(1497, 751, 48, 1),
(1498, 752, 48, 1),
(1499, 753, 48, 1),
(1500, 754, 48, 1),
(1501, 755, 48, 1),
(1502, 756, 48, 1),
(1503, 757, 48, 1),
(1504, 758, 48, 1),
(1505, 759, 48, 1),
(1506, 760, 48, 1),
(1507, 761, 48, 1),
(1508, 762, 48, 1),
(1509, 763, 48, 1),
(1510, 764, 48, 1),
(1511, 765, 48, 1),
(1512, 766, 48, 1),
(1513, 767, 48, 2),
(1514, 768, 48, 1),
(1515, 769, 48, 1),
(1516, 770, 48, 1),
(1517, 774, 49, 1),
(1518, 779, 49, 1),
(1519, 789, 49, 1),
(1520, 812, 49, 1),
(1521, 825, 49, 1),
(1522, 839, 49, 1),
(1523, 867, 49, 1),
(1524, 22, 50, 1),
(1525, 12, 51, 1),
(1526, 42, 51, 1),
(1527, 44, 51, 1),
(1528, 49, 51, 1),
(1529, 23, 52, 1),
(1530, 30, 53, 1),
(1531, 39, 54, 1),
(1532, 57, 54, 1),
(1533, 125, 55, 1),
(1534, 142, 55, 1),
(1535, 143, 55, 1),
(1536, 145, 55, 1),
(1537, 159, 55, 1),
(1538, 55, 56, 1),
(1539, 65, 56, 1),
(1540, 68, 56, 1),
(1541, 72, 56, 1),
(1542, 3, 57, 1),
(1543, 4, 57, 4),
(1544, 5, 57, 1),
(1545, 6, 57, 4),
(1546, 7, 57, 1),
(1547, 8, 57, 2),
(1548, 9, 57, 4),
(1549, 10, 57, 5),
(1550, 1, 58, 1),
(1551, 5, 58, 2),
(1552, 6, 58, 1),
(1553, 21, 58, 1),
(1554, 22, 58, 1),
(1555, 24, 58, 2),
(1556, 25, 58, 1),
(1557, 26, 58, 1),
(1558, 27, 58, 1),
(1559, 28, 58, 1),
(1560, 48, 58, 1),
(1561, 49, 58, 1),
(1562, 50, 58, 2),
(1563, 52, 58, 1),
(1564, 54, 58, 1),
(1565, 57, 58, 1),
(1566, 58, 58, 2),
(1567, 77, 58, 1),
(1568, 82, 58, 1),
(1569, 1, 59, 1),
(1570, 2, 59, 1),
(1571, 3, 59, 1),
(1572, 4, 59, 1),
(1573, 5, 59, 1),
(1574, 6, 59, 1),
(1575, 7, 59, 1),
(1576, 8, 59, 1),
(1577, 9, 59, 1),
(1578, 10, 59, 1),
(1579, 11, 59, 1),
(1580, 12, 59, 1),
(1581, 13, 59, 1),
(1582, 14, 59, 1),
(1583, 15, 59, 1),
(1584, 16, 59, 1),
(1585, 17, 59, 1),
(1586, 18, 59, 1),
(1587, 19, 59, 1),
(1588, 20, 59, 1),
(1589, 21, 59, 1),
(1590, 22, 59, 1),
(1591, 23, 59, 1),
(1592, 24, 59, 1),
(1593, 25, 59, 1),
(1594, 26, 59, 1),
(1595, 27, 59, 1),
(1596, 28, 59, 1),
(1597, 29, 59, 1),
(1598, 30, 59, 1),
(1599, 31, 59, 1),
(1600, 32, 59, 1),
(1601, 33, 59, 1),
(1602, 34, 59, 1),
(1603, 35, 59, 1),
(1604, 36, 59, 1),
(1605, 37, 59, 1),
(1606, 38, 59, 1),
(1607, 39, 59, 1),
(1608, 40, 59, 1),
(1609, 42, 59, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itemsdescription`
--

CREATE TABLE IF NOT EXISTS `itemsdescription` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `description` varchar(50) DEFAULT NULL COMMENT '�������� �� �������, ������������ ��� ������...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `itemsdescription`
--

INSERT INTO `itemsdescription` (`id`, `item_id`, `description`) VALUES
(1, 42, '*'),
(2, 135, '*'),
(3, 189, '*'),
(4, 414, '*'),
(5, 598, '��������� ����'),
(6, 757, 'c'),
(7, 791, 'Peugeot 20'),
(8, 795, 'Sport Elise'),
(9, 797, 'Audi S5 cabriolet 1968'),
(10, 940, '*'),
(11, 984, '*'),
(12, 1041, '*'),
(13, 1160, '*'),
(14, 1208, 'Guattro'),
(15, 1268, 'nissan200SX'),
(16, 1269, 'Toyota Celica 200 GTR'),
(17, 1270, '����� ������ /������� �� �����������'),
(18, 1333, '�������� ������ ��� ����������'),
(19, 1336, 'dArtagnan'),
(20, 1340, 'Simon Le Bon'),
(21, 1343, 'Dil Baligi'),
(22, 1348, 'Kirmizi Gagali Hornbill'),
(23, 1371, '*'),
(24, 1438, 'Bon Jovi'),
(25, 1439, '*'),
(26, 1478, '*'),
(27, 1524, 'Porsche 928'),
(28, 1528, '������ ����� ��� �����������'),
(29, 1530, 'Zerrin Ozer'),
(30, 1537, '�������� ������ � ����� 158'),
(31, 1566, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) DEFAULT NULL COMMENT '�����: ������, �����',
  `parentCategory` int(2) unsigned NOT NULL COMMENT '�����, ��-���...',
  `numbersFromTo` varchar(8) DEFAULT NULL COMMENT '101-200 ��������',
  PRIMARY KEY (`id`),
  KEY `parentCategory` (`parentCategory`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `label`, `parentCategory`, `numbersFromTo`) VALUES
(1, 'rare[1-50]', 1, '1-50'),
(2, '[51-120]', 1, '51-120'),
(3, '[121-190]', 1, '121-190'),
(4, '[191-260]', 1, '191-260'),
(5, 'thick&thin[261-330]', 1, '261-330'),
(6, 'super[331-400]', 1, '331-400'),
(7, 'super[401-470]', 1, '401-470'),
(8, 'super[471-540]', 1, '471-540'),
(9, 'blue&violet[1-70]', 2, '1-70'),
(10, 'blue&violet[71-140]', 2, '71-140'),
(11, 'blue&violet[141-210]', 2, '141-210'),
(12, 'with&without classic[1-70]', 3, '1-70'),
(13, 'with&without classic[71-140]', 3, '71-140'),
(14, '[71-140]', 4, '71-140'),
(15, '[211-280]', 5, '211-280'),
(16, '[1-160]', 6, '1-160'),
(17, 'cars[1-168]', 7, '1-168'),
(18, '[1-100]', 8, '1-100'),
(19, 'left aligned text[1-70]', 9, '1-70'),
(20, 'center aligned text[1-70]', 9, '1-70'),
(21, 'Love is...black hearts.[1-102]', 10, '1-102'),
(22, 'turkish Love is...[1-54]', 11, '1-54'),
(23, '1 square[1-60]', 12, '1-60'),
(24, '2 rectangle white[1-90]', 12, '1-90'),
(25, '3 yellow with b[1-90]', 12, '1-90'),
(26, 'big white[1-70]', 12, '1-70'),
(27, 'sport[1-99]', 12, '1-99'),
(28, '1990[1-40]', 13, '1-40'),
(29, 'big[1-70]', 14, '1-70'),
(30, 'small[1-70]', 14, '1-70'),
(31, 'singers[unknown]', 15, 'unknown'),
(32, 'Aquatic Life[1-97]', 16, '1-97'),
(33, 'Animals/�������[1-70]', 16, '1-70'),
(34, '3 friends red[1-96]', 16, '1-96'),
(35, '3-friends[1-100]', 16, '1-100'),
(36, 'not known[unknown]', 16, 'unknown'),
(37, 'Science Fiction[1-96]', 16, '1-96'),
(38, 'actors[1-70]', 17, '1-70'),
(39, '[71-140]', 17, '71-140'),
(40, '[141-220]', 17, '141-220'),
(41, 'actors[1-100]', 17, '1-100'),
(42, 'blue minti[1-99]', 17, '1-99'),
(43, 'black italic[1-100]', 18, '1-100'),
(44, '[351-420]', 19, '351-420'),
(45, '[421-490]', 19, '421-490'),
(46, '[561-630]', 19, '561-630'),
(47, '[631-700]', 19, '631-700'),
(48, '[701-770]', 19, '701-770'),
(49, '[771-870]', 19, '771-870'),
(50, '[unknown]', 20, 'unknown'),
(51, '[1-54]', 21, '1-54'),
(52, '[unknown]', 22, 'unknown'),
(53, '[unknown]', 23, 'unknown'),
(54, '[1-80]', 24, '1-80'),
(55, '[81-160]', 24, '81-160'),
(56, '[]', 25, ''),
(57, '[]', 26, ''),
(58, '[1-100]', 27, '1-100'),
(59, '[1-42]', 28, '1-42');

-- --------------------------------------------------------

--
-- Table structure for table `typeofcollection`
--

CREATE TABLE IF NOT EXISTS `typeofcollection` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL COMMENT '��������, ��������, �����...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='��������� ���� �� ����������' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `typeofcollection`
--

INSERT INTO `typeofcollection` (`id`, `type`) VALUES
(1, '�������� �� �����'),
(2, '��������');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
