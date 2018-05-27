--
-- Poison analysis by week no.
--
DROP PROCEDURE IF EXISTS spStats_Get_PoissonAnalysis_w;
DELIMITER $$
CREATE PROCEDURE spStats_Get_PoissonAnalysis_w(
	  IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
    -- DELETE PREVIUOS RECORDS
    DELETE FROM tbStats_PoissonAnalysis WHERE FixtureId IN (
		SELECT FT.FixtureId  FROM tbCore_Fixture FT WHERE FT.SeasonId = SeasonId_p AND FT.WeekNo = WeekNo_p
    );
    
    INSERT INTO tbStats_PoissonAnalysis
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
	FROM (
		-- CREATE VIEW vwStats_Get_PoissonProb AS
		SELECT
			OC.*
			
			, fnUtil_Get_PoissonProb(0, OC.OH)	AS `POH_0`
			, fnUtil_Get_PoissonProb(1, OC.OH)	AS `POH_1`
			, fnUtil_Get_PoissonProb(2, OC.OH)	AS `POH_2`
			, fnUtil_Get_PoissonProb(3, OC.OH)	AS `POH_3`
			, fnUtil_Get_PoissonProb(4, OC.OH)	AS `POH_4`
			, fnUtil_Get_PoissonProb(5, OC.OH)	AS `POH_5`
			, fnUtil_Get_PoissonProb(6, OC.OH)	AS `POH_6`
			
			, fnUtil_Get_PoissonProb(0, OC.OV)	AS `POV_0`
			, fnUtil_Get_PoissonProb(1, OC.OV)	AS `POV_1`
			, fnUtil_Get_PoissonProb(2, OC.OV)	AS `POV_2`
			, fnUtil_Get_PoissonProb(3, OC.OV)	AS `POV_3`
			, fnUtil_Get_PoissonProb(4, OC.OV)	AS `POV_4`
			, fnUtil_Get_PoissonProb(5, OC.OV)	AS `POV_5`
			, fnUtil_Get_PoissonProb(6, OC.OV)	AS `POV_6`
		FROM (
			-- CREATE VIEW vwStats_Get_Outcomes AS
			SELECT
				  SP.*
				, SP.THAS * SP.TVDS * SP.SASH	AS `OH`
				, SP.TVAS * SP.THDS * SP.SASV	AS `OV`
			FROM  (
				-- CREATE VIEW vwStats_Get_StrengthParms AS
				SELECT
					  FT.SeasonId
					, FT.WeekNo
					, FT.FixtureId

					, IFNULL(SH.avgScored,0.0)								AS `THAGS`	-- Team Home Avg Goals Scored At Home:			(THAGS)
					, IFNULL(CV.AvgAgainst,0.0)								AS `TVAGC`	-- Team Visit Avg Goals Conceded As Visitor:	(TVAGC)
					, IFNULL(SV.avgScored,0.0)								AS `TVAGS`	-- Team Visit Avg Goals Scored As Visitor:		(TVAGS)
					, IFNULL(CH.AvgAgainst,0.0)								AS `THAGC`	-- Team Home Avg Goals Conceded At Home:		(THAGC)
					
					, IFNULL(SH.AvgScored,0.0) / IFNULL(HS.avgScored,1.0)	AS `THAS`	-- Team Home Attack Strength At Home:			(THAS)
					, IFNULL(CV.avgAgainst,0.0) / IFNULL(HS.avgScored,1.0)	AS `TVDS`	-- Team Visit Defense Strength As Visitor:		(TVDS)
					, IFNULL(SV.AvgScored,0.0) / IFNULL(VS.avgScored,1.0)	AS `TVAS`	-- Team Visit Attack Strength As Visitor:		(TVAS)
					, IFNULL(CH.avgAgainst,0.0) / IFNULL(VS.avgScored,1.0)	AS `THDS`	-- Team Home Defense Strength At Home:			(THDS)
					
					, IFNULL(HS.avgScored,0.0)								AS `SASH`	-- Season Avg Scored At Home					(SASH)
					, IFNULL(VS.avgScored,0.0)								AS `SASV`	-- Season Avg Scored As Visitor					(SASV)
				FROM
					`tbCore_Fixture` FT
					LEFT JOIN (			-- `vwStats_Get_AGSHT` 
						SELECT
							  HI.TeamId
							, SUM(HI.Played)					AS `Played`
							, SUM(HI.Scored)					AS `Scored`
							, SUM(HI.Scored) / SUM(HI.Played)	AS `avgScored`
						FROM
							`vwStats_Get_HomeIndicators` HI
						WHERE
								HI.SeasonId = SeasonId_p
							AND HI.WeekNo 	< WeekNo_p
						GROUP BY
							HI.TeamId
					) SH ON	--  Average Goals Scored By Given Home Teams In A Given Season		(AGSHT)
						SH.TeamId	= FT.HomeTeamId
					LEFT JOIN  (			-- `vwStats_Get_AGSVT` 
						SELECT
							  VI.TeamId
							, SUM(VI.Played)					AS `Played`
							, SUM(VI.Scored)					AS `Scored`
							, SUM(VI.Scored) / SUM(VI.Played)	AS `avgScored`
						FROM
							`vwStats_Get_VisitIndicators` VI
						WHERE
								VI.SeasonId = SeasonId_p
							AND VI.WeekNo 	< WeekNo_p
						GROUP BY
							VI.TeamId
					) SV ON	--  Average Goals Scored By Given Visitor Teams In A Given Season		(AGSVT)
						SV.TeamId 	= FT.VisitorTeamId
					LEFT JOIN ( 			-- `vwStats_Get_AGCHT`
						SELECT
							  HI.TeamId
							, SUM(HI.Played)					AS `Played`
							, SUM(HI.Against)					AS `Against`
							, SUM(HI.Against) / SUM(HI.Played)	AS `avgAgainst`
						FROM
							`vwStats_Get_HomeIndicators` HI
						WHERE
								HI.SeasonId = SeasonId_p
							AND HI.WeekNo 	< WeekNo_p
						GROUP BY
							HI.TeamId
					) CH ON	--  Average Goals Conceded By Given Home Teams In A Given Season		(AGCHT)
						CH.TeamId 	= FT.HomeTeamId
					LEFT JOIN (			-- `vwStats_Get_AGCVT` 
						SELECT
							  VI.TeamId
							, SUM(VI.Played)					AS `Played`
							, SUM(VI.Against)					AS `Against`
							, SUM(VI.Against) / SUM(VI.Played)	AS `avgAgainst`
						FROM
							`vwStats_Get_VisitIndicators` VI
						WHERE
								VI.SeasonId = SeasonId_p
							AND VI.WeekNo 	< WeekNo_p
						GROUP BY
							VI.TeamId
					) CV ON	--  Average Goals Conceded By Given Visitor Teams In A Given Season	(AGCVT)
						CV.TeamId 	= FT.VisitorTeamId
					LEFT JOIN ( 			-- `vwStats_Get_SAGSAH` 
						SELECT
							  HI.SeasonId
							, SUM(HI.Played)					AS `Played`
							, SUM(HI.Scored)					AS `Scored`
							, SUM(HI.Scored) / SUM(HI.Played)	AS `avgScored`
						FROM
							`vwStats_Get_HomeIndicators` HI
						WHERE
								HI.SeasonId = SeasonId_p
							AND HI.WeekNo 	< WeekNo_p
					) HS ON	--  Average Goals Scored By Home Team In A Given Season
						HS.SeasonId = FT.SeasonId
					LEFT JOIN (			-- `vwStats_Get_SAGSBV` 
						SELECT
							  VI.SeasonId
							, SUM(VI.Played)					AS `Played`
							, SUM(VI.Scored)					AS `Scored`
							, SUM(VI.Scored) / SUM(VI.Played)	AS `avgScored`
						FROM
							`vwStats_Get_VisitIndicators` VI
						WHERE
								VI.SeasonId = SeasonId_p
							AND VI.WeekNo 	< WeekNo_p
					) VS ON	--  Average Goals Scored By Visitor Teams In A Given Season
						VS.SeasonId = FT.SeasonId
				WHERE
						FT.SeasonId = SeasonId_p
                    AND FT.WeekNo 	= WeekNo_p
				) SP
			) OC
	 ) PP;
END$$
DELIMITER ;
