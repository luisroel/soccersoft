--
--  Away Raw Stats
--
DROP VIEW IF EXISTS vwStats_Get_RawAway_Tmp;
CREATE VIEW vwStats_Get_RawAway_Tmp AS
SELECT
	  MT.FixtureId								AS `FixtureId`
	, MT.SeasonId								AS `SeasonId`
	, MT.Time									AS `Time`
    , MT.Round									AS `Round`
	, MT.VisitorTeamId							AS `TeamId`
    , 1											AS `Played`
    , IF(MT.ScoredVisitor > MT.ScoredHome,1,0)	AS `Wins`
    , IF(MT.ScoredVisitor = MT.ScoredHome,1,0)	AS `Draws`
    , IF(MT.ScoredVisitor < MT.ScoredHome,1,0)	AS `Losses`
    , MT.ScoredVisitor							AS `Scored`
    , MT.ScoredHome								AS `Against`
    , MT.ScoredVisitor - MT.ScoredHome			AS `Diff`
    , CASE
		WHEN MT.ScoredVisitor > MT.ScoredHome THEN 3
		WHEN MT.ScoredVisitor = MT.ScoredHome THEN 1
        ELSE 0 END								AS `Points`
FROM
	`tbCore_FixtureTmp` MT
WHERE
	MT.FixtureStatusId = 2;
