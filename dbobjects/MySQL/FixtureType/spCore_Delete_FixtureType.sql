DROP PROCEDURE IF EXISTS spCore_Delete_FixtureType;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_FixtureType(
      IN FixtureTypeId_p	BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_FixtureType CC WHERE CC.FixtureTypeId = FixtureTypeId_p) THEN
		SET Msg_p = 'FixtureType does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_FixtureType WHERE FixtureTypeId = FixtureTypeId_p;
	END IF;
END $$
DELIMITER ;

