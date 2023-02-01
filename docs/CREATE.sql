CREATE TABLE TM_COMPANIA(
COM_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
COM_NOM VARCHAR(150) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL
)


CREATE TABLE TM_EMPRESA(
EMP_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
COM_ID INT NOT NULL,
EMP_NOM VARCHAR(150) NOT NULL,
EMP_RUC VARCHAR(50) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL,
CONSTRAINT FK_COM_ID 
	FOREIGN KEY (COM_ID)
	REFERENCES TM_COMPANIA (COM_ID)
)


CREATE TABLE TM_SUCURSAL(
SUC_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
EMP_ID INT NOT NULL,
SUC_NOM VARCHAR(150) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL,
CONSTRAINT FK_EMP_ID 
	FOREIGN KEY (EMP_ID)
	REFERENCES TM_EMPRESA (EMP_ID)

)


CREATE TABLE TM_ROL(
ROL_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SUC_ID INT NOT NULL,
ROL_NOM VARCHAR(50) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL,

CONSTRAINT FK_SUC_ID 
	FOREIGN KEY (SUC_ID)
	REFERENCES TM_SUCURSAL (SUC_ID)
)


CREATE TABLE TM_USUARIO(
USU_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SUC_ID INT NOT NULL,
ROL_ID INT NOT NULL,
USU_NOM VARCHAR(150) NOT NULL,
USU_CORREO VARCHAR(150) NOT NULL,
USU_APE VARCHAR(150) NOT NULL,
USU_DPI VARCHAR(50) NOT NULL,
USU_TEL VARCHAR(50) NOT NULL,
USU_PASS VARCHAR(50) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL,

CONSTRAINT U_FK_SUC_ID 
	FOREIGN KEY (SUC_ID)
	REFERENCES TM_SUCURSAL (SUC_ID),

CONSTRAINT U_FK_ROL_ID 
	FOREIGN KEY (ROL_ID)
	REFERENCES TM_ROL (ROL_ID)
)


CREATE TABLE TM_CATEGORIA(
CAT_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SUC_ID INT NOT NULL,
CAT_NOM VARCHAR(150) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL

CONSTRAINT FK_SUC_ID 
	FOREIGN KEY (SUC_ID)
	REFERENCES TM_SUCURSAL (SUC_ID)
)


CREATE TABLE TM_MONEDA(
MON_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SUC_ID INT NOT NULL,
MON_NOM VARCHAR(150) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL

CONSTRAINT MON_FK_SUC_ID 
	FOREIGN KEY (SUC_ID)
	REFERENCES TM_SUCURSAL (SUC_ID)
)


CREATE TABLE TM_UNIDAD(
UND_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SUC_ID INT NOT NULL,
UND_NOM VARCHAR(150) NOT NULL,
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL

CONSTRAINT UND_FK_SUC_ID 
	FOREIGN KEY (SUC_ID)
	REFERENCES TM_SUCURSAL (SUC_ID)
)


CREATE TABLE TM_PRODUCTO(
PROD_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SUC_ID INT NOT NULL,
CAT_ID INT  NOT NULL,
PROD_NOM VARCHAR(150) NOT NULL,
PROD_DESCRIP VARCHAR(150)  NOT NULL,
UND_ID INT NOT NULL,
MON_ID INT  NOT NULL,
PROD_PCOMPRA NUMERIC (18,2)  NOT NULL,
PROD_PVENTA NUMERIC (18,2)NOT NULL,
PROD_STOCK INT NOT NULL,
PROD_FECHAVEN DATE NOT NULL,
PROD_IMG VARCHAR(MAX) NOT NULL,
FECH_CREA DATETIME  NOT NULL,
EST INT  NOT NULL,

CONSTRAINT PROD_FK_SUC_ID
	FOREIGN KEY (SUC_ID)
	REFERENCES TM_SUCURSAL (SUC_ID),

CONSTRAINT PROD_FK_CAT_ID
	FOREIGN KEY (CAT_ID)
	REFERENCES TM_CATEGORIA (CAT_ID),

CONSTRAINT PROD_FK_UND_ID
	FOREIGN KEY (UND_ID)
	REFERENCES TM_UNIDAD (UND_ID),

CONSTRAINT PROD_FK_MON_ID
	FOREIGN KEY (MON_ID)
	REFERENCES TM_MONEDA (MON_ID),
)


CREATE TABLE TM_CLIENTE(
CLI_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
EMP_ID INT NOT NULL,
CLI_NOM VARCHAR (150) NOT NULL,
CLI_RUC VARCHAR(150) NOT NULL,
CLI_TEL VARCHAR(50) NOT NULL,
CLI_DIRECC VARCHAR(150) NOT NULL,
CLI_CORREO VARCHAR(150) NOT NULL, 
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL,

CONSTRAINT CLIE_FK_EMP_ID 
	FOREIGN KEY (EMP_ID)
	REFERENCES TM_EMPRESA (EMP_ID)
)


CREATE TABLE TM_PROVEEDOR(
PROV_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
EMP_ID INT NOT NULL,
PROV_NOM VARCHAR(150) NOT NULL,
PROV_RUC VARCHAR(150) NOT NULL,
PROV_TEL VARCHAR(50) NOT NULL,
PROV_DIRECC VARCHAR(150) NOT NULL,
PROV_CORREO VARCHAR(150) NOT NULL, 
FECH_CREA DATETIME NOT NULL,
EST INT NOT NULL,

CONSTRAINT PROV_FK_EMP_ID 
	FOREIGN KEY (EMP_ID)
	REFERENCES TM_EMPRESA (EMP_ID)
)