USE BD_DESARROLLO;
GO;

CREATE TABLE VISMED.USUARIO
(
	NUSUARIO INT IDENTITY(1,1) NOT NULL,
	CUSUARIO NVARCHAR(150) NULL,
	CPASSWORD VARBINARY(MAX) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.USUARIO
ADD
CONSTRAINT PK_USUARIO_NUSUARIO PRIMARY KEY(NUSUARIO);

CREATE TABLE VISMED.ROL
(
	NROL INT IDENTITY(1,1) NOT NULL,
	CROL NVARCHAR(150) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.ROL
ADD
CONSTRAINT PK_ROL_NROL PRIMARY KEY(NUSUARIO);

CREATE TABLE VISMED.ROL_USUARIO
(
	NUSUARIO INT NOT NULL,
	NROL INT NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.ROL_USUARIO
ADD 
CONSTRAINT FK_ROL_USUARIO_NUSUARIO FOREIGN KEY (NUSUARIO) REFERENCES VISMED.USUARIO(NUSUARIO),
CONSTRAINT FK_ROL_USUARIO_NROL FOREIGN KEY (NROL) REFERENCES VISMED.ROL(NROL);

CREATE TABLE VISMED.PERMISO
(
	NPERMISO INT IDENTITY(1,1) NOT NULL,
	CPERMISO NVARCHAR(150) NOT NULL,
	CVALOR NVARCHAR(150) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.PERMISO
ADD
CONSTRAINT PK_PERMISO_NPERMISO PRIMARY KEY(NPERMISO); 


CREATE TABLE VISMED.MODULO
(
	NMODULO INT IDENTITY(1,1) NOT NULL,
	CMODULO NVARCHAR(150) NOT NULL,
	CVALOR VARCHAR(150) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.MODULO
ADD
CONSTRAINT PK_MODULO_NMODULO PRIMARY KEY(NMODULO);

CREATE TABLE VISMED.ROL_MODULO_PERMISO
(
	NROL INT NOT NULL,
	NPERMISO INT NOT NULL,
	NMODULO INT NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.ROL_MODULO_PERMISO
ADD 
CONSTRAINT FK_ROL_MODULO_PERMISO_NROL FOREIGN KEY (NROL) REFERENCES VISMED.ROL(NROL),
CONSTRAINT FK_ROL_MODULO_PERMISO_NPERMISO FOREIGN KEY (NPERMISO) REFERENCES VISMED.PERMISO(NPERMISO),
CONSTRAINT FK_ROL_MODULO_PERMISO_NMODULO FOREIGN KEY (NMODULO) REFERENCES VISMED.MODULO(NMODULO);

CREATE TABLE VISMED.TOKEN_USUARIO
(
	NUSUARIO INT NOT NULL,
	CTOKEN NVARCHAR(150) NULL,
	DFEC_VENCIMIENTO DATETIME NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.TOKEN_USUARIO
ADD CONSTRAINT FK_TOKEN_USUARIO_NUSUARIO FOREIGN KEY (NUSUARIO) REFERENCES VISMED.USUARIO(NUSUARIO);

CREATE TABLE VISMED.PERSONA
(
	CDNI NVARCHAR(8) NOT NULL,
	CNOMBRE NVARCHAR(80) NOT NULL,
	CAPE_PATERNO NVARCHAR(80) NOT NULL,
	CAPE_MATERNO NVARCHAR(80) NOT NULL,
	CAPE_CASADO NVARCHAR(80) NOT NULL,
	CDIRECCION NVARCHAR(500) NULL,
	CTELEFONO NVARCHAR(15) NULL,
	CCORREO NVARCHAR(250) NULL,
	DFEC_NACIMIENTO DATETIME NULL,
	CSEXO NVARCHAR(1) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.PERSONA
ADD CONSTRAINT PK_PERSONA_CDNI PRIMARY KEY(CDNI);

ALTER TABLE VISMED.PERSONA
ADD CFOTO_URL NVARCHAR(750) NOT NULL;

CREATE TABLE VISMED.PERSONA_USUARIO
(
	CDNI NVARCHAR(8) NOT NULL,
	NUSUARIO INT NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.PERSONA_USUARIO
ADD 
CONSTRAINT FK_PERSONA_USUARIO_CDNI FOREIGN KEY (CDNI) REFERENCES VISMED.PERSONA(CDNI),
CONSTRAINT FK_PERSONA_USUARIO_NUSUARIO FOREIGN KEY (NUSUARIO) REFERENCES VISMED.USUARIO(NUSUARIO);

CREATE TABLE VISMED.UBIGEO
(
	CUBIGEO NVARCHAR(6) NOT NULL,
	CDEPARTAMENTO NVARCHAR(80) NOT NULL,
	CPROVINCIA  NVARCHAR(80) NOT NULL,
	CDISTRITO NVARCHAR(80) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.UBIGEO
ADD
CONSTRAINT PK_UBIGEO_CUBIGEO PRIMARY KEY(CUBIGEO);

CREATE TABLE VISMED.CATEGORIA
(
	NCATEGORIA INT IDENTITY(1,1) NOT NULL,
	CCATEGORIA NVARCHAR(250) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.CATEGORIA
ADD
CONSTRAINT PK_CATEGORIA_NCATEGORIA PRIMARY KEY(NCATEGORIA);


CREATE TABLE VISMED.CLIENTE
(
	NCLIENTE INT IDENTITY(1,1) NOT NULL,
	CUBIGEO NVARCHAR(6) NOT NULL,
	NCATEGORIA INT NOT NULL,
	CRUC NVARCHAR(11) NULL,
	CRAZON_SOCIAL NVARCHAR(500) NULL,
	CDIRECCION NVARCHAR(500) NULL,
	CLONGITUD NVARCHAR(50) NULL,
	CLATITUD NVARCHAR(50) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.CLIENTE
ADD
CONSTRAINT PK_CLIENTE_NCLIENTE PRIMARY KEY(NCLIENTE),
CONSTRAINT FK_CLIENTE_CUBIGEO FOREIGN KEY (CUBIGEO) REFERENCES VISMED.UBIGEO(CUBIGEO),
CONSTRAINT FK_CLIENTE_NCATEGORIA FOREIGN KEY (NCATEGORIA) REFERENCES VISMED.CATEGORIA(NCATEGORIA);

CREATE TABLE VISMED.PERSONA_CLIENTE
(
	NCLIENTE INT NOT NULL,
	CDNI NVARCHAR(8) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.PERSONA_CLIENTE
ADD 
CONSTRAINT FK_PERSONA_CLIENTE_NCLIENTE FOREIGN KEY (NCLIENTE) REFERENCES VISMED.CLIENTE(NCLIENTE),
CONSTRAINT FK_PERSONA_CLIENTE_CDNI FOREIGN KEY (CDNI) REFERENCES VISMED.PERSONA(CDNI);


CREATE TABLE VISMED.ACTIVIDAD
(
	NACTIVIDAD INT IDENTITY(1,1) NOT NULL,
	CDNI NVARCHAR(8) NOT NULL,
	NCLIENTE INT NOT NULL,
	CACTIVIDAD NVARCHAR(500) NOT NULL,
	DFEC_INICIO DATETIME NULL,
	DFEC_FIN DATETIME NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.ACTIVIDAD
ADD
CONSTRAINT PK_ACTIVIDAD_NACTIVIDAD PRIMARY KEY(NACTIVIDAD),
CONSTRAINT FK_ACTIVIDAD_CDNI FOREIGN KEY (CDNI) REFERENCES VISMED.PERSONA(CDNI),
CONSTRAINT FK_ACTIVIDAD_NCLIENTE FOREIGN KEY (NCLIENTE) REFERENCES VISMED.CLIENTE(NCLIENTE);

CREATE TABLE VISMED.PRODUCTO
(
	NPRODUCTO INT IDENTITY(1,1) NOT NULL,
	NCATEGORIA INT NOT NULL,
	NMARCAR INT NOT NULL,
	CPRODUCTO NVARCHAR(500) NOT NULL,
	NPRECIO NUMERIC(10,2) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.PRODUCTO
ADD
CONSTRAINT PK_PRODUCTO_NPRODUCTO PRIMARY KEY(NPRODUCTO);

CREATE TABLE VISMED.ACCESORIO
(
	NACCESORIO INT IDENTITY(1,1) NOT NULL,
	NCATEGORIA INT NOT NULL,
	NMARCAR INT NOT NULL,
	CACCESORIO NVARCHAR(500) NOT NULL,
	NPRECIO NUMERIC(10,2) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.ACCESORIO
ADD
CONSTRAINT PK_ACCESORIO_NACCESORIO PRIMARY KEY(NACCESORIO);

CREATE TABLE VISMED.SERVICIO
(
	NSERVICIO INT IDENTITY(1,1) NOT NULL,
	NCATEGORIA INT NOT NULL,
	CSERVICIO NVARCHAR(500) NOT NULL,
	DFEC_INICIO DATETIME NULL,
	DFEC_FIN DATETIME NULL,
	NPRECIO NUMERIC(10,2) NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.SERVICIO
ADD
CONSTRAINT PK_SERVICIO_NSERVICIO PRIMARY KEY (NSERVICIO);

CREATE TABLE VISMED.COTIZACION_C
(
	NCOTIZACION INT IDENTITY(1,1) NOT NULL,
	NCLIENTE INT NOT NULL,
	CDNI NVARCHAR(8) NOT NULL,
	CCOTIZACION NVARCHAR(500) NULL,
	DFEC_COTIZACION DATETIME NULL,
	NDESCUENTO NUMERIC(10,2) NULL,
	NSUB_TOTAL NUMERIC(10,2) NULL,
	NIGV NUMERIC(10,2) NULL,
	NTOTAL NUMERIC(10,2) NULL,
	NFASE INT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.COTIZACION_C
ADD
CONSTRAINT PK_COTIZACION_C_NCOTIZACION PRIMARY KEY (NCOTIZACION),
CONSTRAINT FK_COTIZACION_C_NCLIENTE FOREIGN KEY (NCLIENTE) REFERENCES VISMED.CLIENTE(NCLIENTE),
CONSTRAINT FK_COTIZACION_C_CDNI FOREIGN KEY (CDNI) REFERENCES VISMED.PERSONA(CDNI);

CREATE TABLE VISMED.COTIZACION_D
(
	NCOTIZACION INT IDENTITY(1,1) NOT NULL,
	NPRODUCTO INT NULL,
	NACCESORIO INT NULL,
	NSERVICIO INT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.COTIZACION_D
ADD
CONSTRAINT FK_COTIZACION_D_NCOTIZACION FOREIGN KEY (NCOTIZACION) REFERENCES VISMED.COTIZACION_C(NCOTIZACION),
CONSTRAINT FK_COTIZACION_D_NPRODUCTO FOREIGN KEY (NPRODUCTO) REFERENCES VISMED.PRODUCTO(NPRODUCTO),
CONSTRAINT FK_COTIZACION_D_NACCESORIO FOREIGN KEY (NACCESORIO) REFERENCES VISMED.ACCESORIO(NACCESORIO),
CONSTRAINT FK_COTIZACION_D_NSERVICIO FOREIGN KEY (NSERVICIO) REFERENCES VISMED.SERVICIO(NSERVICIO);


CREATE TABLE VISMED.TABLA_GENERAL_C
(
	NTABLA INT NOT NULL,
	CTABLA NVARCHAR(500) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.TABLA_GENERAL_C
ADD
CONSTRAINT PK_TABLA_GENERAL_C_NTABLA PRIMARY KEY (NTABLA);

CREATE TABLE VISMED.TABLA_GENERAL_D
(
	NTABLA INT NOT NULL,
	NITEM INT NOT NULL,
	CITEM NVARCHAR(500) NOT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.TABLA_GENERAL_D
ADD
CONSTRAINT FK_TABLA_GENERAL_D_NTABLA FOREIGN KEY (NTABLA) REFERENCES VISMED.TABLA_GENERAL_C(NTABLA);

CREATE TABLE VISMED.VENTA_C
(
	NVENTA INT IDENTITY(1,1) NOT NULL,
	NCOTIZACION INT NOT NULL,
	NCLIENTE INT NOT NULL,
	CDNI NVARCHAR(8) NOT NULL,
	CVENTA NVARCHAR(500) NULL,
	DFEC_VENTA DATETIME NULL,
	NDESCUENTO NUMERIC(10,2) NULL,
	NSUB_TOTAL NUMERIC(10,2) NULL,
	NIGV NUMERIC(10,2) NULL,
	NTOTAL NUMERIC(10,2) NULL,
	NFASE INT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL
);

ALTER TABLE VISMED.VENTA_C
ADD
CONSTRAINT PK_VENTA_C_NVENTA PRIMARY KEY (NVENTA),
CONSTRAINT FK_VENTA_C_NCOTIZACION FOREIGN KEY (NCOTIZACION) REFERENCES VISMED.COTIZACION_C(NCOTIZACION),
CONSTRAINT FK_VENTA_C_NCLIENTE FOREIGN KEY (NCLIENTE) REFERENCES VISMED.CLIENTE(NCLIENTE),
CONSTRAINT FK_VENTA_C_CDNI FOREIGN KEY (CDNI) REFERENCES VISMED.PERSONA(CDNI);

CREATE TABLE VISMED.VENTA_D
(
	NVENTA INT IDENTITY(1,1) NOT NULL,
	NCOTIZACION INT NOT NULL,
	NPRODUCTO INT NULL,
	NACCESORIO INT NULL,
	NSERVICIO INT NULL,
	BESTADO BIT NOT NULL,
	NREGISTRO INT NULL,
	DFEC_REGISTRO DATETIME NULL,
	NMODIFICACION INT NULL,
	DFEC_MODIFICACION DATETIME NULL 
);

ALTER TABLE VISMED.VENTA_D
ADD
CONSTRAINT FK_VENTA_D_NVENTA FOREIGN KEY (NVENTA) REFERENCES VISMED.VENTA_C(NVENTA),
CONSTRAINT FK_VENTA_D_NCOTIZACION FOREIGN KEY (NCOTIZACION) REFERENCES VISMED.COTIZACION_C (NCOTIZACION),
CONSTRAINT FK_VENTA_D_NPRODUCTO FOREIGN KEY (NPRODUCTO) REFERENCES VISMED.PRODUCTO(NPRODUCTO),
CONSTRAINT FK_VENTA_D_NACCESORIO FOREIGN KEY (NACCESORIO) REFERENCES VISMED.ACCESORIO(NACCESORIO);

