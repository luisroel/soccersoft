--
-- Season Avg Goals Scored At Home:
--
DROP FUNCTION IF EXISTS fnStats_Get_FCResultdDC;
DELIMITER $$
CREATE FUNCTION fnStats_Get_FCResultdDC(
	  FC1		VARCHAR(1)
	, FC2		VARCHAR(1)
    , FC3		VARCHAR(1)
    , Rsl		VARCHAR(1)
) RETURNS INT
BEGIN
	DECLARE Value_v INT;
	DECLARE FC 		VARCHAR(2);

	SET FC = (
		CASE	WHEN FC1 = FC2 THEN FC3
				ELSE FC1
		END);


	SET Value_v = (CASE WHEN Rsl = FC OR Rsl = FC2 THEN 1 ELSE  0 END);

	-- Return the value
	RETURN Value_v;
END$$
DELIMITER ;

