DROP FUNCTION IF EXISTS `fnUtil_Get_Last10HNormal`;
DELIMITER $$
CREATE FUNCTION `fnUtil_Get_Last10HNormal`(TeamId_p BIGINT, Date_p DATETIME, SeasonId_p BIGINT) 
RETURNS varchar(15) CHARSET latin1
BEGIN
	DECLARE result_v VARCHAR(15);
	SELECT
		REPLACE(GROUP_CONCAT(T.L5),',','')
	INTO
		result_v
	FROM (
		SELECT
			(CASE
				WHEN FT.ScoredHome > FT.ScoredVisitor THEN 'W' 
				WHEN FT.ScoredHome < FT.ScoredVisitor THEN 'L' 
				ELSE 'D'
			END) AS `L5`
		FROM
			tbCore_Fixture FT
		WHERE
				FT.SeasonId 		= SeasonId_p
			AND FT.Time 			< Date_p
			AND FT.HomeTeamId 		= TeamId_p
			AND FT.FixtureStatusId 	= 2
		ORDER BY
			FT.Time DESC
		LIMIT 10
	) T;
	RETURN IFNULL(result_v,'');
END$$
DELIMITER ;
