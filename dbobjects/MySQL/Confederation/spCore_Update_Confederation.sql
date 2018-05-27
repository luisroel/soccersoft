DROP PROCEDURE IF EXISTS spCore_Update_Confederation;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Confederation(
      IN ConfederationId_p	BIGINT
	, IN ShortName_p		VARCHAR(10)
	, IN Name_p				VARCHAR(200)
	, IN IsActive_p			BIT
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Confederation CC WHERE CC.ShortName = ShortName_p AND CC.ConfederationId <> ConfederationId_p) THEN
		SET Msg_p = 'Confederation already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Confederation CC WHERE CC.ConfederationId = ConfederationId_p) THEN
		SET Msg_p = 'Confederation does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Confederation SET
			  `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `IsActive`		= IsActive_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			ConfederationId = ConfederationId_p;
	END IF;
END $$
DELIMITER ;

