--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_Visit7Simulation;
CREATE VIEW vwStats_Get_Visit7Simulation AS
SELECT
	  'Bet'				AS 'Type'
	, HW.FixtureId
	, HW.TournamentId
	, HW.Tournament
	, HW.Time
	, HW.Home
	, HW.Visitor
	, HW.SH
	, HW.SV
	, HW.FC
	, HW.Rsl
	, HW.Ok
	, HW.Odd
FROM 
	vwStats_Get_Visit7Raw HW
UNION ALL
SELECT 
	  CASE WHEN HW.OK = 1 THEN 'Pay' ELSE 'Ded' END 	 AS  'Type'
	, HW.FixtureId
	, HW.TournamentId
	, HW.Tournament
	, DATE_ADD(HW.Time, INTERVAL 150 MINUTE) 				 AS 'Time'
	, HW.Home
	, HW.Visitor
	, HW.SH
	, HW.SV
	, HW.FC
	, HW.Rsl
	, HW.Ok
	, HW.Odd
FROM 
	vwStats_Get_Visit7Raw HW;