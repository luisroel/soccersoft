--
-- Live Away Standing Clasification
--
DROP PROCEDURE IF EXISTS spStats_Get_AwayLiveStanding;
DELIMITER $$
CREATE PROCEDURE spStats_Get_AwayLiveStanding(
	  IN SeasonId_p		BIGINT
    , IN PhaseId_p		BIGINT
    , IN CutoffDate_p 	DATETIME
)
BEGIN
	-- Store Procedure Away live Standings
	SET @row_number:=0;
    SELECT
		  @row_number:=@row_number+1						AS `Pos`
		, TA.*
        , fnUtil_Get_Last5ANormal(TA.TeamId, CutoffDate_p) 	AS `L5`
	FROM (
		SELECT
			  SS.SeasonId
			, SS.ShortName					AS `Season`
			, TM.TeamId
			, TM.ShortName					AS `Team`
			, `AS`.Ply
			, `AS`.Win
			, `AS`.Drw
			, `AS`.Lss
			, `AS`.Gls
			, `AS`.Agn
			, `AS`.Dif
			, `AS`.Pts
		FROM
			tbCore_Season SS
			INNER JOIN tbCore_SeasonTeam ST ON
				ST.SeasonId = SS.SeasonId
			INNER JOIN tbCore_Team TM ON
				TM.TeamId = ST.TeamId
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
					+ IFNULL(VI.Draws,0))		AS `Pts`
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
	) TA
	ORDER BY
		  TA.Pts DESC
		, TA.Dif DESC
		, TA.Win DESC;
END$$
DELIMITER ;
