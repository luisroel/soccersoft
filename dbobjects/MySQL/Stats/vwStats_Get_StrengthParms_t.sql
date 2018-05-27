--
--  Average Goals Conceded By Home Teams In A Given Season (ONLY SELECTED MATCHES)
--
DROP VIEW IF EXISTS vwStats_Get_StrengthParms_t;
CREATE VIEW vwStats_Get_StrengthParms_t AS
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
	LEFT JOIN `vwStats_Get_AGSHT_t` SH ON	--  Average Goals Scored By Given Home Teams In A Given Season		(AGSHT)
			SH.SeasonId = FT.SeasonId
        AND SH.TeamId	= FT.HomeTeamId
    LEFT JOIN `vwStats_Get_AGSVT_t` SV ON	--  Average Goals Scored By Given Visitor Teams In A Given Season	(AGSVT)
			SV.SeasonId = FT.SeasonId
        AND SV.TeamId 	= FT.VisitorTeamId
    LEFT JOIN `vwStats_Get_AGCHT_t` CH ON	--  Average Goals Conceded By Given Home Teams In A Given Season	(AGCHT)
			CH.SeasonId = FT.SeasonId
        AND CH.TeamId 	= FT.HomeTeamId
    LEFT JOIN `vwStats_Get_AGCVT_t` CV ON	--  Average Goals Conceded By Given Visitor Teams In A Given Season	(AGCVT)
			CV.SeasonId = FT.SeasonId
        AND CV.TeamId 	= FT.VisitorTeamId
    LEFT JOIN `vwStats_Get_SAGSAH_t` HS ON	--  Average Goals Scored By Home Team In A Given Season
		HS.SeasonId = FT.SeasonId
    LEFT JOIN `vwStats_Get_SAGSBV_t` VS ON	--  Average Goals Scored By Visitor Teams In A Given Season
		VS.SeasonId = FT.SeasonId;
