DROP FUNCTION IF EXISTS fnUtil_Get_PoissonProb;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_PoissonProb(X_p INT, Mean_p FLOAT) RETURNS FLOAT
BEGIN
	DECLARE Prob_v 		FLOAT;
    DECLARE MinusMean_v	FLOAT;
    
    -- Get negative value of Mean 
    SET MinusMean_v = Mean_p * -1.0;
	
	-- Use of Poisson formula
	SET Prob_v = EXP(MinusMean_v)*POWER(Mean_p,X_p) / fnUtil_Get_Factorial(X_p);
		
	-- Return the probability value
	RETURN Prob_v;
END$$
DELIMITER ;

