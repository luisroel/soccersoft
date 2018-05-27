--
--  Indicators for a given match
--
DROP VIEW IF EXISTS vwStats_Get_Indicators;
CREATE VIEW vwStats_Get_Indicators AS
SELECT
	  HI.SeasonId
    , HI.PhaseId
    , HI.WeekNo
    , HI.Time
    , HI.TeamId
	    
    , HI.Played				AS `HPl`
    , HI.Wins				AS `HWn`
    , HI.Draws				AS `HDr`
    , HI.Losses				AS `HLs`
    , HI.Scored				AS `HGl`
    , HI.Against			AS `HAg`
    , HI.Diff				AS `HDf`
    , 3*HI.Wins + HI.Draws	AS `HPt`

    , 0						AS `VPl`
    , 0						AS `VWn`
    , 0						AS `VDr`
    , 0						AS `VLs`
    , 0						AS `VGl`
    , 0						AS `VAg`
    , 0						AS `VDf`
    , 0						AS `VPt`
FROM
	vwStats_Get_HomeIndicators HI
UNION ALL
SELECT
	  VI.SeasonId
	, VI.PhaseId
    , VI.WeekNo
    , VI.Time
    , VI.TeamId
      
    , 0
    , 0
    , 0
    , 0
    , 0
    , 0
    , 0
    , 0

    , VI.Played
    , VI.Wins
    , VI.Draws
    , VI.Losses
    , VI.Scored
    , VI.Against
    , VI.Diff
    , 3*VI.Wins + VI.Draws
FROM
	vwStats_Get_VisitIndicators VI;
