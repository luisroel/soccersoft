DROP PROCEDURE IF EXISTS spCore_Update_Tournament;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Tournament(
      IN TournamentId_p		BIGINT
	, IN ShortName_p		VARCHAR(50)
	, IN Name_p				VARCHAR(255)
	, IN IsActive_p			BIT
    , IN AssociationId_p	BIGINT
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_Tournament CC WHERE 
			CC.ShortName = ShortName_p 
        AND CC.AssociationId = AssociationId_p
        AND CC.TournamentId <> TournamentId_p) THEN
		SET Msg_p = 'Tournament already exist. Please verify!';
	ELSEIF NOT EXISTS(SELECT * FROM tbCore_Tournament CC WHERE CC.TournamentId = TournamentId_p) THEN
		SET Msg_p = 'Tournament does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Tournament SET
			  `ShortName`		= TRIM(ShortName_p)
			, `Name`			= TRIM(Name_p)
			, `IsActive`		= IsActive_p
            , `AssociationId`	= AssociationId_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
		 WHERE
			TournamentId = TournamentId_p;
	END IF;
END $$
DELIMITER ;

