-- Añadir un país

INSERT INTO paises (pais_id, nombre) VALUES ('NEW', 'New Pais');

-- Añadir ciudad

INSERT INTO ciudades (ciudad_id, nombre) VALUES ('NEW', 'New City');

-- Añadir Sucursal

INSERT INTO sucursales (sucursal_id, nombre, ciudad_id) VALUES ('NEW', 'New Sucursal', 'BOG');

-- Añadir Cliente

INSERT INTO clientes (cliente_id, nombre, email, ciudad_id) VALUES ('NEW', 'New Client', 'newemail@gmail.com', 'MOS');

-- Añadir Telefono cliente

INSERT INTO telefonos_clientes (numero, cliente_id) VALUES ('3158421073', 'NEW');

-- Añadir Paquete 
-- NOTA: Primero hay que añadir un Tipo y un Estado

INSERT INTO paquetes (peso, dimensiones, contenido, valor_declarado, tipo_id, estado_id) VALUES (5.45, '15x15x15', 'News Objects', 200.55, 'TS1', 'ES1');

-- Añdir Envio
-- NOTA: Primero hay que añadir una Ruta

INSERT INTO envios (fecha_envio, ciudad_id, ruta_id, jornada_id, cliente_id, paquete_id, sucursal_id) 
VALUES ('2022-04-20 11:11:11', 'MTY', 2, 'TAR' ,'CL1', 4, 'SU1');

-- Añadir Vehículos
-- NOTA: Primero se debe añadir un Modelo y por lo tanto una Marca para el modelo.

INSERT INTO vehiculos (placa, capacidad_carga, modelo_id) VALUES ('SXI031', 2500.45, 'MD1');

-- Añadir Conductores

INSERT INTO conductores (conductor_id, nombre) VALUES ('NEW000', 'New Conductor');

-- Añadir Telefonos Conductores

INSERT INTO telefonos_conductores (numero, conductor_id) VALUES ('1231231235', 'NEW000');

-- Añadir Conductor a Ruta y Vehiculo
-- NOTA: Primero se debe añadir una Ruta
INSERT INTO conductores_rutas (conductor_id, ruta_id, vehiculo_id, sucursal_id, jornada_id) VALUES
('CON001', 1, 1, 'SU1', 'MAN');

-- Añadir Auxiliares

INSERT INTO auxiliares (auxiliar_id, nombre) VALUES ('NEW000', 'New Auxiliar');

-- Añadir Auxiliares a Rutas

INSERT INTO ruta_auxiliares (ruta_id, auxiliar_id) VALUES (1, 'NEW000');

-- Añadir Seguimientos
-- NOTA: Antes se debe añadir un estado
INSERT INTO seguimientos (fecha_hora, ciudad_id, paquete_id, estado_id) 
VALUES ('2006-01-01 11:55:11', 'OSA', 6, 'ES3');

-- Añadir Envios
-- Busca el cliente NEW y sus envios

SELECT
env.cliente_id,
cli.nombre,
env.fecha_envio,
env.ciudad_id,
env.paquete_id
FROM envios env
INNER JOIN clientes cli ON env.cliente_id = cli.cliente_id
WHERE cli.cliente_id = 'NEW';

-- Actualizar estado de paquete
-- Cambia el estado al paquete con la id = 1

UPDATE paquetes SET estado_id = 'ES1' WHERE paquete_id = 1;

-- Rastrear ubicacion de un paquete

SELECT seg.fecha_hora, seg.ciudad_id, dseg.calle, dseg.carrera
FROM seguimientos seg
JOIN direcciones_seguimientos dseg ON seg.seguimiento_id = dseg.seguimiento_id
WHERE seg.paquete_id = 5;

-- Informacion Completa Envíos

SELECT
	env.envio_id,
    env.fecha_envio,
    env.ciudad_id AS ciudad_envio,
	cli.cliente_id AS cliente_id,
    cli.nombre AS cliente_nombre,
    cli.email AS cliente_email,
    paq.paquete_id,
    paq.peso AS peso_paq,
    paq.dimensiones AS dimensiones_paq,
    paq.contenido AS contenido_paq,
    paq.valor_declarado AS price_paq,
    paq.tipo_id AS tipo_paq,
    paq.estado_id AS estado_paq,
    env.jornada_id,
    rut.nombre AS nombre_ruta,
    conrut.conductor_id
