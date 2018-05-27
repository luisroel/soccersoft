DROP PROCEDURE IF EXISTS spCore_Delete_Association;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Association(
      IN AssociationId_p	BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	
	SET	Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Association CC WHERE CC.AssociationId = AssociationId_p) THEN
		SET Msg_p = 'Association does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Association WHERE AssociationId = AssociationId_p;
	END IF;
END $$
DELIMITER ;