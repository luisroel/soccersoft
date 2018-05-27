--
--  Home indicators for a given match
--
DROP VIEW IF EXISTS vwStats_Get_VisitIndicators_t;
CREATE VIEW vwStats_Get_VisitIndicators_t AS
SELECT
	  FT.SeasonId
	, FT.PhaseId
	, FT.WeekNo
    , FT.VisitorTeamId													AS `TeamId`
    , 1																	AS `Played`
    , (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Wins`
    , (CASE WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Draws`
    , (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Losses`
    , (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 3
			WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Earned_Pts`
	, (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 3
			WHEN FT.ScoredHome = FT.ScoredVisitor THEN 2 ELSE 0 END)	AS `Lost_Pts`
    , FT.ScoredVisitor													AS `Scored`
    , FT.ScoredHome														AS `Against`
    , FT.ScoredVisitor - FT.ScoredHome									AS `Diff`
FROM
	`tbCore_FixtureTmp` FT
WHERE
	FT.FixtureStatusId = 2;		-- Match is already finished

