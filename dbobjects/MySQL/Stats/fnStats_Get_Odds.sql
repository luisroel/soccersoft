DROP FUNCTION IF EXISTS fnStats_Get_Odds;
DELIMITER $$
CREATE FUNCTION fnStats_Get_Odds(
	  FC	VARCHAR(2)
    , Odd_1	DOUBLE
    , Odd_X	DOUBLE
    , Odd_2	DOUBLE
) RETURNS DOUBLE
BEGIN
	DECLARE Value_v DOUBLE;

	SET Value_v = (
		CASE	WHEN FC = 'L' THEN Odd_1
				WHEN FC = 'V' THEN Odd_2 
				ELSE Odd_X
		END);

	-- Return the value
	RETURN Value_v;
END$$
DELIMITER ;

