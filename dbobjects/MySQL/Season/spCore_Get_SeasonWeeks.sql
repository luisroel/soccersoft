DROP PROCEDURE IF EXISTS spCore_Get_SeasonWeeks;
DELIMITER $$
CREATE PROCEDURE spCore_Get_SeasonWeeks(
	IN SeasonId_p BIGINT
)
BEGIN
    -- Insert statements for procedure here
	SELECT 
		  SW.WeekNo
		, SW.From
		, SW.To
	FROM 
		`vwCore_Get_SeasonWeeks` SW
	WHERE 
		SW.SeasonId = SeasonId_p
	ORDER BY
		SW.WeekNo;
END $$
DELIMITER ;
