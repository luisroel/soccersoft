DROP PROCEDURE IF EXISTS spCore_Update_Referee;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Referee(
      IN RefereeId_p	BIGINT
	, IN NickName_p		VARCHAR(30)
	, IN FirstName_p	VARCHAR(30)
	, IN MiddleName_p	VARCHAR(30)
	, IN LastName_p		VARCHAR(30)
	, IN IsActive_p		BIT
	, IN Birthdate_p	DATETIME
	, IN CountryId_p	BIGINT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF EXISTS(SELECT * FROM tbCore_Referee CC WHERE CC.FirstName = FirstName_p AND CC.LastName = LastName_p AND CC.RefereeId <> RefereeId_p) THEN
		SET Msg_p = 'Referee already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Referee CC WHERE CC.RefereeId = RefereeId_p) THEN
		SET Msg_p = 'Referee does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Referee SET
			  `NickName`	= NickName_p
			, `FirstName`	= FirstName_p
			, `MiddleName`	= MiddleName_p
			, `LastName`	= LastName_p
			, `IsActive`	= IsActive_p
			, `BirthDate`	= BirthDate_p
			, `CountryId`	= CountryId_p
			, `ModUserId`	= UserId_p
			, `ModDate`		= Date_v
		 WHERE
			`RefereeId` = RefereeId_p;
	END IF;
END $$
DELIMITER ;

