--
--  Average Goals Conceded By Visitor Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_AGCVT;
CREATE VIEW vwStats_Get_AGCVT AS
SELECT
	  VI.SeasonId
    , VI.TeamId
    , SUM(VI.Played)					AS `Played`
    , SUM(VI.Against)					AS `Against`
    , SUM(VI.Against) / SUM(VI.Played)	AS `avgAgainst`
FROM
	`vwStats_Get_VisitIndicators` VI
GROUP BY
	  VI.SeasonId
    , VI.TeamId;
	