DROP PROCEDURE IF EXISTS spCore_Insert_SeasonTeam;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_SeasonTeam(
	  IN SeasonId_p	BIGINT
	, IN TeamId_p	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	INSERT INTO tbCore_SeasonTeam (
		  `SeasonId`
		, `TeamId`
	) VALUES ( 
		  SeasonId_p
		, TeamId_p 
	);
END $$
DELIMITER ;
