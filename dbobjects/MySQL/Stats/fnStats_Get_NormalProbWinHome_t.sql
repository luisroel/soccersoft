--
-- Normal Prob, Win Home (ONLY SELECTED MATCHES)
--
DROP FUNCTION IF EXISTS fnStats_Get_NormalProbWinHome_t;
DELIMITER $$
CREATE FUNCTION fnStats_Get_NormalProbWinHome_t(
	  SeasonId_p BIGINT
) RETURNS FLOAT
BEGIN
	DECLARE Prob_v 		FLOAT;

	SElECT
		SUM(NP.Prob)
    INTO
		Prob_v 
	FROM
		`vwStats_Get_NormalProb_t` NP
	WHERE
			NP.SeasonId = SeasonId_p
        AND NP.Diff > 0;
        
	-- Return the value
	RETURN Prob_v;
END$$
DELIMITER ;

