--
--  Gets by Season goals scored, games played and Avg goals per match by vist teams
--
DROP VIEW IF EXISTS vwStats_Get_SAGSBV;
CREATE VIEW vwStats_Get_SAGSBV AS
SELECT
	  VI.SeasonId
	, SUM(VI.Played)					AS `Played`
	, SUM(VI.Scored)					AS `Scored`
	, SUM(VI.Scored) / SUM(VI.Played)	AS `avgScored`
FROM
	`vwStats_Get_VisitIndicators` VI
GROUP BY
	VI.SeasonId;
