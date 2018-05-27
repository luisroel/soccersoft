DROP PROCEDURE IF EXISTS spStats_Get_HomeWins_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_HomeWins_t(
	  From_p	DATETIME
    , To_p		DATETIME
) 
BEGIN
	SELECT
		*
	FROM
		vwStats_Get_HomeWins_t TT
    WHERE
		TT.Time BETWEEN From_p AND To_p
	ORDER BY
		  TT.Time ASC
		, TT.Type
		, TT.Home;
END$$
DELIMITER ;