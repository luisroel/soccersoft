--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_Visit7Raw;
CREATE VIEW vwStats_Get_Visit7Raw AS
SELECT
	  SS.SeasonId
	, SS.ShortName													AS 'Season'
	, FT.FixtureId
    , FT.WeekNo
    , AA.AssociationId
    , AA.ShortName													AS 'Association'
    , TR.TournamentId
    , TR.ShortName													AS 'Tournament'
	, FT.Time
    , TH.Name 														AS 'Home'
    , TV.Name 														AS 'Visitor'
    , FT.Odd_1
    , FT.Odd_X
    , FT.Odd_2
    , FT.Last5_H
    , FT.Last5_V
    , PA.OH
    , PA.OV
    , PA.OH - PA.OV													AS 'Diff'
    , PA.Max_OH
    , PA.Max_OV
    , FT.ScoredHome 												AS 'SH'
    , FT.ScoredVisitor 												AS 'SV'
    , 'V'															AS 'FC'
    , fnStats_Get_Result(FT.ScoredHome, FT.ScoredVisitor)			AS 'Rsl'
    , FT.Odd_2														AS 'Odd'
    , (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)AS 'Ok'
    
    
    , PA.Pb_Home
    , PA.Pb_Draw
    , PA.Pb_Visit
    , PA.Max_POH
    , PA.Max_POV
    , PA.POH_0
    , PA.POH_1
    , PA.POH_2
    , PA.POH_3
    , PA.POH_4
    , PA.POH_5
    , PA.POH_6
    , PA.POV_0
    , PA.POV_1
    , PA.POV_2
    , PA.POV_3
    , PA.POV_4
    , PA.POV_5
    , PA.POV_6
    
    , PA.THAGS
    , PA.TVAGC
    , PA.TVAGS
    , PA.THAGC
    , PA.THAS
    , PA.TVDS
    , PA.TVAS
    , PA.THDS
    , PA.SASH
    , PA.SASV
    
	, IFNULL(OH.Position,0)	AS PositionH
    , IFNULL(OH.Played,0)	AS PlayedH
    , IFNULL(OH.Wins,0)		AS WinsH
    , IFNULL(OH.Draws,0)	AS DrawH
    , IFNULL(OH.Losses,0)	AS LossesH
    , IFNULL(OH.Scored,0)	AS ScoredH
    , IFNULL(OH.Against,0)	AS AgainstH
    , IFNULL(OH.Points,0)	AS PointsH
    
	, IFNULL(OV.Position,0)	AS PositionV
    , IFNULL(OV.Played,0)	AS PlayedV
    , IFNULL(OV.Wins,0)		AS WinsV
    , IFNULL(OV.Draws,0)	AS DrawV
    , IFNULL(OV.Losses,0)	AS LossesV
    , IFNULL(OV.Scored,0)	AS ScoredV
    , IFNULL(OV.Against,0)	AS AgainstV
    , IFNULL(OV.Points,0)	AS PointsV
    
    , IFNULL(PF.OH,0)					AS OH_F
    , IFNULL(PF.OV,0)					AS OV_F
    , IFNULL(PF.OH,0) - IFNULL(PF.OV,0)	AS Diff_F
    , IFNULL(PF.Max_OH,0)				AS Max_OH_F
    , IFNULL(PF.Max_OV,0)				AS Max_OV_F

    , IFNULL(PF.Pb_Home,0)			AS Pb_Home_F
    , IFNULL(PF.Pb_Draw,0)			AS Pb_Draw_F
    , IFNULL(PF.Pb_Visit,0)			AS Pb_Visit_F
    , IFNULL(PF.Max_POH,0)			AS Max_POH_F
    , IFNULL(PF.Max_POV,0)			AS Max_POV_F
    , IFNULL(PF.POH_0,0)			AS POH_0_F
    , IFNULL(PF.POH_1,0)			AS POH_1_F
    , IFNULL(PF.POH_2,0)			AS POH_2_F
    , IFNULL(PF.POH_3,0)			AS POH_3_F
    , IFNULL(PF.POH_4,0)			AS POH_4_F
    , IFNULL(PF.POH_5,0)			AS POH_5_F
    , IFNULL(PF.POH_6,0)			AS POH_6_F
    , IFNULL(PF.POV_0,0)			AS POV_0_F
    , IFNULL(PF.POV_1,0)			AS POV_1_F
    , IFNULL(PF.POV_2,0)			AS POV_2_F
    , IFNULL(PF.POV_3,0)			AS POV_3_F
    , IFNULL(PF.POV_4,0)			AS POV_4_F
    , IFNULL(PF.POV_5,0)			AS POV_5_F
    , IFNULL(PF.POV_6,0)			AS POV_6_F
    
    , IFNULL(PF.THAGS,0)			AS THAGS_F
    , IFNULL(PF.TVAGC,0)			AS TVAGC_F
    , IFNULL(PF.TVAGS,0)			AS TVAGS_F
    , IFNULL(PF.THAGC,0)			AS THAGC_F
    , IFNULL(PF.THAS,0)				AS THAS_F
    , IFNULL(PF.TVDS,0)				AS TVDS_F
    , IFNULL(PF.TVAS,0)				AS TVAS_F
    , IFNULL(PF.THDS,0)				AS THDS_F
    , IFNULL(PF.SASH,0)				AS SASH_F
    , IFNULL(PF.SASV,0)				AS SASV_F
    
    , IFNULL(PP.OH,0)					AS OH_P
    , IFNULL(PP.OV,0)					AS OV_P
    , IFNULL(PP.OH,0) - IFNULL(PP.OV,0)	AS Diff_P
    , IFNULL(PP.Max_OH,0)				AS Max_OH_P
    , IFNULL(PP.Max_OV,0)				AS Max_OV_P

    , IFNULL(PP.Pb_Home,0)			AS Pb_Home_P
    , IFNULL(PP.Pb_Draw,0)			AS Pb_Draw_P
    , IFNULL(PP.Pb_Visit,0)			AS Pb_Visit_P
    , IFNULL(PP.Max_POH,0)			AS Max_POH_P
    , IFNULL(PP.Max_POV,0)			AS Max_POV_P
    , IFNULL(PP.POH_0,0)			AS POH_0_P
    , IFNULL(PP.POH_1,0)			AS POH_1_P
    , IFNULL(PP.POH_2,0)			AS POH_2_P
    , IFNULL(PP.POH_3,0)			AS POH_3_P
    , IFNULL(PP.POH_4,0)			AS POH_4_P
    , IFNULL(PP.POH_5,0)			AS POH_5_P
    , IFNULL(PP.POH_6,0)			AS POH_6_P
    , IFNULL(PP.POV_0,0)			AS POV_0_P
    , IFNULL(PP.POV_1,0)			AS POV_1_P
    , IFNULL(PP.POV_2,0)			AS POV_2_P
    , IFNULL(PP.POV_3,0)			AS POV_3_P
    , IFNULL(PP.POV_4,0)			AS POV_4_P
    , IFNULL(PP.POV_5,0)			AS POV_5_P
    , IFNULL(PP.POV_6,0)			AS POV_6_P
    
    , IFNULL(PP.THAGS,0)			AS THAGS_P
    , IFNULL(PP.TVAGC,0)			AS TVAGC_P
    , IFNULL(PP.TVAGS,0)			AS TVAGS_P
    , IFNULL(PP.THAGC,0)			AS THAGC_P
    , IFNULL(PP.THAS,0)				AS THAS_P
    , IFNULL(PP.TVDS,0)				AS TVDS_P
    , IFNULL(PP.TVAS,0)				AS TVAS_P
    , IFNULL(PP.THDS,0)				AS THDS_P
    , IFNULL(PP.SASH,0)				AS SASH_P
    , IFNULL(PP.SASV,0)				AS SASV_P
