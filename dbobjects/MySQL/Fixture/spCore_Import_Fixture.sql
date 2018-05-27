DROP PROCEDURE IF EXISTS spCore_Import_Fixture;
DELIMITER $$
CREATE PROCEDURE spCore_Import_Fixture(
	  IN Association_p		VARCHAR(100)
	, IN Tournament_p		VARCHAR(100)
	, IN Season_p			VARCHAR(100)
	, IN Phase_p			VARCHAR(50)
	, IN Round_p			INTEGER
    , IN Time_p				DATETIME
    , IN HomeTeam_p			VARCHAR(100)
    , IN ScoredHome_p		INTEGER
    , IN VisitorTeam_p		VARCHAR(100)
    , IN ScoredVisitor_p	INTEGER
    , IN Status_p			VARCHAR(20)
    , IN Odd_1_p			FLOAT
    , IN Odd_X_p			FLOAT
    , IN Odd_2_p			FLOAT
    , IN WeekNo_p			INT
    , IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v DATETIME;
    
    SET @HomeTeamId		= -1;
    SET @VisitorTeamId 	= -1;
    SET @AssociationId	= -1;
    SET @TournamentId   = -1;
    SET @SeasonId		= -1;
    SET @PhaseId		= -1;
    SET @StatusId		= -1;
	SET Date_v 			= NOW();
	SET Msg_p 			= '';

	-- Fixture Status description traslation
	SET @StatusDesc		= fnUtil_Normalize_MatchStatus(Status_p);
    
    IF EXISTS(SELECT * FROM tbCore_FixtureStatus FS WHERE TRIM(FS.ShortName) = @StatusDesc) THEN
		SELECT FS.FixtureStatusId INTO @StatusId FROM tbCore_FixtureStatus FS WHERE TRIM(FS.ShortName) = @StatusDesc;

		IF EXISTS(SELECT * FROM tbCore_Phase PH WHERE TRIM(PH.ShortName) = Phase_p) THEN
			SELECT PH.PhaseId INTO @PhaseId FROM tbCore_Phase PH WHERE TRIM(PH.ShortName) = Phase_p;
        
			IF EXISTS(SELECT * FROM tbCore_Association AA WHERE TRIM(AA.Name) = Association_p) THEN
				SELECT AA.AssociationId INTO @AssociationId FROM tbCore_Association AA WHERE TRIM(AA.Name) = Association_p;

				IF EXISTS(SELECT * FROM tbCore_Tournament TT WHERE TT.AssociationId = @AssociationId AND TRIM(TT.Name) = Tournament_p) THEN
					SELECT TT.TournamentId INTO @TournamentId FROM tbCore_Tournament TT WHERE TT.AssociationId = @AssociationId AND TRIM(TT.Name) = Tournament_p;
				
					IF EXISTS(SELECT * FROM tbCore_Season SS WHERE SS.TournamentId = @TournamentId AND TRIM(SS.Name) = Season_p) THEN
						SELECT SS.SeasonId INTO @SeasonId FROM tbCore_Season SS WHERE SS.TournamentId = @TournamentId AND TRIM(SS.Name) = Season_p;
                        
						IF EXISTS(SELECT * FROM tbCore_Team SO WHERE SO.Alias01 = HomeTeam_p AND SO.AssociationId = @AssociationId) AND
						EXISTS(SELECT * FROM tbCore_Team SO WHERE SO.Alias01 = VisitorTeam_p AND SO.AssociationId = @AssociationId) THEN
							SELECT SO.TeamId INTO @HomeTeamId FROM tbCore_Team SO WHERE SO.Alias01 = HomeTeam_p AND SO.AssociationId = @AssociationId;
							SELECT SO.TeamId INTO @VisitorTeamId FROM tbCore_Team SO WHERE SO.Alias01 = VisitorTeam_p AND SO.AssociationId = @AssociationId;
						END IF;

						IF @HomeTeamId <> -1 AND @VisitorTeamId <> -1 THEN
							IF EXISTS(SELECT * FROM tbCore_Fixture FT WHERE FT.SeasonId 	= @SeasonId 
																	AND FT.PhaseId 			= @PhaseId
																	AND FT.HomeTeamId 		= @HomeTeamId
																	AND FT.VisitorTeamId	= @VisitorTeamId
																	AND FT.Round			= Round_p) THEN
									UPDATE tbCore_Fixture SET
										  `Time`			= Time_p
										, `Odd_1`			= Odd_1_p
										, `Odd_X`			= Odd_X_p
										, `Odd_2`			= Odd_2_p
										, `aOdd_1`			= Odd_1_p
										, `aOdd_X`			= Odd_X_p
										, `aOdd_2`			= Odd_2_p                        
										, `ModUserId`		= UserId_p
										, `ModDate`			= Date_v
										, `Last5_H`			= fnUtil_Get_Last5(@HomeTeamId, Time_p)
										, `Last5_V`			= fnUtil_Get_Last5(@VisitorTeamId, Time_p)
									WHERE
											`SeasonId` 		= @SeasonId
										AND `PhaseId` 		= @PhaseId
										AND `HomeTeamId`	= @HomeTeamId
										AND `VisitorTeamId`	= @VisitorTeamId
										AND `Round`         = Round_p;
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
									  @SeasonId
									, @PhaseId
									, Round_p
									, Time_p
									, @HomeTeamId
									, ScoredHome_p
									, @VisitorTeamId
									, ScoredVisitor_p
									, 1
									, 1
									, @StatusId
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
									, fnUtil_Get_Last5(@HomeTeamId, Time_p)
									, fnUtil_Get_Last5(@VisitorTeamId, Time_p)
									, ''
								);
							END IF;
						ELSE
							SET Msg_p = CONCAT('Home or Visitor Team Not Found (', HomeTeam_p, ',', VisitorTeam_p , ')');
						END IF;
					ELSE
						SET Msg_p = CONCAT('Season Not Found (', Season_p , ')');
					END IF;
				ELSE
					SET Msg_p = CONCAT('Tournament Not Found (', Tournament_p , ')');
				END IF;
			ELSE
				SET Msg_p = CONCAT('Association Not Found (', Association_p , ')');
			END IF;
		ELSE
			SET Msg_p = CONCAT('Phase Not Found (', Phase_p , ')');
        END IF;
	ELSE
		SET Msg_p = CONCAT('Fixture Status Not Found (', Status_p , ')');
    END IF;
END $$
DELIMITER ;

