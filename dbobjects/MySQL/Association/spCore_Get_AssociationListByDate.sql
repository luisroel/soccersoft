DROP PROCEDURE IF EXISTS spCore_Get_AssociationListByDate;
DELIMITER $$
CREATE PROCEDURE spCore_Get_AssociationListByDate(
	  IN From_p	DATETIME
    , IN To_p	DATETIME
)
BEGIN
	SELECT
		*
	FROM (
	SELECT DISTINCT
		  FD.AssociationId
		, FD.Association
	FROM 
		vwCore_Get_FixtureList FD
	WHERE
		FD.Time BETWEEN From_p AND To_p
	UNION ALL
	SELECT
		  0
		, '---'
	) TT
	ORDER BY
		TT.Association;
END $$
DELIMITER ;
