--
--  Parameters to compute probability by normal formula
--
DROP VIEW IF EXISTS vwStats_Get_NormalParmsDiff;
CREATE VIEW vwStats_Get_NormalParmsDiff AS
SELECT
	  HI.SeasonId
    , MIN(HI.Diff) AS `Min`
	, MAX(HI.Diff) AS `Max`
    , AVG(HI.Diff) AS `Avg`
    , STD(HI.Diff) AS `Std`
FROM
	`vwStats_Get_HomeIndicators` HI
WHERE
	HI.PhaseId <= 4
GROUP BY
	  HI.SeasonId;
	