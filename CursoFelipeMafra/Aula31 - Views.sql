-- Consulta verbosa 
SELECT
	C.NOME,
	C.SEXO,
	IFNULL(C.EMAIL, 'SEM EMAIL') AS "EMAIL",
	IFNULL(T.NUMERO, 'SEM TELEFONE') AS "TELEFONE",
	IFNULL(T.TIPO, '') AS "TIPO",
	E.BAIRRO,
	E.CIDADE,
	E.ESTADO
FROM
	CLIENTE C
LEFT JOIN TELEFONE T ON
	T.IDCLIENTE = C.IDCLIENTE
INNER JOIN ENDERECO E ON
	E.IDCLIENTE = C.IDCLIENTE;
	
-- Criação da view com a consulta anterior. Usar prefixo V 
CREATE VIEW V_RELATORIO AS
SELECT
	C.NOME,
	C.SEXO,
	IFNULL(C.EMAIL, 'SEM EMAIL') AS "EMAIL",
	IFNULL(T.NUMERO, 'SEM TELEFONE') AS "TELEFONE",
	IFNULL(T.TIPO, '') AS "TIPO",
	E.BAIRRO,
	E.CIDADE,
	E.ESTADO
FROM
	CLIENTE C
LEFT JOIN TELEFONE T ON
	T.IDCLIENTE = C.IDCLIENTE
INNER JOIN ENDERECO E ON
	E.IDCLIENTE = C.IDCLIENTE;
	
-- Chamando a primeiro consulta pela view.
SELECT * FROM V_RELATORIO WHERE ESTADO = 'MG';

-- Apagando uma view
DROP VIEW V_RELATORIO;