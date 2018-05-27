DROP PROCEDURE IF EXISTS spCore_Insert_Season;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Season(
	  IN SeasonTypeId_p	BIGINT
	, IN ShortName_p	VARCHAR(55)
	, IN Name_p			VARCHAR(255)
	, IN TournamentId_p	BIGINT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Season SO WHERE SO.ShortName = ShortName_p AND SO.TournamentId = TournamentId_p) THEN
		SET Msg_p = 'Season already exist. Please verify!';
	ELSE
		INSERT tbCore_Season ( 
			  `SeasonTypeId`
			, `ShortName`
			, `Name`
			, `TournamentId`
		 ) VALUES (
			  SeasonTypeId_p
		 	, ShortName_p
			, Name_p
			, TournamentId_p
		);

		UPDATE tbCore_Tournament SET
			  `ModDate`   = Date_v
			, `ModUserId` = UserId_p
		WHERE
			`TournamentId` = TournamentId_p;
	END IF;
END $$
DELIMITER ;

