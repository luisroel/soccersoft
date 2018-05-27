DROP PROCEDURE IF EXISTS spCore_Update_QuickFixture;
DELIMITER $$
CREATE PROCEDURE spCore_Update_QuickFixture(
      IN FixtureId_p		BIGINT
    , IN ScoredHome_p		INTEGER
    , IN ScoredVisitor_p	INTEGER
    , IN Odd_1_p			FLOAT
    , IN Odd_X_p			FLOAT
    , IN Odd_2_p			FLOAT
    , IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.FixtureId = FixtureId_p) THEN
		SET	Msg_p = 'Fixture does not exist. Please verify!';
	ELSE
		UPDATE tbCore_Fixture SET
			  `ScoredHome`		= ScoredHome_p
			, `ScoredVisitor`	= ScoredVisitor_p
            , `Odd_1`			= Odd_1_p
			, `Odd_X`			= Odd_X_p
            , `Odd_2`			= Odd_2_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
			, `Last5_H`			= fnUtil_Get_Last5(HomeTeamId, Time)
			, `Last5_V`			= fnUtil_Get_Last5(VisitorTeamId, Time)
		WHERE
			`FixtureId` = FixtureId_p;
	END IF;
END $$
DELIMITER ;
