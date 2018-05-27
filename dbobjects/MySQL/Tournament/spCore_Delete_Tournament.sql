DROP PROCEDURE IF EXISTS spCore_Delete_Tournament;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Tournament(
      IN TournamentId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';
    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Tournament CC WHERE CC.TournamentId = TournamentId_p) THEN
		SET Msg_p = 'Tournament does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Tournament WHERE TournamentId = TournamentId_p;
	END IF;
END $$
DELIMITER ;
