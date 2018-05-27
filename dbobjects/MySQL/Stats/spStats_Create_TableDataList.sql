DROP PROCEDURE IF EXISTS `spStats_Create_TableDataList`;
DELIMITER $$
CREATE PROCEDURE `spStats_Create_TableDataList`(
      IN From_p DATETIME
    , IN To_p	DATETIME
)
BEGIN
	DELETE FROM tbStats_TableDataList WHERE `DT` >= From_p AND `DT` <= To_p;
    INSERT INTO	tbStats_TableDataList
	SELECT
		  AA.AssociationId
		, AA.ShortName												AS `CT`
		, TT.TournamentId
		, TT.ShortName												AS `LG`
		, SS.SeasonId
		, SS.ShortName												AS `SS`
		, PH.PhaseId
		, PH.ShortName												AS `PH`
		, FT.Time													AS `DT`
		, FT.HomeTeamId
		, TH.ShortName												AS `HM`
		, FT.VisitorTeamId	
		, TV.ShortName												AS `VS`
		, FT.ScoredHome												AS `SH`
		, FT.ScoredVisitor											AS `SV`
		, (CASE WHEN FT.FixtureStatusId <> 2 THEN '?'
				WHEN FT.ScoredHome > FT.ScoredVisitor THEN '1'
				WHEN FT.ScoredHome < FT.ScoredVisitor THEN '2'
				ELSE 'X'
		END)														AS `RSL`
		, FT.Odd_1													AS `O1`
		, FT.Odd_X													AS `OX`
		, FT.Odd_2													AS `O2`
		, (1.0/(CASE WHEN FT.Odd_1 = 0 THEN 1 ELSE FT.Odd_1 END)
		 + 1.0/(CASE WHEN FT.Odd_X = 0 THEN 1 ELSE FT.Odd_X END)
         + 1.0/(CASE WHEN FT.Odd_2 = 0 THEN 1 ELSE FT.Odd_2 END))	AS `VAL`


		, IFNULL(SH.HGl,0)											AS `GSH`
		, IFNULL(SH.HAg,0)											AS `GAH`
		, IFNULL(SH.Pts,0)											AS `PTH`
		, fnUtil_Get_Last2ONormal(FT.HomeTeamId, FT.Time)			AS `LH`

		, IFNULL(SV.VGl,0)											AS `GSV`
		, IFNULL(SV.VAg,0)											AS `GAV`
		, IFNULL(SV.Pts,0)											AS `PTV`
		, fnUtil_Get_Last2ONormal(FT.VisitorTeamId, FT.Time)		AS `LV`
		, ((IFNULL(SH.Gls,0) / (CASE	WHEN IFNULL(SH.Gls,0) + IFNULL(SV.Gls,0) = 0 THEN 1 
										ELSE IFNULL(SH.Gls,0) + IFNULL(SV.Gls,0)
								END))
		  - (IFNULL(SH.Agn,0) / (CASE 	WHEN IFNULL(SH.Agn,0) + IFNULL(SV.Agn,0) = 0 THEN 1 
										ELSE IFNULL(SH.Agn,0) + IFNULL(SV.Agn,0) 
								END))
		) * 100.0 													AS `DPT`
		, ((IFNULL(SH.Gls,0) / (CASE WHEN IFNULL(SH.Agn,0) = 0 THEN 1 ELSE IFNULL(SH.Agn,0) END))
		 - (IFNULL(SV.Gls,0) / (CASE WHEN IFNULL(SV.Agn,0) = 0 THEN 1 ELSE IFNULL(SV.Agn,0) END))
		 ) 															AS `DFT`
		, (IFNULL(SH.Gls,0) - IFNULL(SV.Gls,0))						AS `DFS`
		, (IFNULL(SH.Agn,0) - IFNULL(SV.Agn,0)) 					AS `DFA`


		, (IFNULL(SH.HGl,0) - IFNULL(SH.HAg,0))						AS `DFH`
		, (IFNULL(SV.VGl,0) - IFNULL(SV.VAg,0))						AS `DFV`
		, (IFNULL(SH.Gls,0) / (CASE WHEN IFNULL(SV.Gls,0) = 0 THEN 1 
									ELSE IFNULL(SV.Gls,0) 
								END))								AS `DGS`
		, (IFNULL(SH.Agn,0) / (CASE WHEN IFNULL(SV.Agn,0) = 0 THEN 1
									ELSE IFNULL(SV.Agn,0)
								END))								AS `DGA`
		, (IFNULL(SH.Pts,0) / (CASE 
									WHEN (IFNULL(SH.Gls,0) / (CASE WHEN IFNULL(SH.Agn,0) = 0 THEN 1 ELSE IFNULL(SH.Agn,0) END)) = 0 THEN 1
									ELSE (IFNULL(SH.Gls,0) / (CASE WHEN IFNULL(SH.Agn,0) = 0 THEN 1 ELSE IFNULL(SH.Agn,0) END))
								END))
		/ (CASE WHEN (IFNULL(SV.Pts,0) / (CASE
									WHEN (IFNULL(SV.Gls,0) / (CASE WHEN IFNULL(SV.Agn,0) = 0 THEN 1 ELSE IFNULL(SV.Agn,0) END)) = 0 THEN 1
									ELSE (IFNULL(SV.Gls,0) / (CASE WHEN IFNULL(SV.Agn,0) = 0 THEN 1 ELSE IFNULL(SV.Agn,0) END))
								END)) = 0 THEN 1
				ELSE (IFNULL(SV.Pts,0) / (CASE
									WHEN (IFNULL(SV.Gls,0) / (CASE WHEN IFNULL(SV.Agn,0) = 0 THEN 1 ELSE IFNULL(SV.Agn,0) END)) = 0 THEN 1
									ELSE (IFNULL(SV.Gls,0) / (CASE WHEN IFNULL(SV.Agn,0) = 0 THEN 1 ELSE IFNULL(SV.Agn,0) END))
								END))
			END)													AS `GPR`
		, ((IFNULL(SH.Win,0) + IFNULL(SV.Lst,0)) / ( CASE
														WHEN IFNULL(SH.Ply,0) + IFNULL(SV.Ply,0) = 0 THEN 1
														ELSE IFNULL(SH.Ply,0) + IFNULL(SV.Ply,0)
													END)) 			AS `PWI`
		, ((IFNULL(SH.Drw,0) + IFNULL(SV.Drw,0)) / ( CASE
														WHEN IFNULL(SH.Ply,0) + IFNULL(SV.Ply,0) = 0 THEN 1
														ELSE IFNULL(SH.Ply,0) + IFNULL(SV.Ply,0)
													END)) 			AS `PDR`
		, ((IFNULL(SH.Lst,0) + IFNULL(SV.Win,0)) / ( CASE
														WHEN IFNULL(SH.Ply,0) + IFNULL(SV.Ply,0) = 0 THEN 1
														ELSE IFNULL(SH.Ply,0) + IFNULL(SV.Ply,0)
													END)) 			AS `PLT`
		, FT.Tendency												AS `TD`
		, FT.aOdd_1 - FT.Odd_1 										AS `DO1`
		, FT.aOdd_X - FT.Odd_X										AS `DOX`
		, FT.aOdd_2 - FT.Odd_2										AS `DO2`
		, fnStats_Get_NP(
              (IFNULL(SH.Gls,0) - IFNULL(SV.Gls,0))	
			, (IFNULL(SH.Agn,0) - IFNULL(SV.Agn,0))
            , (IFNULL(SH.HGl,0) - IFNULL(SH.HAg,0))
            , (IFNULL(SV.VGl,0) - IFNULL(SV.VAg,0))
            ) 														AS `Mask`
    FROM 
		tbCore_Fixture FT
		INNER JOIN tbCore_Team TH ON
			TH.TeamId = FT.HomeTeamId
		INNER JOIN tbCore_Team TV ON
			TV.TeamId = FT.VisitorTeamId
		INNER JOIN tbCore_FixtureStatus FS ON
			FS.FixtureStatusId = FT.FixtureStatusId
		INNER JOIN tbCore_Season SS ON
			SS.SeasonId = FT.SeasonId
		INNER JOIN tbCore_Phase PH ON
			PH.PhaseId = FT.PhaseId
		INNER JOIN tbCore_Tournament TT ON
			TT.TournamentId = SS.TournamentId
		INNER JOIN tbCore_Association AA ON
			AA.AssociationId = TT.AssociationId
		LEFT JOIN (
			SELECT
				  ID.SeasonId
				, ID.PhaseId
				, ID.TeamId
				, SUM(IFNULL(ID.HPl + ID.VPl,0)) 	AS `Ply`
				, SUM(IFNULL(ID.HWn + ID.VWn,0)) 	AS `Win`
				, SUM(IFNULL(ID.HDr + ID.VDr,0)) 	AS `Drw`
				, SUM(IFNULL(ID.HLs + ID.VLs,0)) 	AS `Lst`
				, SUM(IFNULL(ID.HGl + ID.VGl,0)) 	AS `Gls`
				, SUM(IFNULL(ID.HAg + ID.VAg,0))	AS `Agn`
				, SUM(IFNULL(ID.HPt + ID.VPt,0))	AS `Pts`
				, SUM(IFNULL(ID.HGl,0)) 			AS `HGl`
				, SUM(IFNULL(ID.HAg,0))				AS `HAg`
			FROM
				vwStats_Get_Indicators ID
			WHERE
					ID.Time < From_p
			GROUP BY
				  ID.SeasonId
				, ID.PhaseId
				, ID.TeamId
			HAVING
				ID.SeasonId IN (
					SELECT DISTINCT FT.SeasonId FROM tbCore_Fixture FT WHERE FT.Time BETWEEN From_p and To_p
				)
		) SH ON
				SH.SeasonId	= FT.SeasonId
			AND SH.PhaseId	= FT.PhaseId
			AND SH.TeamId	= FT.HomeTeamId
		LEFT JOIN (
			SELECT
				  ID.SeasonId
				, ID.PhaseId
				, ID.TeamId
				, SUM(IFNULL(ID.HPl + ID.VPl,0)) 	AS `Ply`
				, SUM(IFNULL(ID.HWn + ID.VWn,0)) 	AS `Win`
				, SUM(IFNULL(ID.HDr + ID.VDr,0)) 	AS `Drw`
				, SUM(IFNULL(ID.HLs + ID.VLs,0)) 	AS `Lst`
				, SUM(IFNULL(ID.HGl + ID.VGl,0)) 	AS `Gls`
				, SUM(IFNULL(ID.HAg + ID.VAg,0))	AS `Agn`
				, SUM(IFNULL(ID.HPt + ID.VPt,0))	AS `Pts`
				, SUM(IFNULL(ID.VGl,0)) 			AS `VGl`
				, SUM(IFNULL(ID.VAg,0))				AS `VAg`
			FROM
				vwStats_Get_Indicators ID
			WHERE
					ID.Time < From_p
			GROUP BY
				  ID.SeasonId
				, ID.PhaseId
				, ID.TeamId
			HAVING
				ID.SeasonId IN (
					SELECT DISTINCT FT.SeasonId FROM tbCore_Fixture FT WHERE FT.Time BETWEEN From_p and To_p
				)
		) SV ON
				SV.SeasonId	= FT.SeasonId
			AND SV.PhaseId	= FT.PhaseId
			AND SV.TeamId	= FT.VisitorTeamId
	WHERE
		FT.Time >= From_p AND FT.Time <= To_p;
END$$
DELIMITER ;
