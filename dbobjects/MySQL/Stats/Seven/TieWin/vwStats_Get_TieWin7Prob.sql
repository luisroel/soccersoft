--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_TieWin7Prob;
CREATE VIEW vwStats_Get_TieWin7Prob AS
SELECT 
      HW.TournamentId
    , HW.Tournament
	, HW.Time
    , HW.Home
    , HW.Visitor
    , HW.Pb_Home
    , HW.Pb_Draw
    , HW.Pb_Visit
    , HW.Max_POH
    , HW.Max_POV
    , HW.POH_0 + HW.POH_1 + HW.POH_2 + HW.POH_3 + HW.POH_4 + HW.POH_5 + HW.POH_6 AS 'POH_0'
    , HW.POH_1 + HW.POH_2 + HW.POH_3 + HW.POH_4 + HW.POH_5 + HW.POH_6 AS 'POH_1'
    , HW.POH_2 + HW.POH_3 + HW.POH_4 + HW.POH_5 + HW.POH_6 AS 'POH_2'
    , HW.POH_3 + HW.POH_4 + HW.POH_5 + HW.POH_6 AS 'POH_3'
    , HW.POH_4 + HW.POH_5 + HW.POH_6 AS 'POH_4'
    , HW.POH_5 + HW.POH_6 AS 'POH_5'
    , HW.POH_6
    , HW.POV_0 + HW.POV_1 + HW.POV_2 + HW.POV_3 + HW.POV_4 + HW.POV_5 + HW.POV_6 AS 'POV_0'
    , HW.POV_1 + HW.POV_2 + HW.POV_3 + HW.POV_4 + HW.POV_5 + HW.POV_6 AS 'POV_1'
    , HW.POV_2 + HW.POV_3 + HW.POV_4 + HW.POV_5 + HW.POV_6 AS 'POV_2'
    , HW.POV_3 + HW.POV_4 + HW.POV_5 + HW.POV_6 AS 'POV_3'
    , HW.POV_4 + HW.POV_5 + HW.POV_6 AS 'POV_4'
    , HW.POV_5 + HW.POV_6 AS 'POV_5'
    , HW.POV_6
	, HW.Rsl
FROM 
	vwStats_Get_TieWin7Raw HW;