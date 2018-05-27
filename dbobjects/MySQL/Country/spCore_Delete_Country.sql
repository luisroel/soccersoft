DROP PROCEDURE IF EXISTS spCore_Delete_Country;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Country(
      IN CountryId_p	BIGINT
	, OUT Msg_p			VARCHAR(255)
)
BEGIN
	SET	Msg_p = '';

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM tbCore_Country CC WHERE CC.CountryId = CountryId_p) THEN
		SET Msg_p = 'Country does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Country WHERE CountryId = CountryId_p;
	END IF;
END $$
DELIMITER ;
