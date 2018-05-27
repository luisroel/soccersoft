DROP PROCEDURE IF EXISTS spCore_Update_Association;
DELIMITER $$

CREATE PROCEDURE spCore_Update_Association(
      IN AssociationId_p	BIGINT
	, IN ShortName_p		VARCHAR(50)
	, IN Name_p				VARCHAR(255)
	, IN IsActive_p			BIT
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
	IF EXISTS(SELECT * FROM tbCore_Association CC WHERE CC.ShortName = ShortName_p AND CC.AssociationId <> AssociationId_p) THEN
		SET Msg_p = 'Association already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Association CC WHERE CC.AssociationId = AssociationId_p) THEN
		SET Msg_p = 'Association does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Association SET
			  ShortName			= ShortName_p
			, Name				= Name_p
			, IsActive			= IsActive_p
			, ConfederationId	= ConfederationId_p
			, CountryId			= CountryId_p
			, ModUserId			= UserId_p
			, ModDate			= Date_v
		 WHERE
			AssociationId = AssociationId_p;
	END IF;
END $$
DELIMITER ;