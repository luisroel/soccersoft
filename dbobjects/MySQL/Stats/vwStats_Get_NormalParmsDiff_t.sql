--
--  Parameters to compute probability by normal formula (ONLY SELECTED MATCHES)
--
DROP VIEW IF EXISTS vwStats_Get_NormalParmsDiff_t;
CREATE VIEW vwStats_Get_NormalParmsDiff_t AS
SELECT
	  HI.SeasonId
    , MIN(HI.Diff) AS `Min`
	, MAX(HI.Diff) AS `Max`
    , AVG(HI.Diff) AS `Avg`
    , STD(HI.Diff) AS `Std`
FROM
	`vwStats_Get_HomeIndicators_t` HI
GROUP BY
	  HI.SeasonId;