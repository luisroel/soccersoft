--
--  Average Goals Scored By Visitor Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_AGSVT;
CREATE VIEW vwStats_Get_AGSVT AS
SELECT
	  VI.SeasonId
    , VI.TeamId
    , SUM(VI.Played)					AS `Played`
    , SUM(VI.Scored)					AS `Scored`
    , SUM(VI.Scored) / SUM(VI.Played)	AS `avgScored`
FROM
	`vwStats_Get_VisitIndicators` VI
GROUP BY
	  VI.SeasonId
    , VI.TeamId;
	