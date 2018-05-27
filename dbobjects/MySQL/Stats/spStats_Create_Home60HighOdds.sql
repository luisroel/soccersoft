DROP PROCEDURE IF EXISTS spStats_Create_Home60HighOdds;
DELIMITER $$
CREATE PROCEDURE spStats_Create_Home60HighOdds( bet_p FLOAT, bankRoll_p FLOAT)
BEGIN
	DECLARE Finished_v	INTEGER DEFAULT 0;
	DECLARE FixtureId_v BIGINT;
    DECLARE pTime_v 	DATETIME;
    DECLARE cTime_v 	DATETIME;
    DECLARE gTime_v 	DATETIME;
    DECLARE start_v 	INT DEFAULT 1;
    DECLARE groupId_v 	INT;
    DECLARE grpId_v 	INT;
    DECLARE count_v 	INT;
    DECLARE profit_v	FLOAT;
    DECLARE lost_v		FLOAT;
    DECLARE pLost_v		FLOAT;
    DECLARE bet_v		FLOAT;
    DECLARE before_v	FLOAT;
    DECLARE after_v		FLOAT;

	-- 1. get tbCore_Fixtures
	DECLARE myCursor CURSOR FOR
	SELECT
		  TT.FixtureId
		, TT.Time
	FROM
		tbStats_Home60HODetail TT
	ORDER BY
		TT.Time;
                
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Finished_v = 1;
	OPEN myCursor;
	SelectionOfFixtures: LOOP
    
		FETCH myCursor INTO FixtureId_v, cTime_v;
		IF Finished_v = 1 THEN
			LEAVE SelectionOfFixtures;
		END IF;

		IF Start_v = 1 THEN
			SET start_v = 0;
            SET gTime_v = cTime_v;
            SET groupId_v = 1;
        END IF;

		IF timediff(cTime_v, gTime_v) >= '02:00:00' THEN
			SET gTime_v 	= cTime_v;
            SET groupId_v 	= groupId_v + 1;
		END IF;

        UPDATE tbStats_Home60HODetail SET
			  `GrpTime` = gTime_v
			, `GrpId`	= groupId_v
		WHERE
			FiXtureId = FixtureId_v;
            
		IF (SELECT 1 = 1 FROM tbStats_Home60HOGroup WHERE GrpId = groupId_v) THEN
			UPDATE tbStats_Home60HOGroup SET
				  `Lost`	 = 0.0
                , `Before`	 = 0.0
                , `After`	 = 0.0
			WHERE
				GrpId = groupId_v;
        ELSE
			INSERT INTO tbStats_Home60HOGroup (`GrpId`, `Lost`, `Before`, `After`) VALUES (groupId_v, 0.0, 0.0, 0.0);
		END IF;
        
	END LOOP SelectionOfFixtures;
	CLOSE myCursor;
    
	SET grpId_v 	= 1;
    SET profit_v 	= 0;
    SET lost_v 		= 0;
    SET before_v	= bankRoll_p;
    SET after_v		= bankRoll_p;
    label_Grp: WHILE grpId_v <= groupId_v DO
    
		IF grpId_v = 1 THEN
			SET pLost_v = lost_v;
		ELSE
			SELECT
				HG.Lost
			INTO
				pLost_v
			FROM
				tbStats_Home60HOGroup HG
			WHERE
				HG.GrpId = (grpId_v - 1);
        END IF;
        
		SELECT
			COUNT(*)
		INTO
			count_v
        FROM
			tbStats_Home60HODetail OD
		WHERE
			OD.GrpId = grpId_v;
                
        UPDATE tbStats_Home60HODetail SET
              `PBet`	= bet_p / (Odd_1 - 1.0)
			, `Rbet`	= (pLost_v / count_v) / ( Odd_1  - 1.0 )
            , `Bet`		= (bet_p / (Odd_1 - 1.0)) + ((pLost_v / count_v) / ( Odd_1  - 1.0 ))
            , `Profit`	= (CASE WHEN Rsl = 'L' THEN 
									((bet_p / (Odd_1 - 1.0)) + ((plost_v / count_v) / ( Odd_1  - 1.0 )))  * Odd_1
								ELSE 0 END)
            , `Lost`    = (CASE WHEN Rsl <> 'L' THEN 
									bet_p + (bet_p / (Odd_1 - 1.0)) + ((pLost_v / count_v) / ( Odd_1  - 1.0 ))
								ELSE 
									-1 * (pLost_v / count_v) / ( Odd_1  - 1.0 )
                                END)
		WHERE
			GrpId = grpId_v;

		SELECT
			SUM(HD.Bet)
		INTO
			bet_v
		FROM
			tbStats_Home60HODetail HD
		WHERE
			HD.GrpId = grpId_v;

		SELECT
			SUM(HD.Lost)
		INTO
			lost_v
		FROM
			tbStats_Home60HODetail HD
		WHERE
			HD.GrpId = grpId_v;

		SELECT
			SUM(HD.Profit)
		INTO
			profit_v
		FROM
			tbStats_Home60HODetail HD
		WHERE
			HD.GrpId = grpId_v;
            
		SET before_v 	= after_v - bet_v;
        SET after_v		=  before_v + profit_v;

		UPDATE tbStats_Home60HOGroup SET
			  `Lost`	= lost_v
			, `Before`	= before_v
            , `After`	= after_v
		WHERE
			GrpId = grpId_v;

		SET grpId_v = grpId_v + 1;
    END WHILE label_Grp;
END$$
DELIMITER ;
