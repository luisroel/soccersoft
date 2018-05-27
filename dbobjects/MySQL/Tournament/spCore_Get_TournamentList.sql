DROP PROCEDURE IF EXISTS spCore_Get_TournamentList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_TournamentList(
	IsActive_p INTEGER
)
BEGIN
    -- Insert statements for procedure here
	IF IsActive_p = 2 THEN
		SELECT
			  CC.TournamentId
			, CC.ShortName
			, CC.Name
			, CC.IsActive
            , CC.AssociationId
            , AA.ShortName			AS Association
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username			AS EntryUser
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
		ORDER BY
			CC.ShortName;
	ELSE
		SELECT
			  CC.TournamentId
			, CC.ShortName
			, CC.Name
			, CC.IsActive
            , CC.AssociationId
            , AA.ShortName			AS Association
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username			AS EntryUser
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
			CC.IsActive = IsActive_p
		ORDER BY
			CC.ShortName;
	END IF;
END $$
DELIMITER ;
