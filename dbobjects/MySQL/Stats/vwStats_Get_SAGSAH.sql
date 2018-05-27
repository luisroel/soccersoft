--
--  Gets by Season goals scored, games played and Avg goals per match by home teams
--
DROP VIEW IF EXISTS vwStats_Get_SAGSAH;
CREATE VIEW vwStats_Get_SAGSAH AS
SELECT
	  HI.SeasonId
	, SUM(HI.Played)					AS `Played`
	, SUM(HI.Scored)					AS `Scored`
	, SUM(HI.Scored) / SUM(HI.Played)	AS `avgScored`
FROM
	`vwStats_Get_HomeIndicators` HI
GROUP BY
	HI.SeasonId;
	