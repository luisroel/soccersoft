DROP PROCEDURE IF EXISTS spCore_Get_RefereeList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_RefereeList(
	IN IsActive_p INTEGER
)
BEGIN
	IF IsActive_p = 2 THEN
		SELECT 
			  CC.RefereeId
			, CC.NickName
			, CC.FirstName
			, CC.MiddleName
			, CC.LastName
			, CC.IsActive
			, CC.BirthDate
			, CC.CountryId
			, CT.ShortName		AS CountryName
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username		AS EntryUser
			, CC.ModDate
			, CC.ModUserId
			, U2.Username		AS ModUser
		FROM 
			tbCore_Referee CC
			INNER JOIN tbCore_Country CT ON
				CT.CountryId = CC.CountryId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = CC.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = CC.ModUserId
		ORDER BY
		  	  CC.FirstName
			, CC.LastName;
	ELSE
		SELECT 
			  CC.RefereeId
			, CC.NickName
			, CC.FirstName
			, CC.MiddleName
			, CC.LastName
			, CC.IsActive
			, CC.BirthDate
			, CC.CountryId
			, CT.ShortName		AS CountryName
			, CC.EntryDate
			, CC.EntryUserId
			, U1.Username		AS EntryUser
			, CC.ModDate
			, CC.ModUserId
			, U2.Username		AS ModUser
		FROM 
			tbCore_Referee CC
			INNER JOIN tbCore_Country CT ON
				CT.CountryId = CC.CountryId
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = CC.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = CC.ModUserId
		WHERE 
			CC.IsActive = IsActive_p
		ORDER BY
		  	  CC.FirstName
			, CC.LastName;
	END IF;
END $$
DELIMITER ;
