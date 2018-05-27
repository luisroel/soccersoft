--
--  Average Point Lost By Visitor Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_APLVT_t;
CREATE VIEW vwStats_Get_APLVT_t AS
SELECT
	  VI.SeasonId
    , VI.TeamId
    , SUM(VI.Played)					AS `Played`
    , SUM(VI.Lost_Pts)					AS `Lost_Pts`
    , SUM(VI.Lost_Pts) / SUM(VI.Played)	AS `Avg_Lost_Pts`
FROM
	`vwStats_Get_VisitIndicators_t` VI
GROUP BY
	  VI.SeasonId
    , VI.TeamId;
	