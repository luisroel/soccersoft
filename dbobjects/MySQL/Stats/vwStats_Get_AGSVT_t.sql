--
--  Average Points Earned By Visitor Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_AGSVT_t;
CREATE VIEW vwStats_Get_AGSVT_t AS
SELECT
	  VI.SeasonId
    , VI.TeamId
    , SUM(VI.Played)					AS `Played`
    , SUM(VI.Scored)					AS `Scored`
    , SUM(VI.Scored) / SUM(VI.Played)	AS `avgScored`
FROM
	`vwStats_Get_VisitIndicators_t` VI
GROUP BY
	  VI.SeasonId
    , VI.TeamId;
	