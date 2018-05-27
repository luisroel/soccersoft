DROP PROCEDURE IF EXISTS spCore_Get_AssociationListByConfederation;
DELIMITER $$
CREATE PROCEDURE spCore_Get_AssociationListByConfederation(
	IN ConfederationId_p BIGINT
)
BEGIN
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
		CC.ConfederationId = ConfederationId_p
	ORDER BY
		CC.ShortName;
END $$
DELIMITER ;