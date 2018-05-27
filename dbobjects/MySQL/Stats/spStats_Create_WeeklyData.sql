DROP PROCEDURE IF EXISTS spStats_Create_WeeklyData;
DELIMITER $$
CREATE PROCEDURE spStats_Create_WeeklyData(SeasonId_p BIGINT, From_p INT, To_p INT)
BEGIN
	DECLARE WeekNo_v INT;

	SET WeekNo_v = From_p;
	WHILE WeekNo_v <= To_p DO

		CALL spStats_Get_VisitTable_w(SeasonId_p, WeekNo_v);
        CALL spStats_Get_HomeTable_w(SeasonId_p, WeekNo_v);
        CALL spStats_Get_OverallTable_w(SeasonId_p, WeekNo_v);
		CALL spStats_Get_PoissonAnalysis_w(SeasonId_p, WeekNo_v);
		CALL spStats_Get_PoissonAnalysis_t(SeasonId_p, WeekNo_v);
        CALL spStats_Get_PoissonAnalysisPts_t(SeasonId_p, WeekNo_v);
        CALL spCore_Update_FixtureLast5(SeasonId_p, WeekNo_v);
        
		SET WeekNo_v = WeekNo_v + 1;
	END WHILE;
END$$
DELIMITER ;