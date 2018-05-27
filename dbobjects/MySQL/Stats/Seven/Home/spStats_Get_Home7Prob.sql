DROP PROCEDURE IF EXISTS spStats_Get_Home7Prob;
DELIMITER $$
CREATE PROCEDURE spStats_Get_Home7Prob(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		*
	FROM
		vwStats_Get_Home7Prob HW
	WHERE
		HW.Time BETWEEN From_p AND To_p
	ORDER BY
		  HW.Time
        , HW.Tournament
        , HW.Home;
END$$
DELIMITER ;