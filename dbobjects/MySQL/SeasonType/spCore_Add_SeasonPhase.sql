DROP PROCEDURE IF EXISTS spCore_Add_SeasonPhase;
DELIMITER $$
CREATE PROCEDURE spCore_Add_SeasonPhase(
	  IN SeasonTypeId_p	BIGINT
	, IN PhaseId_p		BIGINT
	, IN UserId_p		BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tbCore_SeasonTypePhase SO WHERE SO.SeasonTypeId = SeasonTypeId_p AND SO.PhaseId = PhaseId_p) THEN
		SET Msg_p = 'Phase already exist in the season type. Please verify!';
	ELSE
		INSERT tbCore_SeasonTypePhase ( 
			  `SeasonTypeId`
			, `PhaseId`
		 ) VALUES (
		 	  SeasonTypeId_p
			, PhaseId_p
		);
		
		UPDATE tbCore_SeasonType SET
			  `ModDate` 	= Date_v
			, `ModUserId` 	= UserId_p
		WHERE
			`SeasonTypeId` 	= SeasonTypeId_p;
	END IF;
END $$
DELIMITER ;

