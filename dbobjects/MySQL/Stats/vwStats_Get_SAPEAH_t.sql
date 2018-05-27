--
--  Gets by Season Points Earned Home Teams (Just selected matches)
--
DROP VIEW IF EXISTS vwStats_Get_SAPEAH_t;
CREATE VIEW vwStats_Get_SAPEAH_t AS
SELECT
	  HI.SeasonId
	, SUM(HI.Played)						AS `Played`
	, SUM(HI.Earned_Pts)					AS `Earned_Pts`
	, SUM(HI.Earned_Pts) / SUM(HI.Played)	AS `Avg_Earned_Pts`
FROM
	`vwStats_Get_HomeIndicators_t` HI
GROUP BY
	HI.SeasonId;
	