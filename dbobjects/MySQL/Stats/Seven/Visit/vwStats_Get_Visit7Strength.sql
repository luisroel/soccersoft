--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_Visit7Strength;
CREATE VIEW vwStats_Get_Visit7Strength AS
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
	vwStats_Get_Visit7Raw HW;