FROM
	envios env
    INNER JOIN clientes cli ON env.cliente_id = cli.cliente_id
    INNER JOIN paquetes paq ON env.paquete_id = paq.paquete_id
    INNER JOIN rutas rut ON env.ruta_id = rut.ruta_id
    INNER JOIN conductores_rutas conrut ON env.ruta_id = conrut.ruta_id AND env.jornada_id = conrut.jornada_id;


-- Historial Envios por cliente

SELECT
	env.envio_id,
    env.fecha_envio AS fecha_envio,
    env.ciudad_id AS ciudad_envio,
    env.ruta_id AS ruta_envio,
    env.jornada_id AS jornada_envio,
    cli.nombre AS nombre_cliente,
    paq.paquete_id,
    paq.peso AS paq_peso,
    paq.dimensiones AS paq_dimensiones,
    paq.contenido AS paq_contenido,
    paq.valor_declarado AS paq_price,
    paq.tipo_id AS paq_tipo,
    seg.seguimiento_id,
    seg.ciudad_id AS ciudad_seguimiento,
    seg.estado_id AS estado_seguimiento
    
FROM envios env
	INNER JOIN clientes cli ON env.cliente_id = cli.cliente_id
    INNER JOIN paquetes paq ON env.paquete_id = paq.paquete_id
    INNER JOIN seguimientos seg ON paq.paquete_id = seg.paquete_id
WHERE
	env.cliente_id = 'CL1';

-- Ver conductores, rutas, vehiculos y sucursales

SELECT 
    cond.conductor_id,
    cond.nombre AS nombre_conductor,
    rut.nombre AS nombre_ruta,
    condrut.vehiculo_id,
    veh.placa AS placa_vehiculo,
    condrut.sucursal_id,
    suc.nombre AS nombre_sucursal
FROM conductores cond
    INNER JOIN conductores_rutas condrut ON cond.conductor_id = condrut.conductor_id
    INNER JOIN rutas rut ON condrut.ruta_id = rut.ruta_id
    INNER JOIN vehiculos veh ON condrut.vehiculo_id = veh.vehiculo_id
    INNER JOIN sucursales suc ON condrut.sucursal_id = suc.sucursal_id;

-- Detalles rutas y auxiliares

SELECT
	rut.ruta_id,
    rut.nombre AS nombre_ruta,
    rutaux.auxiliar_id,
    aux.nombre AS nombre_auxiliar
FROM rutas rut
    INNER JOIN ruta_auxiliares rutaux ON rut.ruta_id = rutaux.ruta_id
    INNER JOIN auxiliares aux ON rutaux.auxiliar_id = aux.auxiliar_id;

-- Paquetes por sucursal y estado

SELECT 
  suc.sucursal_id,
  suc.nombre AS nombre_sucursal,
  suc.ciudad_id AS ciudad_sucursal,
  env.paquete_id,
  paq.contenido AS contenido_paquete,
  paq.estado_id AS estado_paquete
FROM sucursales suc
  INNER JOIN envios env ON suc.sucursal_id = env.sucursal_id
  INNER JOIN paquetes paq ON env.paquete_id = paq.paquete_id
GROUP BY 
    suc.sucursal_id,
    suc.nombre,
    suc.ciudad_id,
    env.paquete_id,
    paq.contenido,
    paq.estado_id;

-- Informacion completa de un paquete y su seguimiento

SELECT 
	paq.paquete_id,
    env.cliente_id,
    paq.peso AS paq_peso,
    paq.dimensiones AS paq_dimensiones,
    paq.contenido AS paq_contenido,
    paq.valor_declarado AS paq_price,
    paq.tipo_id AS paq_tipo,
    paq.estado_id AS paq_estado,
    seg.seguimiento_id,
    seg.fecha_hora AS seg_fecha_hora,
    seg.ciudad_id AS ciudad_seguimiento,
    seg.estado_id AS estado_seguimiento
FROM paquetes paq
	INNER JOIN envios env ON paq.paquete_id = env.paquete_id
	INNER JOIN seguimientos seg ON paq.paquete_id = seg.paquete_id;


-- Paquetes enviados dentro de un rango de fechas

