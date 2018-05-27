DROP PROCEDURE IF EXISTS spCore_Delete_Stadium;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Stadium(
      IN StadiumId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Stadium CC WHERE CC.StadiumId = StadiumId_p) THEN
		SET Msg_p = 'Stadium does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Stadium WHERE StadiumId = StadiumId_p;
	END IF;
END $$
DELIMITER ;
