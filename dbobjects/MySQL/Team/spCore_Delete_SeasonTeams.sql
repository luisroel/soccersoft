DROP PROCEDURE IF EXISTS spCore_Delete_SeasonTeams;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_SeasonTeams(
	  IN @SeasonId	BIGINT
	, OUT Msg_p		VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.AwayTeamId IN (
				SELECT ST.TeamId FROM tbCore_SeasonTeam ST WHERE ST.SeasonId = @SeasonId
			))
		OR EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.HomeTeamId IN (
					SELECT ST.TeamId FROM tbCore_SeasonTeam ST WHERE ST.SeasonId = @SeasonId
			)) THEN
		SET Msg_p = 'Teams list cannot change. There is already a schedule!';
    ELSE
		DELETE FROM tbCore_SeasonTeam WHERE SeasonId = @SeasonId;
	END IF;
END $$
DELIMITER ;

