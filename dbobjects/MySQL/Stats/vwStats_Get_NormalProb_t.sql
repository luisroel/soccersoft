--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_NormalProb_t;
CREATE VIEW vwStats_Get_NormalProb_t AS
SELECT 
	  SD.*
    , NP.Min
    , NP.Max
    , NP.Avg
    , NP.Std
    , fnStats_Get_NormalValue(SD.Diff, NP.Avg, NP.Std)	AS `Prob`
FROM 
	`vwStats_Get_DiffFrecuencies_t` SD
    INNER JOIN `vwStats_Get_NormalParmsDiff_t` NP ON
		NP.SeasonId = SD.SeasonId;
	