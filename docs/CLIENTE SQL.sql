--#############################################
--LISTAR TODOS LOS REGISTROS POR SUCURSAL
CREATE PROCEDURE SP_L_CLIENTE_01
@EMP_ID INT
AS
BEGIN
	SELECT * FROM TM_CLIENTE
	WHERE
	EMP_ID = @EMP_ID
	AND EST = 1
END

--EJECUTAR EL PROCEDIMIENTO
--	EXEC SP_L_CLIENTE_01 @XX

--MODIFICAR EL PROCEDIMIENTO 
--	SP_HELPTEXT SP_L_CLIENTE_01

--#############################################
--OBTENER REGISTROS POR ID
CREATE PROCEDURE SP_L_CLIENTE_02
@CLI_ID INT
AS
BEGIN
	SELECT * FROM TM_CLIENTE
	WHERE
	CLI_ID = @CLI_ID
END

--#############################################
--ELIMINAR REGISTROS POR ID
CREATE PROCEDURE SP_D_CLIENTE_01
@CLI_ID INT
AS
BEGIN
	UPDATE TM_CLIENTE
	SET
		EST = 0
	WHERE 
		CLI_ID= @CLI_ID		
END


--#############################################
--INSERTAR NUEVO REGISTRO
CREATE PROCEDURE SP_I_CLIENTE_01
@EMP_ID INT,
@CLI_NOM VARCHAR(150),
@CLI_RUC INT,
@CLI_TEL VARCHAR(150),
@CLI_DIRECC VARCHAR(150),
@CLI_CORREO VARCHAR(150)

AS
BEGIN
	INSERT INTO TM_CLIENTE 
	(CLI_NOM, EMP_ID, CLI_RUC, CLI_TEL, CLI_DIRECC, CLI_CORREO,FECH_CREA, EST)
	VALUES
	(@CLI_NOM, @EMP_ID, @CLI_RUC, @CLI_TEL, @CLI_DIRECC, @CLI_CORREO,GETDATE(), 1)
END


--#############################################
--ACTUALIZAR REGISTRO
CREATE PROCEDURE SP_U_CLIENTE_01
@CLI_ID INT,
@CLI_NOM VARCHAR(150),
@EMP_ID INT,
@CLI_RUC VARCHAR(150),
@CLI_TEL VARCHAR(150),
@CLI_DIRECC VARCHAR(150),
@CLI_CORREO VARCHAR(150)
AS
BEGIN
	UPDATE TM_CLIENTE
	SET
		CLI_NOM = @CLI_NOM,
		EMP_ID = @EMP_ID,
		CLI_RUC = @CLI_RUC,
		CLI_TEL = @CLI_TEL,
		CLI_DIRECC = @CLI_DIRECC,
		CLI_CORREO = @CLI_CORREO

	WHERE
		CLI_ID = @CLI_ID
END

SELECT * FROM TM_CLIENTE