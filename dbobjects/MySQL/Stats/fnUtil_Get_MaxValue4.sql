--
-- Season Avg Goals Scored At Home:
--
DROP FUNCTION IF EXISTS fnUtil_Get_MaxValue4;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_MaxValue4(
	  Value1_p	FLOAT
    , Value2_p	FLOAT
    , Value3_p	FLOAT
    , Value4_p	FLOAT
) RETURNS FLOAT
BEGIN
	DECLARE MaxValue_v FLOAT;
    
	SET MaxValue_v = Value1_p;
	IF Value2_p > MaxValue_v THEN
		SET MaxValue_v = Value2_p;
	END IF;
    
	IF Value3_p > MaxValue_v THEN
		SET MaxValue_v = Value3_p;
	END IF;

	IF Value4_p > MaxValue_v THEN
		SET MaxValue_v = Value4_p;
	END IF;

	-- Return the value
	RETURN MaxValue_v;
END$$
DELIMITER ;

