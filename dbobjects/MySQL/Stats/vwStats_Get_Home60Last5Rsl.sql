--
--  Home Wins Matches
--
DROP VIEW IF EXISTS vwStats_Get_Home60Last5Rsl;
CREATE VIEW vwStats_Get_Home60Last5Rsl AS
SELECT
	  SUBSTRING(FT.Last5_H,1,3)	AS H
    , SUBSTRING(FT.Last5_V,1,3)	AS v
    , SUM(CASE WHEN FX.ScoredHome > FX.ScoredVisitor THEN 1 ELSE 0 END) AS '1'
    , SUM(CASE WHEN FX.ScoredHome = FX.ScoredVisitor THEN 1 ELSE 0 END) AS 'X'
    , SUM(CASE WHEN FX.ScoredHome < FX.ScoredVisitor THEN 1 ELSE 0 END) AS '2'
FROM
	vwStats_Get_Home60Wins_t FT
    INNER JOIN tbCore_Fixture FX ON
			FX.FixtureId = FT.FixtureId
        AND FX.FixtureStatusId = 2
WHERE
		FT.Type = 'Bet'
	AND LENGTH(FT.Last5_H) > 6
    AND LENGTH(FT.Last5_V) > 6
GROUP BY
	  SUBSTRING(FT.Last5_H,1,3)
    , SUBSTRING(FT.Last5_V,1,3);

    




    

