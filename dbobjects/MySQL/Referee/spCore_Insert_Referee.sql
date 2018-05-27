DROP PROCEDURE IF EXISTS spCore_Insert_Referee;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Referee(
	  IN NickName_p		VARCHAR(30)
	, IN FirstName_p	VARCHAR(30)
	, IN MiddleName_p	VARCHAR(30)
	, IN LastName_p		VARCHAR(30)
	, IN Birthdate_p	DATETIME
	, IN CountryId_p	BIGINT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Referee CC WHERE CC.FirstName = FirstName_p AND CC.LastName = LastName_p) THEN
		SET Msg_p = 'Referee already exist. Please verify!';
	ELSE
		INSERT tbCore_Referee ( 
			  `NickName`
			, `FirstName`
			, `MiddleName`
			, `LastName`
			, `IsActive`
			, `BirthDate`
			, `CountryId`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
		 	  NickName_p
			, FirstName_p
			, MiddleName_p
			, LastName_p
			, 1
			, BirthDate_p
			, CountryId_p
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END $$
DELIMITER ;
