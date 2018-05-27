--
-- Current Standing Overall Table
--
DROP PROCEDURE IF EXISTS spStats_Get_OverallTable_w;
DELIMITER $$
CREATE PROCEDURE spStats_Get_OverallTable_w(
      IN SeasonId_p BIGINT
    , IN WeekNo_p 	INT
)
BEGIN
	-- DELETE PREVIUOS RECORDS
    DELETE FROM tbStats_OverallTable WHERE SeasonId = SeasonId_p AND WeekNo = WeekNo_p;

    -- INSERT NEW RECORDS
    SET @row_number:= 0;
    INSERT INTO tbStats_OverallTable
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
			  ID.SeasonId
			, SS.ShortName						AS `Season`
			, WeekNo_p							AS `WeekNo`
			, ST.TeamId
			, TM.ShortName						AS `Team`
				
			, SUM(IFNULL(ID.HPl + ID.VPl,0))	AS `Ply`
			, SUM(IFNULL(ID.HWn + ID.VWn,0))	AS `Win`
			, SUM(IFNULL(ID.HDr + ID.VDr,0)) 	AS `Drw`
			, SUM(IFNULL(ID.HLs + ID.VLs,0)) 	AS `Lss`
			, SUM(IFNULL(ID.HGl + ID.VGl,0)) 	AS `Gls`
			, SUM(IFNULL(ID.HAg + ID.VAg,0))	AS `Agn`
			, SUM(IFNULL(ID.HDf + ID.VDf,0)) 	AS `Dif`
			, SUM(IFNULL(ID.HPt + ID.VPt,0))	AS `Pts`
		FROM
			`tbCore_SeasonTeam` ST
			INNER JOIN `tbCore_Season` SS ON
				SS.SeasonId = ST.SeasonId
			INNER JOIN `tbCore_Team` TM ON
				TM.TeamId = ST.TeamId
			LEFT JOIN `vwStats_Get_Indicators` ID ON
					ID.SeasonId = ST.SeasonId
				AND ID.TeamId 	= ST.TeamId 
		WHERE
				ID.SeasonId = SeasonId_p
			AND ID.PhaseId 	<= 4			-- Only regular season
			AND ID.WeekNo	< WeekNo_p
		GROUP BY
			  ST.SeasonId
			, SS.ShortName
			, ST.TeamId
			, TM.ShortName
		ORDER BY
			  ST.SeasonId
			, SUM(IFNULL(ID.HPt + ID.VPt,0)) DESC
			, SUM(IFNULL(ID.HDf + ID.VDf,0)) DESC
			, SUM(IFNULL(ID.HWn + ID.VWn,0)) DESC
            , SUM(IFNULL(ID.HGl + ID.VGl,0)) DESC
	) TT;
END$$
DELIMITER ;
