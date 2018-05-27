DROP PROCEDURE IF EXISTS spStats_Get_VisitAllStats;
DELIMITER $$
CREATE PROCEDURE spStats_Get_VisitAllStats(From_p DATETIME, To_p DATETIME)
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
		, AF.OH_F		AS OH
		, AF.OV_F		AS OV
		, AF.Diff_F		AS Diff
		, AF.Max_OH_F	AS Max_OH
		, AF.Max_OV_F	AS Max_OV
		, AF.SH
		, AF.SV
		, AF.FC
		, AF.Rsl
		, AF.Odd
		, AF.Ok
	FROM
		vwStats_Get_Visit7Raw AF
	WHERE
			AF.Time BETWEEN From_p AND To_p
	ORDER BY
		  AF.Time
        , AF.Tournament
        , AF.Home;
END$$
DELIMITER ;