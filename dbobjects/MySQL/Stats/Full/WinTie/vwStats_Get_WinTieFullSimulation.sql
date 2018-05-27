--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_WinTieFullSimulation;
CREATE VIEW vwStats_Get_WinTieFullSimulation AS
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
    , HW.Pb_Home
FROM 
	vwStats_Get_WinTieFullRaw HW
UNION ALL
SELECT 
	  CASE WHEN HW.Ok = 1 THEN 'Pay' ELSE 'Ded' END 	 AS  'Type'
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
    , HW.Pb_Home
FROM 
	vwStats_Get_WinTieFullRaw HW;