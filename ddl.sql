-- DDL

-- Crear DB

CREATE DATABASE logistica;

-- Entrar a la DB "Logistica"

USE logistica;

-- Tablas

CREATE TABLE paises(
    pais_id VARCHAR(3),
    nombre VARCHAR(30),
    CONSTRAINT pk_id_paises PRIMARY KEY (pais_id)
);

CREATE TABLE jornadas(
    jornada_id VARCHAR(3),
    horario TIME,
    CONSTRAINT pk_id_jornadas PRIMARY KEY (jornada_id)
);

CREATE TABLE rutas(
    ruta_id INT(5) AUTO_INCREMENT,
    nombre VARCHAR(30),
    CONSTRAINT pk_id_rutas PRIMARY KEY (ruta_id)
);

CREATE TABLE tipos_servicios(
    tipo_id VARCHAR(3),
    nombre VARCHAR(10),
    CONSTRAINT pk_id_tipos_servicios PRIMARY KEY (tipo_id)
);

CREATE TABLE estados(
    estado_id VARCHAR(3),
    nombre VARCHAR(15),
    CONSTRAINT pk_id_estados PRIMARY KEY (estado_id)
);

CREATE TABLE marcas(
    marca_id VARCHAR(3),
    nombre VARCHAR(20),
    CONSTRAINT pk_id_marcas PRIMARY KEY (marca_id)
);

-- Tablas 2°

CREATE TABLE conductores(
    conductor_id VARCHAR(10),
    nombre VARCHAR(30),
    CONSTRAINT pk_id_conductores PRIMARY KEY (conductor_id)
);

CREATE TABLE auxiliares(
    auxiliar_id VARCHAR(10),
    nombre VARCHAR(30),
    CONSTRAINT pk_id_auxiliares PRIMARY KEY (auxiliar_id)
);

CREATE TABLE modelos (
    modelo_id VARCHAR(3),
    nombre VARCHAR(20),
    marca_id VARCHAR(3),

    CONSTRAINT pk_id_modelos PRIMARY KEY (modelo_id),
    CONSTRAINT fk_modelos_marcas FOREIGN KEY (marca_id) REFERENCES marcas (marca_id)
);

CREATE TABLE vehiculos (
    vehiculo_id INT(5) AUTO_INCREMENT,
    placa VARCHAR(8),
    capacidad_carga DECIMAL(10, 2),
    modelo_id VARCHAR(3),

    CONSTRAINT pk_id_vehiculos PRIMARY KEY (vehiculo_id),
    CONSTRAINT fk_vehiculos_modelos FOREIGN KEY (modelo_id) REFERENCES modelos (modelo_id)
);

CREATE TABLE ciudades(
    ciudad_id VARCHAR(3),
    nombre VARCHAR(30),
    pais_id VARCHAR(3),

    CONSTRAINT pk_id_ciudades PRIMARY KEY (ciudad_id),
    CONSTRAINT fk_ciudades_paises FOREIGN KEY (pais_id) REFERENCES paises (pais_id)
);

CREATE TABLE sucursales(
    sucursal_id VARCHAR(3),
    nombre VARCHAR(30),
    ciudad_id VARCHAR(3),

    CONSTRAINT pk_id_sucursales PRIMARY KEY (sucursal_id),
    CONSTRAINT fk_sucursales_ciudades FOREIGN KEY (ciudad_id) REFERENCES ciudades (ciudad_id)
);

CREATE TABLE direcciones_sucursales(
    direccion_id INT(5) AUTO_INCREMENT,
    calle VARCHAR(30) NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    sucursal_id VARCHAR(3),

    CONSTRAINT pk_id_direcciones_sucursales PRIMARY KEY (direccion_id),
    CONSTRAINT fk_dir_sucursales_sucursales FOREIGN KEY (sucursal_id) REFERENCES sucursales (sucursal_id)
);

CREATE TABLE clientes(
    cliente_id VARCHAR(10),
    nombre VARCHAR(30),
    email VARCHAR(30),
    ciudad_id VARCHAR(3),

    CONSTRAINT pk_id_clientes PRIMARY KEY (cliente_id),
    CONSTRAINT fk_clientes_ciudades FOREIGN KEY (ciudad_id) REFERENCES ciudades (ciudad_id)
);

CREATE TABLE direcciones_clientes(
    direccion_id INT(5) AUTO_INCREMENT,
    calle VARCHAR(30) NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    cliente_id VARCHAR(10),

    CONSTRAINT pk_id_direcciones_clientes PRIMARY KEY (direccion_id),
    CONSTRAINT fk_dir_clientes_clientes FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id)
);

CREATE TABLE telefonos_clientes(
    telefono_id INT(5) AUTO_INCREMENT,
    numero VARCHAR(10),
    cliente_id VARCHAR(10),

    CONSTRAINT pk_id_telefonos_clientes PRIMARY KEY (telefono_id),
    CONSTRAINT fk_tel_clientes_clientes FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id)
);

CREATE TABLE telefonos_conductores(
    telefono_id INT(5) AUTO_INCREMENT,
    numero VARCHAR(10),
    conductor_id VARCHAR(10),

    CONSTRAINT pk_id_telefonos_conductores PRIMARY KEY (telefono_id),
    CONSTRAINT fk_tel_conductores_conductores FOREIGN KEY (conductor_id) REFERENCES conductores (conductor_id)
);

