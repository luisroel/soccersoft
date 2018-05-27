--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_PredictionWins_t;
CREATE VIEW vwStats_Get_PredictionWins_t AS
SELECT
	  TT.*
	, TT.SFC										AS `FC`
	, TT.SOdd 										AS `Odd`
	, CASE WHEN TT.rsl = TT.SFC THEN 1 ELSE 0 END 	AS `Ok`
FROM 
	vwStats_Get_Simulation_t TT;
