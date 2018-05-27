--
--  Weeks per season
--
DROP VIEW IF EXISTS vwCore_Get_SeasonWeeks;
CREATE VIEW vwCore_Get_SeasonWeeks AS	
SELECT
	  FT.SeasonId
	, FT.WeekNo
	, MIN(FT.Time)	AS `From`
	, MAX(FT.Time)	AS `To`
FROM 
	tbCore_Fixture FT
GROUP BY
	  FT.SeasonId
	, FT.WeekNo
ORDER BY
	  FT.SeasonId
	, FT.WeekNo;