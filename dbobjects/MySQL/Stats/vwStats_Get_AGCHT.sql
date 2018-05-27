--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_AGCHT;
CREATE VIEW vwStats_Get_AGCHT AS
SELECT
	  HI.SeasonId
    , HI.TeamId
    , SUM(HI.Played)					AS `Played`
    , SUM(HI.Against)					AS `Against`
    , SUM(HI.Against) / SUM(HI.Played)	AS `avgAgainst`
FROM
	`vwStats_Get_HomeIndicators` HI
GROUP BY
	  HI.SeasonId
    , HI.TeamId;
	