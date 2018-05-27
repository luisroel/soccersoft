--
-- Current Standing Visit Table
--
DROP PROCEDURE IF EXISTS spStats_Get_VisitStanding;
DELIMITER $$
CREATE PROCEDURE spStats_Get_VisitStanding(
	  IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
	SELECT
		*
	FROM
		`tbStats_VisitTable` VT
	WHERE
			VT.SeasonId = SeasonId_p
        AND VT.WeekNo	= WeekNo_p
	ORDER BY
		VT.Position ASC;
END$$
DELIMITER ;
