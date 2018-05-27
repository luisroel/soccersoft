--
-- Season Avg Goals Scored At Home:
--
DROP FUNCTION IF EXISTS fnStats_Get_FCResult;
DELIMITER $$
CREATE FUNCTION fnStats_Get_FCResult(
	  FC		VARCHAR(1)
    , Rsl		VARCHAR(1)
) RETURNS INT
BEGIN
	DECLARE Value_v INT;

	SET Value_v = (CASE WHEN FC = Rsl THEN 1 ELSE  0 END);

	-- Return the value
	RETURN Value_v;
END$$
DELIMITER ;

