DROP PROCEDURE IF EXISTS spStats_Get_WinTie7Simulation;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinTie7Simulation(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinTie7Simulation HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;