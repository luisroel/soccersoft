--
-- Current Standing Home Table
--
DROP PROCEDURE IF EXISTS spStats_Get_HomeStanding;
DELIMITER $$
CREATE PROCEDURE spStats_Get_HomeStanding(
	  IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
	SELECT
		*
	FROM
		`tbStats_HomeTable` HT
	WHERE
			HT.SeasonId = SeasonId_p
        AND HT.WeekNo	= WeekNo_p
	ORDER BY
		HT.Position ASC;
END$$
DELIMITER ;
