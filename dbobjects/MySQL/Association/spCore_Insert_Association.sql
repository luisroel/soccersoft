DROP PROCEDURE IF EXISTS spCore_Insert_Association;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Association(
	  IN ShortName_p		VARCHAR(55)
	, IN Name_p				VARCHAR(255)
	, IN ConfederationId_p	BIGINT
	, IN CountryId_p		BIGINT
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Association SO WHERE SO.ShortName = ShortName_p) THEN
		SET Msg_p = 'Association already exist. Please verify!';
	ELSE
		INSERT tbCore_Association ( 
			  `ShortName`
			, `Name`
			, `IsActive`
			, `ConfederationId`
			, `CountryId`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
		 	  ShortName_p
			, Name_p 
			, 1
			, ConfederationId_p
			, CountryId_p
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END $$
DELIMITER ;
