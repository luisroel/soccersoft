--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_WinTieFullStrength;
CREATE VIEW vwStats_Get_WinTieFullStrength AS
SELECT 
      HW.TournamentId
    , HW.Tournament
	, HW.Time
    , HW.Home
    , HW.Visitor
    , HW.THAGS
    , HW.TVAGC
    , HW.TVAGS
    , HW.THAGC
    , HW.THAS
    , HW.TVDS
    , HW.TVAS
    , HW.THDS
    , HW.SASH
    , HW.SASV
    , HW.Rsl
	, HW.Pb_Home
FROM 
	vwStats_Get_WinTieFullRaw HW;