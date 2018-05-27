--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_WinTie7Strength;
CREATE VIEW vwStats_Get_WinTie7Strength AS
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
FROM 
	vwStats_Get_WinTie7Raw HW;