--
--  Gets by Season Points Earned home teams (Just selected matches)
--
DROP VIEW IF EXISTS vwStats_Get_SAGSAH_t;
CREATE VIEW vwStats_Get_SAGSAH_t AS
SELECT
	  HI.SeasonId
	, SUM(HI.Played)					AS `Played`
	, SUM(HI.Scored)					AS `Scored`
	, SUM(HI.Scored) / SUM(HI.Played)	AS `avgScored`
FROM
	`vwStats_Get_HomeIndicators_t` HI
GROUP BY
	HI.SeasonId;
	