DROP PROCEDURE IF EXISTS spStats_Get_Win7PtsProb;
DELIMITER $$
CREATE PROCEDURE spStats_Get_Win7PtsProb(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		  HR.TournamentId
		, HR.Tournament
		, HR.Time
		, HR.Home
		, HR.Visitor
		, HR.Pb_Home_P	AS Pb_Home
		, HR.Pb_Draw_P	AS Pb_Draw
		, HR.Pb_Visit_P	AS Pb_Visit
		, HR.Max_POH_P	AS Max_POH
		, HR.Max_POV_P	AS Max_POV
		, HR.POH_0_P + HR.POH_1_P + HR.POH_2_P + HR.POH_3_P + HR.POH_4_P + HR.POH_5_P + HR.POH_6_P AS 'POH_0'
		, HR.POH_1_P + HR.POH_2_P + HR.POH_3_P + HR.POH_4_P + HR.POH_5_P + HR.POH_6_P AS 'POH_1'
		, HR.POH_2_P + HR.POH_3_P + HR.POH_4_P + HR.POH_5_P + HR.POH_6_P AS 'POH_2'
		, HR.POH_3_P + HR.POH_4_P + HR.POH_5_P + HR.POH_6_P AS 'POH_3'
		, HR.POH_4_P + HR.POH_5_P + HR.POH_6_P AS 'POH_4'
		, HR.POH_5_P + HR.POH_6_P AS 'POH_5'
		, HR.POH_6_P	AS POH_6
		, HR.POV_0_P + HR.POV_1_P + HR.POV_2_P + HR.POV_3_P + HR.POV_4_P + HR.POV_5_P + HR.POV_6_P AS 'POV_0'
		, HR.POV_1_P + HR.POV_2_P + HR.POV_3_P + HR.POV_4_P + HR.POV_5_P + HR.POV_6_P AS 'POV_1'
		, HR.POV_2_P + HR.POV_3_P + HR.POV_4_P + HR.POV_5_P + HR.POV_6_P AS 'POV_2'
		, HR.POV_3_P + HR.POV_4_P + HR.POV_5_P + HR.POV_6_P AS 'POV_3'
		, HR.POV_4_P + HR.POV_5_P + HR.POV_6_P AS 'POV_4'
		, HR.POV_5_P + HR.POV_6_P AS 'POV_5'
		, HR.POV_6_P	AS POV_6
		, HR.Rsl
	FROM
		vwStats_Get_Win7Raw HR
	WHERE
			HR.Time BETWEEN From_p AND To_p
	ORDER BY
		  HR.Time
        , HR.Tournament
        , HR.Home;
END$$
DELIMITER ;