DROP FUNCTION IF EXISTS `fnUtil_Get_Tendency`;
DELIMITER $$
CREATE FUNCTION `fnUtil_Get_Tendency`(
	  Odd1_p 	FLOAT
    , aOdd1_p 	FLOAT
	, OddX_p 	FLOAT
    , aOddX_p 	FLOAT
	, Odd2_p 	FLOAT
    , aOdd2_p	FLOAT    
) RETURNS varchar(20) CHARSET latin1
BEGIN
	DECLARE Result_v VARCHAR(20);
	SET @diff_1 = aOdd1_p - Odd1_p;
    SET @diff_X = aOddX_p - OddX_p;
    SET @diff_2 = aOdd2_p - Odd2_p;
    
    SET Result_v = '1';
	IF @diff_X < @diff_1 THEN
		IF @diff_X < @diff_2 THEN
			SET Result_v = 'X';
		ELSE
			SET Result_v = '2';
		END IF;
    ELSEIF @diff_2 < @diff_1 THEN
		SET Result_v = '2';
	END IF;

	RETURN Result_v;
END$$
DELIMITER ;
