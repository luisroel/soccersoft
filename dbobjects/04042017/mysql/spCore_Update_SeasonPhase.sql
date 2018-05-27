DROP PROCEDURE IF EXISTS spCore_Update_SeasonPhase;
DELIMITER $$
CREATE PROCEDURE spCore_Update_SeasonPhase(
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
	IF NOT EXISTS(SELECT * FROM tbCore_SeasonPhase SP WHERE SP.SeasonId = SeasonId_p AND SP.PhaseId = PhaseId_p) THEN
		SET Msg_p = 'Phase does not exist. Please verify!';
	ELSE
		UPDATE tbCore_SeasonPhase SET
              `Name`		= Desc_p
            , `ModUserId`	= UserId_p
            , `ModDate`		= Date_v
		WHERE
				`SeasonId`	= SeasonId_p
			AND `PhaseId`	= PhaseId_p;
	END IF;
END $$
DELIMITER ;

