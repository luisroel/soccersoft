DROP PROCEDURE IF EXISTS spCore_Insert_Phase;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Phase(
	  IN ShortName_p	VARCHAR(15)
	, IN Name_p			VARCHAR(50)
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Phase SO WHERE SO.ShortName = ShortName_p) THEN
		SET Msg_p = 'Phase already exist. Please verify!';
	ELSE
		INSERT tbCore_Phase ( 
			  `ShortName`
			, `Name`
			, `IsActive`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
		 ) VALUES (
		 	  ShortName_p
			, Name_p 
			, 1
			, UserId_p
			, Date_v
			, UserId_p
			, Date_v
		);
	END IF;
END $$
DELIMITER ;

