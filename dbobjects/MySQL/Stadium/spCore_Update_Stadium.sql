DROP PROCEDURE IF EXISTS spCore_Update_Stadium;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Stadium(
      IN StadiumId_p	BIGINT
	, IN ShortName_p	VARCHAR(10)
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
	IF EXISTS(SELECT * FROM tbCore_Stadium CC WHERE CC.ShortName = ShortName_p AND CC.StadiumId <> StadiumId_p) THEN
		SET Msg_p = 'Stadium already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Stadium CC WHERE CC.StadiumId = StadiumId_p) THEN
		SET Msg_p = 'Stadium does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Stadium SET
			  `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `IsActive`		= IsActive_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			`StadiumId` = StadiumId_p;
	END IF;
END $$
DELIMITER ;
