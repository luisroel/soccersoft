DROP PROCEDURE IF EXISTS spStats_Get_NormalProb;
DELIMITER $$
CREATE PROCEDURE spStats_Get_NormalProb(
      IN SeasonId_p BIGINT
    , IN WeekNo_p	INT
)
BEGIN
	SELECT
		  NP.*
        , SS.ShortName	AS `Season`
	FROM
		`vwStats_Get_NormalProb` NP
        INNER JOIN `tbCore_Season` SS ON
			SS.SeasonId = NP.SeasonId
	WHERE
		NP.SeasonId = SeasonId_p;
END$$
DELIMITER ;
