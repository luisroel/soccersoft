--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_Simulation_t;
CREATE VIEW vwStats_Get_Simulation_t AS
	SELECT
		  RD.Time	AS	`Date`
		, 'Bet'		AS	`Type`
		, RD.*
	FROM
		vwStats_Get_RawData_tt RD
	UNION ALL
	SELECT
		  DATE_ADD(RD.Time, INTERVAL 150 MINUTE) 				AS `Date`
		, CASE WHEN RD.Rsl = RD.SFC THEN 'Pay' ELSE 'Ded' END 	AS  `Type`
		, RD.*
	FROM
		vwStats_Get_RawData_tt RD;
