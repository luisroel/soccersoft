DROP PROCEDURE IF EXISTS spCore_Get_AvailablePhases;
DELIMITER $$
CREATE PROCEDURE spCore_Get_AvailablePhases(
	IN SeasonTypeId_p BIGINT
)
BEGIN
	SELECT 
		  PH.PhaseId
		, PH.ShortName
	FROM 
		tbCore_Phase PH
	WHERE 
		NOT PH.PhaseId IN (SELECT SP.PhaseId FROM tbCore_SeasonTypePhase SP WHERE SP.SeasonTypeId = SeasonTypeId_p)
	ORDER BY
		PH.PhaseId;
END $$
DELIMITER ;

