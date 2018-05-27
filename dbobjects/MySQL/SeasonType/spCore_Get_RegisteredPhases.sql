DROP PROCEDURE IF EXISTS spCore_Get_RegisteredPhases;
DELIMITER $$
CREATE PROCEDURE spCore_Get_RegisteredPhases(
	IN SeasonTypeId_p BIGINT
)
BEGIN
	SELECT 
		  PH.PhaseId
		, PH.ShortName
	FROM 
		tbCore_Phase PH
	WHERE 
		PH.PhaseId IN (SELECT SP.PhaseId FROM tbCore_SeasonTypePhase SP WHERE SP.SeasonTypeId = SeasonTypeId_p)
	ORDER BY
		PH.PhaseId;
END $$
DELIMITER ;

