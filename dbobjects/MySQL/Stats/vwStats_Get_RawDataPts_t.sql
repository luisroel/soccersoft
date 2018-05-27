--
--  Forecast raw data
--
DROP VIEW IF EXISTS vwStats_Get_RawDataPts_t;
CREATE VIEW vwStats_Get_RawDataPts_t AS
SELECT
	  AA.ShortName AS `Association`
    , TR.ShortName AS `Tournament`
    , FT.Time
    , TH.Name		AS `Home`
    , TV.Name 		AS `Visit`
    , PA.*
    , PA.OH - PA.OV	AS `Diff`
    , FT.ScoredHome		AS `SH`
    , FT.ScoredVisitor	AS `SV`
    , CASE 	WHEN PA.Max_OH >= 2 AND PA.Max_OH > PA.Max_OV THEN 'L'
			WHEN PA.Max_OV >= 2 AND PA.Max_OH < PA.Max_OV THEN 'V'
            WHEN PA.MAX_OH = 1 AND PA.Max_OV = 0 THEN 'D'
            ELSE '?'
	END AS `FC`
    , CASE 	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'L'
			WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'V'
            ELSE 'D'
	END AS `Rsl`
    , CASE WHEN (CASE 
					WHEN PA.Max_OH >= 2 AND PA.Max_OH > PA.Max_OV THEN 'L'
					WHEN PA.Max_OV >= 2 AND PA.Max_OH < PA.Max_OV THEN 'V'
					ELSE 'D'
				END
				) = (CASE 	
						WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'L'
						WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'V'
						ELSE 'D'
				END) THEN 1 
			ELSE 0 
	END AS `Ok`
    , FT.Odd_1
    , FT.Odd_X
    , FT.Odd_2
FROM
	tbStats_PoissonAnalysisPts_t PA
    INNER JOIN tbCore_Fixture FT ON
		FT.FixtureId = PA.FixtureId
	INNER JOIN tbCore_Team TH ON
		TH.TeamId = FT.HomeTeamId
	INNER JOIN tbCore_Team TV ON
		TV.TeamId = FT.VisitorTeamId
	INNER JOIN tbCore_Season SS ON
		SS.SeasonId = FT.SeasonId
	INNER JOIN tbCore_Tournament TR ON
		TR.TournamentId = SS.TournamentId
	INNER JOIN tbCore_Association AA ON
		AA.AssociationId = TR.AssociationId
WHERE
	PA.WeekNo > 5;
	