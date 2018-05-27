DROP PROCEDURE IF EXISTS spStats_Get_TableDataMask;
DELIMITER $$
CREATE PROCEDURE spStats_Get_TableDataMask(
	  IN From_p 	DATETIME
    , IN To_p		DATETIME
    , IN PWIFrom_p	FLOAT
    , IN PWITo_p	FLOAT
    , IN Mask_p		VARCHAR(6)
)
BEGIN
	SET @row_number:=0;
	SELECT
		  @row_number:=@row_number+1	AS `NO`
		, TD.*
	FROM
		tbStats_TableDataList TD
	WHERE
		    TD.PWI >= PWIFrom_p AND TD.PWI <= PWITo_p
		AND TD.DT >= From_p AND TD.DT <= To_p
		AND TD.Mask = Mask_p
        AND DAYOFWEEK(TD.DT) = DAYOFWEEK(To_p)
	ORDER BY
		  TD.Mask
		, TD.DT;
END$$
DELIMITER ;