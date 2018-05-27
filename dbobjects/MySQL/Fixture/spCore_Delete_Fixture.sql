DROP PROCEDURE IF EXISTS spCore_Delete_Fixture;
DELIMITER $$
CREATE PROCEDURE spCore_Delete_Fixture(
      IN FixtureId_p BIGINT
	, OUT Msg_p		 VARCHAR(255)
)
BEGIN
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_Fixture CC WHERE CC.FixtureId = FixtureId_p) THEN
		SET Msg_p = 'Fixture does not exist. Please verify!';
	ELSE
		DELETE FROM tbCore_Fixture WHERE FixtureId = FixtureId_p;
	END IF;
END $$
DELIMITER ;
