DROP PROCEDURE IF EXISTS spCore_Insert_Tournament;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Tournament(
	  IN ShortName_p		VARCHAR(55)
	, IN Name_p				VARCHAR(255)
	, IN AssociationId_p	BIGINT
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Tournament SO WHERE SO.ShortName = ShortName_p) THEN
		SET Msg_p = 'Tournament already exist. Please verify!';
	ELSE
		INSERT tbCore_Tournament ( 
			  `ShortName`
			, `Name`
			, `IsActive`
			, `AssociationId`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
		 	  ShortName_p
			, Name_p 
			, 1
			, AssociationId_p
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END $$
DELIMITER ;

