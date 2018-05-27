DROP PROCEDURE IF EXISTS spCore_Get_SeasonTypeList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_SeasonTypeList(
	IN IsActive_p INTEGER
)
BEGIN
    -- Insert statements for procedure here
	IF IsActive_p = 2 THEN
		SELECT 
			  CC.SeasonTypeId
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
			tbCore_SeasonType CC
			INNER JOIN tbSecurity_User U1 ON
				U1.UserId = CC.EntryUserId
			INNER JOIN tbSecurity_User U2 ON
				U2.UserId = CC.ModUserId
		ORDER BY
			CC.ShortName;
	ELSE
		SELECT 
			  CC.SeasonTypeId
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
			tbCore_SeasonType CC
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

