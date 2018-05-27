DROP PROCEDURE IF EXISTS spCore_Get_FixtureListByDate;
DELIMITER $$
CREATE PROCEDURE spCore_Get_FixtureListByDate(
	  IN From_p				DATETIME
    , IN To_p				DATETIME
    , IN AssociationId_p 	BIGINT
    , IN TournamentId_p 	BIGINT
)
BEGIN
	IF AssociationId_p = 0 THEN
		IF TournamentId_p = 0 THEN
			SELECT 
				FL.*
			FROM 
				vwCore_Get_FixtureList FL
			WHERE
				FL.Time BETWEEN From_p AND To_p
			ORDER BY
				  FL.Time
                , FL.Home;
		ELSE
			SELECT 
				FL.*
			FROM 
				vwCore_Get_FixtureList FL
			WHERE
				    FL.Time BETWEEN From_p AND To_p
                AND FL.TournamentId = TournamentId_p
			ORDER BY
				  FL.Time
                , FL.Home;
		END IF;
	ELSEIF TournamentId_p = 0 THEN
		SELECT 
			FL.*
		FROM 
			vwCore_Get_FixtureList FL
		WHERE
			    FL.Time BETWEEN From_p AND To_p
			AND FL.AssociationId = AssociationId_p
		ORDER BY
			  FL.Time
            , FL.Home;
	ELSE

		SELECT 
			FL.*
		FROM 
			vwCore_Get_FixtureList FL
		WHERE
			    FL.Time BETWEEN From_p AND To_p
			AND FL.AssociationId = AssociationId_p
			AND FL.TournamentId = TournamentId_p
		ORDER BY
			  FL.Time
            , FL.Home;
    END IF;
END $$
DELIMITER ;
