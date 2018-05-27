--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_DiffFrecuencies_t;
CREATE VIEW vwStats_Get_DiffFrecuencies_t AS
SELECT
	  HI.SeasonId
	, HI.Diff
    , COUNT(*)	AS `Frecuency`
FROM
	`vwStats_Get_HomeIndicators_t` HI
GROUP BY
	  HI.SeasonId
	, HI.Diff;
    