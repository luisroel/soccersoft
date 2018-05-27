--
--  Home Raw Stats
--
DROP VIEW IF EXISTS vwStats_Get_RawHome_Tmp;
CREATE VIEW vwStats_Get_RawHome_Tmp AS
SELECT
	  MT.FixtureId									AS `FixtureId`
	, MT.SeasonId									AS `SeasonId`
	, MT.Time										AS `Time`
    , MT.Round										AS `Round`
	, MT.HomeTeamId									AS `TeamId`
    , 1												AS `Played`
    , IF(MT.ScoredHome > MT.ScoredVisitor,1,0)		AS `Wins`
    , IF(MT.ScoredHome = MT.ScoredVisitor,1,0)		AS `Draws`
    , IF(MT.ScoredHome < MT.ScoredVisitor,1,0)		AS `Losses`
    , MT.ScoredHome									AS `Scored`
    , MT.ScoredVisitor								AS `Against`
    , MT.ScoredHome - MT.ScoredVisitor				AS `Diff`
    , CASE 	
		WHEN MT.ScoredHome > MT.ScoredVisitor THEN 3
		WHEN MT.ScoredHome = MT.ScoredVisitor THEN 1
        ELSE 0 END									AS `Points`
FROM
	`tbCore_FixtureTmp` MT
WHERE
	MT.FixtureStatusId = 2;