--
-- Current Standing Visit Table
--
DROP PROCEDURE IF EXISTS spStats_Get_VisitTable_w;
DELIMITER $$
CREATE PROCEDURE spStats_Get_VisitTable_w(
      IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
	-- DELETE PREVIUOS RECORDS
    DELETE FROM tbStats_VisitTable WHERE SeasonId = SeasonId_p AND WeekNo = WeekNo_p;
    
    -- INSERT NEW RECORDS
    SET @row_number:= 0;
    INSERT INTO tbStats_VisitTable
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
			   
			, SUM(IFNULL(VI.Played,0))	AS `Ply`
			, SUM(IFNULL(VI.Wins,0))	AS `Win`
			, SUM(IFNULL(VI.Draws,0)) 	AS `Drw`
			, SUM(IFNULL(VI.Losses,0)) 	AS `Lss`
			, SUM(IFNULL(VI.Scored,0)) 	AS `Gls`
			, SUM(IFNULL(VI.Against,0))	AS `Agn`
			, SUM(IFNULL(VI.Diff,0)) 	AS `Dif`
			, SUM(3*IFNULL(VI.Wins,0)
			+ IFNULL(VI.Draws,0)) 		AS `Pts`
		FROM
			`tbCore_SeasonTeam` ST
			INNER JOIN `tbCore_Season` SS ON
				SS.SeasonId = ST.SeasonId
			INNER JOIN `tbCore_Team` TM ON
				TM.TeamId = ST.TeamId
			LEFT JOIN `vwStats_Get_VisitIndicators` VI ON
					VI.SeasonId = ST.SeasonId
				AND VI.TeamId 	= ST.TeamId 
		WHERE
				VI.SeasonId =  SeasonId_p
			AND VI.PhaseId 	<= 4
			AND VI.WeekNo 	< WeekNo_p
		GROUP BY
			  ST.SeasonId
			, SS.ShortName
			, ST.TeamId
			, TM.ShortName
		ORDER BY
			  ST.SeasonId
			, SUM(3*IFNULL(VI.Wins,0) + IFNULL(VI.Draws,0)) DESC
			, SUM(IFNULL(VI.Diff,0)) DESC
			, SUM(IFNULL(VI.Wins,0)) DESC
            , SUM(IFNULL(VI.Scored,0)) DESC
	) TT;
END$$
DELIMITER ;
