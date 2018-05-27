DROP PROCEDURE IF EXISTS spCore_Get_AvailableTeams;
DELIMITER $$
CREATE PROCEDURE spCore_Get_AvailableTeams (
	  IN AssociationId_p	BIGINT
	, IN SeasonId_p			BIGINT
)
BEGIN
	SELECT 
		  TM.TeamId
		, TM.ShortName
	FROM 
		tbCore_Team TM
	WHERE
		TM.AssociationId = AssociationId_p
		AND NOT TM.TeamId IN (
			SELECT TS.TeamId FROM tbCore_SeasonTeam TS WHERE TS.SeasonId = SeasonId_p
		)
	ORDER BY
		TM.ShortName;
END $$
DELIMITER ;