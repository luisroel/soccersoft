DROP PROCEDURE IF EXISTS spStats_Get_TieWin7Strength;
DELIMITER $$
CREATE PROCEDURE spStats_Get_TieWin7Strength(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_TieWin7Strength HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;