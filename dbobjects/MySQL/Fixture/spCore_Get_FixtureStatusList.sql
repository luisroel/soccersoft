DROP PROCEDURE IF EXISTS spCore_Get_FixtureStatusList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_FixtureStatusList()
BEGIN
	SELECT 
		  CC.FixtureStatusId
		, CC.Name
		, CC.ShortName
	FROM 
		tbCore_FixtureStatus CC
	ORDER BY
		CC.ShortName;
END $$
DELIMITER ;
