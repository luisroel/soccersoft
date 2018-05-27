DROP PROCEDURE IF EXISTS spStats_Get_Win7Strength;
DELIMITER $$
CREATE PROCEDURE spStats_Get_Win7Strength(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_Win7Strength HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		  HW.Time
        , HW.Tournament
        , HW.Home;
END$$
DELIMITER ;