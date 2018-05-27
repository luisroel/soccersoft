DROP FUNCTION IF EXISTS fnUtil_Get_Factorial;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_Factorial(x INT) RETURNS INT(11)
BEGIN
	DECLARE factorial INT;
	
	-- Guardamos el valor de x
	SET factorial = x ;
	
	-- Caso en que x sea menor o igual a 0
	IF x <= 0 THEN
	RETURN 1;
	END IF;
	
	-- Iteramos para obtener multiplicaciones consecutivas
	
	bucle: LOOP
	
	-- Cada iteracion reducimos en 1 a x
	SET x = x - 1 ;
	
	-- Condición de parada del bucle
	IF x<1 THEN
	LEAVE bucle;
	END IF;
	
	-- Factorial parcial
	SET factorial = factorial * x ;
	
	END LOOP bucle;
	
	-- Retornamos en el factorial
	RETURN factorial;
END$$
DELIMITER ;

