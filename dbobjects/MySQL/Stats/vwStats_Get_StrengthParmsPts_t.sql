--
--  Average Lost Points By Home Teams In A Given Season (ONLY SELECTED MATCHES)
--
DROP VIEW IF EXISTS vwStats_Get_StrengthParmsPts_t;
CREATE VIEW vwStats_Get_StrengthParmsPts_t AS
SELECT
	  FT.SeasonId
	, FT.WeekNo
	, FT.FixtureId
    
    , SH.Avg_Earned_Pts						AS `THAGS`	-- Team Home Avg Earned Points At Home:					(THAGS)
    , CV.Avg_Lost_Pts						AS `TVAGC`	-- Team Visit Avg Lost Points As Visitor:				(TVAGC)
    , SV.Avg_Earned_Pts						AS `TVAGS`	-- Team Visit Avg Earned Points As Visitor:				(TVAGS)
    , CH.Avg_Lost_Pts						AS `THAGC`	-- Team Home Avg Lost Points At Home:					(THAGC)
    
    , SH.Avg_Earned_Pts / HS.Avg_Earned_Pts	AS `THAS`	-- Team Home Attack Strength At Home:					(THAS)
    , CV.Avg_Lost_Pts / HS.Avg_Earned_Pts	AS `TVDS`	-- Team Visit Defense Strength As Visitor:				(TVDS)
    , SV.Avg_Earned_Pts / VS.Avg_Earned_Pts	AS `TVAS`	-- Team Visit Attack Strength As Visitor:				(TVAS)
    , CH.Avg_Lost_Pts / VS.Avg_Earned_Pts	AS `THDS`	-- Team Home Defense Strength At Home:					(THDS)
    
    , HS.Avg_Earned_Pts						AS `SASH`	-- Season Avg Earned Points At Home						(SASH)
    , VS.Avg_Earned_Pts						AS `SASV`	-- Season Avg Earned Points As Visitor					(SASV)    
FROM
	`tbCore_Fixture` FT
	INNER JOIN `vwStats_Get_APEHT_t` SH ON	--  Average Earned Points By Given Home Teams In A Given Season		(AGSHT)
			SH.SeasonId = FT.SeasonId
        AND SH.TeamId	= FT.HomeTeamId
    INNER JOIN `vwStats_Get_APEVT_t` SV ON	--  Average Earned Points By Given Visitor Teams In A Given Season	(AGSVT)
			SV.SeasonId = FT.SeasonId
        AND SV.TeamId 	= FT.VisitorTeamId
    INNER JOIN `vwStats_Get_APLHT_t` CH ON	--  Average Lost Points By Given Home Teams In A Given Season		(AGCHT)
			CH.SeasonId = FT.SeasonId
        AND CH.TeamId 	= FT.HomeTeamId
    INNER JOIN `vwStats_Get_APLVT_t` CV ON	--  Average Lost Points By Given Visitor Teams In A Given Season	(AGCVT)
			CV.SeasonId = FT.SeasonId
        AND CV.TeamId 	= FT.VisitorTeamId
    INNER JOIN `vwStats_Get_SAPEAH_t` HS ON	--  Average Earned Points By Home Team In A Given Season
		HS.SeasonId = FT.SeasonId
    INNER JOIN `vwStats_Get_SAPEBV_t` VS ON	--  Average Earned Points By Visitor Teams In A Given Season
		VS.SeasonId = FT.SeasonId;
