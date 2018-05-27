DROP FUNCTION IF EXISTS fnStats_Get_NP;
DELIMITER $$
CREATE FUNCTION fnStats_Get_NP(
	  DFS	INT
	, DFA	INT
    , DFH	INT
    , DFV	INT
) RETURNS VARCHAR(6)
BEGIN
	DECLARE Rsl	VARCHAR(6);

	SET Rsl = (
		CASE
			WHEN DFS < 0  AND DFA < 0 AND DFH < 0 AND DFV < 0 THEN 'NNNN'
            WHEN DFS < 0  AND DFA < 0  AND DFH < 0  AND DFV >= 0 THEN 'NNNP'
            WHEN DFS < 0  AND DFA < 0  AND DFH >= 0 AND DFV < 0  THEN 'NNPN'
            WHEN DFS < 0  AND DFA < 0  AND DFH >= 0 AND DFV >= 0 THEN 'NNPP'
            WHEN DFS < 0  AND DFA >= 0 AND DFH < 0  AND DFV < 0  THEN 'NPNN'
            WHEN DFS < 0  AND DFA >= 0 AND DFH < 0  AND DFV >= 0 THEN 'NPNP'
            WHEN DFS < 0  AND DFA >= 0 AND DFH >= 0 AND DFV < 0  THEN 'NPPN'
            WHEN DFS < 0  AND DFA >= 0 AND DFH >= 0 AND DFV >= 0 THEN 'NPPP'
            WHEN DFS >= 0 AND DFA < 0  AND DFH < 0  AND DFV < 0  THEN 'PNNN'
            WHEN DFS >= 0 AND DFA < 0  AND DFH < 0  AND DFV >= 0 THEN 'PNNP'
            WHEN DFS >= 0 AND DFA < 0  AND DFH >= 0 AND DFV < 0  THEN 'PNPN'
            WHEN DFS >= 0 AND DFA < 0  AND DFH >= 0 AND DFV >= 0 THEN 'PNPP'
            WHEN DFS >= 0 AND DFA >= 0 AND DFH < 0  AND DFV < 0  THEN 'PPNN'
            WHEN DFS >= 0 AND DFA >= 0 AND DFH < 0  AND DFV >= 0 THEN 'PPNP'
            WHEN DFS >= 0 AND DFA >= 0 AND DFH >= 0 AND DFV < 0  THEN 'PPPN'
            ELSE 'PPPP'
		END);

	-- Return the value
	RETURN Rsl;
END$$
DELIMITER ;

