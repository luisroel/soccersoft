--
--  Average Point Earn By Home Teams In A Given Season (APEHT)
--
DROP VIEW IF EXISTS vwStats_Get_APEHT_t;
CREATE VIEW vwStats_Get_APEHT_t AS
SELECT
	  HI.SeasonId
    , HI.TeamId
    , SUM(HI.Played)						AS `Played`
    , SUM(HI.Earned_Pts)					AS `Earned_Pts`
    , SUM(HI.Earned_Pts) / SUM(HI.Played)	AS `Avg_Earned_Pts`
FROM
	`vwStats_Get_HomeIndicators_t` HI
GROUP BY
	  HI.SeasonId
    , HI.TeamId;
	