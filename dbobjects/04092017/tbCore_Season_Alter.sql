ALTER TABLE tbCore_Season ADD `StartDate` DATETIME;
ALTER TABLE tbCore_Season ADD `EndDate` DATETIME;

UPDATE tbCore_Season SS SET
	  `StartDate` = (SELECT CAST(CONCAT(CAST(YEAR(MIN(FT.Time)) AS CHAR),'-', CAST(MONTH(MIN(FT.Time)) AS CHAR),'-',CAST(DAY(MIN(FT.Time)) AS CHAR),' 00:00:00') AS DATETIME) FROM tbCore_Fixture FT WHERE FT.SeasonId = SS.SeasonId)
    , `EndDate` = (SELECT CAST(CONCAT(CAST(YEAR(MAX(FT.Time)) AS CHAR),'-', CAST(MONTH(MAX(FT.Time)) AS CHAR),'-',CAST(DAY(MAX(FT.Time)) AS CHAR),' 23:59:59') AS DATETIME)	FROM tbCore_Fixture FT WHERE FT.SeasonId = SS.SeasonId);

UPDATE tbCore_Season SET
	  `StartDate` = `EndDate`
WHERE
	`StartDate` = null
    AND `EndDate` != null;
    
UPDATE tbCore_Season SET
	  `EndDate` = `StartDate`
WHERE
	`StartDate` != null
    AND `EndDate` = null;
    
UPDATE tbCore_Season SET
	  `StartDate` = NOW()
    , `EndDate`	= NOW()
WHERE
	`StartDate` = null
    AND `EndDate` = null;