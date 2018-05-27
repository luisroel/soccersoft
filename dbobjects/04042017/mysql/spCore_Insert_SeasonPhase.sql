DROP PROCEDURE IF EXISTS spCore_Insert_SeasonPhase;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_SeasonPhase(
	  IN SeasonId_p	BIGINT
	, IN PhaseId_p	BIGINT
    , IN Desc_p		VARCHAR(100)
	, IN UserId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_SeasonPhase SP WHERE SP.SeasonId = SeasonId_p AND SP.PhaseId = PhaseId_p) THEN
		SET Msg_p = 'Phase already exist. Please verify!';
	ELSE
		INSERT tbCore_SeasonPhase ( 
			  `SeasonId`
			, `PhaseId`
            , `Name`
            , `EntryUserId`
            , `EntryDate`
            , `ModUserId`
            , `ModDate`
		 ) VALUES (
			  SeasonId_p
			, PhaseId_p
            , Desc_p
            , UserId_p
            , Date_v
            , UserId_p
            , Date_v
		);
	END IF;
END $$
DELIMITER ;

