DROP PROCEDURE IF EXISTS spStats_Create_WeeklyDataByDate;
DELIMITER $$
CREATE PROCEDURE spStats_Create_WeeklyDataByDate(
	  IN FromDate_p 	DATETIME
    , IN ToDate_p		DATETIME
    , IN AllWeeks_p		BIT
)
BEGIN
	DECLARE Finished_v	INTEGER DEFAULT 0;
	DECLARE SeasonId_v 	BIGINT;
    DECLARE WeekNo_v	INT;
    
	-- 1. Season and Weekno Within FromDate_v and ToDate_v
	DECLARE myCursor CURSOR FOR
	SELECT 
		  FT.SeasonId
		, FT.WeekNo
	FROM 
		tbCore_Fixture FT 
	WHERE 
		FT.Time BETWEEN FromDate_p AND ToDate_p
	GROUP BY
		  FT.SeasonId
	ORDER BY
		  FT.SeasonId;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Finished_v = 1;
    
	OPEN myCursor;
	SeasonSelections: LOOP
    
		FETCH myCursor INTO SeasonId_v, WeekNo_v;
		IF Finished_v = 1 THEN
			LEAVE SeasonSelections;
		END IF;
		IF AllWeeks_p = 0 THEN
			CALL spStats_Create_WeeklyData(SeasonId_v, WeekNo_v, WeekNo_v);
		ELSE
			CALL spStats_Create_WeeklyData(SeasonId_v, 1, WeekNo_v);
		END IF;
        
	END LOOP SeasonSelections;
	CLOSE myCursor;
END$$
DELIMITER ;
