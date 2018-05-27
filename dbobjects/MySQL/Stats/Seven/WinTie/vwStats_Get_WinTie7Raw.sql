--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_WinTie7Raw;
CREATE VIEW vwStats_Get_WinTie7Raw AS
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
    , fnStats_Get_FCNormal(PA.Pb_Home,PA.Pb_Draw, PA.Pb_Visit)		AS 'FC'
    , fnStats_Get_Result(FT.ScoredHome, FT.ScoredVisitor)			AS 'Rsl'
    ,fnStats_Get_OddNotLose(
		  fnStats_Get_FCNormal(PA.Pb_Home,PA.Pb_Draw, PA.Pb_Visit)
		, 'D', 'L'
        , FnStats_Get_Result(FT.ScoredHome, FT.ScoredVisitor)
        ,FT.Odd_1, FT.Odd_X, FT.Odd_2) 								AS 'Odd'
    , fnStats_Get_FCResultdDC(
		  fnStats_Get_FCNormal(PA.Pb_Home,PA.Pb_Draw, PA.Pb_Visit)
        , 'D', 'L'
        , fnStats_Get_Result(FT.ScoredHome, FT.ScoredVisitor)
	)																AS 'Ok'
    
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
WHERE
	    PA.TVAGC	<= 2.0
	AND PA.TVAS		<  1.5
	AND PA.Pb_Home	> 0.65
	AND PA.Max_OV 	= 0
	AND PA.Pb_Draw	< 0.1
    AND ((FT.Odd_1	>= 1.5 AND FT.Odd_1	<= 2.2) OR  FT.Odd_1	= 1.0 )
	AND PA.WeekNo 	>= 4;