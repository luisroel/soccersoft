DROP FUNCTION IF EXISTS fnStats_Get_OddDC;
DELIMITER $$
CREATE FUNCTION fnStats_Get_OddDC(
	  FC1	VARCHAR(2)
	, FC2	VARCHAR(2)
    , FC3	VARCHAR(2)
    , Rsl	VARCHAR(2)
    , Odd_1	DOUBLE
    , Odd_X	DOUBLE
    , Odd_2	DOUBLE
) RETURNS DOUBLE
BEGIN
	DECLARE Value_v DOUBLE;
	DECLARE FC 		VARCHAR(2);

	SET FC = (
		CASE	WHEN FC1 = FC2 THEN FC3
				ELSE FC1
		END);
        
	
	SET Value_v = (
		CASE	WHEN FC = 'L' THEN 
					CASE	WHEN FC2 = 'D' THEN (Odd_1 * Odd_X / (Odd_1 + Odd_X))
							ELSE (Odd_1 * Odd_2 / (Odd_1 + Odd_2))
					END
				WHEN FC = 'D' THEN
					CASE	WHEN FC2 = 'L' THEN (Odd_1 * Odd_X / (Odd_1 + Odd_X))
							ELSE (Odd_2 * Odd_X / (Odd_2 + Odd_X))
					END
				ELSE
					CASE	WHEN FC2 = 'L' THEN (Odd_1 * Odd_2 / (Odd_1 + Odd_2))
							ELSE (Odd_2 * Odd_X / (Odd_2 + Odd_X))
					END
		END
    );
    
	-- Return the value
	RETURN Value_v;
END$$
DELIMITER ;

