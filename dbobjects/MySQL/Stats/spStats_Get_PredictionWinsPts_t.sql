DROP PROCEDURE IF EXISTS spStats_Get_PredictionWinsPts_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_PredictionWinsPts_t(
	  From_p	DATETIME
    , To_p		DATETIME
) 
BEGIN
	SELECT
		*
	FROM
		vwStats_Get_RawDataPts_tt TT
    WHERE
		TT.FixtureId IN (
			SELECT T.FixtureId FROM vwStats_Get_PredictionWins_t T WHERE T.Time BETWEEN From_p AND To_p
        )
	ORDER BY
		  TT.Time ASC
		, TT.Home;
END$$
DELIMITER ;