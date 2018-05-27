--
-- Live Home Standing Clasification
--
DROP PROCEDURE IF EXISTS spStats_Get_HomeLiveStanding;
DELIMITER $$
CREATE PROCEDURE spStats_Get_HomeLiveStanding(
	  IN SeasonId_p 	BIGINT
    , IN PhaseId_p		BIGINT
    , IN CutoffDate_p	DATETIME
)
BEGIN
	-- sp live standing
	SET @row_number:=0;
    SELECT
		  @row_number:=@row_number+1						AS `Pos`
		, TH.*
		, fnUtil_Get_Last5HNormal(TH.TeamId, CutoffDate_p) 	AS `L5`
	FROM (
		SELECT
			  SS.SeasonId
			, SS.ShortName					AS `Season`
			, TM.TeamId
			, TM.ShortName					AS `Team`
			, HS.Ply
			, HS.Win
			, HS.Drw
			, HS.Lss
			, HS.Gls
			, HS.Agn
			, HS.Dif
			, HS.Pts
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
			WHERE
				SS.SeasonId = SeasonId_p
	) TH
	ORDER BY
		  TH.Pts DESC
		, TH.Dif DESC
		, TH.Win DESC;
END$$
DELIMITER ;
