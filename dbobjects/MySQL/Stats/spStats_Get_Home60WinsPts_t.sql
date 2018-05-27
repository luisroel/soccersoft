DROP PROCEDURE IF EXISTS spStats_Get_Home60WinsPts_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_Home60WinsPts_t(
	  From_p	DATETIME
    , To_p		DATETIME
) 
BEGIN
	SELECT
		  TT.Association
		, TT.Tournament	
		, TT.Time
		, TT.Home
		, TT.Visit
		, TT.FixtureId
		, TT.THAGS
		, TT.TVAGC
		, TT.TVAGS
		, TT.THAGC
		, TT.THAS
		, TT.TVDS
		, TT.TVAS
		, TT.THDS
		, TT.OH
		, TT.OV
		, TT.Pb_Home
		, TT.Pb_Draw
		, TT.Pb_Visit
		, TT.Max_POH
		, TT.Max_POV
		, TT.Max_OH
		, TT.Max_OV
		, TT.Diff
		, TT.SH
		, TT.SV
		, TT.SFC
		, TT.Rsl
		, TT.SOdd
	FROM (
		SELECT
			TT.*
		FROM
			vwStats_Get_RawDataPts_tt TT
			INNER JOIN (
				SELECT DISTINCT
					T.FixtureId 
				FROM 
					vwStats_Get_Home60Wins_t T 
				WHERE 
					T.Time BETWEEN From_p AND To_p
			) T ON
			T.FixtureId = TT.FixtureId
		ORDER BY
			  TT.Time DESC
			, TT.Home
		LIMIT 2000
    ) TT
    ORDER BY
		  TT.Time ASC
		, TT.Home ;
END$$
DELIMITER ;