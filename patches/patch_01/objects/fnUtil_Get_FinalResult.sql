DROP FUNCTION IF EXISTS `fnUtil_Get_FinalResult`;
DELIMITER $$
CREATE FUNCTION `fnUtil_Get_FinalResult`(
	  SH		INT
    , SV		INT
    , StatusId	BIGINT
) RETURNS varchar(1) CHARSET latin1
BEGIN
	DECLARE Rsl_v 	VARCHAR(1);

	SET Rsl_v = (
		CASE	WHEN StatusId = 1 THEN '?'
				WHEN StatusId = 5 OR StatusId = 2 THEN
					(CASE 	WHEN SH > SV THEN '1'
							WHEN SH < SV THEN '2'
							ELSE 'X'
					END)
				ELSE  '*'
		END);

	RETURN Rsl_v;
END$$
DELIMITER ;
