DROP FUNCTION IF EXISTS fnUtil_Get_MaxIdx6;
DELIMITER $$
CREATE FUNCTION fnUtil_Get_MaxIdx6(
	  V0_p FLOAT
	, V1_p FLOAT
    , V2_p FLOAT
    , V3_p FLOAT
    , V4_p FLOAT
    , V5_p FLOAT
    , V6_p FLOAT
) RETURNS INT
BEGIN
	DECLARE Max_v 	FLOAT;
    DECLARE Idx_v 	INT;
    
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
    
    SET Idx_v = -1;
    IF Max_v = V0_P THEN
		SET Idx_v = 0;
    ELSEIF Max_v = V1_P THEN
		SET Idx_v = 1;
	ELSEIF Max_v = V2_P THEN
		SET Idx_v = 2;
	ELSEIF Max_v = V3_P THEN
		SET Idx_v = 3;
	ELSEIF Max_v = V4_P THEN
		SET Idx_v = 4;
	ELSEIF Max_v = V5_P THEN
		SET Idx_v = 5;
	ELSE
		SET Idx_v = 6;
	END IF;

	-- Return the probability value
	RETURN Idx_v;
END$$
DELIMITER ;

