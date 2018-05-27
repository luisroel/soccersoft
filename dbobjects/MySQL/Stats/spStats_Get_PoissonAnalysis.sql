--
-- Fixtures to be analyzed must have not been closed. (FixtureStatusId <> 2)
--
DROP PROCEDURE IF EXISTS spStats_Get_PoissonAnalysis;
DELIMITER $$
CREATE PROCEDURE spStats_Get_PoissonAnalysis(
	  IN WeekNo_p	INT
    , IN SeasonId_p BIGINT
)
BEGIN    
	SELECT
		  PP.*
    
		, PP.POH_6 * PP.POV_0 + PP.POH_6 * PP.POV_1 + PP.POH_6 * PP.POV_2 + PP.POH_6 * PP.POV_3 + PP.POH_6 * PP.POV_4 + PP.POH_6 * PP.POV_5 
		+ PP.POH_5 * PP.POV_0 + PP.POH_5 * PP.POV_1 + PP.POH_5 * PP.POV_2 + PP.POH_5 * PP.POV_3 + PP.POH_5 * PP.POV_4 
		+ PP.POH_4 * PP.POV_0 + PP.POH_4 * PP.POV_1 + PP.POH_4 * PP.POV_2 + PP.POH_4 * PP.POV_3 
		+ PP.POH_3 * PP.POV_0 + PP.POH_3 * PP.POV_1 + PP.POH_3 * PP.POV_2 
		+ PP.POH_2 * PP.POV_0 + PP.POH_2 * PP.POV_1 
		+ PP.POH_1 * PP.POV_0 		AS `Pb_Home`	-- Win Probabilty for Team Home
		
		, PP.POH_0 * PP.POV_0 + PP.POH_1 * PP.POV_1 + PP.POH_2 * PP.POV_2
		+ PP.POH_3 * PP.POV_3 + PP.POH_4 * PP.POV_4 + PP.POH_5 * PP.POV_5
		+ PP.POH_6 * PP.POV_6		AS `Pb_Draw`	-- Probabilty of Match Tie
		
		, PP.POH_0 * PP.POV_6 + PP.POH_0 * PP.POV_5 + PP.POH_0 * PP.POV_4 + PP.POH_0 * PP.POV_3 + PP.POH_0 * PP.POV_2 + PP.POH_0 * PP.POV_1
		+ PP.POH_1 * PP.POV_6 + PP.POH_1 * PP.POV_5 + PP.POH_1 * PP.POV_4 + PP.POH_1 * PP.POV_3 + PP.POH_1 * PP.POV_2
		+ PP.POH_2 * PP.POV_6 + PP.POH_2 * PP.POV_5 + PP.POH_2 * PP.POV_4 + PP.POH_2 * PP.POV_3
		+ PP.POH_3 * PP.POV_6 + PP.POH_3 * PP.POV_5 + PP.POH_3 * PP.POV_4
		+ PP.POH_4 * PP.POV_6 + PP.POH_4 * PP.POV_5
		+ PP.POH_5 * PP.POV_6		AS `Pb_Visit`	-- Win Probabilty for Team Visit
        
		, fnUtil_Get_Max6(PP.POH_0, PP.POH_1, PP.POH_2, PP.POH_3, PP.POH_4, PP.POH_5, PP.POH_6) 	AS `Max_POH`	-- Max Probability for Possible Goal Scored BY Team Home
		, fnUtil_Get_Max6(PP.POV_0, PP.POV_1, PP.POV_2, PP.POV_3, PP.POV_4, PP.POV_5, PP.POV_6) 	AS `Max_POV`	-- Max Probability for Possible Goal Scored BY Team Visit
		, fnUtil_Get_MaxIdx6(PP.POH_0, PP.POH_1, PP.POH_2, PP.POH_3, PP.POH_4, PP.POH_5, PP.POH_6)	AS `Max_OH` 	-- Score for Max Prob. Home Team
		, fnUtil_Get_MaxIdx6(PP.POV_0, PP.POV_1, PP.POV_2, PP.POV_3, PP.POV_4, PP.POV_5, PP.POV_6) 	AS `Max_OV`		-- Score for Max Prob. Team Visit
	FROM 
		`vwStats_Get_PoissonProb` PP
	WHERE
			PP.SeasonId = SeasonId_p
		AND PP.WeekNo = WeekNo_p;
END$$
DELIMITER ;
