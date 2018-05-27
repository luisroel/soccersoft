--
--  Average Goals Scored By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_AGSHT;
CREATE VIEW vwStats_Get_AGSHT AS
SELECT
	  HI.SeasonId
    , HI.TeamId
    , SUM(HI.Played)					AS `Played`
    , SUM(HI.Scored)					AS `Scored`
    , SUM(HI.Scored) / SUM(HI.Played)	AS `avgScored`
FROM
	`vwStats_Get_HomeIndicators` HI
GROUP BY
	  HI.SeasonId
    , HI.TeamId;
	