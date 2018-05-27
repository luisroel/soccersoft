DROP FUNCTION IF EXISTS fnStats_Get_Result;
DELIMITER $$
CREATE FUNCTION fnStats_Get_Result(
	  SH	INT
    , SV	INT
) RETURNS VARCHAR(1)
BEGIN
	DECLARE Rsl_v 	VARCHAR(1);

	SET Rsl_v = (
		CASE	WHEN SH > SV THEN 'L' 
				WHEN SH < SV THEN 'V' 
				ELSE 'D'
		END);

	-- Return the value
	RETURN Rsl_v;
END$$
DELIMITER ;

