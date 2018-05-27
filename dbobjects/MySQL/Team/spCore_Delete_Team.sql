DROP PROCEDURE IF EXISTS spCore_Delete_Team;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Team(
      IN TeamId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_Team CC WHERE CC.TeamId = TeamId_p) THEN
		SET Msg_p = 'Team does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Team WHERE TeamId = TeamId_p;
	END IF;
END $$
DELIMITER ;

