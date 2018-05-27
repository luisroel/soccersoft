DROP PROCEDURE IF EXISTS spCore_Insert_Fixture;
DELIMITER $$
CREATE PROCEDURE spCore_Insert_Fixture(
	  IN SeasonId_p			BIGINT
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

	IF EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.SeasonId = SeasonId_p 
												AND FT.PhaseId 	= PhaseId_p
                                                AND FT.Round	= Round_p
                                                AND FT.HomeTeamId = HomeTeamId_p
                                                AND FT.VisitorTeamId = VisitorTeamId_p) THEN
		SET Msg_p = 'Fixture already exist. Please verify!';
	ELSE
		INSERT tbCore_Fixture ( 
			  `SeasonId`
			, `PhaseId`
			, `Round`
			, `Time`
			, `HomeTeamId`
			, `ScoredHome`
			, `VisitorTeamId`
			, `ScoredVisitor`
			, `StadiumId`
			, `RefereeId`
			, `FixtureStatusId`
            , `Odd_1`
            , `Odd_X`
            , `Odd_2`
            , `aOdd_1`
            , `aOdd_X`
            , `aOdd_2`
            , `WeekNo`
			, `EntryUserId`
			, `EntryDate`
			, `ModUserId`
			, `ModDate`
			, `Last5_H`
			, `Last5_V`
            , `Tendency`
		 ) VALUES (
			  SeasonId_p
			, PhaseId_p
			, Round_p
			, Time_p
			, HomeTeamId_p
			, ScoredHome_p
			, VisitorTeamId_p
			, ScoredVisitor_p
			, StadiumId_p
			, RefereeId_p
			, StatusId_p
            , Odd_1_p
            , Odd_X_p
            , Odd_2_p
            , Odd_1_p
            , Odd_X_p
            , Odd_2_p
            , WeekNo_p
            , UserId_p
            , Date_v
            , UserId_p
            , Date_v
			, fnUtil_Get_Last5(HomeTeamId_p, Time_p)
			, fnUtil_Get_Last5(VisitorTeamId_p, Time_p)
            , Tendency_p
		);
	END IF;
END $$
DELIMITER ;
