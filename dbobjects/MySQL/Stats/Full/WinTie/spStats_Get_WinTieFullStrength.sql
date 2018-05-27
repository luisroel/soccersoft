DROP PROCEDURE IF EXISTS spStats_Get_WinTieFullStrength;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinTieFullStrength(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinTieFullStrength HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		  HW.Time
        , HW.Pb_Home;
END$$
DELIMITER ;