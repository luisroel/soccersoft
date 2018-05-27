--
--  Live Away Standing Clasification
--
DROP VIEW IF EXISTS vwStats_Get_AwayLiveStanding;
CREATE VIEW vwStats_Get_AwayLiveStanding AS
SELECT
	  ST.SeasonId
	, VI.PhaseId
    , SS.ShortName				AS `Season`
    , ST.TeamId
    , TM.ShortName				AS `Team`
       
    , SUM(IFNULL(VI.Played,0))	AS `Ply`
    , SUM(IFNULL(VI.Wins,0))	AS `Win`
    , SUM(IFNULL(VI.Draws,0)) 	AS `Drw`
    , SUM(IFNULL(VI.Losses,0)) 	AS `Lss`
    , SUM(IFNULL(VI.Scored,0)) 	AS `Gls`
    , SUM(IFNULL(VI.Against,0))	AS `Agn`
    , SUM(IFNULL(VI.Diff,0)) 	AS `Dif`
    , SUM(3*IFNULL(VI.Wins,0)
    + IFNULL(VI.Draws,0)) 		AS `Pts`
FROM
	tbCore_SeasonTeam ST
    INNER JOIN tbCore_Season SS ON
		SS.SeasonId = ST.SeasonId
    INNER JOIN tbCore_Team TM ON
		TM.TeamId = ST.TeamId
	LEFT JOIN vwStats_Get_VisitIndicators VI ON
			VI.SeasonId = ST.SeasonId
        AND VI.TeamId 	= ST.TeamId
GROUP BY
	  ST.SeasonId
	, VI.PhaseId
    , SS.ShortName
    , ST.TeamId
    , TM.ShortName;
