DROP PROCEDURE IF EXISTS spStats_Get_Win7Stats;
DELIMITER $$
CREATE PROCEDURE spStats_Get_Win7Stats(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_Win7Stats HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		  HW.Time
        , HW.Tournament
        , HW.Home;
END$$
DELIMITER ;