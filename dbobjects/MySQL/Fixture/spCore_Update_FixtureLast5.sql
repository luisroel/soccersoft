DROP PROCEDURE IF EXISTS spCore_Update_FixtureLast5;
DELIMITER $$
CREATE PROCEDURE spCore_Update_FixtureLast5(SeasonId_p BIGINT, WeekNo_p INT)
BEGIN
	UPDATE tbCore_Fixture SET
		  Last5_H = fnUtil_Get_Last5(HomeTeamId, `Time`)
		, LAST5_V = fnUtil_Get_Last5(VisitorTeamId, `Time`)
	WHERE
		     SeasonId 	= SeasonId_p
         AND WeekNo 	= WeekNo_p;
END$$
DELIMITER ;