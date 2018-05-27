DROP TABLE IF EXISTS tbCore_SeasonPhase;
CREATE TABLE tbCore_SeasonPhase (
	  `SeasonId` 	BIGINT
    , `PhaseId` 	BIGINT
    , `Name` 		VARCHAR(100)
    , `EntryUserId`	BIGINT
    , `EntryDate`	DATETIME
    , `ModUserId`	BIGINT
    , `ModDate`		DATETIME
);

INSERT INTO tbCore_SeasonPhase
SELECT
	  SS.SeasonId
    , TP.PhaseId
    , TT.Name
    , 1
    , NOW()
    , 1
    , NOW()
FROM
	tbCore_Season SS
    INNER JOIN tbCore_SeasonTypePhase TP ON
		TP.SeasonTypeId = SS.SeasonTypeId
	INNER JOIN tbCore_Tournament TT ON
		TT.TournamentId = SS.TournamentId;
        
ALTER TABLE tbCore_Season DROP COLUMN SeasonTypeId;
DROP PROCEDURE IF EXISTS spCore_Get_SeasonTypeList;
DROP PROCEDURE IF EXISTS spCore_Insert_SeasonType;
DROP PROCEDURE IF EXISTS spCore_Update_SeasonType;
DROP PROCEDURE IF EXISTS spCore_Delete_SeasonType;
DROP PROCEDURE IF EXISTS spCore_Add_SeasonPhase;
DROP PROCEDURE IF EXISTS spCore_Remove_SeasonPhase;
DROP PROCEDURE IF EXISTS spCore_Get_AvailablePhases;
DROP PROCEDURE IF EXISTS spCore_Get_RegisteredPhases;
DROP TABLE IF EXISTS tbCore_SeasonType;
