DROP PROCEDURE IF EXISTS spCore_Get_PhaseListBySeason;
DELIMITER $$
CREATE PROCEDURE spCore_Get_PhaseListBySeason(
	IN SeasonId_p INTEGER
)
BEGIN
    -- Insert statements for procedure here
	SELECT 
		  CC.PhaseId
		, CC.Name
		, CC.ShortName
		, CC.IsActive
		, CC.EntryDate
		, CC.EntryUserId
		, U1.Username 		AS EntryUser
		, CC.ModDate
		, CC.ModUserId
		, U2.Username 		AS ModUser
	FROM 
		tbCore_Season SS
		INNER JOIN tbcore_SeasonTypePhase PT ON
			PT.SeasonTypeId  = SS.SeasonTypeId
		INNER JOIN tbCore_Phase CC ON
			PT.PhaseId = CC.PhaseId
        INNER JOIN tbcore_SeasonType ST ON
			ST.SeasonTypeId = PT.SeasonTypeId
		INNER JOIN tbSecurity_User U1 ON
			U1.UserId = CC.EntryUserId
		INNER JOIN tbSecurity_User U2 ON
			U2.UserId = CC.ModUserId
	WHERE
		SS.SeasonId = SeasonId_p
	ORDER BY
		CC.PhaseId;
END $$
DELIMITER ;

