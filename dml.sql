-- INSERTS ----------------------------------------------------------

-- Paises

INSERT INTO paises (pais_id, nombre) VALUES 
('ARG', 'Argentina'),
('AUS', 'Australia'),
('BRA', 'Brasil'),
('CAN', 'Canadá'),
('CHL', 'Chile'),
('CHN', 'China'),
('COL', 'Colombia'),
('CRI', 'Costa Rica'),
('CUB', 'Cuba'),
('DNK', 'Dinamarca'),
('EGY', 'Egipto'),
('FRA', 'Francia'),
('DEU', 'Alemania'),
('GHA', 'Ghana'),
('IND', 'India'),
('IDN', 'Indonesia'),
('ITA', 'Italia'),
('JPN', 'Japón'),
('KEN', 'Kenia'),
('MEX', 'México'),
('NGA', 'Nigeria'),
('NOR', 'Noruega'),
('PAK', 'Pakistán'),
('PER', 'Perú'),
('PHL', 'Filipinas'),
('RUS', 'Rusia'),
('SAU', 'Arabia Saudita'),
('ZAF', 'Sudáfrica'),
('KOR', 'Corea del Sur'),
('ESP', 'España');

-- Jornada ID

INSERT INTO jornadas (jornada_id, horario) VALUES
('MAN', '06:00:00'),
('TAR', '12:00:00'),
('NOC', '17:00:00');

-- Conductores

INSERT INTO conductores (conductor_id, nombre) VALUES
('CON001', 'Juan Pérez'),
('CON002', 'María López'),
('CON003', 'Carlos Martínez'),
('CON004', 'Ana Rodríguez'),
('CON005', 'Pedro Gómez');

-- Auxiliares

INSERT INTO auxiliares (auxiliar_id, nombre) VALUES
('AUX001', 'Luisa García'),
('AUX002', 'Javier Pérez'),
('AUX003', 'Ana Martínez'),
('AUX004', 'Carlos Rodríguez'),
('AUX005', 'Laura Gómez');

-- Rutas

INSERT INTO rutas (nombre) VALUES
('Ruta 1'),
('Ruta 2'),
('Ruta 3'),
('Ruta 4'),
('Ruta 5'),
('Ruta 6');

-- tipos_servicios

INSERT INTO tipos_servicios (tipo_id, nombre) VALUES
('TS1', 'Express'),
('TS2', 'Estándar'),
('TS3', 'Económico');

-- Estados

INSERT INTO estados (estado_id, nombre) VALUES
('ES1', 'Activo'),
('ES2', 'Inactivo'),
('ES3', 'En proceso');

-- Marcas

INSERT INTO marcas (marca_id, nombre) VALUES
('TOY', 'Toyota'),
('HON', 'Honda'),
('FOR', 'Ford');

-- Modelos

INSERT INTO modelos (modelo_id, nombre, marca_id) VALUES
('MD1', 'Corolla', 'TOY'),
('MD2', 'Civic', 'HON'),
('MD3', 'Focus', 'FOR'),
('MD4', 'Camry', 'TOY'),
('MD5', 'Accord', 'HON');

-- Vehiculos

INSERT INTO vehiculos (placa, capacidad_carga, modelo_id) VALUES
('ABC123', 1500.00, 'MD1'),
('XYZ789', 2000.50, 'MD2'),
('DEF456', 1800.75, 'MD3'),
('GHI789', 2500.25, 'MD1'),
('JKL012', 2200.00, 'MD2');

