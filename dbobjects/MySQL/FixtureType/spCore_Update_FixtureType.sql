DROP PROCEDURE IF EXISTS spCore_Update_FixtureType;
DELIMITER $$
CREATE PROCEDURE spCore_Update_FixtureType(
      IN FixtureTypeId_p	BIGINT
	, IN ShortName_p		VARCHAR(15)
	, IN Name_p				VARCHAR(50)
	, IN IsActive_p			BIT
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF EXISTS(SELECT * FROM tbCore_FixtureType CC WHERE CC.ShortName = ShortName_p AND CC.FixtureTypeId <> FixtureTypeId_p) THEN
		SET Msg_p = 'FixtureType already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_FixtureType CC WHERE CC.FixtureTypeId = FixtureTypeId_p) THEN
		SET	Msg_p = 'FixtureType does not exist. Please verify!';
	ELSE
		UPDATE tbCore_FixtureType SET
			  `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `IsActive`		= IsActive_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			`FixtureTypeId` = FixtureTypeId_p;
	END IF;
END $$
DELIMITER ;
