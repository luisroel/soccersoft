--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_WinWin7Stats;
CREATE VIEW vwStats_Get_WinWin7Stats AS
SELECT 
	  HW.SeasonId
	, HW.Season
	, HW.FixtureId
    , HW.WeekNo
    , HW.AssociationId
    , HW.Association
    , HW.TournamentId
    , HW.Tournament
	, HW.Time
    , HW.Home
    , HW.Visitor
    , HW.Odd_1
    , HW.Odd_X
    , HW.Odd_2
    , HW.Last5_H
    , HW.Last5_V
    , HW.OH
    , HW.OV
    , HW.Diff
    , HW.Max_OH
    , HW.Max_OV
    , HW.SH
    , HW.SV
    , HW.FC
    , HW.Rsl
    , HW.Odd
    , HW.Ok
FROM 
	vwStats_Get_WinWin7Raw HW;