DROP PROCEDURE IF EXISTS spStats_Create_TableDataListFromTo;
DELIMITER $$
CREATE PROCEDURE spStats_Create_TableDataListFromTo(From_p DATETIME, To_p DATETIME)
BEGIN
	DECLARE DateFrom_v DATETIME;
    DECLARE DateTo_v DATETIME;

	SET DateFrom_v = From_p;
	WHILE DateFrom_v <= To_p DO
		SET DateTo_v = date_add(DateFrom_v, INTERVAL 23 HOUR);
        SET DateTo_v = date_add(DateTo_v, INTERVAL 59 MINUTE);
        SET DateTo_v = date_add(DateTo_v, INTERVAL 59 SECOND);
        CALL `spStats_Create_TableDataList`(DateFrom_v, DateTo_v);
        SET DateFrom_v = date_add(DateFrom_v, INTERVAL 1 DAY);
	END WHILE;
END$$
DELIMITER ;