--
-- Season Avg Goals Scored At Home:
--
DROP FUNCTION IF EXISTS fnStats_Get_NormalValue;
DELIMITER $$
CREATE FUNCTION fnStats_Get_NormalValue(
	  X_P 		FLOAT
    , Mean_p	FLOAT
    , Std_p		FLOAT
) RETURNS FLOAT
BEGIN
	DECLARE Prob_v 		FLOAT;

	SET Prob_v = (1.0 / ( Std_p * SQRT(2 * PI())) * EXP(-0.5*POWER((X_p - Mean_p)/Std_p,2)));

	-- Return the value
	RETURN Prob_v;
END$$
DELIMITER ;

