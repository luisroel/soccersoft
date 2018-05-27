DROP PROCEDURE IF EXISTS spUtil_Get_PlayedByWeekNo;
DELIMITER $$
CREATE PROCEDURE spUtil_Get_PlayedByWeekNo(
	IN SeasonId_p	BIGINT
)
BEGIN
	SELECT DISTINCT
		  ST.SeasonId
		, SS.WeekNo
		, ST.TeamId
		, SS.Played
	FROM 
		tbCore_SeasonTeam ST
		LEFT JOIN (
			SELECT
					  WW.SeasonId
					, WW.WeekNo
					, WW.TeamId
					, SUM(WW.PlayedH + WW.PlayedV) AS Played
			FROM (
				SELECT
					  FT.SeasonId
					, FT.WeekNo
					, FT.HomeTeamId 			AS TeamId
					, COUNT(FT.HomeTeamId) 		AS PlayedH
					, 0							AS PlayedV
				FROM
					tbCore_Fixture FT
				GROUP BY
					  FT.SeasonId
					, FT.WeekNo
					, FT.HomeTeamId
				UNION ALL
				SELECT
					  FT.SeasonId
					, FT.WeekNo
					, FT.VisitorTeamId
					, 0
					, COUNT(FT.VisitorTeamId)
				FROM
					tbCore_Fixture FT
				GROUP BY
					  FT.SeasonId
					, FT.WeekNo
					, FT.VisitorTeamId
			) WW
			GROUP BY
				  WW.SeasonId
				, WW.WeekNo
				, WW.TeamId
		) SS ON
				SS.SeasonId = ST.SeasonId
			AND SS.TeamId = ST.TeamId
	WHERE
		ST.SeasonId = SeasonId_p
	ORDER BY
		SS.WeekNo;
END$$
DELIMITER ;
