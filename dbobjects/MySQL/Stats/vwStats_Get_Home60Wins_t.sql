--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_Home60Wins_t;
CREATE VIEW vwStats_Get_Home60Wins_t AS
SELECT
	  TT.Association
    , TT.Tournament	
    , TT.Time
    , TT.Home
    , TT.Visit
    , TT.FixtureId
    , TT.THAGS
    , TT.TVAGC
    , TT.TVAGS
    , TT.THAGC
    , TT.THAS
    , TT.TVDS
    , TT.TVAS
    , TT.THDS
    , TT.OH
    , TT.OV
    , TT.Pb_Home
    , TT.Pb_Draw
    , TT.Pb_Visit
    , TT.Max_POH
    , TT.Max_POV
    , TT.Max_OH
    , TT.Max_OV
    , TT.Diff
    , TT.SH
    , TT.SV
    , TT.SFC
    , TT.Rsl
    , TT.SOdd
    , TT.Last5_H
    , TT.Last5_V
    , TT.Type
FROM 
	vwStats_Get_Simulation_t TT
WHERE
	TT.Pb_Home >= 0.6;
