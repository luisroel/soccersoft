DROP PROCEDURE IF EXISTS spStats_Get_PoissonAnalysis_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_PoissonAnalysis_t(
	  IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
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
	DELETE FROM tbCore_FixtureTmp WHERE SeasonId = SeasonId_p;
    
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
				MT.SeasonId 		= SeasonId_p
            AND MT.WeekNo 			< WeekNo_p
			AND MT.HomeTeamId		= TeamId_v
            AND MT.FixtureStatusId 	= 2
            AND NOT MT.FixtureId IN (
				SELECT TT.FixtureId FROM `tbCore_FixtureTmp` TT WHERE TT.SeasonId = SeasonId_p
            )
		ORDER BY
			MT.Time	DESC
		LIMIT 3;
        
		INSERT INTO `tbCore_FixtureTmp`
		SELECT
			*
		FROM
			`tbCore_Fixture` MT
		WHERE
				MT.SeasonId 		= SeasonId_p
            AND MT.WeekNo			< WeekNo_p
			AND MT.VisitorTeamId	= TeamId_v
			AND MT.FixtureStatusId 	= 2
            AND NOT MT.FixtureId IN (
				SELECT TT.FixtureId FROM `tbCore_FixtureTmp` TT WHERE TT.SeasonId = SeasonId_p
            )
		ORDER BY
			MT.Time	DESC
		LIMIT 3;
	END LOOP SelectionOfFixtures;
	CLOSE myCursor;
    
    -- DELETE PREVIUOS RECORDS
    DELETE FROM tbStats_PoissonAnalysis_t WHERE FixtureId IN (
		SELECT FT.FixtureId  FROM tbCore_Fixture FT WHERE FT.SeasonId = SeasonId_p AND FT.WeekNo = WeekNo_p
    );

    -- Gets Poisson analysis data
    INSERT INTO tbStats_PoissonAnalysis_t
	SELECT
		  PP.*
        
		, PP.POH_6 * PP.POV_0 + PP.POH_6 * PP.POV_1 + PP.POH_6 * PP.POV_2 + PP.POH_6 * PP.POV_3 + PP.POH_6 * PP.POV_4 + PP.POH_6 * PP.POV_5 
		+ PP.POH_5 * PP.POV_0 + PP.POH_5 * PP.POV_1 + PP.POH_5 * PP.POV_2 + PP.POH_5 * PP.POV_3 + PP.POH_5 * PP.POV_4 
		+ PP.POH_4 * PP.POV_0 + PP.POH_4 * PP.POV_1 + PP.POH_4 * PP.POV_2 + PP.POH_4 * PP.POV_3 
		+ PP.POH_3 * PP.POV_0 + PP.POH_3 * PP.POV_1 + PP.POH_3 * PP.POV_2 
		+ PP.POH_2 * PP.POV_0 + PP.POH_2 * PP.POV_1 
		+ PP.POH_1 * PP.POV_0 																		AS `Pb_Home`	-- Win Probabilty for Team Home
		
		, PP.POH_0 * PP.POV_0 + PP.POH_1 * PP.POV_1 + PP.POH_2 * PP.POV_2
		+ PP.POH_3 * PP.POV_3 + PP.POH_4 * PP.POV_4 + PP.POH_5 * PP.POV_5
		+ PP.POH_6 * PP.POV_6																		AS `Pb_Draw`	-- Probabilty of Match Tie
		
		, PP.POH_0 * PP.POV_6 + PP.POH_0 * PP.POV_5 + PP.POH_0 * PP.POV_4 + PP.POH_0 * PP.POV_3 + PP.POH_0 * PP.POV_2 + PP.POH_0 * PP.POV_1
		+ PP.POH_1 * PP.POV_6 + PP.POH_1 * PP.POV_5 + PP.POH_1 * PP.POV_4 + PP.POH_1 * PP.POV_3 + PP.POH_1 * PP.POV_2
		+ PP.POH_2 * PP.POV_6 + PP.POH_2 * PP.POV_5 + PP.POH_2 * PP.POV_4 + PP.POH_2 * PP.POV_3
		+ PP.POH_3 * PP.POV_6 + PP.POH_3 * PP.POV_5 + PP.POH_3 * PP.POV_4
		+ PP.POH_4 * PP.POV_6 + PP.POH_4 * PP.POV_5
		+ PP.POH_5 * PP.POV_6																		AS `Pb_Visit`	-- Win Probabilty for Team Visit
        
		, fnUtil_Get_Max6(PP.POH_0, PP.POH_1, PP.POH_2, PP.POH_3, PP.POH_4, PP.POH_5, PP.POH_6) 	AS `Max_POH`	-- Max Probability for Possible Goal Scored BY Team Home
		, fnUtil_Get_Max6(PP.POV_0, PP.POV_1, PP.POV_2, PP.POV_3, PP.POV_4, PP.POV_5, PP.POV_6) 	AS `Max_POV`	-- Max Probability for Possible Goal Scored BY Team Visit
		, fnUtil_Get_MaxIdx6(PP.POH_0, PP.POH_1, PP.POH_2, PP.POH_3, PP.POH_4, PP.POH_5, PP.POH_6)	AS `Max_OH` 	-- Score for Max Prob. Home Team
		, fnUtil_Get_MaxIdx6(PP.POV_0, PP.POV_1, PP.POV_2, PP.POV_3, PP.POV_4, PP.POV_5, PP.POV_6) 	AS `Max_OV`		-- Score for Max Prob. Team Visit
	FROM 
		`vwStats_Get_PoissonProb_t` PP
	WHERE
			PP.SeasonId = SeasonId_p
		AND PP.WeekNo 	= WeekNo_p;
END$$
DELIMITER ;
