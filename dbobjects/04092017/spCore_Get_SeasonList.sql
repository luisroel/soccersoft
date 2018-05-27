DROP PROCEDURE IF EXISTS spCore_Get_SeasonList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_SeasonList(
	IN TournamentId_p BIGINT
)
BEGIN
    -- Insert statements for procedure here
	SELECT 
		  SS.SeasonId
		, SS.ShortName
		, SS.Name
		, SS.TournamentId
		, TN.ShortName		AS TournamentName
        , SS.StartDate
        , SS.EndDate
	FROM 
		tbCore_Season SS
		INNER JOIN tbCore_Tournament TN ON
			TN.TournamentId = SS.TournamentId
	WHERE 
		SS.TournamentId = TournamentId_p
	ORDER BY
		SS.ShortName DESC;
END $$
DELIMITER ;

