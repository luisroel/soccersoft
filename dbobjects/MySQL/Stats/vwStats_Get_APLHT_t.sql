--
--  Average Points Lost By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_APLHT_t;
CREATE VIEW vwStats_Get_APLHT_t AS
SELECT
	  HI.SeasonId
    , HI.TeamId
    , SUM(HI.Played)					AS `Played`
    , SUM(HI.Lost_Pts)					AS `Lost_Pts`
    , SUM(HI.Lost_Pts) / SUM(HI.Played)	AS `Avg_Lost_Pts`
FROM
	`vwStats_Get_HomeIndicators_t` HI
GROUP BY
	  HI.SeasonId
    , HI.TeamId;
	