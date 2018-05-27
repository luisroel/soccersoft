DROP PROCEDURE IF EXISTS spStats_Get_WinWinFullProb;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinWinFullProb(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_WinWinFullProb HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		HW.Time;
END$$
DELIMITER ;