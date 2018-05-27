--
--  Average Goals Conceded By Home Teams In A Given Season
--
DROP VIEW IF EXISTS vwStats_Get_CountTeamsBySeason;
CREATE VIEW vwStats_Get_CountTeamsBySeason AS
SELECT
	  OT.SeasonId
	, OT.WeekNo
    , MAX(OT.Position) as 'Teams'
FROM 
	tbStats_OverallTable OT
GROUP BY
	  OT.SeasonId
	, OT.WeekNo;

	