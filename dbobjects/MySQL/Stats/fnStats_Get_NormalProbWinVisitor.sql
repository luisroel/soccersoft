--
-- Normal Prob. Win Visitor
--
DROP FUNCTION IF EXISTS fnStats_Get_NormalProbWinVisitor;
DELIMITER $$
CREATE FUNCTION fnStats_Get_NormalProbWinVisitor(
	  SeasonId_p BIGINT
) RETURNS FLOAT
BEGIN
	DECLARE Prob_v 		FLOAT;

	SElECT
		SUM(NP.Prob)
    INTO
		Prob_v 
	FROM
		`vwStats_Get_NormalProb` NP
	WHERE
			NP.SeasonId = SeasonId_p
        AND NP.Diff < 0;
        
	-- Return the value
	RETURN Prob_v;
END$$
DELIMITER ;

