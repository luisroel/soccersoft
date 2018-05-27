DROP PROCEDURE IF EXISTS spCore_Update_Season;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Season(
      IN SeasonId_p		BIGINT
	, IN SeasonTypeId_p	BIGINT
	, IN ShortName_p	VARCHAR(50)
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
	IF EXISTS(SELECT * FROM tbCore_Season CC WHERE CC.ShortName = ShortName_p AND CC.SeasonId <> SeasonId_p AND CC.TournamentId = TournamentId_p) THEN
		SET Msg_p = 'Season already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Season CC WHERE CC.SeasonId = SeasonId_p) THEN
		SET Msg_p = 'Season does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Season SET
			  `SeasonTypeId`	= SeasonTypeId_p
			, `ShortName`		= ShortName_p
			, `Name`			= Name_p
			, `TournamentId`	= TournamentId_p
		 WHERE
			`SeasonId` = SeasonId_p;

		UPDATE tbCore_Tournament SET
			  `ModDate`   = Date_v
			, `ModUserId` = UserId_p
		WHERE
			`TournamentId` = TournamentId_p;
	END IF;
END $$
DELIMITER ;
