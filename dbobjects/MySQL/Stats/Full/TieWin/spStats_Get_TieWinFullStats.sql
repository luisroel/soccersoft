DROP PROCEDURE IF EXISTS spStats_Get_TieWinFullStats;
DELIMITER $$
CREATE PROCEDURE spStats_Get_TieWinFullStats(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_TieWinFullStats HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;