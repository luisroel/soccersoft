--
--  Forecast raw data
--
DROP VIEW IF EXISTS vwStats_Get_RawData_tt;
CREATE VIEW vwStats_Get_RawData_tt AS
SELECT
	  AA.ShortName 		AS `Association`
    , TR.ShortName 		AS `Tournament`
    , FT.Time
    , TH.Name			AS `Home`
    , TV.Name 			AS `Visit`
    , PA.*
    , PA.OH - PA.OV		AS `Diff`
    , FT.ScoredHome		AS `SH`
    , FT.ScoredVisitor	AS `SV`
    , FT.Last5_H
    , FT.Last5_V
    , CASE 	WHEN PA.Pb_Home > PA.Pb_Draw AND PA.Pb_Home > PA.Pb_Visit THEN 
				CASE 	WHEN 	(PA.Pb_Draw > PA.Pb_Visit AND (PA.Pb_Home - PA.Pb_Draw) > 0.11) OR
								(PA.Pb_Visit > PA.Pb_Draw AND (PA.Pb_Home - PA.Pb_Visit) > 0.11) THEN 'L'
						ELSE 'D'
				END
			WHEN PA.Pb_Visit > PA.Pb_Draw AND PA.Pb_Visit > PA.Pb_Home THEN 
				CASE 	WHEN 	(PA.Pb_Draw > PA.Pb_Home AND (PA.Pb_Visit - PA.Pb_Draw) > 0.11) OR
								(PA.Pb_Home > PA.Pb_Draw AND (PA.Pb_Visit - PA.Pb_Home) > 0.11) THEN 'V'
						ELSE 'D'
				END
            ELSE 'D'
	END 				AS `SFC`
	, CASE 	WHEN PA.Pb_Home > PA.Pb_Draw AND PA.Pb_Home > PA.Pb_Visit THEN 
				CASE 	WHEN (PA.Pb_Draw > PA.Pb_Visit AND (PA.Pb_Home - PA.Pb_Draw) > 0.11) THEN 'LD'
						WHEN (PA.Pb_Visit > PA.Pb_Draw AND (PA.Pb_Home - PA.Pb_Visit) > 0.11) THEN 'LV'
						ELSE CASE WHEN PA.Pb_Home > PA.Pb_Visit THEN 'LD'
								ELSE 'DV'
							END
				END
			WHEN PA.Pb_Visit > PA.Pb_Draw AND PA.Pb_Visit > PA.Pb_Home THEN 
				CASE WHEN (PA.Pb_Draw > PA.Pb_Home AND (PA.Pb_Visit - PA.Pb_Draw) > 0.11) THEN 'DV'
					WHEN (PA.Pb_Home > PA.Pb_Draw AND (PA.Pb_Visit - PA.Pb_Home) > 0.11) THEN 'LV'
						ELSE CASE WHEN PA.Pb_Home > PA.Pb_Visit THEN 'LD'
								ELSE 'DV'
							END
				END
            ELSE CASE WHEN PA.Pb_Home > PA.Pb_Visit THEN 'LD'
					ELSE 'DV'
				END
	END 				AS `DFC`
    , CASE 	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'L'
			WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'V'
            ELSE 'D'
	END 				AS `Rsl`
	, CASE 	WHEN PA.Pb_Home > PA.Pb_Draw AND PA.Pb_Home > PA.Pb_Visit THEN 
				CASE 	WHEN 	(PA.Pb_Draw > PA.Pb_Visit AND (PA.Pb_Home - PA.Pb_Draw) > 0.11) OR
								(PA.Pb_Visit > PA.Pb_Draw AND (PA.Pb_Home - PA.Pb_Visit) > 0.11) THEN FT.Odd_1
						ELSE FT.Odd_X
				END
			WHEN PA.Pb_Visit > PA.Pb_Draw AND PA.Pb_Visit > PA.Pb_Home THEN 
				CASE 	WHEN 	(PA.Pb_Draw > PA.Pb_Home AND (PA.Pb_Visit - PA.Pb_Draw) > 0.11) OR
								(PA.Pb_Home > PA.Pb_Draw AND (PA.Pb_Visit - PA.Pb_Home) > 0.11) THEN FT.Odd_2
						ELSE FT.Odd_X
				END
            ELSE FT.Odd_X
	END					AS `SOdd`
    , CASE 	WHEN PA.Pb_Home > PA.Pb_Draw AND PA.Pb_Home > PA.Pb_Visit THEN 
				CASE 	WHEN (PA.Pb_Draw > PA.Pb_Visit AND (PA.Pb_Home - PA.Pb_Draw) > 0.11) THEN (FT.Odd_1 * FT.Odd_X / (FT.Odd_1 + FT.Odd_X))
						WHEN (PA.Pb_Visit > PA.Pb_Draw AND (PA.Pb_Home - PA.Pb_Visit) > 0.11) THEN (FT.Odd_1 * FT.Odd_2 / (FT.Odd_1 + FT.Odd_2))
						ELSE CASE WHEN PA.Pb_Home > PA.Pb_Visit THEN (FT.Odd_1 * FT.Odd_X / (FT.Odd_1 + FT.Odd_X))
								ELSE (FT.Odd_X * FT.Odd_2 / (FT.Odd_X + FT.Odd_2))
							END
				END
			WHEN PA.Pb_Visit > PA.Pb_Draw AND PA.Pb_Visit > PA.Pb_Home THEN 
				CASE 	WHEN (PA.Pb_Draw > PA.Pb_Home AND (PA.Pb_Visit - PA.Pb_Draw) > 0.11) THEN (FT.Odd_X * FT.Odd_2 / (FT.Odd_X + FT.Odd_2))
						WHEN (PA.Pb_Home > PA.Pb_Draw AND (PA.Pb_Visit - PA.Pb_Home) > 0.11) THEN (FT.Odd_1 * FT.Odd_2 / (FT.Odd_1 + FT.Odd_2))
						ELSE CASE WHEN PA.Pb_Home > PA.Pb_Visit THEN (FT.Odd_1 * FT.Odd_X / (FT.Odd_1 + FT.Odd_X))
								ELSE (FT.Odd_X * FT.Odd_2 / (FT.Odd_X + FT.Odd_2))
							END
				END
            ELSE CASE WHEN PA.Pb_Home > PA.Pb_Visit THEN (FT.Odd_1 * FT.Odd_X / (FT.Odd_1 + FT.Odd_X))
					ELSE (FT.Odd_X * FT.Odd_2 / (FT.Odd_X + FT.Odd_2))
				END
	END 				AS `DOdd`
FROM
	tbStats_PoissonAnalysis_t PA
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
