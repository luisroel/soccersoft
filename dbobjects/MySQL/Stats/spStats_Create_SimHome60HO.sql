DROP PROCEDURE IF EXISTS spStats_Create_SimHome60HO;
DELIMITER $$
CREATE PROCEDURE spStats_Create_SimHome60HO( bet_p FLOAT, bankRoll_p FLOAT)
BEGIN
	TRUNCATE TABLE tbStats_Home60HOGroup;
	TRUNCATE TABLE tbStats_Home60HODetail;
	INSERT INTO tbStats_Home60HODetail (
		  `FixtureId`
		, `Time`
		, `SH`
		, `SV`
		, `Rsl`
		, `Odd_1`
		, `Odd_X`
		, `Odd_2`)
	SELECT
		  TT.FixtureId
		, TT.Time
		, TT.SH
		, TT.SV
		, TT.Rsl
		, FT.Odd_1
		, FT.Odd_X
		, FT.Odd_2
	FROM
		vwStats_Get_Home60Wins_t TT
		INNER JOIN tbCore_Fixture FT ON	
			FT.FixtureId = TT.FixtureId
	WHERE
			TT.Type 	= 'Bet'
		AND FT.Odd_1 	>= 2.0
	ORDER BY
		  TT.`Time`
		, TT.Home;

	CALL spStats_Create_Home60HighOdds(bet_p, bankRoll_p);
END$$
DELIMITER ;
