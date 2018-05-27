DROP PROCEDURE IF EXISTS spStats_Get_WinTieFullSimulation;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinTieFullSimulation(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinTieFullSimulation HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		  HW.Time
        , HW.Pb_Home;
END$$
DELIMITER ;