--
-- Normal Prob. Draw
--
DROP FUNCTION IF EXISTS fnStats_Get_THAGS_Frec;
DELIMITER $$
CREATE FUNCTION fnStats_Get_THAGS_Frec(
		date_p 	DATETIME
      , value_p	DOUBLE
) RETURNS DOUBLE
BEGIN
	DECLARE weigth_v DOUBLE;

	SElECT
		NP.Weight
    INTO
		weigth_v 
	FROM
		tbStats_FrecuencyTablePts NP
	WHERE
			NP.aDate 	= date_p
        AND NP.parName 	= 'THAGS'
        AND NP.parValue <= value_p
	ORDER BY
		NP.parValue DESC
	LIMIT 1;
    
	-- Return the value
	RETURN weigth_v;
END$$
DELIMITER ;

