DROP PROCEDURE IF EXISTS spCore_Delete_Referee;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Referee(
      IN RefereeId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_Referee CC WHERE CC.RefereeId = RefereeId_p) THEN
		SET Msg_p = 'Referee does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Referee WHERE RefereeId = RefereeId_p;
	END IF;
END $$
DELIMITER ;
