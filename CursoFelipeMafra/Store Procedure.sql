-- Muda o delimiter
DELIMITER $
CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'NOME DA EMPRESA' AS EMPRESA;
END
$
-- Usa o delimitador para terminar o comando

DELIMITER ; 
CALL NOME_EMPRESA();
DROP PROCEDURE NOME_EMPRESA();

-- Procedure com parâmetro
DELIMITER $
CREATE PROCEDURE SOMA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS `RESULTADO DA SOMA`;
END
$

USE CURSOSQL01;
CREATE TABLE IF NOT EXISTS CURSOS(
	ID_CURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL,
	DURACAO SMALLINT NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);


INSERT INTO CURSOS VALUES 
(NULL, 'SQL', 42, 23.90),
(NULL, 'BLAZOR', 42, 23.90);

SELECT * FROM CURSOS;


DELIMITER $
CREATE PROCEDURE ADD_CURSO(NOME VARCHAR(255), DURACAO SMALLINT UNSIGNED, VALOR FLOAT(10,2) UNSIGNED)
BEGIN
	INSERT INTO CURSOS VALUES (NULL, NOME, DURACAO, VALOR);
END $

DELIMITER $
CREATE PROCEDURE LISTAR_CURSOS()
BEGIN
	SELECT 
		C.ID_CURSO, 
		C.NOME, 
		CONCAT(DURACAO, ' H') AS `DURAÇÃO`, 
		CONCAT('R$ ', FORMAT(C.VALOR, 2, 'de_DE')) AS `PREÇO` 
	FROM 
		CURSOS C;
END
$