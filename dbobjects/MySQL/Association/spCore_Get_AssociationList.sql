DROP PROCEDURE IF EXISTS spCore_Get_AssociationList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_AssociationList(
	IsActive_p INTEGER
)
BEGIN
    -- Insert statements for procedure here
	IF IsActive_p = 2 THEN
		SELECT 
			  CC.AssociationId
			, CC.ShortName
			, CC.Name
			, CC.IsActive
			, CC.ConfederationId
			, CF.ShortName			AS ConfederationName
			, CC.CountryId
			, CT.ShortName			AS CountryName
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username 			AS EntryUser
			, CC.ModDate
			, CC.ModUserId
			, U2.Username 			AS ModUser
		FROM 
			tbCore_Association CC
			INNER JOIN tbCore_Confederation CF ON
				CF.ConfederationId = CC.ConfederationId
			INNER JOIN tbCore_Country CT ON
				CT.CountryId = CC.CountryId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = CC.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = CC.ModUserId
		ORDER BY
			CC.ShortName;
	ELSE
		SELECT 
			  CC.AssociationId
			, CC.ShortName
			, CC.Name
			, CC.IsActive
			, CC.ConfederationId
			, CF.ShortName			AS ConfederationName
			, CC.CountryId
			, CT.ShortName			AS CountryName
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username 			AS EntryUser
			, CC.ModDate
			, CC.ModUserId
			, U2.Username 			AS ModUser
		FROM 
			tbCore_Association CC
			INNER JOIN tbCore_Confederation CF ON
				CF.ConfederationId = CC.ConfederationId
			INNER JOIN tbCore_Country CT ON
				CT.CountryId = CC.CountryId
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