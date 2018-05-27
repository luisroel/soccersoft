DROP PROCEDURE IF EXISTS spCore_Get_PhaseListBySeason;
DELIMITER $$
CREATE PROCEDURE spCore_Get_PhaseListBySeason(
	IN SeasonId_p INTEGER
)
BEGIN
    -- Insert statements for procedure here
	SELECT 
		  PH.PhaseId
		, PH.Name
		, PH.ShortName
		, PH.IsActive
		, PH.EntryDate
		, PH.EntryUserId
		, U1.Username 		AS EntryUser
		, PH.ModDate
		, PH.ModUserId
		, U2.Username 		AS ModUser
	FROM 
		tbCore_Season SS
		INNER JOIN tbcore_SeasonPhase SP ON
			SP.SeasonId  = SS.SeasonId
		INNER JOIN tbCore_Phase PH ON
			PH.PhaseId = SP.PhaseId
		INNER JOIN tbSecurity_User U1 ON
			U1.UserId = PH.EntryUserId
		INNER JOIN tbSecurity_User U2 ON
			U2.UserId = PH.ModUserId
	WHERE
		SS.SeasonId = SeasonId_p
	ORDER BY
		PH.PhaseId;
END $$
DELIMITER ;

