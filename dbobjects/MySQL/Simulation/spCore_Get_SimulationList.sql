DROP PROCEDURE IF EXISTS spCore_Get_SimulationList;
DELIMITER $$
CREATE PROCEDURE spCore_Get_SimulationList()
BEGIN
	SELECT 
		  SS.SimId
		, SS.Description
	FROM 
		tbCore_Simulation SS
	ORDER BY
		SS.SimId;
END $$
DELIMITER ;