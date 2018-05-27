--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_HomeWins_t;
CREATE VIEW vwStats_Get_HomeWins_t AS
SELECT
	  TT.*
	, TT.SFC										AS `FC`
	, TT.SOdd 										AS `Odd`
	, CASE WHEN TT.Rsl = TT.SFC THEN 1 ELSE 0 END 	AS `Ok`
FROM 
	vwStats_Get_Simulation_t TT
WHERE
		TT.SFC 		= 'L'
	AND TT.TVAGC	<= 2.0
	AND TT.TVAS		<  1.5
	AND ((TT.SOdd	BETWEEN 1.5 AND 2.0) OR TT.SOdd = 1.0)
	AND TT.Pb_Home	> 0.65
	AND TT.Max_OV 	= 0
	AND TT.Pb_Draw	< 0.1;
