--
--  Gets by Season goals scored, games played and Avg goals per match by visit teams (ONLY SELECT MATCHES)
--
DROP VIEW IF EXISTS vwStats_Get_SAGSBV_t;
CREATE VIEW vwStats_Get_SAGSBV_t AS
SELECT
	  VI.SeasonId
	, SUM(VI.Played)					AS `Played`
	, SUM(VI.Scored)					AS `Scored`
	, SUM(VI.Scored) / SUM(VI.Played)	AS `avgScored`
FROM
	`vwStats_Get_VisitIndicators_t` VI
GROUP BY
	VI.SeasonId;
	