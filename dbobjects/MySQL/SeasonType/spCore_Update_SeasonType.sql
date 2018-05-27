DROP PROCEDURE IF EXISTS spCore_Update_SeasonType;
DELIMITER $$
CREATE PROCEDURE spCore_Update_SeasonType(
      IN SeasonTypeId_p	BIGINT
	, IN ShortName_p	VARCHAR(15)
	, IN Name_p			VARCHAR(50)
	, IN IsActive_p		BIT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_SeasonType CC WHERE CC.ShortName = ShortName_p AND CC.SeasonTypeId <> SeasonTypeId_p) THEN
		SET Msg_p = 'Season type already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_SeasonType CC WHERE CC.SeasonTypeId = SeasonTypeId_p) THEN
		SET Msg_p = 'Season type does not exist. Please verify!';
	ELSE
		UPDATE tbCore_SeasonType SET
			  `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `IsActive`		= IsActive_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			`SeasonTypeId` = SeasonTypeId_p;
	END IF;
END $$
DELIMITER ;
