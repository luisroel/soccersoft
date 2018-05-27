DROP PROCEDURE IF EXISTS spStats_Get_AllAllProb;
DELIMITER $$
CREATE PROCEDURE spStats_Get_AllAllProb(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		  HR.TournamentId
		, HR.Tournament
		, HR.Time
		, HR.Home
		, HR.Visitor
		, HR.Pb_Home_F	AS Pb_Home
		, HR.Pb_Draw_F	AS Pb_Draw
		, HR.Pb_Visit_F	AS Pb_Visit
		, HR.Max_POH_F	AS Max_POH
		, HR.Max_POV_F	AS Max_POV
		, HR.POH_0_F + HR.POH_1_F + HR.POH_2_F + HR.POH_3_F + HR.POH_4_F + HR.POH_5_F + HR.POH_6_F AS 'POH_0'
		, HR.POH_1_F + HR.POH_2_F + HR.POH_3_F + HR.POH_4_F + HR.POH_5_F + HR.POH_6_F AS 'POH_1'
		, HR.POH_2_F + HR.POH_3_F + HR.POH_4_F + HR.POH_5_F + HR.POH_6_F AS 'POH_2'
		, HR.POH_3_F + HR.POH_4_F + HR.POH_5_F + HR.POH_6_F AS 'POH_3'
		, HR.POH_4_F + HR.POH_5_F + HR.POH_6_F AS 'POH_4'
		, HR.POH_5_F + HR.POH_6_F AS 'POH_5'
		, HR.POH_6_F	AS POH_6
		, HR.POV_0_F + HR.POV_1_F + HR.POV_2_F + HR.POV_3_F + HR.POV_4_F + HR.POV_5_F + HR.POV_6_F AS 'POV_0'
		, HR.POV_1_F + HR.POV_2_F + HR.POV_3_F + HR.POV_4_F + HR.POV_5_F + HR.POV_6_F AS 'POV_1'
		, HR.POV_2_F + HR.POV_3_F + HR.POV_4_F + HR.POV_5_F + HR.POV_6_F AS 'POV_2'
		, HR.POV_3_F + HR.POV_4_F + HR.POV_5_F + HR.POV_6_F AS 'POV_3'
		, HR.POV_4_F + HR.POV_5_F + HR.POV_6_F AS 'POV_4'
		, HR.POV_5_F + HR.POV_6_F AS 'POV_5'
		, HR.POV_6_F	AS POV_6
		, HR.Rsl
	FROM
		vwStats_Get_All7Raw HR
	WHERE
			HR.Time BETWEEN From_p AND To_p
	ORDER BY
		  HR.Time
        , HR.Tournament
        , HR.Home;
END$$
DELIMITER ;