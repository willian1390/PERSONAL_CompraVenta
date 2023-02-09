use CompraVenta

--#############################################
--LISTAR TODOS LOS REGISTROS POR USUARIO
CREATE PROCEDURE SP_L_USUARIO_01
@SUC_ID INT
AS
BEGIN
	SELECT * FROM TM_USUARIO
	WHERE
	SUC_ID = @SUC_ID
	AND EST = 1
END

--EJECUTAR EL PROCEDIMIENTO
--	EXEC SP_L_USUARIO_01 @XX

--MODIFICAR EL PROCEDIMIENTO 
--	SP_HELPTEXT SP_L_USUARIO_01

--#############################################
--OBTENER REGISTROS POR ID
CREATE PROCEDURE SP_L_USUARIO_02
@USU_ID INT
AS
BEGIN
	SELECT * FROM TM_USUARIO
	WHERE
	USU_ID = @USU_ID
END

--#############################################
--ELIMINAR REGISTROS POR ID
CREATE PROCEDURE SP_D_USUARIO_01
@USU_ID INT
AS
BEGIN
	UPDATE TM_USUARIO
	SET
		EST = 0
	WHERE 
		USU_ID= @USU_ID		
END


--#############################################
--INSERTAR NUEVO REGISTRO
CREATE PROCEDURE SP_I_USUARIO_01
@SUC_ID INT,
@ROL_ID INT,
@USU_NOM VARCHAR(150),
@USU_CORREO VARCHAR(150),
@USU_APE VARCHAR(150),
@USU_DPI VARCHAR(150),
@USU_TEL VARCHAR(150),
@USU_PASS VARCHAR(150)

AS
BEGIN
	INSERT INTO TM_USUARIO 
	(SUC_ID,ROL_ID, USU_NOM, USU_CORREO, USU_APE, USU_DPI, USU_TEL, USU_PASS, FECH_CREA, EST)
	VALUES
	(@SUC_ID, @ROL_ID, @USU_NOM, @USU_CORREO, @USU_APE, @USU_DPI, @USU_TEL, @USU_PASS, GETDATE(), 1)
END


--#############################################
--ACTUALIZAR REGISTRO
CREATE PROCEDURE SP_U_USUARIO_01
@USU_ID INT,
@SUC_ID INT,
@ROL_ID INT,
@USU_NOM VARCHAR(150),
@USU_CORREO VARCHAR(150),
@USU_APE VARCHAR(150),
@USU_DPI VARCHAR(150),
@USU_TEL VARCHAR(150),
@USU_PASS VARCHAR(150)
AS
BEGIN
	UPDATE TM_USUARIO
	SET
		SUC_ID = @SUC_ID,
		ROL_ID = @ROL_ID,
		USU_NOM = @USU_NOM,
		USU_CORREO = @USU_CORREO,
		USU_APE = @USU_APE,
		USU_DPI = @USU_DPI,
		USU_TEL = @USU_TEL,
		USU_PASS = @USU_PASS
	WHERE
		USU_ID = @USU_ID
END

SELECT * FROM TM_USUARIO

--ACCESO DE USUARIO
CREATE PROCEDURE SP_L_USUARIO_03
@USU_CORREO VARCHAR(150),
@USU_PASS VARCHAR(150)
AS
BEGIN
	SELECT * FROM TM_USUARIO
	WHERE
	USU_CORREO = @USU_CORREO
	AND USU_PASS = @USU_PASS
	AND EST = 1
END