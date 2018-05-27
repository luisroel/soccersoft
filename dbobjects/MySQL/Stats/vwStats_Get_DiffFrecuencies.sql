--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_DiffFrecuencies;
CREATE VIEW vwStats_Get_DiffFrecuencies AS
SELECT
	  HI.SeasonId
	, HI.Diff
    , COUNT(*)	AS `Frecuency`
FROM
	`vwStats_Get_HomeIndicators` HI
WHERE
	HI.PhaseId <= 4
GROUP BY
	  HI.SeasonId
	, HI.Diff;
    