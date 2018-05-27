--
--  Average Goals Conceded By Visitor Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_AGCVT_t;
CREATE VIEW vwStats_Get_AGCVT_t AS
SELECT
	  VI.SeasonId
    , VI.TeamId
    , SUM(VI.Played)					AS `Played`
    , SUM(VI.Against)					AS `Against`
    , SUM(VI.Against) / SUM(VI.Played)	AS `avgAgainst`
FROM
	`vwStats_Get_VisitIndicators_t` VI
GROUP BY
	  VI.SeasonId
    , VI.TeamId;
	