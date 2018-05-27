DROP PROCEDURE IF EXISTS spStats_Get_WinTieFullStats;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinTieFullStats(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinTieFullStats HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		  HW.Time
        , HW.Pb_Home;
END$$
DELIMITER ;