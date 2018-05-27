DROP FUNCTION IF EXISTS fnUtil_Get_RslStats_CV;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_RslStats_CV(
		Date_p 		DATETIME
      , Last5_V_p 	VARCHAR(10)
) RETURNS INTEGER
BEGIN
	DECLARE Counter_v INTEGER;
    
    -- Get Max Value
	SELECT
		IFNULL(SUM(CASE	WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0 END),0) AS 'CV'
	INTO
		Counter_V
	FROM 
		tbStats_PoissonAnalysis_t PA
		INNER JOIN tbCore_Fixture FT ON
			FT.FixtureId = PA.FixtureId
	WHERE
		(PA.OH - PA.OV) BETWEEN -0.192 AND 0.938
		AND FT.FixtureStatusId = 2
        AND FT.Last5_V = Last5_V_p
        AND FT.Time < Date_p;

	-- Return the probability value
	RETURN IFNULL(Counter_v,0);
END$$
DELIMITER ;
