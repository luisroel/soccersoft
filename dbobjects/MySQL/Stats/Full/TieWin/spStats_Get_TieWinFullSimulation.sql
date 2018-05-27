DROP PROCEDURE IF EXISTS spStats_Get_TieWinFullSimulation;
DELIMITER $$
CREATE PROCEDURE spStats_Get_TieWinFullSimulation(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_TieWinFullSimulation HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;