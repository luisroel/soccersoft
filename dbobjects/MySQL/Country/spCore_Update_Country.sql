DROP PROCEDURE IF EXISTS spCore_Update_Country;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Country(
      IN CountryId_p	BIGINT
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
	IF EXISTS(SELECT * FROM tbCore_Country CC WHERE CC.ShortName = ShortName_p AND CC.CountryId <> CountryId_p) THEN
		SET Msg_p = 'Country already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Country CC WHERE CC.CountryId = CountryId_p) THEN
		SET Msg_p = 'Country does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Country SET
			  ShortName		= ShortName_p
			, Name			= Name_p
			, IsActive		= IsActive_p
			, ModUserId		= UserId_p
			, ModDate		= Date_v
		 WHERE
			CountryId = CountryId_p;
	END IF;
END $$
DELIMITER ;
