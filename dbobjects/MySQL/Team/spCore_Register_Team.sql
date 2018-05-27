DROP PROCEDURE IF EXISTS spCore_Register_Team;
DELIMITER $$
CREATE PROCEDURE spCore_Register_Team(
	  IN Association_p		VARCHAR(100)
	, IN Tournament_p		VARCHAR(100)
	, IN Season_p			VARCHAR(100)
	, IN Team_p				VARCHAR(100)
	, IN UserId_p			BIGINT
	, OUT Msg_p				VARCHAR(255)
)
BEGIN
	DECLARE Date_v		DATETIME;
	SET Date_v 			= NOW();

	SET Msg_p 			= '';
    SET @AssociationId	= -1;
    SET @TournamentId   = -1;
    SET @SeasonId		= -1;
    SET @TeamId			= -1;
    
	IF EXISTS(SELECT * FROM tbCore_Association AA WHERE TRIM(AA.Name) = Association_p) THEN
		SELECT AA.AssociationId INTO @AssociationId FROM tbCore_Association AA WHERE TRIM(AA.Name) = Association_p;

		IF EXISTS(SELECT * FROM tbCore_Tournament TT WHERE TT.AssociationId = @AssociationId AND TRIM(TT.Name) = Tournament_p) THEN
			SELECT TT.TournamentId INTO @TournamentId FROM tbCore_Tournament TT WHERE TT.AssociationId = @AssociationId AND TRIM(TT.Name) = Tournament_p;
		
			IF EXISTS(SELECT * FROM tbCore_Season SS WHERE SS.TournamentId = @TournamentId AND TRIM(SS.Name) = Season_p) THEN
				SELECT SS.SeasonId INTO @SeasonId FROM tbCore_Season SS WHERE SS.TournamentId = @TournamentId AND TRIM(SS.Name) = Season_p;            
   
				IF EXISTS(SELECT * FROM tbCore_Team SO WHERE SO.Alias01 = Team_p AND SO.AssociationId = @AssociationId) THEN
					SELECT SO.TeamId INTO @TeamId FROM tbCore_Team SO WHERE SO.Alias01 = Team_p AND SO.AssociationId = @AssociationId;
				END IF;
                
				IF @TeamId = -1 THEN
					INSERT tbCore_Team (
						  `ShortName`
						, `Name`
						, `IsActive`
						, `AssociationId`
						, `Alias01`
						, `Alias02`
						, `Alias03`
						, `Alias04`
						, `Alias05`
						, `Alias06`
						, `Alias07`
						, `Alias08`
						, `Alias09`
						, `Alias10`
						, `EntryUserId`
						, `EntryDate`
						, `ModUserId`
						, `ModDate`
					 ) VALUES (
						  Team_p
						, Team_p
						, 1
						, @AssociationId
						, Team_p
						, '', '', '', '', '', '', '', '', ''
						, UserId_p
						, Date_v
						, UserId_p
						, Date_v
					);
					
					SET @TeamId = LAST_INSERT_ID();
				END IF;
        
				IF NOT EXISTS (SELECT * FROM tbCore_SeasonTeam ST WHERE ST.TeamId = @TeamId AND ST.SeasonId = @SeasonId) THEN
					INSERT INTO tbCore_SeasonTeam  (TeamId, SeasonId) VALUES (@TeamId, @SeasonId);
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
END $$
DELIMITER ;