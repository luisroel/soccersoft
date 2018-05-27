DROP PROCEDURE IF EXISTS spCore_Delete_SeasonType;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_SeasonType(
      IN SeasonTypeId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_SeasonType CC WHERE CC.SeasonTypeId = SeasonTypeId_p) THEN
		SET Msg_p = 'Season type does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_SeasonType WHERE SeasonTypeId = SeasonTypeId_p;
	END IF;
END $$
DELIMITER ;

