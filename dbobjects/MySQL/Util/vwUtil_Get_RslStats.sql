--
--  Home indicators for a given match
--
DROP VIEW IF EXISTS vwUtil_Get_RslStats;
CREATE VIEW vwUtil_Get_RslStats AS
SELECT
	  FT.Last5_V	
	, IFNULL(SUM(CASE	WHEN FT.ScoredHome > FT.ScoredVisitor THEN 1 ELSE 0 END),0) AS 'CL'
	, IFNULL(SUM(CASE	WHEN FT.ScoredHome = FT.ScoredVisitor THEN 1 ELSE 0	END),0) AS 'CD'
	, IFNULL(SUM(CASE	WHEN FT.ScoredHome < FT.ScoredVisitor THEN 1 ELSE 0	END),0) AS 'CV'
FROM 
	tbStats_PoissonAnalysis_t PA 
	INNER JOIN tbCore_Fixture FT ON
		FT.FixtureId = PA.FixtureId
WHERE
	(PA.OH - PA.OV) BETWEEN -0.192 AND 0.938
	AND FT.FixtureStatusId = 2
GROUP BY
	FT.Last5_V;