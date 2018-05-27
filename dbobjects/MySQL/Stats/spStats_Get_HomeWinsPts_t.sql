DROP PROCEDURE IF EXISTS spStats_Get_HomeWinsPts_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_HomeWinsPts_t(
	  From_p	DATETIME
    , To_p		DATETIME
) 
BEGIN
	SELECT
		TT.*
	FROM
		vwStats_Get_RawDataPts_tt TT
        INNER JOIN (
			SELECT DISTINCT
				T.FixtureId 
			FROM 
				vwStats_Get_HomeWins_t T 
			WHERE 
				T.Time BETWEEN From_p AND To_p
		) T ON
			T.FixtureId = TT.FixtureId
	ORDER BY
		  TT.Time ASC
		, TT.Home;
END$$
DELIMITER ;