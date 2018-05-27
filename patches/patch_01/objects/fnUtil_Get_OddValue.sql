DROP FUNCTION IF EXISTS `fnUtil_Get_OddValue`;
DELIMITER $$
CREATE FUNCTION `fnUtil_Get_OddValue`(
	  Odd_1	FLOAT
    , Odd_X	FLOAT
    , Odd_2	FLOAT
) RETURNS FLOAT
BEGIN
	DECLARE Rsl_v 	FLOAT;

	SET Rsl_v = (1.0 / Odd_1) + (1.0 / Odd_x) + (1.0 / Odd_2);

	RETURN Rsl_v;
END$$
DELIMITER ;
