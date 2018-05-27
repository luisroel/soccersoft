DROP PROCEDURE IF EXISTS spCore_Delete_Season;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Season(
	  IN SeasonId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Season CC WHERE CC.SeasonId = SeasonId_p) THEN
		SET Msg_p = 'Season does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Season WHERE SeasonId = SeasonId_p;
	END IF;
END $$
DELIMITER ;

