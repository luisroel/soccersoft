DROP PROCEDURE IF EXISTS spCore_Update_Team;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Team(
      IN TeamId_p			BIGINT
	, IN ShortName_p		VARCHAR(50)
	, IN Name_p				VARCHAR(255)
	, IN IsActive_p			BIT
	, IN AssociationId_p	BIGINT
	, IN Alias01_p			VARCHAR(50)
	, IN Alias02_p			VARCHAR(50)
	, IN Alias03_p			VARCHAR(50)
	, IN Alias04_p			VARCHAR(50)
	, IN Alias05_p			VARCHAR(50)
	, IN Alias06_p			VARCHAR(50)
	, IN Alias07_p			VARCHAR(50)
	, IN Alias08_p			VARCHAR(50)
	, IN Alias09_p			VARCHAR(50)
	, IN Alias10_p			VARCHAR(50)
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_Team CC WHERE CC.TeamId = TeamId_p) THEN
		SET Msg_p = 'Team does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Team SET
			  `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `IsActive`		= IsActive_p
			, `AssociationId`	= AssociationId_p
			, `Alias01`			= Alias01_p
			, `Alias02`			= Alias02_p
			, `Alias03`			= Alias03_p
			, `Alias04`			= Alias04_p
			, `Alias05`			= Alias05_p
			, `Alias06`			= Alias06_p
			, `Alias07`			= Alias07_p
			, `Alias08`			= Alias08_p
			, `Alias09`			= Alias09_p
			, `Alias10`			= Alias10_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			`TeamId` = TeamId_p;
	END IF;
END $$
DELIMITER ;

