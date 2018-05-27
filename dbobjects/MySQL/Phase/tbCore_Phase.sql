DROP TABLE IF EXISTS tbCore_Phase;
CREATE TABLE tbCore_Phase(
	`PhaseId`		BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`		VARCHAR(15) NULL,
	`Name`			VARCHAR(50) NULL,
	`IsActive`		INT NULL,
	`EntryUserId`	BIGINT NULL,
	`EntryDate`		DATETIME NULL,
	`ModUserId`		BIGINT NULL,
	`ModDate`		DATETIME NULL
);

INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP01', 'Group 1',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP02', 'Group 2',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP03', 'Group 3',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP04', 'Group 4',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP05', 'Group 5',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP06', 'Group 6',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP07', 'Group 7',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP08', 'Group 8',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP09', 'Group 9',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP10', 'Group 10',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP11', 'Group 11',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP12', 'Group 12',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP13', 'Group 13',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP14', 'Group 14',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP15', 'Group 15',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP16', 'Group 16',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP17', 'Group 17',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP18', 'Group 18',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP19', 'Group 19',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP20', 'Group 20',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP21', 'Group 21',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP22', 'Group 22',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP23', 'Group 23',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP24', 'Group 24',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP25', 'Group 25',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP26', 'Group 26',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP27', 'Group 27',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP28', 'Group 28',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP29', 'Group 29',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'GRP30', 'Group 30',	1,	1,	NOW(),	1,	NOW());

INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL128_1',	 'Playoff 1/128',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL064_1',	 'Playoff 1/64',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL032_1',	 'Playoff 1/32',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL016_1',	 'Playoff 1/16',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL008_1',	 'Playoff 1/8',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'QTERS_1',	 'Quarter Final',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'SEMIS_1',	 'Semi-Final',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'THIRD_2',	 'Third Place',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'FINAL_1',	 'Finals',	1,	1,	NOW(),	1,	NOW());

INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL128_2',	 'Playoff 1/128',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL064_2',	 'Playoff 1/64',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL032_2',	 'Playoff 1/32',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL016_2',	 'Playoff 1/16',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'PL008_2',	 'Playoff 1/8',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'QTERS_2',	 'Quarter Final',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'SEMIS_2',	 'Semi-Final',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'THIRD_2',	 'Third Place',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'FINAL_2',	 'Finals',	1,	1,	NOW(),	1,	NOW());

INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'RELEG',	 'Relegation',	1,	1,	NOW(),	1,	NOW());
INSERT INTO `tbCore_Phase` (`ShortName`, `Name`, `IsActive`, `EntryUserId`, `EntryDate`, `ModUserId`, `ModDate`) VALUE ( 
'S_FINAL',	 'Super Final',	1,	1,	NOW(),	1,	NOW());
