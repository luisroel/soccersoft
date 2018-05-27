DROP PROCEDURE IF EXISTS spCore_Get_SeasonPhaseList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_SeasonPhaseList(
      IN SeasonId_p		BIGINT
)
BEGIN
	SELECT
		  PH.PhaseId
		, PH.Name		AS `Phase`
		, SP.Name		AS `Description`
        , (SELECT COUNT(*) FROM tbCore_Fixture FT WHERE FT.SeasonId = SP.SeasonId AND FT.PhaseId = SP.PhaseId) AS `Records`
	FROM
		tbCore_SeasonPhase SP
		INNER JOIN tbCore_Phase PH ON
			PH.PhaseId = SP.PhaseId
	WHERE
		SP.SeasonId = SeasonId_p
	ORDER BY
		PH.PhaseId;
END $$
DELIMITER ;
