DROP FUNCTION IF EXISTS fnStats_Get_FCNormal;
DELIMITER $$
CREATE FUNCTION fnStats_Get_FCNormal(
	  Pb_H 	FLOAT
    , Pb_D	FLOAT
    , Pb_V	FLOAT
) RETURNS VARCHAR(1)
BEGIN
	DECLARE Rsl_v 	VARCHAR(1);

	SET Rsl_v = (
		CASE 	WHEN Pb_H > Pb_D AND Pb_H > Pb_V THEN 'L'
			WHEN Pb_V > Pb_D AND Pb_V > Pb_H THEN 'V'
            ELSE 'D'
		END
    );

	-- Return the value
	RETURN Rsl_v;
END$$
DELIMITER ;

