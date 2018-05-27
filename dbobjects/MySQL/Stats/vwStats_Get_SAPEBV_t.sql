--
--  Gets by Season Point Earned Visit Teams (ONLY SELECT MATCHES)
--
DROP VIEW IF EXISTS vwStats_Get_SAPEBV_t;
CREATE VIEW vwStats_Get_SAPEBV_t AS
SELECT
	  VI.SeasonId
	, SUM(VI.Played)						AS `Played`
	, SUM(VI.Earned_Pts)					AS `Earned_Pts`
	, SUM(VI.Earned_Pts) / SUM(VI.Played)	AS `Avg_Earned_Pts`
FROM
	`vwStats_Get_VisitIndicators_t` VI
GROUP BY
	VI.SeasonId;
	