DROP PROCEDURE IF EXISTS spCore_Get_FixtureList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_FixtureList(
	  IN SeasonId_p	BIGINT
    , IN PhaseId_p	BIGINT
    , IN Round_p	INTEGER
)
BEGIN
	IF Round_p = 0 THEN
		SELECT 
			 FL.*
		FROM 
			vwCore_Get_FixtureList FL
		WHERE
				FL.SeasonId = SeasonId_p
            AND FL.PhaseId 	= PhaseId_p
		ORDER BY
			  FL.Time DESC
            , FL.Home;
	ELSE
		SELECT 
			FL.*
		FROM 
			vwCore_Get_FixtureList FL
		WHERE
				FL.SeasonId = SeasonId_p
            AND FL.PhaseId 	= PhaseId_p
            AND FL.Round 	= Round_p
		ORDER BY
			  FL.Time DESC
            , FL.Home;
	END IF;
END $$
DELIMITER ;