SELECT 
	env.envio_id,
    env.fecha_envio,
    paq.paquete_id,
    paq.contenido,
    paq.estado_id
FROM envios env
	INNER JOIN paquetes paq ON env.paquete_id = paq.paquete_id
    WHERE fecha_envio BETWEEN '2024-06-19 10:00:00' AND '2024-06-21 12:45:00';


-- Paquetes con ciertos estados

SELECT
	paq.paquete_id,
    paq.peso,
    paq.dimensiones,
    paq.contenido,
    paq.valor_declarado AS price,
    paq.tipo_id,
    paq.estado_id
FROM paquetes paq
    WHERE paq.estado_id IN ('ES1', 'ES2');


-- Paquetes excluyendo ciertos estados

SELECT
	paq.paquete_id,
    paq.peso,
    paq.dimensiones,
    paq.contenido,
    paq.valor_declarado AS price,
    paq.tipo_id,
    paq.estado_id
FROM paquetes paq
    WHERE paq.estado_id NOT IN ('ES1', 'ES2');

-- Clientes con envios dentro de un rango de fechas

SELECT
	cli.cliente_id,
    cli.nombre AS nombre_cliente,
    cli.email AS email_cliente,
    cli.ciudad_id AS ciudad_cliente,
    env.fecha_envio
    
FROM clientes cli
	INNER JOIN envios env ON cli.cliente_id = env.cliente_id
	WHERE env.fecha_envio BETWEEN '2024-06-20 11:30:00' AND '2024-06-21 12:45:00';

-- Conductores sin asignar a rutas

INSERT INTO conductores (conductor_id, nombre) VALUES ('LIB888', 'Jose Martínez');

SELECT
    cond.conductor_id,
    cond.nombre AS conductor_nombre
FROM conductores cond
    LEFT JOIN conductores_rutas condrut ON cond.conductor_id = condrut.conductor_id
    WHERE condrut.conductor_id IS NULL;

-- Paquetes entre precios especificos

SELECT
	paq.paquete_id,
    paq.peso,
    paq.dimensiones,
    paq.contenido,
    paq.valor_declarado AS price,
    paq.tipo_id,
    paq.estado_id
FROM paquetes paq
	WHERE paq.valor_declarado BETWEEN 75 AND 100;

-- Auxiliares en rutas especificas

SELECT
	aux.auxiliar_id,
    aux.nombre AS nombre_auxiliar,
    telaux.numero AS telefono_auxiliar,
    rut.nombre AS nombre_ruta_auxiliar

FROM auxiliares aux
	INNER JOIN telefonos_auxiliares telaux ON aux.auxiliar_id = telaux.auxiliar_id
    INNER JOIN ruta_auxiliares rutaux ON aux.auxiliar_id = rutaux.auxiliar_id
    INNER JOIN rutas rut ON rutaux.ruta_id = rut.ruta_id
    WHERE rut.ruta_id = 1;


-- Envios excluyendo ciertas ciudades

SELECT
	env.envio_id,
    env.fecha_envio,
    env.cliente_id,
    env.sucursal_id,
    env.ciudad_id
FROM envios env
	WHERE ciudad_id NOT IN ('BOG', 'MED');

-- Seguimientos en rango de fechas

SELECT
	seg.seguimiento_id,
    seg.fecha_hora,
    seg.ciudad_id,
    seg.paquete_id,
    seg.estado_id
FROM seguimientos seg
	WHERE seg.fecha_hora BETWEEN '2024-06-19 13:15:00' AND '2024-06-19 16:00:00';

-- Clientes con ciertos tipos de paquetes

SELECT
	cli.cliente_id,
    cli.nombre AS nombre_cliente,
    cli.email AS email_cliente,
    telcli.numero AS telefono_cliente,
    cli.ciudad_id,
    paq.contenido,
    tipserv.tipo_id,
    tipserv.nombre AS tipo_paquete

FROM clientes cli
	INNER JOIN telefonos_clientes telcli ON cli.cliente_id = telcli.cliente_id
    INNER JOIN envios env ON cli.cliente_id = env.cliente_id
    INNER JOIN paquetes paq ON env.paquete_id = paq.paquete_id
    INNER JOIN tipos_servicios tipserv ON paq.tipo_id = tipserv.tipo_id
    WHERE tipserv.tipo_id = 'TS3';