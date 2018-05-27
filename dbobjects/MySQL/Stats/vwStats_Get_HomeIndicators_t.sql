--
--  Home indicators for a given match
--
DROP VIEW IF EXISTS vwStats_Get_HomeIndicators_t;
CREATE VIEW vwStats_Get_HomeIndicators_t AS
SELECT
	  FT.SeasonId
	, FT.PhaseId
	, FT.WeekNo
    , FT.HomeTeamId														AS `TeamId`
    , 1																	AS `Played`
    , (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Wins`
    , (CASE WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Draws`
    , (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Losses`
    , (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 3 
			WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Earned_Pts`
	, (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 3
			WHEN FT.ScoredHome = FT.ScoredVisitor THEN 2 ELSE 0 END)	AS `Lost_Pts`
    , FT.ScoredHome														AS `Scored`
    , FT.ScoredVisitor													AS `Against`
    , FT.ScoredHome - FT.ScoredVisitor									AS `Diff`
FROM
	`tbCore_FixtureTmp` FT
WHERE
	FT.FixtureStatusId = 2;		-- Match is already finished
	