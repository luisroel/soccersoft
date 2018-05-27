DROP PROCEDURE IF EXISTS spCore_Delete_Phase;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Phase(
      IN PhaseId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Phase CC WHERE CC.PhaseId = PhaseId_p) THEN
		SET Msg_p = 'Phase does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Phase WHERE PhaseId = PhaseId_p;
	END IF;
END $$
DELIMITER ;

