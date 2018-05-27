DROP PROCEDURE IF EXISTS spStats_Get_Home7PtsStrength;
DELIMITER $$
CREATE PROCEDURE spStats_Get_Home7PtsStrength(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		  AF.TournamentId
		, AF.Tournament
		, AF.Time
		, AF.Home
		, AF.Visitor
		, AF.THAGS_P	AS THAGS
		, AF.TVAGC_P	AS TVAGC
		, AF.TVAGS_P	AS TVAGS
		, AF.THAGC_P	AS THAGC
		, AF.THAS_P		AS THAS
		, AF.TVDS_P		AS TVDS
		, AF.TVAS_P		AS TVAS
		, AF.THDS_P		AS THDS
		, AF.SASH_P		AS SASH
		, AF.SASV_P		AS SASV
		, AF.Rsl
	FROM
		vwStats_Get_Home7Raw AF
	WHERE
			AF.Time BETWEEN From_p AND To_p
	ORDER BY
		  AF.Time
        , AF.Tournament
        , AF.Home;
END$$
DELIMITER ;