CREATE TABLE telefonos_auxiliares(
    telefono_id INT(5) AUTO_INCREMENT,
    numero VARCHAR(10),
    auxiliar_id VARCHAR(10),

    CONSTRAINT pk_id_telefonos_auxiliares PRIMARY KEY (telefono_id),
    CONSTRAINT fk_tel_auxiliares_auxiliares FOREIGN KEY (auxiliar_id) REFERENCES auxiliares (auxiliar_id)
);

-- Tablas 3°

CREATE TABLE paquetes(
    paquete_id INT(5) AUTO_INCREMENT,
    peso DECIMAL(10, 2),
    dimensiones VARCHAR(10),
    contenido TEXT,
    valor_declarado DECIMAL(10, 2),
    tipo_id VARCHAR(3),
    estado_id VARCHAR(3),

    CONSTRAINT pk_id_paquetes PRIMARY KEY (paquete_id),
    CONSTRAINT fk_paquetes_tip_servicios FOREIGN KEY (tipo_id) REFERENCES tipos_servicios (tipo_id),
    CONSTRAINT fk_paquetes_estados FOREIGN KEY (estado_id) REFERENCES estados (estado_id)
);

CREATE TABLE seguimientos (
    seguimiento_id INT(5) AUTO_INCREMENT,
    fecha_hora TIMESTAMP,
    ciudad_id VARCHAR(3),
    paquete_id INT(5),
    estado_id VARCHAR(3),

    CONSTRAINT pk_id_seguimientos PRIMARY KEY (seguimiento_id),
    CONSTRAINT fk_dir_seguimientos_ciudades FOREIGN KEY (ciudad_id) REFERENCES ciudades (ciudad_id),
    CONSTRAINT fk_seguimientos_paquetes FOREIGN KEY (paquete_id) REFERENCES paquetes (paquete_id),
    CONSTRAINT fk_seguimientos_estados FOREIGN KEY (estado_id) REFERENCES estados (estado_id)
);

CREATE TABLE direcciones_seguimientos (
    direccion_id INT(5) AUTO_INCREMENT,
    calle VARCHAR(30) NOT NULL,
    carrera VARCHAR(30) NOT NULL,
    seguimiento_id INT(5),
    
    CONSTRAINT pk_id_direccion_seguimientos PRIMARY KEY (direccion_id),
    CONSTRAINT fk_dir_seguimientos_seguimientos FOREIGN KEY (seguimiento_id) REFERENCES seguimientos (seguimiento_id)
);

CREATE TABLE conductores_rutas(
    conductor_id VARCHAR(10),
    ruta_id INT(5),
    vehiculo_id INT(5),
    sucursal_id VARCHAR(3),
    jornada_id VARCHAR(3),

    CONSTRAINT fk_cond_rutas_conductores FOREIGN KEY (conductor_id) REFERENCES conductores (conductor_id),
    CONSTRAINT fk_cond_rutas_rutas FOREIGN KEY (ruta_id) REFERENCES rutas (ruta_id),
    CONSTRAINT fk_cond_rutas_vehiculos FOREIGN KEY (vehiculo_id) REFERENCES vehiculos (vehiculo_id),
    CONSTRAINT fk_cond_rutas_sucursales FOREIGN KEY (sucursal_id) REFERENCES sucursales (sucursal_id),
    CONSTRAINT fk_cond_rutas_jornadas FOREIGN KEY (jornada_id) REFERENCES jornadas (jornada_id),
    CONSTRAINT unique_ruta_jornada UNIQUE (ruta_id, jornada_id)
);

CREATE TABLE ruta_auxiliares(
    ruta_id INT(5),
    auxiliar_id VARCHAR(10),

    CONSTRAINT fk_rutas_auxiliares_rutas FOREIGN KEY (ruta_id) REFERENCES rutas (ruta_id),
    CONSTRAINT fk_rutas_auxiliares_auxiliares FOREIGN KEY (auxiliar_id) REFERENCES auxiliares (auxiliar_id)
);

CREATE TABLE envios(
    envio_id INT(5) AUTO_INCREMENT,
    fecha_envio TIMESTAMP,

    ciudad_id VARCHAR(3),
    ruta_id INT(5),
    jornada_id VARCHAR(3),
    cliente_id VARCHAR(10),
    paquete_id INT(5) UNIQUE,
    sucursal_id VARCHAR(3),

    CONSTRAINT pk_id_envios PRIMARY KEY (envio_id),
    CONSTRAINT fk_envios_ciudades FOREIGN KEY (ciudad_id) REFERENCES ciudades (ciudad_id),
    CONSTRAINT fk_envios_rutas FOREIGN KEY (ruta_id) REFERENCES rutas (ruta_id),
    CONSTRAINT fk_envios_clientes FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id),
    CONSTRAINT fk_envios_jornada FOREIGN KEY (jornada_id) REFERENCES jornadas (jornada_id),
    CONSTRAINT fk_envios_paquetes FOREIGN KEY (paquete_id) REFERENCES paquetes (paquete_id),
    CONSTRAINT fk_envios_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursales (sucursal_id)
);

CREATE TABLE direcciones_envios (
    direccion_id INT(5) AUTO_INCREMENT,
    calle VARCHAR(30) NOT NULL,
    carrera VARCHAR(30) NOT NULL,

    envio_id INT(5),

    CONSTRAINT pk_id_direcciones_envios PRIMARY KEY (direccion_id),
    CONSTRAINT fk_dir_envios_envios FOREIGN KEY (envio_id) REFERENCES envios (envio_id)
);