-- Ciudades

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('BUE', 'Buenos Aires', 'ARG'),
('COR', 'Córdoba', 'ARG'),
('ROS', 'Rosario', 'ARG');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('SYD', 'Sídney', 'AUS'),
('MEL', 'Melbourne', 'AUS'),
('BRI', 'Brisbane', 'AUS');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('RIO', 'Río de Janeiro', 'BRA'),
('SAO', 'São Paulo', 'BRA'),
('BEL', 'Belo Horizonte', 'BRA');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('TOR', 'Toronto', 'CAN'),
('VAN', 'Vancouver', 'CAN'),
('MTL', 'Montreal', 'CAN');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('SCL', 'Santiago', 'CHL'),
('CON', 'Concepción', 'CHL'),
('VAL', 'Valparaíso', 'CHL');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('PEK', 'Pekín', 'CHN'),
('SHA', 'Shanghái', 'CHN'),
('CAN', 'Guangzhou', 'CHN');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('BOG', 'Bogotá', 'COL'),
('MED', 'Medellín', 'COL'),
('CAL', 'Cali', 'COL');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('SJO', 'San José', 'CRI'),
('LIM', 'Liberia', 'CRI'),
('PUN', 'Puntarenas', 'CRI');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('HAV', 'La Habana', 'CUB'),
('SAN', 'Santiago de Cuba', 'CUB'),
('CIE', 'Cienfuegos', 'CUB');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('CPH', 'Copenhague', 'DNK'),
('AAR', 'Aarhus', 'DNK'),
('ODS', 'Odense', 'DNK');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('CAI', 'El Cairo', 'EGY'),
('ALE', 'Alejandría', 'EGY'),
('LUX', 'Luxor', 'EGY');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('PAR', 'París', 'FRA'),
('MAR', 'Marsella', 'FRA'),
('LIO', 'Lyon', 'FRA');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('BER', 'Berlín', 'DEU'),
('HAM', 'Hamburgo', 'DEU'),
('MUN', 'Múnich', 'DEU');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('ACC', 'Accra', 'GHA'),
('KUM', 'Kumasi', 'GHA'),
('TAM', 'Tamale', 'GHA');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('DEL', 'Delhi', 'IND'),
('MUM', 'Bombay', 'IND'),
('BAN', 'Bangalore', 'IND');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('JAK', 'Yakarta', 'IDN'),
('SUY', 'Surabaya', 'IDN'),
('MDN', 'Medan', 'IDN');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('ROM', 'Roma', 'ITA'),
('MIL', 'Milán', 'ITA'),
('NAP', 'Nápoles', 'ITA');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('TYO', 'Tokio', 'JPN'),
('OSA', 'Osaka', 'JPN'),
('NAG', 'Nagoya', 'JPN');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('NAI', 'Nairobi', 'KEN'),
('MOM', 'Mombasa', 'KEN'),
('KIS', 'Kisumu', 'KEN');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('CMX', 'Ciudad de México', 'MEX'),
('GDL', 'Guadalajara', 'MEX'),
('MTY', 'Monterrey', 'MEX');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('LOS', 'Lagos', 'NGA'),
('ABU', 'Abuja', 'NGA'),
('POR', 'Port Harcourt', 'NGA');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('OSL', 'Oslo', 'NOR'),
('BEG', 'Bergen', 'NOR'),
('STA', 'Stavanger', 'NOR');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('ISL', 'Islamabad', 'PAK'),
('KAR', 'Karachi', 'PAK'),
('LAH', 'Lahore', 'PAK');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('LIA', 'Lima', 'PER'),
('ARE', 'Arequipa', 'PER'),
('CUS', 'Cusco', 'PER');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('MNL', 'Manila', 'PHL'),
('CEB', 'Cebú', 'PHL'),
('DAV', 'Davao', 'PHL');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('MOS', 'Moscú', 'RUS'),
('SPE', 'San Petersburgo', 'RUS'),
('NIZ', 'Nizhni Nóvgorod', 'RUS');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('RUI', 'Riad', 'SAU'),
('JED', 'Jeddah', 'SAU'),
('DAH', 'Dammam', 'SAU');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('JNB', 'Johannesburgo', 'ZAF'),
('CPT', 'Ciudad del Cabo', 'ZAF'),
('DUR', 'Durban', 'ZAF');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('SEL', 'Seúl', 'KOR'),
('BUS', 'Busan', 'KOR'),
('INC', 'Incheon', 'KOR');

INSERT INTO ciudades (ciudad_id, nombre, pais_id) VALUES 
('MAD', 'Madrid', 'ESP'),
('BCN', 'Barcelona', 'ESP'),
('VLE', 'Valencia', 'ESP');

-- Sucursales

INSERT INTO sucursales (sucursal_id, nombre, ciudad_id) VALUES
('SU1', 'Sucursal A', 'BOG'),
('SU2', 'Sucursal B', 'BCN'),
('SU3', 'Sucursal C', 'MED'),
('SU4', 'Sucursal D', 'OSA'),
('SU5', 'Sucursal E', 'MOS'); 

-- direcciones_sucursales

INSERT INTO direcciones_sucursales (calle, carrera, sucursal_id) VALUES
('Calle 1', 'Carrera 1', 'SU1'),
('Calle 2', 'Carrera 2', 'SU2'),
('Calle 3', 'Carrera 3', 'SU3'),
('Calle 4', 'Carrera 4', 'SU4'),
('Calle 5', 'Carrera 5', 'SU5');

-- Clientes

INSERT INTO clientes (cliente_id, nombre, email, ciudad_id) VALUES
('CL1', 'Cliente A', 'clienteA@example.com', 'BOG'),
('CL2', 'Cliente B', 'clienteB@example.com', 'BCN'),
('CL3', 'Cliente C', 'clienteC@example.com', 'MED'),
('CL4', 'Cliente D', 'clienteD@example.com', 'OSA'),
('CL5', 'Cliente E', 'clienteE@example.com', 'MOS');

