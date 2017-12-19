/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : entre_amigos

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-10-11 10:22:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cheques
-- ----------------------------
DROP TABLE IF EXISTS `cheques`;
CREATE TABLE `cheques` (
  `Pk_Id_Cheque` int(11) NOT NULL AUTO_INCREMENT,
  `Clave` varchar(50) DEFAULT NULL,
  `Codigo_Asesor_Borrar` varchar(50) DEFAULT NULL,
  `Fecha` varchar(50) DEFAULT NULL,
  `Codigo_Cheque` varchar(25) DEFAULT NULL,
  `Fk_Id_Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Cheque`),
  KEY `Fk_Id_Usuario` (`Fk_Id_Usuario`),
  CONSTRAINT `cheques_ibfk_1` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuarios` (`Pk_Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cheques
-- ----------------------------

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `Pk_Id_Compra` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(175) DEFAULT NULL,
  `Email` varchar(175) DEFAULT NULL,
  `Codigo_Cheque` varchar(75) DEFAULT NULL,
  `Numero_Cheque` varchar(75) DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pk_Id_Compra`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of compras
-- ----------------------------
INSERT INTO `compras` VALUES ('2', 'YarcevPrueba', 'johnarleycano@hotmail.com', 'ML333', 'EC555', '2015-04-20 19:20:00');
INSERT INTO `compras` VALUES ('3', 'John', 'johnarleycano@hotmail.com', 'ML574', 'EC555', '2015-04-20 19:21:53');
INSERT INTO `compras` VALUES ('4', 'yarce pruebA 2', 'johnarleycano@hotmail.com', 'ML032411', 'EC025416', '2015-04-20 19:30:26');
INSERT INTO `compras` VALUES ('5', 'yarce tres', 'yarceochoa@hotmail.com', 'ML5437', 'EC7890', '2015-04-21 08:29:20');
INSERT INTO `compras` VALUES ('6', 'maria pulgarin ospina', 'p.samaro42@gmail.com', 'ML032412', 'EC025416', '2015-05-08 07:49:02');
INSERT INTO `compras` VALUES ('7', 'Johana Araque', 'johaaud4@hotmail.com', 'ML4567', 'EC219879', '2015-05-23 09:16:08');
INSERT INTO `compras` VALUES ('8', 'Andrés  prieto', 'masterprieto07@Hotmail.com', 'ML4567', 'EC3443', '2015-06-07 17:26:30');
INSERT INTO `compras` VALUES ('9', 'John', 'johnarleycano@hotmail.com', 'ML123', 'EC1234', '2015-06-17 10:37:47');
INSERT INTO `compras` VALUES ('10', 'John', 'johnarleycano@hotmail.com', 'ML123', 'EC123', '2015-06-17 10:39:21');
INSERT INTO `compras` VALUES ('11', 'John', 'johnarleycano@hotmail.com', 'ML123', 'EC123', '2015-06-17 10:40:43');
INSERT INTO `compras` VALUES ('12', 'yarce 8a', 'yarceochoa@hotmail.com', 'ML4567', 'EC5687', '2015-06-17 23:58:42');
INSERT INTO `compras` VALUES ('13', 'yarce 2', 'yarceochoa@hotmail.com', 'ML7685', 'EC8745', '2015-06-18 10:17:59');
INSERT INTO `compras` VALUES ('14', 'John Arley Cano Salinas', 'johnarleycano@hotmail.com', 'MLD', 'ECSD', '2015-06-18 16:24:51');
INSERT INTO `compras` VALUES ('15', 'yarce tres', 'yarceochoa@hotmail.com', 'ML7895', 'EC8723', '2015-06-18 18:18:22');
INSERT INTO `compras` VALUES ('16', 'yarce cinco', 'yarceochoa@hotmail.com', 'ML7645', 'EC0914', '2015-06-19 22:52:43');
INSERT INTO `compras` VALUES ('17', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5624', 'EC1685', '2015-06-25 11:37:01');
INSERT INTO `compras` VALUES ('18', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5624', 'EC1685', '2015-06-25 11:37:06');
INSERT INTO `compras` VALUES ('19', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5624', 'EC1685', '2015-06-25 11:37:08');
INSERT INTO `compras` VALUES ('20', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5624', 'EC1685', '2015-06-25 11:37:09');
INSERT INTO `compras` VALUES ('21', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5624', 'EC1685', '2015-06-25 11:37:24');
INSERT INTO `compras` VALUES ('22', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5610', 'EC2430', '2015-06-25 11:38:08');
INSERT INTO `compras` VALUES ('23', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5610', 'EC2430', '2015-06-25 11:38:10');
INSERT INTO `compras` VALUES ('24', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5610', 'EC2430', '2015-06-25 11:38:13');
INSERT INTO `compras` VALUES ('25', 'liceth caro', 'liceth-caro25@hotmail.com', 'ML5632', 'EC1419', '2015-06-25 12:21:24');
INSERT INTO `compras` VALUES ('26', 'yarce ochoa', 'yarceochoa@hotmail.com', 'ML5698', 'EC7624', '2015-06-25 21:25:57');
INSERT INTO `compras` VALUES ('27', 'Jeisson ochoa Montoya', 'Checho46@gmail.com', 'ML5426', 'EC1742', '2015-06-27 06:27:14');
INSERT INTO `compras` VALUES ('28', 'melquiades durango', 'melquiades60@outlook.com', 'ML5678', 'EC8934', '2015-06-27 19:01:30');
INSERT INTO `compras` VALUES ('29', 'sebastian', 'sebasarangovanegas@hotmail.com', 'ML0826', 'EC2107', '2015-06-29 17:52:38');
INSERT INTO `compras` VALUES ('30', 'hernan perez', 'info@artescyp.com', 'ML2436', 'EC6846', '2015-06-30 16:16:38');
INSERT INTO `compras` VALUES ('31', 'NATALIA HERNANDEZ MAZO', 'kultor1994@hotmail.com', 'ML0721', 'EC3647', '2015-07-07 15:15:33');

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `Pk_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(175) NOT NULL,
  PRIMARY KEY (`Pk_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES ('1', '91', 'AMAZONAS');
INSERT INTO `departamentos` VALUES ('2', '5', 'ANTIOQUIA');
INSERT INTO `departamentos` VALUES ('3', '81', 'ARAUCA');
INSERT INTO `departamentos` VALUES ('4', '8', 'ATLÁNTICO');
INSERT INTO `departamentos` VALUES ('6', '13', 'BOLÍVAR');
INSERT INTO `departamentos` VALUES ('7', '15', 'BOYACÁ');
INSERT INTO `departamentos` VALUES ('8', '17', 'CALDAS');
INSERT INTO `departamentos` VALUES ('9', '18', 'CAQUETÁ');
INSERT INTO `departamentos` VALUES ('10', '85', 'CASANARE');
INSERT INTO `departamentos` VALUES ('11', '19', 'CAUCA');
INSERT INTO `departamentos` VALUES ('12', '20', 'CESAR');
INSERT INTO `departamentos` VALUES ('13', '27', 'CHOCÓ');
INSERT INTO `departamentos` VALUES ('14', '23', 'CÓRDOBA');
INSERT INTO `departamentos` VALUES ('15', '25', 'CUNDINAMARCA');
INSERT INTO `departamentos` VALUES ('16', '94', 'GUAINÍA');
INSERT INTO `departamentos` VALUES ('17', '95', 'GUAVIARE');
INSERT INTO `departamentos` VALUES ('18', '41', 'HUILA');
INSERT INTO `departamentos` VALUES ('19', '44', 'LA GUAJIRA');
INSERT INTO `departamentos` VALUES ('20', '47', 'MAGDALENA');
INSERT INTO `departamentos` VALUES ('21', '50', 'META');
INSERT INTO `departamentos` VALUES ('22', '52', 'NARIÑO');
INSERT INTO `departamentos` VALUES ('23', '54', 'NORTE DE SANTANDER');
INSERT INTO `departamentos` VALUES ('24', '86', 'PUTUMAYO');
INSERT INTO `departamentos` VALUES ('25', '63', 'QUINDIO');
INSERT INTO `departamentos` VALUES ('26', '66', 'RISARALDA');
INSERT INTO `departamentos` VALUES ('27', '68', 'SANTANDER');
INSERT INTO `departamentos` VALUES ('28', '70', 'SUCRE');
INSERT INTO `departamentos` VALUES ('29', '73', 'TOLIMA');
INSERT INTO `departamentos` VALUES ('30', '76', 'Valle del Cauca');
INSERT INTO `departamentos` VALUES ('31', '97', 'Vaupés');
INSERT INTO `departamentos` VALUES ('32', '99', 'Vichada');

-- ----------------------------
-- Table structure for municipios
-- ----------------------------
DROP TABLE IF EXISTS `municipios`;
CREATE TABLE `municipios` (
  `Pk_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) DEFAULT NULL,
  `Fk_Id_Departamento` int(11) NOT NULL,
  `Nombre` varchar(175) NOT NULL,
  PRIMARY KEY (`Pk_Id`),
  KEY `Fk_Id_Departamento` (`Fk_Id_Departamento`),
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`Fk_Id_Departamento`) REFERENCES `departamentos` (`Pk_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of municipios
-- ----------------------------
INSERT INTO `municipios` VALUES ('33', '91001', '1', 'LETICIA');
INSERT INTO `municipios` VALUES ('34', '91263', '1', 'EL ENCANTO');
INSERT INTO `municipios` VALUES ('35', '91405', '1', 'LA CHORRERA');
INSERT INTO `municipios` VALUES ('36', '91407', '1', 'LA PEDRERA');
INSERT INTO `municipios` VALUES ('37', '91460', '1', 'MIRITÍ - PARANÁ');
INSERT INTO `municipios` VALUES ('38', '91530', '1', 'PUERTO ALEGRÍA');
INSERT INTO `municipios` VALUES ('39', '91536', '1', 'PUERTO ARICA');
INSERT INTO `municipios` VALUES ('40', '91540', '1', 'PUERTO NARIÑO');
INSERT INTO `municipios` VALUES ('41', '91798', '1', 'TARAPACÁ');
INSERT INTO `municipios` VALUES ('42', '5001', '2', 'MEDELLÍN');
INSERT INTO `municipios` VALUES ('43', '5002', '2', 'Abejorral');
INSERT INTO `municipios` VALUES ('44', '5004', '2', 'ABRIAQUÍ');
INSERT INTO `municipios` VALUES ('45', '5021', '2', 'ALEJANDRÍA');
INSERT INTO `municipios` VALUES ('46', '5030', '2', 'AMAGÁ');
INSERT INTO `municipios` VALUES ('47', '5031', '2', 'AMALFI');
INSERT INTO `municipios` VALUES ('48', '5034', '2', 'ANDES');
INSERT INTO `municipios` VALUES ('49', '5036', '2', 'ANGELÓPOLIS');
INSERT INTO `municipios` VALUES ('50', '5038', '2', 'ANGOSTURA');
INSERT INTO `municipios` VALUES ('51', '5040', '2', 'ANORÍ');
INSERT INTO `municipios` VALUES ('52', '5042', '2', 'SANTA FÉ DE ANTIOQUIA');
INSERT INTO `municipios` VALUES ('53', '5044', '2', 'ANZÁ');
INSERT INTO `municipios` VALUES ('54', '5045', '2', 'APARTADÓ');
INSERT INTO `municipios` VALUES ('55', '5051', '2', 'ARBOLETES');
INSERT INTO `municipios` VALUES ('56', '5055', '2', 'ARGELIA');
INSERT INTO `municipios` VALUES ('57', '5059', '2', 'ARMENIA');
INSERT INTO `municipios` VALUES ('58', '5079', '2', 'BARBOSA');
INSERT INTO `municipios` VALUES ('59', '5086', '2', 'BELMIRA');
INSERT INTO `municipios` VALUES ('60', '5088', '2', 'BELLO');
INSERT INTO `municipios` VALUES ('61', '5091', '2', 'BETANIA');
INSERT INTO `municipios` VALUES ('62', '5093', '2', 'BETULIA');
INSERT INTO `municipios` VALUES ('63', '5101', '2', 'CIUDAD BOLÍVAR');
INSERT INTO `municipios` VALUES ('64', '5107', '2', 'BRICEÑO');
INSERT INTO `municipios` VALUES ('65', '5113', '2', 'BURITICÁ');
INSERT INTO `municipios` VALUES ('66', '5120', '2', 'CÁCERES');
INSERT INTO `municipios` VALUES ('67', '5125', '2', 'CAICEDO');
INSERT INTO `municipios` VALUES ('68', '5129', '2', 'CALDAS');
INSERT INTO `municipios` VALUES ('69', '5134', '2', 'CAMPAMENTO');
INSERT INTO `municipios` VALUES ('70', '5138', '2', 'CAÑASGORDAS');
INSERT INTO `municipios` VALUES ('71', '5142', '2', 'CARACOLÍ');
INSERT INTO `municipios` VALUES ('72', '5145', '2', 'CARAMANTA');
INSERT INTO `municipios` VALUES ('73', '5147', '2', 'CAREPA');
INSERT INTO `municipios` VALUES ('74', '5148', '2', 'EL CARMEN DE VIBORAL');
INSERT INTO `municipios` VALUES ('75', '5150', '2', 'CAROLINA');
INSERT INTO `municipios` VALUES ('76', '5154', '2', 'CAUCASIA');
INSERT INTO `municipios` VALUES ('77', '5172', '2', 'CHIGORODÓ');
INSERT INTO `municipios` VALUES ('78', '5190', '2', 'CISNEROS');
INSERT INTO `municipios` VALUES ('79', '5197', '2', 'COCORNÁ');
INSERT INTO `municipios` VALUES ('80', '5206', '2', 'CONCEPCIÓN');
INSERT INTO `municipios` VALUES ('81', '5209', '2', 'CONCORDIA');
INSERT INTO `municipios` VALUES ('82', '5212', '2', 'COPACABANA');
INSERT INTO `municipios` VALUES ('83', '5234', '2', 'DABEIBA');
INSERT INTO `municipios` VALUES ('84', '5237', '2', 'DONMATÍAS');
INSERT INTO `municipios` VALUES ('85', '5240', '2', 'EBÉJICO');
INSERT INTO `municipios` VALUES ('86', '5250', '2', 'EL BAGRE');
INSERT INTO `municipios` VALUES ('87', '5264', '2', 'ENTRERRÍOS');
INSERT INTO `municipios` VALUES ('88', '5266', '2', 'ENVIGADO');
INSERT INTO `municipios` VALUES ('89', '5282', '2', 'FREDONIA');
INSERT INTO `municipios` VALUES ('90', '5284', '2', 'FRONTINO');
INSERT INTO `municipios` VALUES ('91', '5306', '2', 'GIRALDO');
INSERT INTO `municipios` VALUES ('92', '5308', '2', 'GIRARDOTA');
INSERT INTO `municipios` VALUES ('93', '5310', '2', 'GÓMEZ PLATA');
INSERT INTO `municipios` VALUES ('94', '5313', '2', 'GRANADA');
INSERT INTO `municipios` VALUES ('95', '5315', '2', 'GUADALUPE');
INSERT INTO `municipios` VALUES ('96', '5318', '2', 'GUARNE');
INSERT INTO `municipios` VALUES ('97', '5321', '2', 'GUATAPÉ');
INSERT INTO `municipios` VALUES ('98', '5347', '2', 'HELICONIA');
INSERT INTO `municipios` VALUES ('99', '5353', '2', 'HISPANIA');
INSERT INTO `municipios` VALUES ('100', '5360', '2', 'ITAGÜÍ');
INSERT INTO `municipios` VALUES ('101', '5361', '2', 'ITUANGO');
INSERT INTO `municipios` VALUES ('102', '5364', '2', 'JARDÍN');
INSERT INTO `municipios` VALUES ('103', '5368', '2', 'JERICÓ');
INSERT INTO `municipios` VALUES ('104', '5376', '2', 'LA CEJA');
INSERT INTO `municipios` VALUES ('105', '5380', '2', 'LA ESTRELLA');
INSERT INTO `municipios` VALUES ('106', '5390', '2', 'LA PINTADA');
INSERT INTO `municipios` VALUES ('107', '5400', '2', 'LA UNIÓN');
INSERT INTO `municipios` VALUES ('108', '5411', '2', 'LIBORINA');
INSERT INTO `municipios` VALUES ('109', '5425', '2', 'MACEO');
INSERT INTO `municipios` VALUES ('110', '5440', '2', 'MARINILLA');
INSERT INTO `municipios` VALUES ('111', '5467', '2', 'MONTEBELLO');
INSERT INTO `municipios` VALUES ('112', '5475', '2', 'MURINDÓ');
INSERT INTO `municipios` VALUES ('113', '5480', '2', 'MUTATÁ');
INSERT INTO `municipios` VALUES ('114', '5483', '2', 'NARIÑO');
INSERT INTO `municipios` VALUES ('115', '5490', '2', 'NECOCLÍ');
INSERT INTO `municipios` VALUES ('116', '5495', '2', 'NECHÍ');
INSERT INTO `municipios` VALUES ('117', '5501', '2', 'OLAYA');
INSERT INTO `municipios` VALUES ('118', '5541', '2', 'PEÑOL');
INSERT INTO `municipios` VALUES ('119', '5543', '2', 'PEQUE');
INSERT INTO `municipios` VALUES ('120', '5576', '2', 'PUEBLORRICO');
INSERT INTO `municipios` VALUES ('121', '5579', '2', 'PUERTO BERRÍO');
INSERT INTO `municipios` VALUES ('122', '5585', '2', 'PUERTO NARE');
INSERT INTO `municipios` VALUES ('123', '5591', '2', 'PUERTO TRIUNFO');
INSERT INTO `municipios` VALUES ('124', '5604', '2', 'REMEDIOS');
INSERT INTO `municipios` VALUES ('125', '5607', '2', 'RETIRO');
INSERT INTO `municipios` VALUES ('126', '5615', '2', 'RIONEGRO');
INSERT INTO `municipios` VALUES ('127', '5628', '2', 'SABANALARGA');
INSERT INTO `municipios` VALUES ('128', '5631', '2', 'SABANETA');
INSERT INTO `municipios` VALUES ('129', '5642', '2', 'SALGAR');
INSERT INTO `municipios` VALUES ('130', '5647', '2', 'SAN ANDRÉS DE CUERQUÍA');
INSERT INTO `municipios` VALUES ('131', '5649', '2', 'SAN CARLOS');
INSERT INTO `municipios` VALUES ('132', '5652', '2', 'SAN FRANCISCO');
INSERT INTO `municipios` VALUES ('133', '5656', '2', 'SAN JERÓNIMO');
INSERT INTO `municipios` VALUES ('134', '5658', '2', 'SAN JOSÉ DE LA MONTAÑA');
INSERT INTO `municipios` VALUES ('135', '5659', '2', 'SAN JUAN DE URABÁ');
INSERT INTO `municipios` VALUES ('136', '5660', '2', 'SAN LUIS');
INSERT INTO `municipios` VALUES ('137', '5664', '2', 'SAN PEDRO DE LOS MILAGROS');
INSERT INTO `municipios` VALUES ('138', '5665', '2', 'SAN PEDRO DE URABÁ');
INSERT INTO `municipios` VALUES ('139', '5667', '2', 'SAN RAFAEL');
INSERT INTO `municipios` VALUES ('140', '5670', '2', 'SAN ROQUE');
INSERT INTO `municipios` VALUES ('141', '5674', '2', 'SAN VICENTE FERRER');
INSERT INTO `municipios` VALUES ('142', '5679', '2', 'SANTA BÁRBARA');
INSERT INTO `municipios` VALUES ('143', '5686', '2', 'SANTA ROSA DE OSOS');
INSERT INTO `municipios` VALUES ('144', '5690', '2', 'SANTO DOMINGO');
INSERT INTO `municipios` VALUES ('145', '5697', '2', 'EL SANTUARIO');
INSERT INTO `municipios` VALUES ('146', '5736', '2', 'SEGOVIA');
INSERT INTO `municipios` VALUES ('147', '5756', '2', 'SONSÓN');
INSERT INTO `municipios` VALUES ('148', '5761', '2', 'SOPETRÁN');
INSERT INTO `municipios` VALUES ('149', '5789', '2', 'TÁMESIS');
INSERT INTO `municipios` VALUES ('150', '5790', '2', 'TARAZÁ');
INSERT INTO `municipios` VALUES ('151', '5792', '2', 'TARSO');
INSERT INTO `municipios` VALUES ('152', '5809', '2', 'TITIRIBÍ');
INSERT INTO `municipios` VALUES ('153', '5819', '2', 'TOLEDO');
INSERT INTO `municipios` VALUES ('154', '5837', '2', 'TURBO');
INSERT INTO `municipios` VALUES ('155', '5842', '2', 'URAMITA');
INSERT INTO `municipios` VALUES ('156', '5847', '2', 'URRAO');
INSERT INTO `municipios` VALUES ('157', '5854', '2', 'VALDIVIA');
INSERT INTO `municipios` VALUES ('158', '5856', '2', 'VALPARAÍSO');
INSERT INTO `municipios` VALUES ('159', '5858', '2', 'VEGACHÍ');
INSERT INTO `municipios` VALUES ('160', '5861', '2', 'VENECIA');
INSERT INTO `municipios` VALUES ('161', '5873', '2', 'VIGÍA DEL FUERTE');
INSERT INTO `municipios` VALUES ('162', '5885', '2', 'YALÍ');
INSERT INTO `municipios` VALUES ('163', '5887', '2', 'YARUMAL');
INSERT INTO `municipios` VALUES ('164', '5890', '2', 'YOLOMBÓ');
INSERT INTO `municipios` VALUES ('165', '5893', '2', 'YONDÓ');
INSERT INTO `municipios` VALUES ('166', '5895', '2', 'ZARAGOZA');
INSERT INTO `municipios` VALUES ('167', '81001', '3', 'ARAUCA');
INSERT INTO `municipios` VALUES ('168', '81065', '3', 'ARAUQUITA');
INSERT INTO `municipios` VALUES ('169', '81220', '3', 'CRAVO NORTE');
INSERT INTO `municipios` VALUES ('170', '81300', '3', 'FORTUL');
INSERT INTO `municipios` VALUES ('171', '81591', '3', 'PUERTO RONDÓN');
INSERT INTO `municipios` VALUES ('172', '81736', '3', 'SARAVENA');
INSERT INTO `municipios` VALUES ('173', '81794', '3', 'TAME');
INSERT INTO `municipios` VALUES ('174', '8001', '4', 'BARRANQUILLA');
INSERT INTO `municipios` VALUES ('175', '8078', '4', 'BARANOA');
INSERT INTO `municipios` VALUES ('176', '8137', '4', 'CAMPO DE LA CRUZ');
INSERT INTO `municipios` VALUES ('177', '8141', '4', 'CANDELARIA');
INSERT INTO `municipios` VALUES ('178', '8296', '4', 'GALAPA');
INSERT INTO `municipios` VALUES ('179', '8372', '4', 'JUAN DE ACOSTA');
INSERT INTO `municipios` VALUES ('180', '8421', '4', 'LURUACO');
INSERT INTO `municipios` VALUES ('181', '8433', '4', 'MALAMBO');
INSERT INTO `municipios` VALUES ('182', '8436', '4', 'MANATÍ');
INSERT INTO `municipios` VALUES ('183', '8520', '4', 'PALMAR DE VARELA');
INSERT INTO `municipios` VALUES ('184', '8549', '4', 'PIOJÓ');
INSERT INTO `municipios` VALUES ('185', '8558', '4', 'POLONUEVO');
INSERT INTO `municipios` VALUES ('186', '8560', '4', 'PONEDERA');
INSERT INTO `municipios` VALUES ('187', '8573', '4', 'PUERTO COLOMBIA');
INSERT INTO `municipios` VALUES ('188', '8606', '4', 'REPELÓN');
INSERT INTO `municipios` VALUES ('189', '8634', '4', 'SABANAGRANDE');
INSERT INTO `municipios` VALUES ('190', '8675', '4', 'SANTA LUCÍA');
INSERT INTO `municipios` VALUES ('191', '8685', '4', 'SANTO TOMÁS');
INSERT INTO `municipios` VALUES ('192', '8758', '4', 'SOLEDAD');
INSERT INTO `municipios` VALUES ('193', '8770', '4', 'SUAN');
INSERT INTO `municipios` VALUES ('194', '8832', '4', 'TUBARÁ');
INSERT INTO `municipios` VALUES ('195', '8849', '4', 'USIACURÍ');
INSERT INTO `municipios` VALUES ('197', '13001', '6', 'CARTAGENA DE INDIAS');
INSERT INTO `municipios` VALUES ('198', '13006', '6', 'ACHÍ');
INSERT INTO `municipios` VALUES ('199', '13030', '6', 'ALTOS DEL ROSARIO');
INSERT INTO `municipios` VALUES ('200', '13042', '6', 'ARENAL');
INSERT INTO `municipios` VALUES ('201', '13052', '6', 'ARJONA');
INSERT INTO `municipios` VALUES ('202', '13062', '6', 'ARROYOHONDO');
INSERT INTO `municipios` VALUES ('203', '13074', '6', 'BARRANCO DE LOBA');
INSERT INTO `municipios` VALUES ('204', '13140', '6', 'CALAMAR');
INSERT INTO `municipios` VALUES ('205', '13160', '6', 'CANTAGALLO');
INSERT INTO `municipios` VALUES ('206', '13188', '6', 'CICUCO');
INSERT INTO `municipios` VALUES ('207', '13212', '6', 'CÓRDOBA');
INSERT INTO `municipios` VALUES ('208', '13222', '6', 'CLEMENCIA');
INSERT INTO `municipios` VALUES ('209', '13244', '6', 'EL CARMEN DE BOLÍVAR');
INSERT INTO `municipios` VALUES ('210', '13248', '6', 'EL GUAMO');
INSERT INTO `municipios` VALUES ('211', '13268', '6', 'EL PEÑÓN');
INSERT INTO `municipios` VALUES ('212', '13300', '6', 'HATILLO DE LOBA');
INSERT INTO `municipios` VALUES ('213', '13430', '6', 'MAGANGUÉ');
INSERT INTO `municipios` VALUES ('214', '13433', '6', 'MAHATES');
INSERT INTO `municipios` VALUES ('215', '13440', '6', 'MARGARITA');
INSERT INTO `municipios` VALUES ('216', '13442', '6', 'MARÍA LA BAJA');
INSERT INTO `municipios` VALUES ('217', '13458', '6', 'MONTECRISTO');
INSERT INTO `municipios` VALUES ('218', '13468', '6', 'MOMPÓS');
INSERT INTO `municipios` VALUES ('219', '13473', '6', 'MORALES');
INSERT INTO `municipios` VALUES ('220', '13490', '6', 'NOROSÍ');
INSERT INTO `municipios` VALUES ('221', '13549', '6', 'PINILLOS');
INSERT INTO `municipios` VALUES ('222', '13580', '6', 'REGIDOR');
INSERT INTO `municipios` VALUES ('223', '13600', '6', 'RÍO VIEJO');
INSERT INTO `municipios` VALUES ('224', '13620', '6', 'SAN CRISTÓBAL');
INSERT INTO `municipios` VALUES ('225', '13647', '6', 'SAN ESTANISLAO');
INSERT INTO `municipios` VALUES ('226', '13650', '6', 'SAN FERNANDO');
INSERT INTO `municipios` VALUES ('227', '13654', '6', 'SAN JACINTO');
INSERT INTO `municipios` VALUES ('228', '13655', '6', 'SAN JACINTO DEL CAUCA');
INSERT INTO `municipios` VALUES ('229', '13657', '6', 'SAN JUAN NEPOMUCENO');
INSERT INTO `municipios` VALUES ('230', '13667', '6', 'SAN MARTÍN DE LOBA');
INSERT INTO `municipios` VALUES ('231', '13670', '6', 'SAN PABLO');
INSERT INTO `municipios` VALUES ('232', '13673', '6', 'SANTA CATALINA');
INSERT INTO `municipios` VALUES ('233', '13683', '6', 'SANTA ROSA');
INSERT INTO `municipios` VALUES ('234', '13688', '6', 'SANTA ROSA DEL SUR');
INSERT INTO `municipios` VALUES ('235', '13744', '6', 'SIMITÍ');
INSERT INTO `municipios` VALUES ('236', '13760', '6', 'SOPLAVIENTO');
INSERT INTO `municipios` VALUES ('237', '13780', '6', 'TALAIGUA NUEVO');
INSERT INTO `municipios` VALUES ('238', '13810', '6', 'TIQUISIO');
INSERT INTO `municipios` VALUES ('239', '13836', '6', 'TURBACO');
INSERT INTO `municipios` VALUES ('240', '13838', '6', 'TURBANÁ');
INSERT INTO `municipios` VALUES ('241', '13873', '6', 'VILLANUEVA');
INSERT INTO `municipios` VALUES ('242', '13894', '6', 'ZAMBRANO');
INSERT INTO `municipios` VALUES ('243', '15001', '7', 'TUNJA');
INSERT INTO `municipios` VALUES ('244', '15022', '7', 'ALMEIDA');
INSERT INTO `municipios` VALUES ('245', '15047', '7', 'AQUITANIA');
INSERT INTO `municipios` VALUES ('246', '15051', '7', 'ARCABUCO');
INSERT INTO `municipios` VALUES ('247', '15087', '7', 'BELÉN');
INSERT INTO `municipios` VALUES ('248', '15090', '7', 'BERBEO');
INSERT INTO `municipios` VALUES ('249', '15092', '7', 'BETÉITIVA');
INSERT INTO `municipios` VALUES ('250', '15097', '7', 'BOAVITA');
INSERT INTO `municipios` VALUES ('251', '15104', '7', 'BOYACÁ');
INSERT INTO `municipios` VALUES ('252', '15109', '7', 'BUENAVISTA');
INSERT INTO `municipios` VALUES ('253', '15114', '7', 'BUSBANZÁ');
INSERT INTO `municipios` VALUES ('254', '15135', '7', 'CAMPOHERMOSO');
INSERT INTO `municipios` VALUES ('255', '15162', '7', 'CERINZA');
INSERT INTO `municipios` VALUES ('256', '15172', '7', 'CHINAVITA');
INSERT INTO `municipios` VALUES ('257', '15176', '7', 'CHIQUINQUIRÁ');
INSERT INTO `municipios` VALUES ('258', '15180', '7', 'CHISCAS');
INSERT INTO `municipios` VALUES ('259', '15183', '7', 'CHITA');
INSERT INTO `municipios` VALUES ('260', '15185', '7', 'CHITARAQUE');
INSERT INTO `municipios` VALUES ('261', '15187', '7', 'CHIVATÁ');
INSERT INTO `municipios` VALUES ('262', '15189', '7', 'CIÉNEGA');
INSERT INTO `municipios` VALUES ('263', '15204', '7', 'CÓMBITA');
INSERT INTO `municipios` VALUES ('264', '15212', '7', 'COPER');
INSERT INTO `municipios` VALUES ('265', '15215', '7', 'CORRALES');
INSERT INTO `municipios` VALUES ('266', '15218', '7', 'COVARACHÍA');
INSERT INTO `municipios` VALUES ('267', '15223', '7', 'CUBARÁ');
INSERT INTO `municipios` VALUES ('268', '15224', '7', 'CUCAITA');
INSERT INTO `municipios` VALUES ('269', '15226', '7', 'CUÍTIVA');
INSERT INTO `municipios` VALUES ('270', '15232', '7', 'CHÍQUIZA');
INSERT INTO `municipios` VALUES ('271', '15236', '7', 'CHIVOR');
INSERT INTO `municipios` VALUES ('272', '15238', '7', 'DUITAMA');
INSERT INTO `municipios` VALUES ('273', '15244', '7', 'EL COCUY');
INSERT INTO `municipios` VALUES ('274', '15248', '7', 'EL ESPINO');
INSERT INTO `municipios` VALUES ('275', '15272', '7', 'FIRAVITOBA');
INSERT INTO `municipios` VALUES ('276', '15276', '7', 'FLORESTA');
INSERT INTO `municipios` VALUES ('277', '15293', '7', 'GACHANTIVÁ');
INSERT INTO `municipios` VALUES ('278', '15296', '7', 'GÁMEZA');
INSERT INTO `municipios` VALUES ('279', '15299', '7', 'GARAGOA');
INSERT INTO `municipios` VALUES ('280', '15317', '7', 'GUACAMAYAS');
INSERT INTO `municipios` VALUES ('281', '15322', '7', 'GUATEQUE');
INSERT INTO `municipios` VALUES ('282', '15325', '7', 'GUAYATÁ');
INSERT INTO `municipios` VALUES ('283', '15332', '7', 'GÜICÁN');
INSERT INTO `municipios` VALUES ('284', '15362', '7', 'IZA');
INSERT INTO `municipios` VALUES ('285', '15367', '7', 'JENESANO');
INSERT INTO `municipios` VALUES ('286', '15377', '7', 'LABRANZAGRANDE');
INSERT INTO `municipios` VALUES ('287', '15380', '7', 'LA CAPILLA');
INSERT INTO `municipios` VALUES ('288', '15401', '7', 'LA VICTORIA');
INSERT INTO `municipios` VALUES ('289', '15403', '7', 'LA UVITA');
INSERT INTO `municipios` VALUES ('290', '15407', '7', 'VILLA DE LEYVA');
INSERT INTO `municipios` VALUES ('291', '15425', '7', 'MACANAL');
INSERT INTO `municipios` VALUES ('292', '15442', '7', 'MARIPÍ');
INSERT INTO `municipios` VALUES ('293', '15455', '7', 'MIRAFLORES');
INSERT INTO `municipios` VALUES ('294', '15464', '7', 'MONGUA');
INSERT INTO `municipios` VALUES ('295', '15466', '7', 'MONGUÍ');
INSERT INTO `municipios` VALUES ('296', '15469', '7', 'MONIQUIRÁ');
INSERT INTO `municipios` VALUES ('297', '15476', '7', 'MOTAVITA');
INSERT INTO `municipios` VALUES ('298', '15480', '7', 'MUZO');
INSERT INTO `municipios` VALUES ('299', '15491', '7', 'NOBSA');
INSERT INTO `municipios` VALUES ('300', '15494', '7', 'NUEVO COLÓN');
INSERT INTO `municipios` VALUES ('301', '15500', '7', 'OICATÁ');
INSERT INTO `municipios` VALUES ('302', '15507', '7', 'OTANCHE');
INSERT INTO `municipios` VALUES ('303', '15511', '7', 'PACHAVITA');
INSERT INTO `municipios` VALUES ('304', '15514', '7', 'PÁEZ');
INSERT INTO `municipios` VALUES ('305', '15516', '7', 'PAIPA');
INSERT INTO `municipios` VALUES ('306', '15518', '7', 'PAJARITO');
INSERT INTO `municipios` VALUES ('307', '15522', '7', 'PANQUEBA');
INSERT INTO `municipios` VALUES ('308', '15531', '7', 'PAUNA');
INSERT INTO `municipios` VALUES ('309', '15533', '7', 'PAYA');
INSERT INTO `municipios` VALUES ('310', '15537', '7', 'PAZ DE RÍO');
INSERT INTO `municipios` VALUES ('311', '15542', '7', 'PESCA');
INSERT INTO `municipios` VALUES ('312', '15550', '7', 'PISBA');
INSERT INTO `municipios` VALUES ('313', '15572', '7', 'PUERTO BOYACÁ');
INSERT INTO `municipios` VALUES ('314', '15580', '7', 'QUÍPAMA');
INSERT INTO `municipios` VALUES ('315', '15599', '7', 'RAMIRIQUÍ');
INSERT INTO `municipios` VALUES ('316', '15600', '7', 'RÁQUIRA');
INSERT INTO `municipios` VALUES ('317', '15621', '7', 'RONDÓN');
INSERT INTO `municipios` VALUES ('318', '15632', '7', 'SABOYÁ');
INSERT INTO `municipios` VALUES ('319', '15638', '7', 'SÁCHICA');
INSERT INTO `municipios` VALUES ('320', '15646', '7', 'SAMACÁ');
INSERT INTO `municipios` VALUES ('321', '15660', '7', 'SAN EDUARDO');
INSERT INTO `municipios` VALUES ('322', '15664', '7', 'SAN JOSÉ DE PARE');
INSERT INTO `municipios` VALUES ('323', '15667', '7', 'SAN LUIS DE GACENO');
INSERT INTO `municipios` VALUES ('324', '15673', '7', 'SAN MATEO');
INSERT INTO `municipios` VALUES ('325', '15676', '7', 'SAN MIGUEL DE SEMA');
INSERT INTO `municipios` VALUES ('326', '15681', '7', 'SAN PABLO DE BORBUR');
INSERT INTO `municipios` VALUES ('327', '15686', '7', 'SANTANA');
INSERT INTO `municipios` VALUES ('328', '15690', '7', 'SANTA MARÍA');
INSERT INTO `municipios` VALUES ('329', '15693', '7', 'SANTA ROSA DE VITERBO');
INSERT INTO `municipios` VALUES ('330', '15696', '7', 'SANTA SOFÍA');
INSERT INTO `municipios` VALUES ('331', '15720', '7', 'SATIVANORTE');
INSERT INTO `municipios` VALUES ('332', '15723', '7', 'SATIVASUR');
INSERT INTO `municipios` VALUES ('333', '15740', '7', 'SIACHOQUE');
INSERT INTO `municipios` VALUES ('334', '15753', '7', 'SOATÁ');
INSERT INTO `municipios` VALUES ('335', '15755', '7', 'SOCOTÁ');
INSERT INTO `municipios` VALUES ('336', '15757', '7', 'SOCHA');
INSERT INTO `municipios` VALUES ('337', '15759', '7', 'SOGAMOSO');
INSERT INTO `municipios` VALUES ('338', '15761', '7', 'SOMONDOCO');
INSERT INTO `municipios` VALUES ('339', '15762', '7', 'SORA');
INSERT INTO `municipios` VALUES ('340', '15763', '7', 'SOTAQUIRÁ');
INSERT INTO `municipios` VALUES ('341', '15764', '7', 'SORACÁ');
INSERT INTO `municipios` VALUES ('342', '15774', '7', 'SUSACÓN');
INSERT INTO `municipios` VALUES ('343', '15776', '7', 'SUTAMARCHÁN');
INSERT INTO `municipios` VALUES ('344', '15778', '7', 'SUTATENZA');
INSERT INTO `municipios` VALUES ('345', '15790', '7', 'TASCO');
INSERT INTO `municipios` VALUES ('346', '15798', '7', 'TENZA');
INSERT INTO `municipios` VALUES ('347', '15804', '7', 'TIBANÁ');
INSERT INTO `municipios` VALUES ('348', '15806', '7', 'TIBASOSA');
INSERT INTO `municipios` VALUES ('349', '15808', '7', 'TINJACÁ');
INSERT INTO `municipios` VALUES ('350', '15810', '7', 'TIPACOQUE');
INSERT INTO `municipios` VALUES ('351', '15814', '7', 'TOCA');
INSERT INTO `municipios` VALUES ('352', '15816', '7', 'TOGÜÍ');
INSERT INTO `municipios` VALUES ('353', '15820', '7', 'TÓPAGA');
INSERT INTO `municipios` VALUES ('354', '15822', '7', 'TOTA');
INSERT INTO `municipios` VALUES ('355', '15832', '7', 'TUNUNGUÁ');
INSERT INTO `municipios` VALUES ('356', '15835', '7', 'TURMEQUÉ');
INSERT INTO `municipios` VALUES ('357', '15837', '7', 'TUTA');
INSERT INTO `municipios` VALUES ('358', '15839', '7', 'TUTAZÁ');
INSERT INTO `municipios` VALUES ('359', '15842', '7', 'ÚMBITA');
INSERT INTO `municipios` VALUES ('360', '15861', '7', 'VENTAQUEMADA');
INSERT INTO `municipios` VALUES ('361', '15879', '7', 'VIRACACHÁ');
INSERT INTO `municipios` VALUES ('362', '15897', '7', 'ZETAQUIRA');
INSERT INTO `municipios` VALUES ('363', '17001', '8', 'MANIZALES');
INSERT INTO `municipios` VALUES ('364', '17013', '8', 'AGUADAS');
INSERT INTO `municipios` VALUES ('365', '17042', '8', 'ANSERMA');
INSERT INTO `municipios` VALUES ('366', '17050', '8', 'ARANZAZU');
INSERT INTO `municipios` VALUES ('367', '17088', '8', 'BELALCÁZAR');
INSERT INTO `municipios` VALUES ('368', '17174', '8', 'CHINCHINÁ');
INSERT INTO `municipios` VALUES ('369', '17272', '8', 'FILADELFIA');
INSERT INTO `municipios` VALUES ('370', '17380', '8', 'LA DORADA');
INSERT INTO `municipios` VALUES ('371', '17388', '8', 'LA MERCED');
INSERT INTO `municipios` VALUES ('372', '17433', '8', 'MANZANARES');
INSERT INTO `municipios` VALUES ('373', '17442', '8', 'MARMATO');
INSERT INTO `municipios` VALUES ('374', '17444', '8', 'MARQUETALIA');
INSERT INTO `municipios` VALUES ('375', '17446', '8', 'MARULANDA');
INSERT INTO `municipios` VALUES ('376', '17486', '8', 'NEIRA');
INSERT INTO `municipios` VALUES ('377', '17495', '8', 'NORCASIA');
INSERT INTO `municipios` VALUES ('378', '17513', '8', 'PÁCORA');
INSERT INTO `municipios` VALUES ('379', '17524', '8', 'PALESTINA');
INSERT INTO `municipios` VALUES ('380', '17541', '8', 'PENSILVANIA');
INSERT INTO `municipios` VALUES ('381', '17614', '8', 'RIOSUCIO');
INSERT INTO `municipios` VALUES ('382', '17616', '8', 'RISARALDA');
INSERT INTO `municipios` VALUES ('383', '17653', '8', 'SALAMINA');
INSERT INTO `municipios` VALUES ('384', '17662', '8', 'SAMANÁ');
INSERT INTO `municipios` VALUES ('385', '17665', '8', 'SAN JOSÉ');
INSERT INTO `municipios` VALUES ('386', '17777', '8', 'SUPÍA');
INSERT INTO `municipios` VALUES ('387', '17867', '8', 'VICTORIA');
INSERT INTO `municipios` VALUES ('388', '17873', '8', 'VILLAMARÍA');
INSERT INTO `municipios` VALUES ('389', '17877', '8', 'VITERBO');
INSERT INTO `municipios` VALUES ('390', '18001', '9', 'FLORENCIA');
INSERT INTO `municipios` VALUES ('391', '18029', '9', 'ALBANIA');
INSERT INTO `municipios` VALUES ('392', '18094', '9', 'BELÉN DE LOS ANDAQUÍES');
INSERT INTO `municipios` VALUES ('393', '18150', '9', 'CARTAGENA DEL CHAIRÁ');
INSERT INTO `municipios` VALUES ('394', '18205', '9', 'CURILLO');
INSERT INTO `municipios` VALUES ('395', '18247', '9', 'EL DONCELLO');
INSERT INTO `municipios` VALUES ('396', '18256', '9', 'EL PAUJÍL');
INSERT INTO `municipios` VALUES ('397', '18410', '9', 'LA MONTAÑITA');
INSERT INTO `municipios` VALUES ('398', '18460', '9', 'MILÁN');
INSERT INTO `municipios` VALUES ('399', '18479', '9', 'MORELIA');
INSERT INTO `municipios` VALUES ('400', '18592', '9', 'PUERTO RICO');
INSERT INTO `municipios` VALUES ('401', '18610', '9', 'SAN JOSÉ DEL FRAGUA');
INSERT INTO `municipios` VALUES ('402', '18753', '9', 'SAN VICENTE DEL CAGUÁN');
INSERT INTO `municipios` VALUES ('403', '18756', '9', 'SOLANO');
INSERT INTO `municipios` VALUES ('404', '18785', '9', 'SOLITA');
INSERT INTO `municipios` VALUES ('405', '85001', '10', 'YOPAL');
INSERT INTO `municipios` VALUES ('406', '85010', '10', 'AGUAZUL');
INSERT INTO `municipios` VALUES ('407', '85015', '10', 'CHÁMEZA');
INSERT INTO `municipios` VALUES ('408', '85125', '10', 'HATO COROZAL');
INSERT INTO `municipios` VALUES ('409', '85136', '10', 'LA SALINA');
INSERT INTO `municipios` VALUES ('410', '85139', '10', 'MANÍ');
INSERT INTO `municipios` VALUES ('411', '85162', '10', 'MONTERREY');
INSERT INTO `municipios` VALUES ('412', '85225', '10', 'NUNCHÍA');
INSERT INTO `municipios` VALUES ('413', '85230', '10', 'OROCUÉ');
INSERT INTO `municipios` VALUES ('414', '85250', '10', 'PAZ DE ARIPORO');
INSERT INTO `municipios` VALUES ('415', '85263', '10', 'PORE');
INSERT INTO `municipios` VALUES ('416', '85279', '10', 'RECETOR');
INSERT INTO `municipios` VALUES ('417', '85315', '10', 'SÁCAMA');
INSERT INTO `municipios` VALUES ('418', '85325', '10', 'SAN LUIS DE PALENQUE');
INSERT INTO `municipios` VALUES ('419', '85400', '10', 'TÁMARA');
INSERT INTO `municipios` VALUES ('420', '85410', '10', 'TAURAMENA');
INSERT INTO `municipios` VALUES ('421', '85430', '10', 'TRINIDAD');
INSERT INTO `municipios` VALUES ('422', '19001', '11', 'POPAYÁN');
INSERT INTO `municipios` VALUES ('423', '19022', '11', 'ALMAGUER');
INSERT INTO `municipios` VALUES ('424', '19075', '11', 'BALBOA');
INSERT INTO `municipios` VALUES ('425', '19100', '11', 'BOLÍVAR');
INSERT INTO `municipios` VALUES ('426', '19110', '11', 'BUENOS AIRES');
INSERT INTO `municipios` VALUES ('427', '19130', '11', 'CAJIBÍO');
INSERT INTO `municipios` VALUES ('428', '19137', '11', 'CALDONO');
INSERT INTO `municipios` VALUES ('429', '19142', '11', 'CALOTO');
INSERT INTO `municipios` VALUES ('430', '19212', '11', 'CORINTO');
INSERT INTO `municipios` VALUES ('431', '19256', '11', 'EL TAMBO');
INSERT INTO `municipios` VALUES ('432', '19300', '11', 'GUACHENÉ');
INSERT INTO `municipios` VALUES ('433', '19318', '11', 'GUAPÍ');
INSERT INTO `municipios` VALUES ('434', '19355', '11', 'INZÁ');
INSERT INTO `municipios` VALUES ('435', '19364', '11', 'JAMBALÓ');
INSERT INTO `municipios` VALUES ('436', '19392', '11', 'LA SIERRA');
INSERT INTO `municipios` VALUES ('437', '19397', '11', 'LA VEGA');
INSERT INTO `municipios` VALUES ('438', '19418', '11', 'LÓPEZ DE MICAY');
INSERT INTO `municipios` VALUES ('439', '19450', '11', 'MERCADERES');
INSERT INTO `municipios` VALUES ('440', '19455', '11', 'MIRANDA');
INSERT INTO `municipios` VALUES ('441', '19513', '11', 'PADILLA');
INSERT INTO `municipios` VALUES ('442', '19532', '11', 'PATÍA');
INSERT INTO `municipios` VALUES ('443', '19533', '11', 'PIAMONTE');
INSERT INTO `municipios` VALUES ('444', '19548', '11', 'PIENDAMÓ');
INSERT INTO `municipios` VALUES ('445', '19573', '11', 'PUERTO TEJADA');
INSERT INTO `municipios` VALUES ('446', '19585', '11', 'PURACÉ');
INSERT INTO `municipios` VALUES ('447', '19622', '11', 'ROSAS');
INSERT INTO `municipios` VALUES ('448', '19693', '11', 'SAN SEBASTIÁN');
INSERT INTO `municipios` VALUES ('449', '19698', '11', 'SANTANDER DE QUILICHAO');
INSERT INTO `municipios` VALUES ('450', '19743', '11', 'SILVIA');
INSERT INTO `municipios` VALUES ('451', '19760', '11', 'SOTARA');
INSERT INTO `municipios` VALUES ('452', '19780', '11', 'SUÁREZ');
INSERT INTO `municipios` VALUES ('453', '19785', '11', 'SUCRE');
INSERT INTO `municipios` VALUES ('454', '19807', '11', 'TIMBÍO');
INSERT INTO `municipios` VALUES ('455', '19809', '11', 'TIMBIQUÍ');
INSERT INTO `municipios` VALUES ('456', '19821', '11', 'TORIBÍO');
INSERT INTO `municipios` VALUES ('457', '19824', '11', 'TOTORÓ');
INSERT INTO `municipios` VALUES ('458', '19845', '11', 'VILLA RICA');
INSERT INTO `municipios` VALUES ('459', '20001', '12', 'VALLEDUPAR');
INSERT INTO `municipios` VALUES ('460', '20011', '12', 'AGUACHICA');
INSERT INTO `municipios` VALUES ('461', '20013', '12', 'AGUSTÍN CODAZZI');
INSERT INTO `municipios` VALUES ('462', '20032', '12', 'ASTREA');
INSERT INTO `municipios` VALUES ('463', '20045', '12', 'BECERRIL');
INSERT INTO `municipios` VALUES ('464', '20060', '12', 'BOSCONIA');
INSERT INTO `municipios` VALUES ('465', '20175', '12', 'CHIMICHAGUA');
INSERT INTO `municipios` VALUES ('466', '20178', '12', 'CHIRIGUANÁ');
INSERT INTO `municipios` VALUES ('467', '20228', '12', 'CURUMANÍ');
INSERT INTO `municipios` VALUES ('468', '20238', '12', 'EL COPEY');
INSERT INTO `municipios` VALUES ('469', '20250', '12', 'EL PASO');
INSERT INTO `municipios` VALUES ('470', '20295', '12', 'GAMARRA');
INSERT INTO `municipios` VALUES ('471', '20310', '12', 'GONZÁLEZ');
INSERT INTO `municipios` VALUES ('472', '20383', '12', 'LA GLORIA');
INSERT INTO `municipios` VALUES ('473', '20400', '12', 'LA JAGUA DE IBIRICO');
INSERT INTO `municipios` VALUES ('474', '20443', '12', 'MANAURE BALCÓN DEL CESAR');
INSERT INTO `municipios` VALUES ('475', '20517', '12', 'PAILITAS');
INSERT INTO `municipios` VALUES ('476', '20550', '12', 'PELAYA');
INSERT INTO `municipios` VALUES ('477', '20570', '12', 'PUEBLO BELLO');
INSERT INTO `municipios` VALUES ('478', '20614', '12', 'RÍO DE ORO');
INSERT INTO `municipios` VALUES ('479', '20621', '12', 'LA PAZ');
INSERT INTO `municipios` VALUES ('480', '20710', '12', 'SAN ALBERTO');
INSERT INTO `municipios` VALUES ('481', '20750', '12', 'SAN DIEGO');
INSERT INTO `municipios` VALUES ('482', '20770', '12', 'SAN MARTÍN');
INSERT INTO `municipios` VALUES ('483', '20787', '12', 'TAMALAMEQUE');
INSERT INTO `municipios` VALUES ('484', '27001', '13', 'QUIBDÓ');
INSERT INTO `municipios` VALUES ('485', '27006', '13', 'ACANDÍ');
INSERT INTO `municipios` VALUES ('486', '27025', '13', 'ALTO BAUDÓ');
INSERT INTO `municipios` VALUES ('487', '27050', '13', 'ATRATO');
INSERT INTO `municipios` VALUES ('488', '27073', '13', 'BAGADÓ');
INSERT INTO `municipios` VALUES ('489', '27075', '13', 'BAHÍA SOLANO');
INSERT INTO `municipios` VALUES ('490', '27077', '13', 'BAJO BAUDÓ');
INSERT INTO `municipios` VALUES ('491', '27099', '13', 'BOJAYÁ');
INSERT INTO `municipios` VALUES ('492', '27135', '13', 'EL CANTÓN DEL SAN PABLO');
INSERT INTO `municipios` VALUES ('493', '27150', '13', 'CARMEN DEL DARIÉN');
INSERT INTO `municipios` VALUES ('494', '27160', '13', 'CÉRTEGUI');
INSERT INTO `municipios` VALUES ('495', '27205', '13', 'CONDOTO');
INSERT INTO `municipios` VALUES ('496', '27245', '13', 'EL CARMEN DE ATRATO');
INSERT INTO `municipios` VALUES ('497', '27250', '13', 'EL LITORAL DEL SAN JUAN');
INSERT INTO `municipios` VALUES ('498', '27361', '13', 'ISTMINA');
INSERT INTO `municipios` VALUES ('499', '27372', '13', 'JURADÓ');
INSERT INTO `municipios` VALUES ('500', '27413', '13', 'LLORÓ');
INSERT INTO `municipios` VALUES ('501', '27425', '13', 'MEDIO ATRATO');
INSERT INTO `municipios` VALUES ('502', '27430', '13', 'MEDIO BAUDÓ');
INSERT INTO `municipios` VALUES ('503', '27450', '13', 'MEDIO SAN JUAN');
INSERT INTO `municipios` VALUES ('504', '27491', '13', 'NÓVITA');
INSERT INTO `municipios` VALUES ('505', '27495', '13', 'NUQUÍ');
INSERT INTO `municipios` VALUES ('506', '27580', '13', 'RÍO IRÓ');
INSERT INTO `municipios` VALUES ('507', '27600', '13', 'RÍO QUITO');
INSERT INTO `municipios` VALUES ('508', '27660', '13', 'SAN JOSÉ DEL PALMAR');
INSERT INTO `municipios` VALUES ('509', '27745', '13', 'SIPÍ');
INSERT INTO `municipios` VALUES ('510', '27787', '13', 'TADÓ');
INSERT INTO `municipios` VALUES ('511', '27800', '13', 'UNGUÍA');
INSERT INTO `municipios` VALUES ('512', '27810', '13', 'UNIÓN PANAMERICANA');
INSERT INTO `municipios` VALUES ('513', '23001', '14', 'MONTERÍA');
INSERT INTO `municipios` VALUES ('514', '23068', '14', 'AYAPEL');
INSERT INTO `municipios` VALUES ('515', '23090', '14', 'CANALETE');
INSERT INTO `municipios` VALUES ('516', '23162', '14', 'CERETÉ');
INSERT INTO `municipios` VALUES ('517', '23168', '14', 'CHIMÁ');
INSERT INTO `municipios` VALUES ('518', '23182', '14', 'CHINÚ');
INSERT INTO `municipios` VALUES ('519', '23189', '14', 'CIÉNAGA DE ORO');
INSERT INTO `municipios` VALUES ('520', '23300', '14', 'COTORRA');
INSERT INTO `municipios` VALUES ('521', '23350', '14', 'LA APARTADA');
INSERT INTO `municipios` VALUES ('522', '23417', '14', 'LORICA');
INSERT INTO `municipios` VALUES ('523', '23419', '14', 'LOS CÓRDOBAS');
INSERT INTO `municipios` VALUES ('524', '23464', '14', 'MOMIL');
INSERT INTO `municipios` VALUES ('525', '23466', '14', 'MONTELÍBANO');
INSERT INTO `municipios` VALUES ('526', '23500', '14', 'MOÑITOS');
INSERT INTO `municipios` VALUES ('527', '23555', '14', 'PLANETA RICA');
INSERT INTO `municipios` VALUES ('528', '23570', '14', 'PUEBLO NUEVO');
INSERT INTO `municipios` VALUES ('529', '23574', '14', 'PUERTO ESCONDIDO');
INSERT INTO `municipios` VALUES ('530', '23580', '14', 'PUERTO LIBERTADOR');
INSERT INTO `municipios` VALUES ('531', '23586', '14', 'PURÍSIMA DE LA CONCEPCIÓN');
INSERT INTO `municipios` VALUES ('532', '23660', '14', 'SAHAGÚN');
INSERT INTO `municipios` VALUES ('533', '23670', '14', 'SAN ANDRÉS DE SOTAVENTO');
INSERT INTO `municipios` VALUES ('534', '23672', '14', 'SAN ANTERO');
INSERT INTO `municipios` VALUES ('535', '23675', '14', 'SAN BERNARDO DEL VIENTO');
INSERT INTO `municipios` VALUES ('536', '23682', '14', 'SAN JOSÉ DE URÉ');
INSERT INTO `municipios` VALUES ('537', '23686', '14', 'SAN PELAYO');
INSERT INTO `municipios` VALUES ('538', '23807', '14', 'TIERRALTA');
INSERT INTO `municipios` VALUES ('539', '23815', '14', 'TUCHÍN');
INSERT INTO `municipios` VALUES ('540', '23855', '14', 'VALENCIA');
INSERT INTO `municipios` VALUES ('541', '25001', '15', 'AGUA DE DIOS');
INSERT INTO `municipios` VALUES ('542', '25019', '15', 'ALBÁN');
INSERT INTO `municipios` VALUES ('543', '25035', '15', 'ANAPOIMA');
INSERT INTO `municipios` VALUES ('544', '25040', '15', 'ANOLAIMA');
INSERT INTO `municipios` VALUES ('545', '25053', '15', 'ARBELÁEZ');
INSERT INTO `municipios` VALUES ('546', '25086', '15', 'BELTRÁN');
INSERT INTO `municipios` VALUES ('547', '25095', '15', 'BITUIMA');
INSERT INTO `municipios` VALUES ('548', '25099', '15', 'BOJACÁ');
INSERT INTO `municipios` VALUES ('549', '25120', '15', 'CABRERA');
INSERT INTO `municipios` VALUES ('550', '25123', '15', 'CACHIPAY');
INSERT INTO `municipios` VALUES ('551', '25126', '15', 'CAJICÁ');
INSERT INTO `municipios` VALUES ('552', '25148', '15', 'CAPARRAPÍ');
INSERT INTO `municipios` VALUES ('553', '25151', '15', 'CÁQUEZA');
INSERT INTO `municipios` VALUES ('554', '25154', '15', 'CARMEN DE CARUPA');
INSERT INTO `municipios` VALUES ('555', '25168', '15', 'CHAGUANÍ');
INSERT INTO `municipios` VALUES ('556', '25175', '15', 'CHÍA');
INSERT INTO `municipios` VALUES ('557', '25178', '15', 'CHIPAQUE');
INSERT INTO `municipios` VALUES ('558', '25181', '15', 'CHOACHÍ');
INSERT INTO `municipios` VALUES ('559', '25183', '15', 'CHOCONTÁ');
INSERT INTO `municipios` VALUES ('560', '25200', '15', 'COGUA');
INSERT INTO `municipios` VALUES ('561', '25214', '15', 'COTA');
INSERT INTO `municipios` VALUES ('562', '25224', '15', 'CUCUNUBÁ');
INSERT INTO `municipios` VALUES ('563', '25245', '15', 'EL COLEGIO');
INSERT INTO `municipios` VALUES ('564', '25260', '15', 'EL ROSAL');
INSERT INTO `municipios` VALUES ('565', '25269', '15', 'FACATATIVÁ');
INSERT INTO `municipios` VALUES ('566', '25279', '15', 'FÓMEQUE');
INSERT INTO `municipios` VALUES ('567', '25281', '15', 'FOSCA');
INSERT INTO `municipios` VALUES ('568', '25286', '15', 'FUNZA');
INSERT INTO `municipios` VALUES ('569', '25288', '15', 'FÚQUENE');
INSERT INTO `municipios` VALUES ('570', '25290', '15', 'FUSAGASUGÁ');
INSERT INTO `municipios` VALUES ('571', '25293', '15', 'GACHALÁ');
INSERT INTO `municipios` VALUES ('572', '25295', '15', 'GACHANCIPÁ');
INSERT INTO `municipios` VALUES ('573', '25297', '15', 'GACHETÁ');
INSERT INTO `municipios` VALUES ('574', '25299', '15', 'GAMA');
INSERT INTO `municipios` VALUES ('575', '25307', '15', 'GIRARDOT');
INSERT INTO `municipios` VALUES ('576', '25317', '15', 'GUACHETÁ');
INSERT INTO `municipios` VALUES ('577', '25320', '15', 'GUADUAS');
INSERT INTO `municipios` VALUES ('578', '25322', '15', 'GUASCA');
INSERT INTO `municipios` VALUES ('579', '25324', '15', 'GUATAQUÍ');
INSERT INTO `municipios` VALUES ('580', '25326', '15', 'GUATAVITA');
INSERT INTO `municipios` VALUES ('581', '25328', '15', 'GUAYABAL DE SÍQUIMA');
INSERT INTO `municipios` VALUES ('582', '25335', '15', 'GUAYABETAL');
INSERT INTO `municipios` VALUES ('583', '25339', '15', 'GUTIÉRREZ');
INSERT INTO `municipios` VALUES ('584', '25368', '15', 'JERUSALÉN');
INSERT INTO `municipios` VALUES ('585', '25372', '15', 'JUNÍN');
INSERT INTO `municipios` VALUES ('586', '25377', '15', 'LA CALERA');
INSERT INTO `municipios` VALUES ('587', '25386', '15', 'LA MESA');
INSERT INTO `municipios` VALUES ('588', '25394', '15', 'LA PALMA');
INSERT INTO `municipios` VALUES ('589', '25398', '15', 'LA PEÑA');
INSERT INTO `municipios` VALUES ('590', '25407', '15', 'LENGUAZAQUE');
INSERT INTO `municipios` VALUES ('591', '25426', '15', 'MACHETÁ');
INSERT INTO `municipios` VALUES ('592', '25430', '15', 'MADRID');
INSERT INTO `municipios` VALUES ('593', '25436', '15', 'MANTA');
INSERT INTO `municipios` VALUES ('594', '25438', '15', 'MEDINA');
INSERT INTO `municipios` VALUES ('595', '25473', '15', 'MOSQUERA');
INSERT INTO `municipios` VALUES ('596', '25486', '15', 'NEMOCÓN');
INSERT INTO `municipios` VALUES ('597', '25488', '15', 'NILO');
INSERT INTO `municipios` VALUES ('598', '25489', '15', 'NIMAIMA');
INSERT INTO `municipios` VALUES ('599', '25491', '15', 'NOCAIMA');
INSERT INTO `municipios` VALUES ('600', '25513', '15', 'PACHO');
INSERT INTO `municipios` VALUES ('601', '25518', '15', 'PAIME');
INSERT INTO `municipios` VALUES ('602', '25524', '15', 'PANDI');
INSERT INTO `municipios` VALUES ('603', '25530', '15', 'PARATEBUENO');
INSERT INTO `municipios` VALUES ('604', '25535', '15', 'PASCA');
INSERT INTO `municipios` VALUES ('605', '25572', '15', 'PUERTO SALGAR');
INSERT INTO `municipios` VALUES ('606', '25580', '15', 'PULÍ');
INSERT INTO `municipios` VALUES ('607', '25592', '15', 'QUEBRADANEGRA');
INSERT INTO `municipios` VALUES ('608', '25594', '15', 'QUETAME');
INSERT INTO `municipios` VALUES ('609', '25596', '15', 'QUIPILE');
INSERT INTO `municipios` VALUES ('610', '25599', '15', 'APULO');
INSERT INTO `municipios` VALUES ('611', '25612', '15', 'RICAURTE');
INSERT INTO `municipios` VALUES ('612', '25645', '15', 'SAN ANTONIO DEL TEQUENDAMA');
INSERT INTO `municipios` VALUES ('613', '25649', '15', 'SAN BERNARDO');
INSERT INTO `municipios` VALUES ('614', '25653', '15', 'SAN CAYETANO');
INSERT INTO `municipios` VALUES ('615', '25662', '15', 'SAN JUAN DE RIOSECO');
INSERT INTO `municipios` VALUES ('616', '25718', '15', 'SASAIMA');
INSERT INTO `municipios` VALUES ('617', '25736', '15', 'SESQUILÉ');
INSERT INTO `municipios` VALUES ('618', '25740', '15', 'SIBATÉ');
INSERT INTO `municipios` VALUES ('619', '25743', '15', 'SILVANIA');
INSERT INTO `municipios` VALUES ('620', '25745', '15', 'SIMIJACA');
INSERT INTO `municipios` VALUES ('621', '25754', '15', 'SOACHA');
INSERT INTO `municipios` VALUES ('622', '25758', '15', 'SOPÓ');
INSERT INTO `municipios` VALUES ('623', '25769', '15', 'SUBACHOQUE');
INSERT INTO `municipios` VALUES ('624', '25772', '15', 'SUESCA');
INSERT INTO `municipios` VALUES ('625', '25777', '15', 'SUPATÁ');
INSERT INTO `municipios` VALUES ('626', '25779', '15', 'SUSA');
INSERT INTO `municipios` VALUES ('627', '25781', '15', 'SUTATAUSA');
INSERT INTO `municipios` VALUES ('628', '25785', '15', 'TABIO');
INSERT INTO `municipios` VALUES ('629', '25793', '15', 'TAUSA');
INSERT INTO `municipios` VALUES ('630', '25797', '15', 'TENA');
INSERT INTO `municipios` VALUES ('631', '25799', '15', 'TENJO');
INSERT INTO `municipios` VALUES ('632', '25805', '15', 'TIBACUY');
INSERT INTO `municipios` VALUES ('633', '25807', '15', 'TIBIRITA');
INSERT INTO `municipios` VALUES ('634', '25815', '15', 'TOCAIMA');
INSERT INTO `municipios` VALUES ('635', '25817', '15', 'TOCANCIPÁ');
INSERT INTO `municipios` VALUES ('636', '25823', '15', 'TOPAIPÍ');
INSERT INTO `municipios` VALUES ('637', '25839', '15', 'UBALÁ');
INSERT INTO `municipios` VALUES ('638', '25841', '15', 'UBAQUE');
INSERT INTO `municipios` VALUES ('639', '25843', '15', 'VILLA DE SAN DIEGO DE UBATÉ');
INSERT INTO `municipios` VALUES ('640', '25845', '15', 'UNE');
INSERT INTO `municipios` VALUES ('641', '25851', '15', 'ÚTICA');
INSERT INTO `municipios` VALUES ('642', '25862', '15', 'VERGARA');
INSERT INTO `municipios` VALUES ('643', '25867', '15', 'VIANÍ');
INSERT INTO `municipios` VALUES ('644', '25871', '15', 'VILLAGÓMEZ');
INSERT INTO `municipios` VALUES ('645', '25873', '15', 'VILLAPINZÓN');
INSERT INTO `municipios` VALUES ('646', '25875', '15', 'VILLETA');
INSERT INTO `municipios` VALUES ('647', '25878', '15', 'VIOTÁ');
INSERT INTO `municipios` VALUES ('648', '25885', '15', 'YACOPÍ');
INSERT INTO `municipios` VALUES ('649', '25898', '15', 'ZIPACÓN');
INSERT INTO `municipios` VALUES ('650', '25899', '15', 'ZIPAQUIRÁ');
INSERT INTO `municipios` VALUES ('651', '94001', '16', 'INÍRIDA');
INSERT INTO `municipios` VALUES ('652', '94343', '16', 'BARRANCO MINAS');
INSERT INTO `municipios` VALUES ('653', '94663', '16', 'MAPIRIPANA');
INSERT INTO `municipios` VALUES ('654', '94883', '16', 'SAN FELIPE');
INSERT INTO `municipios` VALUES ('655', '94885', '16', 'LA GUADALUPE');
INSERT INTO `municipios` VALUES ('656', '94886', '16', 'CACAHUAL');
INSERT INTO `municipios` VALUES ('657', '94887', '16', 'PANA PANA');
INSERT INTO `municipios` VALUES ('658', '94888', '16', 'MORICHAL');
INSERT INTO `municipios` VALUES ('659', '95001', '17', 'SAN JOSÉ DEL GUAVIARE');
INSERT INTO `municipios` VALUES ('660', '95025', '17', 'EL RETORNO');
INSERT INTO `municipios` VALUES ('661', '41001', '18', 'NEIVA');
INSERT INTO `municipios` VALUES ('662', '41006', '18', 'ACEVEDO');
INSERT INTO `municipios` VALUES ('663', '41013', '18', 'AGRADO');
INSERT INTO `municipios` VALUES ('664', '41016', '18', 'AIPE');
INSERT INTO `municipios` VALUES ('665', '41020', '18', 'ALGECIRAS');
INSERT INTO `municipios` VALUES ('666', '41026', '18', 'ALTAMIRA');
INSERT INTO `municipios` VALUES ('667', '41078', '18', 'BARAYA');
INSERT INTO `municipios` VALUES ('668', '41132', '18', 'CAMPOALEGRE');
INSERT INTO `municipios` VALUES ('669', '41206', '18', 'COLOMBIA');
INSERT INTO `municipios` VALUES ('670', '41244', '18', 'ELÍAS');
INSERT INTO `municipios` VALUES ('671', '41298', '18', 'GARZÓN');
INSERT INTO `municipios` VALUES ('672', '41306', '18', 'GIGANTE');
INSERT INTO `municipios` VALUES ('673', '41349', '18', 'HOBO');
INSERT INTO `municipios` VALUES ('674', '41357', '18', 'ÍQUIRA');
INSERT INTO `municipios` VALUES ('675', '41359', '18', 'ISNOS');
INSERT INTO `municipios` VALUES ('676', '41378', '18', 'LA ARGENTINA');
INSERT INTO `municipios` VALUES ('677', '41396', '18', 'LA PLATA');
INSERT INTO `municipios` VALUES ('678', '41483', '18', 'NÁTAGA');
INSERT INTO `municipios` VALUES ('679', '41503', '18', 'OPORAPA');
INSERT INTO `municipios` VALUES ('680', '41518', '18', 'PAICOL');
INSERT INTO `municipios` VALUES ('681', '41524', '18', 'PALERMO');
INSERT INTO `municipios` VALUES ('682', '41548', '18', 'PITAL');
INSERT INTO `municipios` VALUES ('683', '41551', '18', 'PITALITO');
INSERT INTO `municipios` VALUES ('684', '41615', '18', 'RIVERA');
INSERT INTO `municipios` VALUES ('685', '41660', '18', 'SALADOBLANCO');
INSERT INTO `municipios` VALUES ('686', '41668', '18', 'SAN AGUSTÍN');
INSERT INTO `municipios` VALUES ('687', '41770', '18', 'SUAZA');
INSERT INTO `municipios` VALUES ('688', '41791', '18', 'TARQUI');
INSERT INTO `municipios` VALUES ('689', '41797', '18', 'TESALIA');
INSERT INTO `municipios` VALUES ('690', '41799', '18', 'TELLO');
INSERT INTO `municipios` VALUES ('691', '41801', '18', 'TERUEL');
INSERT INTO `municipios` VALUES ('692', '41807', '18', 'TIMANÁ');
INSERT INTO `municipios` VALUES ('693', '41872', '18', 'VILLAVIEJA');
INSERT INTO `municipios` VALUES ('694', '41885', '18', 'YAGUARÁ');
INSERT INTO `municipios` VALUES ('695', '44001', '19', 'RIOHACHA');
INSERT INTO `municipios` VALUES ('696', '44078', '19', 'BARRANCAS');
INSERT INTO `municipios` VALUES ('697', '44090', '19', 'DIBULLA');
INSERT INTO `municipios` VALUES ('698', '44098', '19', 'DISTRACCIÓN');
INSERT INTO `municipios` VALUES ('699', '44110', '19', 'EL MOLINO');
INSERT INTO `municipios` VALUES ('700', '44279', '19', 'FONSECA');
INSERT INTO `municipios` VALUES ('701', '44378', '19', 'HATONUEVO');
INSERT INTO `municipios` VALUES ('702', '44420', '19', 'LA JAGUA DEL PILAR');
INSERT INTO `municipios` VALUES ('703', '44430', '19', 'MAICAO');
INSERT INTO `municipios` VALUES ('704', '44560', '19', 'MANAURE');
INSERT INTO `municipios` VALUES ('705', '44650', '19', 'SAN JUAN DEL CESAR');
INSERT INTO `municipios` VALUES ('706', '44847', '19', 'URIBIA');
INSERT INTO `municipios` VALUES ('707', '44855', '19', 'URUMITA');
INSERT INTO `municipios` VALUES ('708', '47001', '20', 'SANTA MARTA');
INSERT INTO `municipios` VALUES ('709', '47030', '20', 'ALGARROBO');
INSERT INTO `municipios` VALUES ('710', '47053', '20', 'ARACATACA');
INSERT INTO `municipios` VALUES ('711', '47058', '20', 'ARIGUANÍ');
INSERT INTO `municipios` VALUES ('712', '47161', '20', 'CERRO DE SAN ANTONIO');
INSERT INTO `municipios` VALUES ('713', '47170', '20', 'CHIVOLO');
INSERT INTO `municipios` VALUES ('714', '47189', '20', 'CIÉNAGA');
INSERT INTO `municipios` VALUES ('715', '47245', '20', 'EL BANCO');
INSERT INTO `municipios` VALUES ('716', '47258', '20', 'EL PIÑÓN');
INSERT INTO `municipios` VALUES ('717', '47268', '20', 'EL RETÉN');
INSERT INTO `municipios` VALUES ('718', '47288', '20', 'FUNDACIÓN');
INSERT INTO `municipios` VALUES ('719', '47318', '20', 'GUAMAL');
INSERT INTO `municipios` VALUES ('720', '47460', '20', 'NUEVA GRANADA');
INSERT INTO `municipios` VALUES ('721', '47541', '20', 'PEDRAZA');
INSERT INTO `municipios` VALUES ('722', '47545', '20', 'PIJIÑO DEL CARMEN');
INSERT INTO `municipios` VALUES ('723', '47551', '20', 'PIVIJAY');
INSERT INTO `municipios` VALUES ('724', '47555', '20', 'PLATO');
INSERT INTO `municipios` VALUES ('725', '47570', '20', 'PUEBLOVIEJO');
INSERT INTO `municipios` VALUES ('726', '47605', '20', 'REMOLINO');
INSERT INTO `municipios` VALUES ('727', '47660', '20', 'SABANAS DE SAN ÁNGEL');
INSERT INTO `municipios` VALUES ('728', '47692', '20', 'SAN SEBASTIÁN DE BUENAVISTA');
INSERT INTO `municipios` VALUES ('729', '47703', '20', 'SAN ZENÓN');
INSERT INTO `municipios` VALUES ('730', '47707', '20', 'SANTA ANA');
INSERT INTO `municipios` VALUES ('731', '47720', '20', 'SANTA BÁRBARA DE PINTO');
INSERT INTO `municipios` VALUES ('732', '47745', '20', 'SITIONUEVO');
INSERT INTO `municipios` VALUES ('733', '47798', '20', 'TENERIFE');
INSERT INTO `municipios` VALUES ('734', '47960', '20', 'ZAPAYÁN');
INSERT INTO `municipios` VALUES ('735', '47980', '20', 'ZONA BANANERA');
INSERT INTO `municipios` VALUES ('736', '50001', '21', 'VILLAVICENCIO');
INSERT INTO `municipios` VALUES ('737', '50006', '21', 'ACACÍAS');
INSERT INTO `municipios` VALUES ('738', '50110', '21', 'BARRANCA DE UPÍA');
INSERT INTO `municipios` VALUES ('739', '50124', '21', 'CABUYARO');
INSERT INTO `municipios` VALUES ('740', '50150', '21', 'CASTILLA LA NUEVA');
INSERT INTO `municipios` VALUES ('741', '50223', '21', 'SAN LUIS DE CUBARRAL');
INSERT INTO `municipios` VALUES ('742', '50226', '21', 'CUMARAL');
INSERT INTO `municipios` VALUES ('743', '50245', '21', 'EL CALVARIO');
INSERT INTO `municipios` VALUES ('744', '50251', '21', 'EL CASTILLO');
INSERT INTO `municipios` VALUES ('745', '50270', '21', 'EL DORADO');
INSERT INTO `municipios` VALUES ('746', '50287', '21', 'FUENTE DE ORO');
INSERT INTO `municipios` VALUES ('747', '50325', '21', 'MAPIRIPÁN');
INSERT INTO `municipios` VALUES ('748', '50330', '21', 'MESETAS');
INSERT INTO `municipios` VALUES ('749', '50350', '21', 'LA MACARENA');
INSERT INTO `municipios` VALUES ('750', '50370', '21', 'URIBE');
INSERT INTO `municipios` VALUES ('751', '50400', '21', 'LEJANÍAS');
INSERT INTO `municipios` VALUES ('752', '50450', '21', 'PUERTO CONCORDIA');
INSERT INTO `municipios` VALUES ('753', '50568', '21', 'PUERTO GAITÁN');
INSERT INTO `municipios` VALUES ('754', '50573', '21', 'PUERTO LÓPEZ');
INSERT INTO `municipios` VALUES ('755', '50577', '21', 'PUERTO LLERAS');
INSERT INTO `municipios` VALUES ('756', '50606', '21', 'RESTREPO');
INSERT INTO `municipios` VALUES ('757', '50680', '21', 'SAN CARLOS DE GUAROA');
INSERT INTO `municipios` VALUES ('758', '50683', '21', 'SAN JUAN DE ARAMA');
INSERT INTO `municipios` VALUES ('759', '50686', '21', 'SAN JUANITO');
INSERT INTO `municipios` VALUES ('760', '50711', '21', 'VISTAHERMOSA');
INSERT INTO `municipios` VALUES ('761', '52001', '22', 'PASTO');
INSERT INTO `municipios` VALUES ('762', '52022', '22', 'ALDANA');
INSERT INTO `municipios` VALUES ('763', '52036', '22', 'ANCUYÁ');
INSERT INTO `municipios` VALUES ('764', '52051', '22', 'ARBOLEDA');
INSERT INTO `municipios` VALUES ('765', '52079', '22', 'BARBACOAS');
INSERT INTO `municipios` VALUES ('766', '52110', '22', 'BUESACO');
INSERT INTO `municipios` VALUES ('767', '52203', '22', 'COLÓN');
INSERT INTO `municipios` VALUES ('768', '52207', '22', 'CONSACÁ');
INSERT INTO `municipios` VALUES ('769', '52210', '22', 'CONTADERO');
INSERT INTO `municipios` VALUES ('770', '52224', '22', 'CUASPÚD');
INSERT INTO `municipios` VALUES ('771', '52227', '22', 'CUMBAL');
INSERT INTO `municipios` VALUES ('772', '52233', '22', 'CUMBITARA');
INSERT INTO `municipios` VALUES ('773', '52240', '22', 'CHACHAGÜÍ');
INSERT INTO `municipios` VALUES ('774', '52250', '22', 'EL CHARCO');
INSERT INTO `municipios` VALUES ('775', '52254', '22', 'EL PEÑOL');
INSERT INTO `municipios` VALUES ('776', '52256', '22', 'EL ROSARIO');
INSERT INTO `municipios` VALUES ('777', '52258', '22', 'EL TABLÓN DE GÓMEZ');
INSERT INTO `municipios` VALUES ('778', '52287', '22', 'FUNES');
INSERT INTO `municipios` VALUES ('779', '52317', '22', 'GUACHUCAL');
INSERT INTO `municipios` VALUES ('780', '52320', '22', 'GUAITARILLA');
INSERT INTO `municipios` VALUES ('781', '52323', '22', 'GUALMATÁN');
INSERT INTO `municipios` VALUES ('782', '52352', '22', 'ILES');
INSERT INTO `municipios` VALUES ('783', '52354', '22', 'IMUÉS');
INSERT INTO `municipios` VALUES ('784', '52356', '22', 'IPIALES');
INSERT INTO `municipios` VALUES ('785', '52378', '22', 'LA CRUZ');
INSERT INTO `municipios` VALUES ('786', '52381', '22', 'LA FLORIDA');
INSERT INTO `municipios` VALUES ('787', '52385', '22', 'LA LLANADA');
INSERT INTO `municipios` VALUES ('788', '52390', '22', 'LA TOLA');
INSERT INTO `municipios` VALUES ('789', '52405', '22', 'LEIVA');
INSERT INTO `municipios` VALUES ('790', '52411', '22', 'LINARES');
INSERT INTO `municipios` VALUES ('791', '52418', '22', 'LOS ANDES');
INSERT INTO `municipios` VALUES ('792', '52427', '22', 'MAGÜÍ');
INSERT INTO `municipios` VALUES ('793', '52435', '22', 'MALLAMA');
INSERT INTO `municipios` VALUES ('794', '52490', '22', 'OLAYA HERRERA');
INSERT INTO `municipios` VALUES ('795', '52506', '22', 'OSPINA');
INSERT INTO `municipios` VALUES ('796', '52520', '22', 'FRANCISCO PIZARRO');
INSERT INTO `municipios` VALUES ('797', '52540', '22', 'POLICARPA');
INSERT INTO `municipios` VALUES ('798', '52560', '22', 'POTOSÍ');
INSERT INTO `municipios` VALUES ('799', '52565', '22', 'PROVIDENCIA');
INSERT INTO `municipios` VALUES ('800', '52573', '22', 'PUERRES');
INSERT INTO `municipios` VALUES ('801', '52585', '22', 'PUPIALES');
INSERT INTO `municipios` VALUES ('802', '52621', '22', 'ROBERTO PAYÁN');
INSERT INTO `municipios` VALUES ('803', '52678', '22', 'SAMANIEGO');
INSERT INTO `municipios` VALUES ('804', '52683', '22', 'SANDONÁ');
INSERT INTO `municipios` VALUES ('805', '52687', '22', 'SAN LORENZO');
INSERT INTO `municipios` VALUES ('806', '52694', '22', 'SAN PEDRO DE CARTAGO');
INSERT INTO `municipios` VALUES ('807', '52699', '22', 'SANTACRUZ');
INSERT INTO `municipios` VALUES ('808', '52720', '22', 'SAPUYES');
INSERT INTO `municipios` VALUES ('809', '52786', '22', 'TAMINANGO');
INSERT INTO `municipios` VALUES ('810', '52788', '22', 'TANGUA');
INSERT INTO `municipios` VALUES ('811', '52835', '22', 'SAN ANDRÉS DE TUMACO');
INSERT INTO `municipios` VALUES ('812', '52838', '22', 'TÚQUERRES');
INSERT INTO `municipios` VALUES ('813', '52885', '22', 'YACUANQUER');
INSERT INTO `municipios` VALUES ('814', '54001', '23', 'CÚCUTA');
INSERT INTO `municipios` VALUES ('815', '54003', '23', 'ÁBREGO');
INSERT INTO `municipios` VALUES ('816', '54051', '23', 'ARBOLEDAS');
INSERT INTO `municipios` VALUES ('817', '54099', '23', 'BOCHALEMA');
INSERT INTO `municipios` VALUES ('818', '54109', '23', 'BUCARASICA');
INSERT INTO `municipios` VALUES ('819', '54125', '23', 'CÁCOTA');
INSERT INTO `municipios` VALUES ('820', '54128', '23', 'CÁCHIRA');
INSERT INTO `municipios` VALUES ('821', '54172', '23', 'CHINÁCOTA');
INSERT INTO `municipios` VALUES ('822', '54174', '23', 'CHITAGÁ');
INSERT INTO `municipios` VALUES ('823', '54206', '23', 'CONVENCIÓN');
INSERT INTO `municipios` VALUES ('824', '54223', '23', 'CUCUTILLA');
INSERT INTO `municipios` VALUES ('825', '54239', '23', 'DURANIA');
INSERT INTO `municipios` VALUES ('826', '54245', '23', 'EL CARMEN');
INSERT INTO `municipios` VALUES ('827', '54250', '23', 'EL TARRA');
INSERT INTO `municipios` VALUES ('828', '54261', '23', 'EL ZULIA');
INSERT INTO `municipios` VALUES ('829', '54313', '23', 'GRAMALOTE');
INSERT INTO `municipios` VALUES ('830', '54344', '23', 'HACARÍ');
INSERT INTO `municipios` VALUES ('831', '54347', '23', 'HERRÁN');
INSERT INTO `municipios` VALUES ('832', '54377', '23', 'LABATECA');
INSERT INTO `municipios` VALUES ('833', '54385', '23', 'LA ESPERANZA');
INSERT INTO `municipios` VALUES ('834', '54398', '23', 'LA PLAYA');
INSERT INTO `municipios` VALUES ('835', '54405', '23', 'LOS PATIOS');
INSERT INTO `municipios` VALUES ('836', '54418', '23', 'LOURDES');
INSERT INTO `municipios` VALUES ('837', '54480', '23', 'MUTISCUA');
INSERT INTO `municipios` VALUES ('838', '54498', '23', 'OCAÑA');
INSERT INTO `municipios` VALUES ('839', '54518', '23', 'PAMPLONA');
INSERT INTO `municipios` VALUES ('840', '54520', '23', 'PAMPLONITA');
INSERT INTO `municipios` VALUES ('841', '54553', '23', 'PUERTO SANTANDER');
INSERT INTO `municipios` VALUES ('842', '54599', '23', 'RAGONVALIA');
INSERT INTO `municipios` VALUES ('843', '54660', '23', 'SALAZAR');
INSERT INTO `municipios` VALUES ('844', '54670', '23', 'SAN CALIXTO');
INSERT INTO `municipios` VALUES ('845', '54680', '23', 'SANTIAGO');
INSERT INTO `municipios` VALUES ('846', '54720', '23', 'SARDINATA');
INSERT INTO `municipios` VALUES ('847', '54743', '23', 'SILOS');
INSERT INTO `municipios` VALUES ('848', '54800', '23', 'TEORAMA');
INSERT INTO `municipios` VALUES ('849', '54810', '23', 'TIBÚ');
INSERT INTO `municipios` VALUES ('850', '54871', '23', 'VILLA CARO');
INSERT INTO `municipios` VALUES ('851', '54874', '23', 'VILLA DEL ROSARIO');
INSERT INTO `municipios` VALUES ('852', '86001', '24', 'MOCOA');
INSERT INTO `municipios` VALUES ('853', '86320', '24', 'ORITO');
INSERT INTO `municipios` VALUES ('854', '86568', '24', 'PUERTO ASÍS');
INSERT INTO `municipios` VALUES ('855', '86569', '24', 'PUERTO CAICEDO');
INSERT INTO `municipios` VALUES ('856', '86571', '24', 'PUERTO GUZMÁN');
INSERT INTO `municipios` VALUES ('857', '86573', '24', 'PUERTO LEGUÍZAMO');
INSERT INTO `municipios` VALUES ('858', '86749', '24', 'SIBUNDOY');
INSERT INTO `municipios` VALUES ('859', '86865', '24', 'VALLE DEL GUAMUEZ');
INSERT INTO `municipios` VALUES ('860', '86885', '24', 'VILLAGARZÓN');
INSERT INTO `municipios` VALUES ('861', '63130', '25', 'CALARCÁ');
INSERT INTO `municipios` VALUES ('862', '63190', '25', 'CIRCASIA');
INSERT INTO `municipios` VALUES ('863', '63272', '25', 'FILANDIA');
INSERT INTO `municipios` VALUES ('864', '63302', '25', 'GÉNOVA');
INSERT INTO `municipios` VALUES ('865', '63401', '25', 'LA TEBAIDA');
INSERT INTO `municipios` VALUES ('866', '63470', '25', 'MONTENEGRO');
INSERT INTO `municipios` VALUES ('867', '63548', '25', 'PIJAO');
INSERT INTO `municipios` VALUES ('868', '63594', '25', 'QUIMBAYA');
INSERT INTO `municipios` VALUES ('869', '63690', '25', 'SALENTO');
INSERT INTO `municipios` VALUES ('870', '66001', '26', 'PEREIRA');
INSERT INTO `municipios` VALUES ('871', '66045', '26', 'APÍA');
INSERT INTO `municipios` VALUES ('872', '66088', '26', 'BELÉN DE UMBRÍA');
INSERT INTO `municipios` VALUES ('873', '66170', '26', 'DOSQUEBRADAS');
INSERT INTO `municipios` VALUES ('874', '66318', '26', 'GUÁTICA');
INSERT INTO `municipios` VALUES ('875', '66383', '26', 'LA CELIA');
INSERT INTO `municipios` VALUES ('876', '66400', '26', 'LA VIRGINIA');
INSERT INTO `municipios` VALUES ('877', '66440', '26', 'MARSELLA');
INSERT INTO `municipios` VALUES ('878', '66456', '26', 'MISTRATÓ');
INSERT INTO `municipios` VALUES ('879', '66572', '26', 'PUEBLO RICO');
INSERT INTO `municipios` VALUES ('880', '66594', '26', 'QUINCHÍA');
INSERT INTO `municipios` VALUES ('881', '66682', '26', 'SANTA ROSA DE CABAL');
INSERT INTO `municipios` VALUES ('882', '66687', '26', 'SANTUARIO');
INSERT INTO `municipios` VALUES ('883', '68001', '27', 'BUCARAMANGA');
INSERT INTO `municipios` VALUES ('884', '68013', '27', 'AGUADA');
INSERT INTO `municipios` VALUES ('885', '68051', '27', 'ARATOCA');
INSERT INTO `municipios` VALUES ('886', '68079', '27', 'BARICHARA');
INSERT INTO `municipios` VALUES ('887', '68081', '27', 'BARRANCABERMEJA');
INSERT INTO `municipios` VALUES ('888', '68132', '27', 'CALIFORNIA');
INSERT INTO `municipios` VALUES ('889', '68147', '27', 'CAPITANEJO');
INSERT INTO `municipios` VALUES ('890', '68152', '27', 'CARCASÍ');
INSERT INTO `municipios` VALUES ('891', '68160', '27', 'CEPITÁ');
INSERT INTO `municipios` VALUES ('892', '68162', '27', 'CERRITO');
INSERT INTO `municipios` VALUES ('893', '68167', '27', 'CHARALÁ');
INSERT INTO `municipios` VALUES ('894', '68169', '27', 'CHARTA');
INSERT INTO `municipios` VALUES ('895', '68176', '27', 'CHIMA');
INSERT INTO `municipios` VALUES ('896', '68179', '27', 'CHIPATÁ');
INSERT INTO `municipios` VALUES ('897', '68190', '27', 'CIMITARRA');
INSERT INTO `municipios` VALUES ('898', '68209', '27', 'CONFINES');
INSERT INTO `municipios` VALUES ('899', '68211', '27', 'CONTRATACIÓN');
INSERT INTO `municipios` VALUES ('900', '68217', '27', 'COROMORO');
INSERT INTO `municipios` VALUES ('901', '68229', '27', 'CURITÍ');
INSERT INTO `municipios` VALUES ('902', '68235', '27', 'EL CARMEN DE CHUCURÍ');
INSERT INTO `municipios` VALUES ('903', '68245', '27', 'EL GUACAMAYO');
INSERT INTO `municipios` VALUES ('904', '68255', '27', 'EL PLAYÓN');
INSERT INTO `municipios` VALUES ('905', '68264', '27', 'ENCINO');
INSERT INTO `municipios` VALUES ('906', '68266', '27', 'ENCISO');
INSERT INTO `municipios` VALUES ('907', '68271', '27', 'FLORIÁN');
INSERT INTO `municipios` VALUES ('908', '68276', '27', 'FLORIDABLANCA');
INSERT INTO `municipios` VALUES ('909', '68296', '27', 'GALÁN');
INSERT INTO `municipios` VALUES ('910', '68298', '27', 'GÁMBITA');
INSERT INTO `municipios` VALUES ('911', '68307', '27', 'GIRÓN');
INSERT INTO `municipios` VALUES ('912', '68318', '27', 'GUACA');
INSERT INTO `municipios` VALUES ('913', '68322', '27', 'GUAPOTÁ');
INSERT INTO `municipios` VALUES ('914', '68324', '27', 'GUAVATÁ');
INSERT INTO `municipios` VALUES ('915', '68327', '27', 'GÜEPSA');
INSERT INTO `municipios` VALUES ('916', '68344', '27', 'HATO');
INSERT INTO `municipios` VALUES ('917', '68368', '27', 'JESÚS MARÍA');
INSERT INTO `municipios` VALUES ('918', '68370', '27', 'JORDÁN');
INSERT INTO `municipios` VALUES ('919', '68377', '27', 'LA BELLEZA');
INSERT INTO `municipios` VALUES ('920', '68385', '27', 'LANDÁZURI');
INSERT INTO `municipios` VALUES ('921', '68406', '27', 'LEBRIJA');
INSERT INTO `municipios` VALUES ('922', '68418', '27', 'LOS SANTOS');
INSERT INTO `municipios` VALUES ('923', '68425', '27', 'MACARAVITA');
INSERT INTO `municipios` VALUES ('924', '68432', '27', 'MÁLAGA');
INSERT INTO `municipios` VALUES ('925', '68444', '27', 'MATANZA');
INSERT INTO `municipios` VALUES ('926', '68464', '27', 'MOGOTES');
INSERT INTO `municipios` VALUES ('927', '68468', '27', 'MOLAGAVITA');
INSERT INTO `municipios` VALUES ('928', '68498', '27', 'OCAMONTE');
INSERT INTO `municipios` VALUES ('929', '68500', '27', 'OIBA');
INSERT INTO `municipios` VALUES ('930', '68502', '27', 'ONZAGA');
INSERT INTO `municipios` VALUES ('931', '68522', '27', 'PALMAR');
INSERT INTO `municipios` VALUES ('932', '68524', '27', 'PALMAS DEL SOCORRO');
INSERT INTO `municipios` VALUES ('933', '68533', '27', 'PÁRAMO');
INSERT INTO `municipios` VALUES ('934', '68547', '27', 'PIEDECUESTA');
INSERT INTO `municipios` VALUES ('935', '68549', '27', 'PINCHOTE');
INSERT INTO `municipios` VALUES ('936', '68572', '27', 'PUENTE NACIONAL');
INSERT INTO `municipios` VALUES ('937', '68573', '27', 'PUERTO PARRA');
INSERT INTO `municipios` VALUES ('938', '68575', '27', 'PUERTO WILCHES');
INSERT INTO `municipios` VALUES ('939', '68655', '27', 'SABANA DE TORRES');
INSERT INTO `municipios` VALUES ('940', '68669', '27', 'SAN ANDRÉS');
INSERT INTO `municipios` VALUES ('941', '68673', '27', 'SAN BENITO');
INSERT INTO `municipios` VALUES ('942', '68679', '27', 'SAN GIL');
INSERT INTO `municipios` VALUES ('943', '68682', '27', 'SAN JOAQUÍN');
INSERT INTO `municipios` VALUES ('944', '68684', '27', 'SAN JOSÉ DE MIRANDA');
INSERT INTO `municipios` VALUES ('945', '68686', '27', 'SAN MIGUEL');
INSERT INTO `municipios` VALUES ('946', '68689', '27', 'SAN VICENTE DE CHUCURÍ');
INSERT INTO `municipios` VALUES ('947', '68720', '27', 'SANTA HELENA DEL OPÓN');
INSERT INTO `municipios` VALUES ('948', '68745', '27', 'SIMACOTA');
INSERT INTO `municipios` VALUES ('949', '68755', '27', 'SOCORRO');
INSERT INTO `municipios` VALUES ('950', '68770', '27', 'SUAITA');
INSERT INTO `municipios` VALUES ('951', '68780', '27', 'SURATÁ');
INSERT INTO `municipios` VALUES ('952', '68820', '27', 'TONA');
INSERT INTO `municipios` VALUES ('953', '68855', '27', 'VALLE DE SAN JOSÉ');
INSERT INTO `municipios` VALUES ('954', '68861', '27', 'VÉLEZ');
INSERT INTO `municipios` VALUES ('955', '68867', '27', 'VETAS');
INSERT INTO `municipios` VALUES ('956', '68895', '27', 'ZAPATOCA');
INSERT INTO `municipios` VALUES ('957', '70001', '28', 'SINCELEJO');
INSERT INTO `municipios` VALUES ('958', '70124', '28', 'CAIMITO');
INSERT INTO `municipios` VALUES ('959', '70204', '28', 'COLOSO');
INSERT INTO `municipios` VALUES ('960', '70215', '28', 'COROZAL');
INSERT INTO `municipios` VALUES ('961', '70221', '28', 'COVEÑAS');
INSERT INTO `municipios` VALUES ('962', '70230', '28', 'CHALÁN');
INSERT INTO `municipios` VALUES ('963', '70233', '28', 'EL ROBLE');
INSERT INTO `municipios` VALUES ('964', '70235', '28', 'GALERAS');
INSERT INTO `municipios` VALUES ('965', '70265', '28', 'GUARANDA');
INSERT INTO `municipios` VALUES ('966', '70418', '28', 'LOS PALMITOS');
INSERT INTO `municipios` VALUES ('967', '70429', '28', 'MAJAGUAL');
INSERT INTO `municipios` VALUES ('968', '70473', '28', 'MORROA');
INSERT INTO `municipios` VALUES ('969', '70508', '28', 'OVEJAS');
INSERT INTO `municipios` VALUES ('970', '70523', '28', 'PALMITO');
INSERT INTO `municipios` VALUES ('971', '70670', '28', 'SAMPUÉS');
INSERT INTO `municipios` VALUES ('972', '70678', '28', 'SAN BENITO ABAD');
INSERT INTO `municipios` VALUES ('973', '70702', '28', 'SAN JUAN DE BETULIA');
INSERT INTO `municipios` VALUES ('974', '70708', '28', 'SAN MARCOS');
INSERT INTO `municipios` VALUES ('975', '70713', '28', 'SAN ONOFRE');
INSERT INTO `municipios` VALUES ('976', '70717', '28', 'SAN PEDRO');
INSERT INTO `municipios` VALUES ('977', '70742', '28', 'SAN LUIS DE SINCÉ');
INSERT INTO `municipios` VALUES ('978', '70820', '28', 'SANTIAGO DE TOLÚ');
INSERT INTO `municipios` VALUES ('979', '70823', '28', 'TOLÚ VIEJO');
INSERT INTO `municipios` VALUES ('980', '73001', '29', 'IBAGUÉ');
INSERT INTO `municipios` VALUES ('981', '73024', '29', 'ALPUJARRA');
INSERT INTO `municipios` VALUES ('982', '73026', '29', 'ALVARADO');
INSERT INTO `municipios` VALUES ('983', '73030', '29', 'AMBALEMA');
INSERT INTO `municipios` VALUES ('984', '73043', '29', 'ANZOÁTEGUI');
INSERT INTO `municipios` VALUES ('985', '73055', '29', 'ARMERO GUAYABAL');
INSERT INTO `municipios` VALUES ('986', '73067', '29', 'ATACO');
INSERT INTO `municipios` VALUES ('987', '73124', '29', 'CAJAMARCA');
INSERT INTO `municipios` VALUES ('988', '73148', '29', 'CARMEN DE APICALÁ');
INSERT INTO `municipios` VALUES ('989', '73152', '29', 'CASABIANCA');
INSERT INTO `municipios` VALUES ('990', '73168', '29', 'CHAPARRAL');
INSERT INTO `municipios` VALUES ('991', '73200', '29', 'COELLO');
INSERT INTO `municipios` VALUES ('992', '73217', '29', 'COYAIMA');
INSERT INTO `municipios` VALUES ('993', '73226', '29', 'CUNDAY');
INSERT INTO `municipios` VALUES ('994', '73236', '29', 'DOLORES');
INSERT INTO `municipios` VALUES ('995', '73268', '29', 'ESPINAL');
INSERT INTO `municipios` VALUES ('996', '73270', '29', 'FALAN');
INSERT INTO `municipios` VALUES ('997', '73275', '29', 'FLANDES');
INSERT INTO `municipios` VALUES ('998', '73283', '29', 'FRESNO');
INSERT INTO `municipios` VALUES ('999', '73319', '29', 'GUAMO');
INSERT INTO `municipios` VALUES ('1000', '73347', '29', 'HERVEO');
INSERT INTO `municipios` VALUES ('1001', '73349', '29', 'HONDA');
INSERT INTO `municipios` VALUES ('1002', '73352', '29', 'ICONONZO');
INSERT INTO `municipios` VALUES ('1003', '73408', '29', 'LÉRIDA');
INSERT INTO `municipios` VALUES ('1004', '73411', '29', 'LÍBANO');
INSERT INTO `municipios` VALUES ('1005', '73443', '29', 'SAN SEBASTIÁN DE MARIQUITA');
INSERT INTO `municipios` VALUES ('1006', '73449', '29', 'MELGAR');
INSERT INTO `municipios` VALUES ('1007', '73461', '29', 'MURILLO');
INSERT INTO `municipios` VALUES ('1008', '73483', '29', 'NATAGAIMA');
INSERT INTO `municipios` VALUES ('1009', '73504', '29', 'ORTEGA');
INSERT INTO `municipios` VALUES ('1010', '73520', '29', 'PALOCABILDO');
INSERT INTO `municipios` VALUES ('1011', '73547', '29', 'PIEDRAS');
INSERT INTO `municipios` VALUES ('1012', '73555', '29', 'PLANADAS');
INSERT INTO `municipios` VALUES ('1013', '73563', '29', 'PRADO');
INSERT INTO `municipios` VALUES ('1014', '73585', '29', 'PURIFICACIÓN');
INSERT INTO `municipios` VALUES ('1015', '73616', '29', 'RIOBLANCO');
INSERT INTO `municipios` VALUES ('1016', '73622', '29', 'RONCESVALLES');
INSERT INTO `municipios` VALUES ('1017', '73624', '29', 'ROVIRA');
INSERT INTO `municipios` VALUES ('1018', '73671', '29', 'SALDAÑA');
INSERT INTO `municipios` VALUES ('1019', '73675', '29', 'SAN ANTONIO');
INSERT INTO `municipios` VALUES ('1020', '73686', '29', 'SANTA ISABEL');
INSERT INTO `municipios` VALUES ('1021', '73854', '29', 'VALLE DE SAN JUAN');
INSERT INTO `municipios` VALUES ('1022', '73861', '29', 'VENADILLO');
INSERT INTO `municipios` VALUES ('1023', '73870', '29', 'VILLAHERMOSA');
INSERT INTO `municipios` VALUES ('1024', '73873', '29', 'VILLARRICA');
INSERT INTO `municipios` VALUES ('1025', '76001', '30', 'CALI');
INSERT INTO `municipios` VALUES ('1026', '76020', '30', 'ALCALÁ');
INSERT INTO `municipios` VALUES ('1027', '76036', '30', 'ANDALUCÍA');
INSERT INTO `municipios` VALUES ('1028', '76041', '30', 'ANSERMANUEVO');
INSERT INTO `municipios` VALUES ('1029', '76109', '30', 'BUENAVENTURA');
INSERT INTO `municipios` VALUES ('1030', '76111', '30', 'GUADALAJARA DE BUGA');
INSERT INTO `municipios` VALUES ('1031', '76113', '30', 'BUGALAGRANDE');
INSERT INTO `municipios` VALUES ('1032', '76122', '30', 'CAICEDONIA');
INSERT INTO `municipios` VALUES ('1033', '76126', '30', 'CALIMA');
INSERT INTO `municipios` VALUES ('1034', '76147', '30', 'CARTAGO');
INSERT INTO `municipios` VALUES ('1035', '76233', '30', 'DAGUA');
INSERT INTO `municipios` VALUES ('1036', '76243', '30', 'EL ÁGUILA');
INSERT INTO `municipios` VALUES ('1037', '76246', '30', 'EL CAIRO');
INSERT INTO `municipios` VALUES ('1038', '76248', '30', 'EL CERRITO');
INSERT INTO `municipios` VALUES ('1039', '76250', '30', 'EL DOVIO');
INSERT INTO `municipios` VALUES ('1040', '76275', '30', 'FLORIDA');
INSERT INTO `municipios` VALUES ('1041', '76306', '30', 'GINEBRA');
INSERT INTO `municipios` VALUES ('1042', '76318', '30', 'GUACARÍ');
INSERT INTO `municipios` VALUES ('1043', '76364', '30', 'JAMUNDÍ');
INSERT INTO `municipios` VALUES ('1044', '76377', '30', 'LA CUMBRE');
INSERT INTO `municipios` VALUES ('1045', '76497', '30', 'OBANDO');
INSERT INTO `municipios` VALUES ('1046', '76520', '30', 'PALMIRA');
INSERT INTO `municipios` VALUES ('1047', '76563', '30', 'PRADERA');
INSERT INTO `municipios` VALUES ('1048', '76616', '30', 'RIOFRÍO');
INSERT INTO `municipios` VALUES ('1049', '76622', '30', 'ROLDANILLO');
INSERT INTO `municipios` VALUES ('1050', '76736', '30', 'SEVILLA');
INSERT INTO `municipios` VALUES ('1051', '76823', '30', 'TORO');
INSERT INTO `municipios` VALUES ('1052', '76828', '30', 'TRUJILLO');
INSERT INTO `municipios` VALUES ('1053', '76834', '30', 'TULUÁ');
INSERT INTO `municipios` VALUES ('1054', '76845', '30', 'ULLOA');
INSERT INTO `municipios` VALUES ('1055', '76863', '30', 'VERSALLES');
INSERT INTO `municipios` VALUES ('1056', '76869', '30', 'VIJES');
INSERT INTO `municipios` VALUES ('1057', '76890', '30', 'YOTOCO');
INSERT INTO `municipios` VALUES ('1058', '76892', '30', 'YUMBO');
INSERT INTO `municipios` VALUES ('1059', '76895', '30', 'ZARZAL');
INSERT INTO `municipios` VALUES ('1060', '97001', '31', 'MITÚ');
INSERT INTO `municipios` VALUES ('1061', '97161', '31', 'CARURÚ');
INSERT INTO `municipios` VALUES ('1062', '97511', '31', 'PACOA');
INSERT INTO `municipios` VALUES ('1063', '97666', '31', 'TARAIRA');
INSERT INTO `municipios` VALUES ('1064', '97777', '31', 'PAPUNAUA');
INSERT INTO `municipios` VALUES ('1065', '97889', '31', 'YAVARATÉ');
INSERT INTO `municipios` VALUES ('1066', '99001', '32', 'PUERTO CARREÑO');
INSERT INTO `municipios` VALUES ('1067', '99524', '32', 'LA PRIMAVERA');
INSERT INTO `municipios` VALUES ('1068', '99624', '32', 'SANTA ROSALÍA');
INSERT INTO `municipios` VALUES ('1069', '99773', '32', 'CUMARIBO');
INSERT INTO `municipios` VALUES ('1074', '00', '7', 'PUERTO BOYACÁ');

-- ----------------------------
-- Table structure for tbl_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE `tbl_usuarios` (
  `Pk_Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(15) DEFAULT NULL,
  `Ciudad_Borrar` varchar(255) DEFAULT NULL,
  `Codigo_Afiliacion` varchar(10) DEFAULT NULL,
  `Codigo_Empleo` varchar(25) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Fk_Id_Usuario_Invitador` int(11) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Password` text,
  `Telefono` varchar(100) DEFAULT NULL,
  `Fk_Id_Municipio` int(11) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL COMMENT '1: Administrador; 2: Afiliado',
  `Consignacion` varchar(100) DEFAULT NULL,
  `Empresa` varchar(100) DEFAULT NULL,
  `Cheque` varchar(100) DEFAULT NULL,
  `Nombre_Empresa` varchar(100) DEFAULT NULL,
  `CE_Invitador` varchar(100) DEFAULT NULL,
  `Cedula_Invitador` varchar(100) DEFAULT NULL,
  `Tipo_Regalo_borrar` varchar(1) DEFAULT NULL,
  `Tipo_Afiliacion` varchar(1) DEFAULT NULL,
  `Telefono_Invitador` varchar(50) DEFAULT NULL,
  `Nombre_Invitador` varchar(125) DEFAULT NULL,
  `Fecha_Entrega_Volante` date DEFAULT NULL,
  `Fecha_Consignacion` date DEFAULT NULL,
  `Anios` tinyint(1) DEFAULT NULL,
  `Numero_Patrocinio` varchar(120) DEFAULT NULL,
  `Numero_Cupo` varchar(120) DEFAULT NULL,
  `Numero_Biblioteca` varchar(120) DEFAULT NULL,
  `Numero_Afiliado` varchar(120) DEFAULT NULL,
  `Nombre_Asesor` varchar(120) DEFAULT NULL,
  `Cedula_Asesor` varchar(100) DEFAULT NULL,
  `Telefono_Asesor` varchar(100) DEFAULT NULL,
  `Celular_Asesor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Usuario`),
  KEY `Fk_Id_Municipio` (`Fk_Id_Municipio`),
  CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`Fk_Id_Municipio`) REFERENCES `municipios` (`Pk_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_usuarios
-- ----------------------------
INSERT INTO `tbl_usuarios` VALUES ('1', '1423456', 'Medellín', '010203', 'Pendiente', 'Medellín', 'info@empleosystemthree.org', '2014-04-11 15:24:01', '1', 'Yarce Ochoa Martínez', '827ccb0eea8a706c4c34a16891f84e7b', '02550', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_usuarios` VALUES ('127', '1017177502', null, '161011', 'Pendiente', 'Carrera 52C # 88 - 49', 'johnarleycano@hotmail.com', '2017-07-28 00:00:00', null, 'John Sin referido', '827ccb0eea8a706c4c34a16891f84e7b', '3134587623', '42', null, '12345', '1990', null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_usuarios` VALUES ('128', '1017177503', null, '319519', 'Pendiente', 'Carrera 52C # 88 - 49', 'johnarleycano@hotmail.com', '2017-07-28 00:00:00', null, 'john empresarial', '827ccb0eea8a706c4c34a16891f84e7b', '3134587623', '42', null, null, 'asd', null, 'asd', null, null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_usuarios` VALUES ('129', '1017', null, '443970', '787903CE', 'Carrera 52C # 88 - 49', 'johnarleycano@hotmail.com', '2017-07-28 00:00:00', '1', 'john patrocinador', '827ccb0eea8a706c4c34a16891f84e7b', '3134587623', '42', null, '123', null, null, null, null, null, null, '5', null, null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `tbl_usuarios` VALUES ('130', '10171775024', null, '186768', 'Pendiente', 'Carrera 52C # 88 - 49', 'johnarleycano@hotmail.com', '2017-07-28 00:00:00', null, 'john patrocinador', '827ccb0eea8a706c4c34a16891f84e7b', '3134587623', '42', null, '5', '6', null, null, null, null, null, '5', null, null, null, null, null, '1', null, '3', '4', '7', null, null, null);
INSERT INTO `tbl_usuarios` VALUES ('131', '22', null, '956939', 'Pendiente', 'Carrera 52C, 88 - 49', 'johnarleycano@gmail.com', '2017-07-28 00:00:00', null, 'john p', '827ccb0eea8a706c4c34a16891f84e7b', '12', '169', null, '5', '6', null, null, null, null, null, '5', null, null, null, null, null, '1', null, '3', '4', '7', '8', '9', '10');

-- ----------------------------
-- Table structure for visitas_biblioteca
-- ----------------------------
DROP TABLE IF EXISTS `visitas_biblioteca`;
CREATE TABLE `visitas_biblioteca` (
  `Pk_Id_Visita` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`Pk_Id_Visita`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of visitas_biblioteca
-- ----------------------------
INSERT INTO `visitas_biblioteca` VALUES ('1', '2016-02-06 00:01:37', '181.138.127.50');
INSERT INTO `visitas_biblioteca` VALUES ('2', '2016-02-06 00:01:51', '181.138.127.50');
INSERT INTO `visitas_biblioteca` VALUES ('3', '2016-03-09 22:30:13', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('4', '2016-03-20 08:38:01', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('5', '2016-03-21 00:37:57', '66.249.64.222');
INSERT INTO `visitas_biblioteca` VALUES ('6', '2016-03-23 19:01:53', '66.249.64.227');
INSERT INTO `visitas_biblioteca` VALUES ('7', '2016-03-24 15:54:56', '136.243.48.82');
INSERT INTO `visitas_biblioteca` VALUES ('8', '2016-03-26 05:35:42', '66.249.64.227');
INSERT INTO `visitas_biblioteca` VALUES ('9', '2016-03-26 17:05:53', '207.46.13.152');
INSERT INTO `visitas_biblioteca` VALUES ('10', '2016-03-27 09:36:41', '207.46.13.152');
INSERT INTO `visitas_biblioteca` VALUES ('11', '2016-03-27 12:15:28', '207.46.13.152');
INSERT INTO `visitas_biblioteca` VALUES ('12', '2016-03-30 23:45:44', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('13', '2016-04-03 16:26:00', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('14', '2016-04-05 00:36:03', '69.58.178.58');
INSERT INTO `visitas_biblioteca` VALUES ('15', '2016-04-06 15:54:17', '66.249.64.232');
INSERT INTO `visitas_biblioteca` VALUES ('16', '2016-04-10 15:55:17', '66.249.64.232');
INSERT INTO `visitas_biblioteca` VALUES ('17', '2016-04-11 16:52:19', '66.249.64.222');
INSERT INTO `visitas_biblioteca` VALUES ('18', '2016-04-11 22:51:06', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('19', '2016-04-11 22:51:27', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('20', '2016-04-12 19:44:51', '66.249.64.227');
INSERT INTO `visitas_biblioteca` VALUES ('21', '2016-04-12 21:57:35', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('22', '2016-04-13 02:50:49', '40.77.167.61');
INSERT INTO `visitas_biblioteca` VALUES ('23', '2016-04-13 14:14:22', '190.70.85.113');
INSERT INTO `visitas_biblioteca` VALUES ('24', '2016-04-13 23:50:27', '186.83.228.85');
INSERT INTO `visitas_biblioteca` VALUES ('25', '2016-04-14 21:48:48', '66.249.64.222');
INSERT INTO `visitas_biblioteca` VALUES ('26', '2016-04-16 00:43:42', '66.249.64.222');
INSERT INTO `visitas_biblioteca` VALUES ('27', '2016-04-17 18:29:57', '66.249.64.222');
INSERT INTO `visitas_biblioteca` VALUES ('28', '2016-04-18 16:39:37', '66.249.64.232');
INSERT INTO `visitas_biblioteca` VALUES ('29', '2016-04-23 12:14:12', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('30', '2016-04-23 12:15:36', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('31', '2016-05-02 19:31:44', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('32', '2016-09-05 16:13:52', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('33', '2016-10-10 22:00:50', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('34', '2016-11-08 19:07:35', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('35', '2016-11-08 19:08:29', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('36', '2016-11-08 19:08:40', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('37', '2016-11-09 09:39:52', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('38', '2016-11-09 09:40:36', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('39', '2016-11-09 09:40:50', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('40', '2016-11-09 09:41:02', '::1');
INSERT INTO `visitas_biblioteca` VALUES ('41', '2016-12-26 15:08:39', '::1');
