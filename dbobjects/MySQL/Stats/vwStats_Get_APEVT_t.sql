--
--  Average Points Earned By Visitor Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_APEVT_t;
CREATE VIEW vwStats_Get_APEVT_t AS
SELECT
	  VI.SeasonId
    , VI.TeamId
    , SUM(VI.Played)						AS `Played`
    , SUM(VI.Earned_Pts)					AS `Earned_Pts`
    , SUM(VI.Earned_Pts) / SUM(VI.Played)	AS `Avg_Earned_Pts`
FROM
	`vwStats_Get_VisitIndicators_t` VI
GROUP BY
	  VI.SeasonId
    , VI.TeamId;
	