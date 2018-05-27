DROP PROCEDURE IF EXISTS spCore_Update_Phase;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Phase(
      IN PhaseId_p		BIGINT
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
	IF EXISTS(SELECT * FROM tbCore_Phase CC WHERE CC.ShortName = ShortName_p AND CC.PhaseId <> PhaseId_p) THEN
		SET Msg_p = 'Phase already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Phase CC WHERE CC.PhaseId = PhaseId_p) THEN
		SET Msg_p = 'Phase does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Phase SET
			  `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `IsActive`		= IsActive_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			`PhaseId` = PhaseId_p;
	END IF;
END $$
DELIMITER ;
