DROP PROCEDURE IF EXISTS spStats_Get_NormalProb_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_NormalProb_t(
	  IN WeekNo_p BIGINT
    , IN SeasonId_p BIGINT
)
BEGIN
	DECLARE Finished_v	INTEGER DEFAULT 0;
	DECLARE TeamId_v 	BIGINT;

	-- 1. get tbCore_Fixtures
	DECLARE myCursor CURSOR FOR
	SELECT DISTINCT
		TT.TeamId
	FROM (
		SELECT
			FT.HomeTeamId AS TeamId
		FROM
			`tbCore_Fixture` FT
		WHERE
			FT.SeasonId = SeasonId_p
		UNION 
		SELECT
			FT.VisitorTeamId
		FROM
			`tbCore_Fixture` FT
		WHERE
			FT.SeasonId = SeasonId_p
	) TT;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Finished_v = 1;
	DELETE FROM `tbCore_FixtureTmp` WHERE SeasonId = SeasonId_p;
    
	OPEN myCursor;
	SelectionOfFixtures: LOOP
    
		FETCH myCursor INTO TeamId_v;
		IF Finished_v = 1 THEN
			LEAVE SelectionOfFixtures;
		END IF;

		INSERT INTO `tbCore_FixtureTmp`
		SELECT
			*
		FROM
			`tbCore_Fixture` MT
		WHERE
				MT.SeasonId 	= SeasonId_p
            AND MT.WeekNo 		< WeekNo_p
			AND MT.HomeTeamId	= TeamId_v
            AND NOT MT.FixtureId IN (
				SELECT TT.FixtureId FROM `tbCore_FixtureTmp` TT WHERE TT.SeasonId = SeasonId_p
            )
		ORDER BY
			MT.Time	DESC
		LIMIT 6;
        
		INSERT INTO `tbCore_FixtureTmp`
		SELECT
			*
		FROM
			`tbCore_Fixture` MT
		WHERE
				MT.SeasonId 		= SeasonId_p
            AND MT.WeekNo			< WeekNo_p
			AND MT.VisitorTeamId	= TeamId_v
            AND NOT MT.FixtureId IN (
				SELECT TT.FixtureId FROM `tbCore_FixtureTmp` TT WHERE TT.SeasonId = SeasonId_p
            )
		ORDER BY
			MT.Time	DESC
		LIMIT 6;
	END LOOP SelectionOfFixtures;
	CLOSE myCursor;


	SELECT
		*
	FROM
		`vwStats_Get_NormalProb_t` NP
	WHERE
		NP.SeasonId = SeasonId_p;
END$$
DELIMITER ;
