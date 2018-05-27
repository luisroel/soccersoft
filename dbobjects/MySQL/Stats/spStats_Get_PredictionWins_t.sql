DROP PROCEDURE IF EXISTS spStats_Get_PredictionWins_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_PredictionWins_t(
	  From_p	DATETIME
    , To_p		DATETIME
) 
BEGIN
	SELECT
		*
	FROM 
		vwStats_Get_PredictionWins_t TT
    WHERE
		TT.Time BETWEEN From_p AND To_p
	ORDER BY
		  TT.Date ASC
		, TT.Type
		, TT.Home;
END$$
DELIMITER ;