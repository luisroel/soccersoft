DROP PROCEDURE IF EXISTS spStats_Get_All7PtsStats;
DELIMITER $$
CREATE PROCEDURE spStats_Get_All7PtsStats(From_p DATETIME, To_p DATETIME)
BEGIN
	SELECT 
		  AF.SeasonId
		, AF.Season
		, AF.FixtureId
		, AF.WeekNo
		, AF.AssociationId
		, AF.Association
		, AF.TournamentId
		, AF.Tournament
		, AF.Time
		, AF.Home
		, AF.Visitor
		, AF.Odd_1
		, AF.Odd_X
		, AF.Odd_2
		, AF.Last5_H
		, AF.Last5_V
		, AF.OH_P		AS OH
		, AF.OV_P		AS OV
		, AF.Diff_P		AS Diff
		, AF.Max_OH_P	AS Max_OH
		, AF.Max_OV_P	AS Max_OV
		, AF.SH
		, AF.SV
		, AF.FC
		, AF.Rsl
		, AF.Odd
		, AF.Ok
	FROM
		vwStats_Get_All7Raw AF
	WHERE
			AF.Time BETWEEN From_p AND To_p
	ORDER BY
		  AF.Time
        , AF.Tournament
        , AF.Home;
END$$
DELIMITER ;