DROP PROCEDURE IF EXISTS spCore_Get_TournamentListByAssociation;
DELIMITER $$
CREATE PROCEDURE spCore_Get_TournamentListByAssociation(
	IN AssociationId_p BIGINT
)
BEGIN
    -- Insert statements for procedure here
	SELECT
		  CC.TournamentId
		, CC.ShortName
		, CC.Name
		, CC.IsActive
		, CC.AssociationId
		, AA.ShortName			AS Association
		, CC.EntryDate
		, CC.EntryUserId
		, U1.Username 			AS EntryUser
		, CC.ModDate
		, CC.ModUserId
		, U2.Username 			AS ModUser
	FROM 
		tbCore_Tournament CC
		INNER JOIN tbCore_Association AA ON
			AA.AssociationId = CC.AssociationId
		INNER JOIN tbSecurity_User U1 ON
			U1.UserId = CC.EntryUserId
		INNER JOIN tbSecurity_User U2 ON
			U2.UserId = CC.ModUserId
	WHERE
		    CC.AssociationId = AssociationId_p
		AND CC.IsActive = 1
	ORDER BY
		CC.ShortName;
END $$
DELIMITER ;

