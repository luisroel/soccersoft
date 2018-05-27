DROP PROCEDURE IF EXISTS spStats_Get_HomeAndDrawWins_t;
DELIMITER $$
CREATE PROCEDURE spStats_Get_HomeAndDrawWins_t(
	  From_p	DATETIME
    , To_p		DATETIME
) 
BEGIN
	SELECT
		  TT.*
		, TT.DFC		AS `FC`
        , TT.DOdd 		AS `Odd`
        , CASE WHEN INSTR(TT.DFC,TT.Rsl) > 0 THEN 1 ELSE 0 END AS `Ok`
	FROM (
		SELECT
			  RD.Time	AS	`Date`
			, 'Bet'		AS	`Type`
			, RD.*
		FROM
			vwStats_Get_RawData_tt RD
		UNION ALL
		SELECT
			  DATE_ADD(RD.Time, INTERVAL 150 MINUTE) 						AS `Date`
			, CASE WHEN INSTR(RD.DFC,RD.Rsl) > 0 THEN 'Pay' ELSE 'Ded' END	AS `Type`
			, RD.*
		FROM
			vwStats_Get_RawData_tt RD
	) TT
    WHERE
			TT.Time BETWEEN From_p AND To_p
		AND	TT.SFC 		= 'L'
		AND TT.TVAGC	<= 2.0
		AND TT.TVAS		<  1.5
        AND (TT.SOdd	> 1.5 OR TT.SOdd = 1.0)
        AND TT.Pb_Home	> 0.65
        AND TT.Max_OV 	= 0
        AND TT.Pb_Draw	< 0.1
	ORDER BY
		  TT.Date ASC
		, TT.Type
		, TT.Home;
END$$
DELIMITER ;