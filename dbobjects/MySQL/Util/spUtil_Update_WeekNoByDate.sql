DROP PROCEDURE IF EXISTS spUtil_Update_WeekNoByDate;
DELIMITER $$
CREATE PROCEDURE spUtil_Update_WeekNoByDate(
	  IN FromDate_p DATETIME
    , IN ToDate_p	DATETIME
)
BEGIN
	DECLARE Finished_v	INTEGER DEFAULT 0;
	DECLARE SeasonId_v 	BIGINT;
    
	-- 1. get tbCore_Fixtures
	DECLARE myCursor CURSOR FOR
	SELECT 
		  FT.SeasonId
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
    
		FETCH myCursor INTO SeasonId_v;
		IF Finished_v = 1 THEN
			LEAVE SeasonSelections;
		END IF;

		CALL spUtil_Update_WeekNo(SeasonId_v);
        
	END LOOP SeasonSelections;
	CLOSE myCursor;
END$$
DELIMITER ;
