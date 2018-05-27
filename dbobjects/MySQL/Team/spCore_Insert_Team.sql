DROP PROCEDURE IF EXISTS spCore_Insert_Team;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Team (
	  IN ShortName_p		VARCHAR(55)
	, IN Name_p				VARCHAR(255)
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

	IF EXISTS(SELECT * FROM tbCore_Team SO WHERE SO.ShortName = ShortName_p AND SO.AssociationId <> AssociationId_p) THEN
		SET	Msg_p = 'Team already exist. Please verify!';
	ELSE
		INSERT tbCore_Team ( 
			  `ShortName`
			, `Name`
			, `IsActive`
			, `AssociationId`
			, `Alias01`
			, `Alias02`
			, `Alias03`
			, `Alias04`
			, `Alias05`
			, `Alias06`
			, `Alias07`
			, `Alias08`
			, `Alias09`
			, `Alias10`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
		 	  ShortName_p
			, Name_p 
			, 1
			, AssociationId_p
			, Alias01_p
			, Alias02_p
			, Alias03_p
			, Alias04_p
			, Alias05_p
			, Alias06_p
			, Alias07_p
			, Alias08_p
			, Alias09_p
			, Alias10_p
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END $$
DELIMITER ;