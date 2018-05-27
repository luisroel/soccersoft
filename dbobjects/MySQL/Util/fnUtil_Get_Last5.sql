DROP FUNCTION IF EXISTS fnUtil_Get_Last5;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_Last5(TeamId_p BIGINT, Date_p DATETIME) RETURNS VARCHAR(15)
BEGIN
	DECLARE result_v VARCHAR(10);
    
	SELECT
		GROUP_CONCAT(T.L5)
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
					WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'G'
                    WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'P'
                    ELSE 'E'
				END)
			END) AS `L5`
		FROM
			tbCore_Fixture FT
		WHERE
			   (FT.HomeTeamId 		= TeamId_p 
			OR FT.VisitorTeamId 	= TeamId_p)
			AND FT.Time 			< Date_p
			AND FT.FixtureStatusId 	= 2
		ORDER BY
			FT.Time DESC
		LIMIT 5
	) T;
    
    SET result_v = REPLACE(result_v,',','');
	RETURN IFNULL(result_v,'');
END$$
DELIMITER ;

