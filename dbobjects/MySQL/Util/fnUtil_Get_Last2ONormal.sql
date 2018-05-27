DROP FUNCTION IF EXISTS fnUtil_Get_Last2ONormal;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_Last2ONormal(TeamId_p BIGINT, Date_p DATETIME) RETURNS VARCHAR(15)
BEGIN
	DECLARE result_v VARCHAR(10);
    
	SELECT
		GROUP_CONCAT(T.L2)
	INTO
		result_v
	FROM (
		SELECT
			(CASE 
				WHEN FT.HomeTeamId = TeamId_p THEN
					(CASE
						WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'W' 
						WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'L' 
						ELSE 'D'
					END)
				ELSE
					(CASE
						WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'L' 
						WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'W' 
						ELSE 'D'
					END)                
            END) AS `L2`
		FROM
			tbCore_Fixture FT
		WHERE
				FT.FixtureStatusId	= 2
			AND FT.Time 			< Date_p
			AND (FT.HomeTeamId 		= TeamId_p 
			OR FT.VisitorTeamId 	= TeamId_p)
		ORDER BY
			FT.Time DESC
		LIMIT 2
	) T;
    
    SET result_v = REPLACE(result_v,',','');
	RETURN IFNULL(result_v,'XX');
END$$
DELIMITER ;
