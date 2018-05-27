DROP PROCEDURE IF EXISTS spCore_Get_TeamList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_TeamList(
	IN IsActive_p INTEGER
)
BEGIN
	IF IsActive_p = 2 THEN
		SELECT 
			  CC.TeamId
			, CC.Name
			, CC.ShortName
			, CC.IsActive
			, CC.AssociationId
			, SA.ShortName		AS AssociationName
			, CC.Alias01
			, CC.Alias02
			, CC.Alias03
			, CC.Alias04
			, CC.Alias05
			, CC.Alias06
			, CC.Alias07
			, CC.Alias08
			, CC.Alias09
			, CC.Alias10
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username 		AS EntryUser
			, CC.ModDate
			, CC.ModUserId
			, U2.Username 		AS ModUser
		FROM 
			tbCore_Team CC
			INNER JOIN tbCore_Association SA ON
				SA.AssociationId = CC.AssociationId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = CC.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = CC.ModUserId
		ORDER BY
			CC.ShortName;
	ELSE
		SELECT 
			  CC.TeamId
			, CC.Name
			, CC.ShortName
			, CC.IsActive
			, CC.AssociationId
			, SA.ShortName			AS AssociationName
			, CC.Alias01
			, CC.Alias02
			, CC.Alias03
			, CC.Alias04
			, CC.Alias05
			, CC.Alias06
			, CC.Alias07
			, CC.Alias08
			, CC.Alias09
			, CC.Alias10
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username 			AS EntryUser
			, CC.ModDate
			, CC.ModUserId
			, U2.Username 			AS ModUser
		FROM 
			tbCore_Team CC
			INNER JOIN tbCore_Association SA ON
				SA.AssociationId = CC.AssociationId
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