FROM 
	tbStats_PoissonAnalysis_t PA 
    INNER JOIN tbCore_Fixture FT ON
		FT.FixtureId = PA.FixtureId
	INNER JOIN tbCore_Team TH ON
		TH.TeamId = FT.HomeTeamId
	INNER JOIN tbCore_Team TV ON
		TV.TeamId = FT.VisitorTeamId
	INNER JOIN tbCore_Season SS ON
		SS.SeasonId = FT.SeasonId
	INNER JOIN tbCore_Tournament TR ON
		TR.TournamentId = SS.TournamentId
	INNER JOIN tbCore_Association AA ON
		AA.AssociationId = TR.AssociationId
	LEFT JOIN tbStats_OverallTable OH ON
		    OH.SeasonId = FT.SeasonId
        AND OH.WeekNo 	= FT.WeekNo
		AND OH.TeamId 	= FT.HomeTeamId
	LEFT JOIN tbStats_OverallTable OV ON
		    OV.SeasonId = FT.SeasonId
        AND OV.WeekNo 	= FT.WeekNo
		AND OV.TeamId 	= FT.VisitorTeamId
    LEFT JOIN tbStats_PoissonAnalysis PF ON
		PF.FixtureId = PA.FixtureId
    LEFT JOIN tbStats_PoissonAnalysisPts_t PP ON
		PP.FixtureId = PA.FixtureId
WHERE
	    FT.Last5_V LIKE 'L%'
	AND FT.WeekNo >= 4
    AND (PA.OH - PA.OV) BETWEEN -0.57 AND 0.73
    AND IFNULL(PF.OH,0) - IFNULL(PF.OV,0) < 0.0
    AND IFNULL(OV.Scored,0) > IFNULL(OH.Scored,0);