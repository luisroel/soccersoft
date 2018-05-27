DROP PROCEDURE IF EXISTS spCore_Update_Fixture;
DELIMITER $$
CREATE PROCEDURE spCore_Update_Fixture(
      IN FixtureId_p		BIGINT
	, IN SeasonId_p			BIGINT
	, IN PhaseId_p			BIGINT
	, IN Round_p			BIGINT
    , IN Time_p				DATETIME
    , IN HomeTeamId_p		BIGINT
    , IN ScoredHome_p		INTEGER
    , IN VisitorTeamId_p	BIGINT
    , IN ScoredVisitor_p	INTEGER
    , IN StadiumId_p		BIGINT
    , IN RefereeId_p		BIGINT
    , IN StatusId_p			BIGINT
    , IN Odd_1_p			FLOAT
    , IN Odd_X_p			FLOAT
    , IN Odd_2_p			FLOAT
    , IN WeekNo_p			INT
    , IN Tendency_p			VARCHAR(3)
    , IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;

	SET Date_v = NOW();
	SET Msg_p = '';

	IF NOT EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.FixtureId = FixtureId_p) THEN
		SET	Msg_p = 'Fixture does not exist. Please verify!';
	ELSEIF EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.SeasonId = SeasonId_p
												AND FT.PhaseId = PhaseId_p
                                                AND FT.Round = Round_p
                                                AND FT.HomeTeamId = HomeTeamId_p
                                                AND FT.VisitorTeamId = VisitorTeamId_p
                                                AND FT.FixtureId <> FixtureId_p) THEN
		SET	Msg_p = 'Fixture already exists. Please verify!';
	ELSE
		UPDATE tbCore_Fixture SET
			  `SeasonId`		= SeasonId_p
			, `PhaseId`			= PhaseId_p
			, `Round`			= Round_p
			, `Time`			= Time_p
			, `HomeTeamId`		= HomeTeamId_p
			, `ScoredHome`		= ScoredHome_p
			, `VisitorTeamId`	= VisitorTeamId_p
			, `ScoredVisitor`	= ScoredVisitor_p
			, `StadiumId`		= StadiumId_p
			, `RefereeId`		= RefereeId_p
			, `FixtureStatusId`	= StatusId_p
            , `Odd_1`			= Odd_1_p
			, `Odd_X`			= Odd_X_p
            , `Odd_2`			= Odd_2_p
            , `WeekNo`			= WeekNo_p
            , `Tendency`		= Tendency_p
			, `ModUserId`		= UserId_p
			, `ModDate`			= Date_v
			, `Last5_H`			= fnUtil_Get_Last5(HomeTeamId_p, Time_p)
			, `Last5_V`			= fnUtil_Get_Last5(VisitorTeamId_p, Time_p)
		WHERE
			`FixtureId` = FixtureId_p;
	END IF;
END $$
DELIMITER ;
