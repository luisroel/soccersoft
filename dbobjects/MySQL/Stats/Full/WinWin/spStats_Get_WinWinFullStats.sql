DROP PROCEDURE IF EXISTS spStats_Get_WinWinFullStats;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinWinFullStats(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinWinFullStats HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;