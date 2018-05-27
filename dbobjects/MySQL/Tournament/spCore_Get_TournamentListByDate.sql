DROP PROCEDURE IF EXISTS spCore_Get_TournamentListByDate;
DELIMITER $$
CREATE PROCEDURE spCore_Get_TournamentListByDate(
	  IN From_p				DATETIME
    , IN To_p				DATETIME
    , IN AssociationId_p 	BIGINT
)
BEGIN
	IF AssociationId_p = 0 THEN
		SELECT
			*
		FROM (
        SELECT DISTINCT
			  FD.TournamentId
			, FD.Tournament
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
			TT.Tournament;
	ELSE
		SELECT
			*
		FROM (
        SELECT DISTINCT
			  FD.TournamentId
			, FD.Tournament
		FROM 
			vwCore_Get_FixtureList FD
		WHERE
			    FD.Time BETWEEN From_p AND To_p
			AND FD.AssociationId = AssociationId_p
		UNION ALL
        SELECT
			  0
            , '---'
		) TT
		ORDER BY
			TT.Tournament;
    END IF;
END $$
DELIMITER ;
