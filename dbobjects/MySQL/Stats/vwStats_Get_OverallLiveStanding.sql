--
--  Overall Standing clasification
--
DROP VIEW IF EXISTS vwStats_Get_OverallLiveStanding;
CREATE VIEW vwStats_Get_OverallLiveStanding AS
SELECT
	  SS.SeasonId
	, ID.PhaseId
    , SS.ShortName						AS `Season`
    , ST.TeamId
    , TM.ShortName						AS `Team`

    , SUM(IFNULL(ID.HPl + ID.VPl,0))	AS `Ply`
    , SUM(IFNULL(ID.HWn + ID.VWn,0))	AS `Win`
    , SUM(IFNULL(ID.HDr + ID.VDr,0)) 	AS `Drw`
    , SUM(IFNULL(ID.HLs + ID.VLs,0)) 	AS `Lss`
    , SUM(IFNULL(ID.HGl + ID.VGl,0)) 	AS `Gls`
    , SUM(IFNULL(ID.HAg + ID.VAg,0))	AS `Agn`
    , SUM(IFNULL(ID.HDf + ID.VDf,0)) 	AS `Dif`
    , SUM(IFNULL(ID.HPt + ID.VPt,0))	AS `Pts`

FROM
	tbCore_Season SS
    INNER JOIN  tbCore_SeasonTeam ST  ON
		ST.SeasonId = SS.SeasonId
    INNER JOIN tbCore_Team TM ON
		TM.TeamId = ST.TeamId
	LEFT JOIN vwStats_Get_Indicators ID ON
			ID.SeasonId = ST.SeasonId
        AND ID.TeamId 	= ST.TeamId 
GROUP BY
	  SS.SeasonId
	, ID.PhaseId
    , SS.ShortName
    , ST.TeamId
    , TM.ShortName;