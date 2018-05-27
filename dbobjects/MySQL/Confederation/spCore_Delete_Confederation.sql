DROP PROCEDURE IF EXISTS spCore_Delete_Confederation;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Confederation(
      IN ConfederationId_p	BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Confederation CC WHERE CC.ConfederationId = ConfederationId_p) THEN
		SET Msg_p = 'Confederation does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Confederation WHERE ConfederationId = ConfederationId_p;
	END IF;
END $$
DELIMITER ;
