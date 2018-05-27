--
-- Current Standing Overall Table
--
DROP PROCEDURE IF EXISTS spStats_Get_OverallLiveStanding;
DELIMITER $$
CREATE PROCEDURE spStats_Get_OverallLiveStanding(
      IN SeasonId_p 	BIGINT
    , IN PhaseId_p 		BIGINT
    , IN CutoffDate_p	DATETIME
)
BEGIN
	-- sp live standing
	SET @row_number:=0;
    SELECT
		  @row_number:=@row_number+1						AS `Pos`
        , SO.*
        , fnUtil_Get_Last5ONormal(SO.TeamId, CutoffDate_p) 	AS `L5`
	FROM (
		SELECT
			  SS.SeasonId
			, SS.ShortName								AS `Season`
			, TM.TeamId
			, TM.ShortName								AS `Team`
			, IFNULL(HS.Ply,0) + IFNULL(`AS`.Ply,0) 	AS `Ply`
			, IFNULL(HS.Win,0) + IFNULL(`AS`.Win,0) 	AS `Win`
			, IFNULL(HS.Drw,0) + IFNULL(`AS`.Drw,0) 	AS `Drw`
			, IFNULL(HS.Lss,0) + IFNULL(`AS`.Lss,0) 	AS `Lss`
			, IFNULL(HS.Gls,0) + IFNULL(`AS`.Gls,0) 	AS `Gls`
			, IFNULL(HS.Agn,0) + IFNULL(`AS`.Agn,0) 	AS `Agn`
			, IFNULL(HS.Dif,0) + IFNULL(`AS`.Dif,0) 	AS `Dif`
			, IFNULL(HS.Pts,0) + IFNULL(`AS`.Pts,0) 	AS `Pts`
		FROM
			tbCore_Season SS
			INNER JOIN tbCore_SeasonTeam ST ON
				ST.SeasonId = SS.SeasonId
			INNER JOIN tbCore_Team TM ON
				TM.TeamId = ST.TeamId
			LEFT JOIN (
				-- Home live standing
				SELECT
					  HI.TeamId
					, SUM(IFNULL(HI.Played,0))	AS `Ply`
					, SUM(IFNULL(HI.Wins,0))	AS `Win`
					, SUM(IFNULL(HI.Draws,0)) 	AS `Drw`
					, SUM(IFNULL(HI.Losses,0)) 	AS `Lss`
					, SUM(IFNULL(HI.Scored,0)) 	AS `Gls`
					, SUM(IFNULL(HI.Against,0))	AS `Agn`
					, SUM(IFNULL(HI.Diff,0)) 	AS `Dif`
					, SUM(3*IFNULL(HI.Wins,0)
					+ IFNULL(HI.Draws,0)) 		AS `Pts`
				FROM (
					-- Home Indicators
					SELECT
						  FT.HomeTeamId														AS `TeamId`
						, 1																	AS `Played`
						, (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Wins`
						, (CASE WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Draws`
						, (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Losses`
						, FT.ScoredHome														AS `Scored`
						, FT.ScoredVisitor													AS `Against`
						, FT.ScoredHome - FT.ScoredVisitor									AS `Diff`
					FROM
						tbCore_Fixture FT
					WHERE
							FT.FixtureStatusId	= 2
						AND FT.SeasonId 		= SeasonId_p
						AND FT.PhaseId			= PhaseId_p
                        AND FT.Time				< CutoffDate_p
					) HI
				GROUP BY
					HI.TeamId
				) HS ON
				HS.TeamId = TM.TeamId
			LEFT JOIN (
				-- Away live standings
				SELECT
					  VI.TeamId
					, SUM(IFNULL(VI.Played,0))	AS `Ply`
					, SUM(IFNULL(VI.Wins,0))	AS `Win`
					, SUM(IFNULL(VI.Draws,0)) 	AS `Drw`
					, SUM(IFNULL(VI.Losses,0)) 	AS `Lss`
					, SUM(IFNULL(VI.Scored,0)) 	AS `Gls`
					, SUM(IFNULL(VI.Against,0))	AS `Agn`
					, SUM(IFNULL(VI.Diff,0)) 	AS `Dif`
					, SUM(3*IFNULL(VI.Wins,0)
					+ IFNULL(VI.Draws,0)) 		AS `Pts`
				FROM (
					-- Visit Indicators
					SELECT
						  FT.VisitorTeamId													AS `TeamId`
						, 1																	AS `Played`
						, (CASE WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Wins`
						, (CASE WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Draws`
						, (CASE WHEN FT.ScoredHome > FT.ScoredVisitor THEN 1 ELSE 0 END)	AS `Losses`
						, FT.ScoredVisitor													AS `Scored`
						, FT.ScoredHome														AS `Against`
						, FT.ScoredVisitor - FT.ScoredHome									AS `Diff`    
					FROM
						tbCore_Fixture FT
					WHERE
							FT.FixtureStatusId	= 2		-- Match is already finished
						AND FT.SeasonId 		= SeasonId_p
						AND FT.PhaseId 			= PhaseId_p
						AND FT.Time				< CutoffDate_p
					) VI 
				GROUP BY
					  VI.TeamId
			) `AS` ON
				`AS`.TeamId = TM.TeamId
			WHERE
				SS.SeasonId = SeasonId_p
	) SO
	ORDER BY
		  SO.Pts DESC
		, SO.Dif DESC
		, SO.Win DESC;
END$$
DELIMITER ;
