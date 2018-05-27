DROP FUNCTION IF EXISTS fnUtil_Get_Max6;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_Max6(
	  V0_p FLOAT
    , V1_p FLOAT
    , V2_p FLOAT
    , V3_p FLOAT
    , V4_p FLOAT
    , V5_p FLOAT
    , V6_p FLOAT
) RETURNS FLOAT
BEGIN
	DECLARE Max_v FLOAT;
    
    -- Get Max Value
    SELECT
		MAX(VL.Value)
	INTO
		Max_v
	FROM (
		SELECT V0_P AS `Value`
		UNION
		SELECT V1_P
		UNION
		SELECT V2_P
		UNION
		SELECT V3_P
		UNION
		SELECT V4_P
		UNION
		SELECT V5_P
		UNION
		SELECT V6_P
    ) VL;
    
	-- Return the probability value
	RETURN Max_v;
END$$
DELIMITER ;
