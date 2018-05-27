--
-- Season Avg Goals Scored At Home:
--
DROP FUNCTION IF EXISTS fnStats_Get_FCHandicap;
DELIMITER $$
CREATE FUNCTION fnStats_Get_FCHandicap(
	  Pb_H 		DOUBLE
    , Pb_D		DOUBLE
    , Pb_V		DOUBLE
    , Handicap 	DOUBLE
) RETURNS VARCHAR(1)
BEGIN
	DECLARE Rsl_v 	VARCHAR(1);

	SET Rsl_v = (
		CASE 	WHEN Pb_H > Pb_D AND Pb_H > Pb_V THEN 
					CASE 	WHEN 	(Pb_D > Pb_V AND (Pb_H - Pb_D) > Handicap) OR
									(Pb_V > Pb_D AND (Pb_H - Pb_V) > Handicap) THEN 'L'
							ELSE 'D'
					END
				WHEN Pb_V > Pb_D AND Pb_V > Pb_H THEN 
					CASE 	WHEN 	(Pb_D > Pb_H AND (Pb_V - Pb_D) > Handicap) OR
									(Pb_H > Pb_D AND (Pb_V - Pb_H) > Handicap) THEN 'V'
							ELSE 'D'
					END
				ELSE 'D'
		END
    );

	-- Return the value
	RETURN Rsl_v;
END$$
DELIMITER ;

