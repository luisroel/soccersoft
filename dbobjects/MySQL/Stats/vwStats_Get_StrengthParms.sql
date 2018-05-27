--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_StrengthParms;
CREATE VIEW vwStats_Get_StrengthParms AS
SELECT
	  FT.SeasonId
	, FT.WeekNo
	, FT.FixtureId
    
    , SH.avgScored					AS `THAGS`	-- Team Home Avg Goals Scored At Home:			(THAGS)
    , CV.AvgAgainst					AS `TVAGC`	-- Team Visit Avg Goals Conceded As Visitor:	(TVAGC)
    , SV.avgScored					AS `TVAGS`	-- Team Visit Avg Goals Scored As Visitor:		(TVAGS)
    , CH.AvgAgainst					AS `THAGC`	-- Team Home Avg Goals Conceded At Home:		(THAGC)
    
    , SH.AvgScored / HS.avgScored	AS `THAS`	-- Team Home Attack Strength At Home:			(THAS)
    , CV.avgAgainst / HS.avgScored	AS `TVDS`	-- Team Visit Defense Strength As Visitor:		(TVDS)
    , SV.AvgScored / VS.avgScored	AS `TVAS`	-- Team Visit Attack Strength As Visitor:		(TVAS)
    , CH.avgAgainst / VS.avgScored	AS `THDS`	-- Team Home Defense Strength At Home:			(THDS)
    
    , HS.avgScored					AS `SASH`	-- Season Avg Scored At Home					(SASH)
    , VS.avgScored					AS `SASV`	-- Season Avg Scored As Visitor					(SASV)
FROM
	`tbCore_Fixture` FT
	INNER JOIN `vwStats_Get_AGSHT` SH ON	--  Average Goals Scored By Given Home Teams In A Given Season		(AGSHT)
			SH.SeasonId = FT.SeasonId
        AND SH.TeamId	= FT.HomeTeamId
    INNER JOIN `vwStats_Get_AGSVT` SV ON	--  Average Goals Scored By Given Visitor Teams In A Given Season		(AGSVT)
			SV.SeasonId = FT.SeasonId
        AND SV.TeamId 	= FT.VisitorTeamId
    INNER JOIN `vwStats_Get_AGCHT` CH ON	--  Average Goals Conceded By Given Home Teams In A Given Season		(AGCHT)
			CH.SeasonId = FT.SeasonId
        AND CH.TeamId 	= FT.HomeTeamId
    INNER JOIN `vwStats_Get_AGCVT` CV ON	--  Average Goals Conceded By Given Visitor Teams In A Given Season	(AGCVT)
			CV.SeasonId = FT.SeasonId
        AND CV.TeamId 	= FT.VisitorTeamId
    INNER JOIN `vwStats_Get_SAGSAH` HS ON	--  Average Goals Scored By Home Team In A Given Season
		HS.SeasonId = FT.SeasonId
    INNER JOIN `vwStats_Get_SAGSBV` VS ON	--  Average Goals Scored By Visitor Teams In A Given Season
		VS.SeasonId = FT.SeasonId;
