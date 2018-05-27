DROP PROCEDURE IF EXISTS spUtil_Update_WeeknoByDate;
DELIMITER $$
CREATE PROCEDURE spUtil_Update_WeeknoByDate(
    IN Date_p DATETIME
)
BEGIN
	DECLARE Finished_v	INTEGER DEFAULT 0;
	DECLARE SeasonId_v 	BIGINT;

	DECLARE myCursor CURSOR FOR
	SELECT DISTINCT
		FT.SeasonId
	FROM
		tbCore_Fixture FT
	WHERE
		FT.Time BETWEEN Date_P AND DATE_ADD(DATE_ADD(Date_p, INTERVAL 23 HOUR),INTERVAL 59 MINUTE);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Finished_v = 1;    
	OPEN myCursor;
	startLoop: LOOP
    
		FETCH myCursor INTO SeasonId_v;
		IF Finished_v = 1 THEN
			LEAVE startLoop;
		END IF;

		Call spUtil_Update_WeekNo(SeasonId_v);

	END LOOP startLoop;
	CLOSE myCursor;
END$$
DELIMITER ;
