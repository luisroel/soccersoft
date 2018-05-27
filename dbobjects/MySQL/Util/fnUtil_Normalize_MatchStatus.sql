DROP FUNCTION IF EXISTS fnUtil_Normalize_MatchStatus;
DELIMITER $$
CREATE FUNCTION fnUtil_Normalize_MatchStatus(Status_p VARCHAR(20)) RETURNS VARCHAR(20)
BEGIN
	DECLARE StatusDesc_v VARCHAR(20);

	IF Status_p = 'Postp' THEN
		SET StatusDesc_v = 'POS';
	ELSEIF Status_p = 'Canc' THEN
		SET StatusDesc_v = 'CAN';
    ELSEIF Status_p = 'Awarded' THEN
		SET StatusDesc_v = 'AWD';
    ELSEIF Status_p = 'Abn' THEN
		SET StatusDesc_v = 'ABN';
    ELSEIF Status_p = 'Fin' OR Status_p = 'AET' OR Status_p = 'Pen' THEN
		SET StatusDesc_v = 'FNL';
	ELSE
		SET StatusDesc_v = 'SCH';
	END IF;

	-- Retornamos en el factorial
	RETURN StatusDesc_v;
END$$
DELIMITER ;

