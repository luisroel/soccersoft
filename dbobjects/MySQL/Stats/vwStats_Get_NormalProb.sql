--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_NormalProb;
CREATE VIEW vwStats_Get_NormalProb AS
SELECT 
	  SD.*
    , NP.Min
    , NP.Max
    , NP.Avg
    , NP.Std
    , fnStats_Get_NormalValue(SD.Diff, NP.Avg, NP.Std)	AS `Prob`
FROM 
	`vwStats_Get_DiffFrecuencies` SD
    INNER JOIN `vwStats_Get_NormalParmsDiff` NP ON
		NP.SeasonId = SD.SeasonId;
	