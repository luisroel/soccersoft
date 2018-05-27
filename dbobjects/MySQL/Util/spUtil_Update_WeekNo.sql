DROP PROCEDURE IF EXISTS spUtil_Update_WeekNo;
DELIMITER $$
CREATE PROCEDURE spUtil_Update_WeekNo(
	IN SeasonId_p	BIGINT
)
BEGIN
	DECLARE fromDate_v DATETIME;
    DECLARE toDate_v	DATETIME;
    DECLARE nextDate_v	DATETIME;
    DECLARE maxDate_v	DATETIME;
    DECLARE maxPlayed_v INT;
    DECLARE weekNo_v	INT;
    DECLARE records_v	INT;
    
    SET weekNo_v = 1;
	
	SELECT
		MIN(DATE(FT.Time))
	INTO
		fromDate_v
	FROM
		tbCore_Fixture FT
	WHERE
		FT.SeasonId = SeasonId_p;
	
    SET toDate_v = fromDate_v;
    SET nextDate_v = fromDate_v;

	SELECT
		MAX(DATE_ADD(DATE_ADD(DATE(FT.Time),INTERVAL 23 HOUR),INTERVAL 59 MINUTE))
	INTO
		maxDate_v
	FROM
		tbCore_Fixture FT
	WHERE
		FT.SeasonId = SeasonId_p;            
    
    WHILE maxDate_v > nextDate_v DO
         
		SELECT
			MIN(DATE_ADD(DATE_ADD(DATE(FT.Time),INTERVAL 23 HOUR),INTERVAL 59 MINUTE))
		INTO
			nextDate_v
		FROM
			tbCore_Fixture FT
		WHERE
			    FT.Time 	> toDate_v
			AND FT.SeasonId = SeasonId_p;

		--
        -- Count How Many Games Has A Team Within The Period and Get the Max
		SELECT
			MAX(TT.Played)
		INTO
			maxPlayed_v
		FROM (
			SELECT
				  ST.TeamId
				, WW.Played
			FROM 
				tbCore_SeasonTeam ST
				LEFT JOIN (
					SELECT
						  SS.TeamId
						, SUM(SS.PlayedH + SS.PlayedV) AS Played
					FROM (
						SELECT
							  FT.HomeTeamId AS TeamId
							, COUNT(*) 		AS PlayedH
							, 0 			AS PlayedV
						FROM
							tbCore_Fixture FT
						WHERE
								FT.Time >= fromDate_v 
							AND FT.Time	<  nextDate_v
							AND FT.SeasonId = SeasonId_p
						GROUP BY
							FT.HomeTeamId
						UNION ALL
						SELECT
							  FT.VisitorTeamId
							, 0
							, COUNT(*)
						FROM
							tbCore_Fixture FT
						WHERE
								FT.Time >= fromDate_v 
							AND FT.Time  < nextDate_v
							AND FT.SeasonId = SeasonId_p
						GROUP BY
							FT.VisitorTeamId ) SS
					GROUP BY
						SS.TeamId ) WW ON
				WW.TeamId = ST.TeamId
			WHERE
				ST.SeasonId = SeasonId_p
		) TT;
		
		IF maxPlayed_v > 1 THEN
	
			UPDATE tbCore_Fixture SET
				WeekNo = weekNo_v
			WHERE
					SeasonId = SeasonId_p
				AND `Time` >= fromDate_v 
                AND `Time`  < toDate_v;
				
			SET weekNo_v 	= weekNo_v + 1;
			SET fromDate_v 	= toDate_v;
		END IF;
        
		SET toDate_v = nextDate_v;
	END WHILE;
    
	UPDATE tbCore_Fixture SET
		WeekNo = weekNo_v
	WHERE
			SeasonId = SeasonId_p
		AND `Time` >= fromDate_v 
		AND `Time`  < toDate_v;
END$$
DELIMITER ;
