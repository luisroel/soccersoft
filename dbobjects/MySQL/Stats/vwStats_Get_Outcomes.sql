--
--  Get possible outcomes base on attack strength and defence strength
--
DROP VIEW IF EXISTS vwStats_Get_Outcomes;
CREATE VIEW vwStats_Get_Outcomes AS
SELECT
	  SP.*
    , SP.THAS * SP.TVDS * SP.SASH	AS `OH`
    , SP.TVAS * SP.THDS * SP.SASV	AS `OV`
FROM 
	`vwStats_Get_StrengthParms` SP;