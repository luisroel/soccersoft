DROP PROCEDURE IF EXISTS spStats_Get_WinAllStrength;
DELIMITER $$
CREATE PROCEDURE spStats_Get_WinAllStrength(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		  AF.TournamentId
		, AF.Tournament
		, AF.Time
		, AF.Home
		, AF.Visitor
		, AF.THAGS_F	AS THAGS
		, AF.TVAGC_F	AS TVAGC
		, AF.TVAGS_F	AS TVAGS
		, AF.THAGC_F	AS THAGC
		, AF.THAS_F		AS THAS
		, AF.TVDS_F		AS TVDS
		, AF.TVAS_F		AS TVAS
		, AF.THDS_F		AS THDS
		, AF.SASH_F		AS SASH
		, AF.SASV_F		AS SASV
		, AF.Rsl
	FROM
		vwStats_Get_Win7Raw AF
	WHERE
			AF.Time BETWEEN From_p AND To_p
	ORDER BY
		  AF.Time
        , AF.Tournament
        , AF.Home;
END$$
DELIMITER ;