--
--  Live Home Standing Clasification
--
DROP VIEW IF EXISTS vwStats_Get_HomeLiveStanding;
CREATE VIEW vwStats_Get_HomeLiveStanding AS
SELECT
	  ST.SeasonId
	, HI.PhaseId
    , SS.ShortName				AS `Season`
    , ST.TeamId
    , TM.ShortName				AS `Team`

    , SUM(IFNULL(HI.Played,0))	AS `PlY`
	, SUM(IFNULL(HI.Wins,0))	AS `Win`
    , SUM(IFNULL(HI.Draws,0)) 	AS `Drw`
    , SUM(IFNULL(HI.Losses,0)) 	AS `Lss`
    , SUM(IFNULL(HI.Scored,0)) 	AS `Gls`
    , SUM(IFNULL(HI.Against,0))	AS `Agn`
    , SUM(IFNULL(HI.Diff,0)) 	AS `Dif`
    , SUM(3*IFNULL(HI.Wins,0)
    + IFNULL(HI.Draws,0)) 		AS `Pts`
FROM
	tbCore_SeasonTeam ST
    INNER JOIN tbCore_Season SS ON
		SS.SeasonId = ST.SeasonId
    INNER JOIN tbCore_Team TM ON
		TM.TeamId = ST.TeamId
	LEFT JOIN vwStats_Get_HomeIndicators HI ON
			HI.SeasonId = ST.SeasonId
        AND HI.TeamId 	= ST.TeamId 
GROUP BY
	  ST.SeasonId
	, HI.PhaseId
    , SS.ShortName
    , ST.TeamId
    , TM.ShortName;
    