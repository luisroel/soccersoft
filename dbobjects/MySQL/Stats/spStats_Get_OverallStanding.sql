--
-- Current Standing Overall Table
--
DROP PROCEDURE IF EXISTS spStats_Get_OverallStanding;
DELIMITER $$
CREATE PROCEDURE spStats_Get_OverallStanding(
	  IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
	SELECT
		*
	FROM
		`tbStats_OverallTable` OT
	WHERE
			OT.SeasonId = SeasonId_p
        AND OT.WeekNo	= WeekNo_p
	ORDER BY
		OT.Position ASC;
END$$
DELIMITER ;
