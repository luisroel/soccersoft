--
--  Get possible outcomes base on attack strength and defence strength (ONLY SELECTED MATCHES)
--
DROP VIEW IF EXISTS vwStats_Get_Outcomes_t;
CREATE VIEW vwStats_Get_Outcomes_t AS
SELECT
	  SP.*
    , SP.THAS * SP.TVDS * SP.SASH	AS `OH`
    , SP.TVAS * SP.THDS * SP.SASV	AS `OV`
FROM 
	`vwStats_Get_StrengthParms_t` SP;