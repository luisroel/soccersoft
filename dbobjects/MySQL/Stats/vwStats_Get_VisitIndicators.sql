--
--  Home indicators for a given match
--
DROP VIEW IF EXISTS vwStats_Get_VisitIndicators;
CREATE VIEW vwStats_Get_VisitIndicators AS
SELECT
	  FT.SeasonId
	, FT.PhaseId
	, FT.WeekNo
    , FT.Time
    , FT.VisitorTeamId													AS `TeamId`
    , 1																	AS `Played`
    , (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Wins`
    , (CASE WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Draws`
    , (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Losses`
    , (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Success`
	, (CASE WHEN FT.ScoredHome >= FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Fail`
    , FT.ScoredVisitor													AS `Scored`
    , FT.ScoredHome														AS `Against`
    , FT.ScoredVisitor - FT.ScoredHome									AS `Diff`    
FROM
	tbCore_Fixture FT
WHERE
	FT.FixtureStatusId = 2;		-- Match is already finished
	
