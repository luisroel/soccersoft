DROP PROCEDURE IF EXISTS spStats_Get_WinTie7Strength;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinTie7Strength(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinTie7Strength HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;