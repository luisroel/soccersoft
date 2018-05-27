--
-- Current Standing Home Table
--
DROP PROCEDURE IF EXISTS spStats_Get_HomeTable_w;
DELIMITER $$
CREATE PROCEDURE spStats_Get_HomeTable_w(
	  IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
	-- DELETE PREVIUOS RECORDS
    DELETE FROM tbStats_HomeTable WHERE SeasonId = SeasonId_p AND WeekNo = WeekNo_p;

    -- INSERT NEW RECORDS
    SET @row_number:= 0;
    INSERT INTO tbStats_HomeTable
    SELECT
		  TT.SeasonId
		, TT.Season
        , TT.WeekNo
        , @row_number := @row_number + 1 		AS `Pos`
		, TT.TeamId
		, TT.Team
			
		, TT.Ply
		, TT.Win
		, TT.Drw
		, TT.Lss
		, TT.Gls
		, TT.Agn
		, TT.Dif
		, TT.Pts
	FROM (
		SELECT
			  ST.SeasonId
			, SS.ShortName				AS `Season`
			, WeekNo_p					AS `WeekNo`
			, ST.TeamId
			, TM.ShortName				AS `Team`

			, SUM(IFNULL(HI.Played,0))	AS `Ply`
			, SUM(IFNULL(HI.Wins,0))	AS `Win`
			, SUM(IFNULL(HI.Draws,0)) 	AS `Drw`
			, SUM(IFNULL(HI.Losses,0)) 	AS `Lss`
			, SUM(IFNULL(HI.Scored,0)) 	AS `Gls`
			, SUM(IFNULL(HI.Against,0))	AS `Agn`
			, SUM(IFNULL(HI.Diff,0)) 	AS `Dif`
			, SUM(3*IFNULL(HI.Wins,0)
			+ IFNULL(HI.Draws,0)) 		AS `Pts`
		FROM
			`tbCore_SeasonTeam` ST
			INNER JOIN `tbCore_Season` SS ON
				SS.SeasonId = ST.SeasonId
			INNER JOIN `tbCore_Team` TM ON
				TM.TeamId = ST.TeamId
			LEFT JOIN `vwStats_Get_HomeIndicators` HI ON
					HI.SeasonId = ST.SeasonId
				AND HI.TeamId 	= ST.TeamId 
		WHERE
				HI.SeasonId = SeasonId_p
			AND HI.PhaseId	<= 4
			AND HI.WeekNo 	< WeekNo_p
		GROUP BY
			  ST.SeasonId
			, SS.ShortName
			, ST.TeamId
			, TM.ShortName
		ORDER BY
			  ST.SeasonId
			, SUM(3*IFNULL(HI.Wins,0) + IFNULL(HI.Draws,0)) DESC
			, SUM(IFNULL(HI.Diff,0)) DESC
			, SUM(IFNULL(HI.Wins,0)) DESC
            , SUM(IFNULL(HI.Scored,0)) DESC
	) TT;
END$$
DELIMITER ;