-- Direcciones clientes

INSERT INTO direcciones_clientes (calle, carrera, cliente_id) VALUES
('Calle 1 cliente', 'Carrera 1 cliente', 'CL3'),
('Calle 2 cliente', 'Carrera 2 cliente', 'CL2'),
('Calle 3 cliente', 'Carrera 3 cliente', 'CL1'),
('Calle 4 cliente', 'Carrera 4 cliente', 'CL4'),
('Calle 5 cliente', 'Carrera 5 cliente', 'CL5');

-- Telefonos clientes

INSERT INTO telefonos_clientes (numero, cliente_id) VALUES
('1234567890', 'CL1'),
('2345678901', 'CL2'),
('3456789012', 'CL3'),
('4567890123', 'CL4'),
('5678901234', 'CL5');

-- Telefonos conductores

INSERT INTO telefonos_conductores (numero, conductor_id) VALUES
('1111111111', 'CON001'),
('2222222222', 'CON002'),
('3333333333', 'CON003'),
('4444444444', 'CON004'),
('5555555555', 'CON005');

-- Telefonos auxiliares

INSERT INTO telefonos_auxiliares (numero, auxiliar_id) VALUES
('6666666666', 'AUX001'),
('7777777777', 'AUX002'),
('8888888888', 'AUX003'),
('9999999999', 'AUX004'),
('5500550055', 'AUX005');

-- Paquetes

INSERT INTO paquetes (peso, dimensiones, contenido, valor_declarado, tipo_id, estado_id) VALUES
(5.25, '15x10x8', 'Libros', 100.00, 'TS1', 'ES1'),
(3.50, '12x8x6', 'Ropa', 75.00, 'TS2', 'ES1'),
(7.80, '18x12x10', 'Electrónicos', 200.00, 'TS3', 'ES3'),
(2.00, '8x6x4', 'Cosméticos', 50.00, 'TS3', 'ES2'),
(4.60, '14x10x7', 'Juguetes', 80.00, 'TS1', 'ES1');

-- Seguimientos

INSERT INTO seguimientos (fecha_hora, ciudad_id, paquete_id, estado_id) VALUES
('2024-06-19 10:00:00', 'BOG' ,1, 'ES1'),
('2024-06-19 11:30:00', 'BCN' ,2, 'ES2'),
('2024-06-19 13:15:00', 'MED' ,3, 'ES3'),
('2024-06-19 14:45:00', 'OSA' ,4, 'ES1'),
('2024-06-19 16:00:00', 'MOS' ,5, 'ES2');

-- Direcciones seguimientos

INSERT INTO direcciones_seguimientos (calle, carrera, seguimiento_id) VALUES
('Calle 1', 'Carrera 2', 1),
('Avenida Principal', 'Carrera 5', 2),
('Calle Central', 'Avenida Norte', 3),
('Avenida Sur', 'Calle 10', 4),
('Carrera 15', 'Avenida Este', 5);

-- Conductores - Rutas

INSERT INTO conductores_rutas (conductor_id, ruta_id, vehiculo_id, sucursal_id, jornada_id) VALUES
('CON001', 1, 1, 'SU1', 'MAN'),
('CON002', 2, 2, 'SU2', 'TAR'),
('CON003', 3, 3, 'SU3', 'NOC'),
('CON004', 1, 4, 'SU4', 'TAR'),  
('CON005', 2, 5, 'SU5', 'NOC');

-- Auxiliares - Rutas

INSERT INTO ruta_auxiliares (ruta_id, auxiliar_id) VALUES
(1, 'AUX001'),
(2, 'AUX002'),
(1, 'AUX003'),
(3, 'AUX004'),
(2, 'AUX005');

-- Envios

INSERT INTO envios (fecha_envio, ciudad_id, ruta_id, jornada_id, cliente_id, paquete_id, sucursal_id) VALUES
('2024-06-19 10:00:00', 'BOG', 1, 'MAN' 'CL1', 1, 'SU1'),
('2024-06-20 11:30:00', 'MED', 3, 'TAR' 'CL2', 2, 'SU2'),
('2024-06-21 12:45:00', 'MOS', 5, 'NOC' 'CL3', 3, 'SU3');

-- Direcciones envios

INSERT INTO direcciones_envios (calle, carrera, envio_id) VALUES
('Calle 1', 'Carrera 2', 1),
('Avenida Principal', 'Calle 3', 2),
('Carrera 4', 'Avenida Secundaria', 3);