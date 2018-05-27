DROP PROCEDURE IF EXISTS spCore_Delete_SeasonPhase;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_SeasonPhase(
	  IN SeasonId_p	BIGINT
	, IN PhaseId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_SeasonPhase SP WHERE SP.SeasonId = SeasonId_p AND SP.PhaseId = PhaseId_p) THEN
		SET Msg_p = 'Phase does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_SeasonPhase WHERE SeasonId = SeasonId_p AND PhaseId = PhaseId_p;
	END IF;
END $$
DELIMITER ;

