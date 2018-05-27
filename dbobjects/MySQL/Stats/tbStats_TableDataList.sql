DROP TABLE IF EXISTS tbStats_TableDataList;
CREATE TABLE tbStats_TableDataList(
		  AssociationId BIGINT NULL
		, `CT` 			VARCHAR(100) NULL
		, TournamentId 	BIGINT NULL
		, `LG` 			VARCHAR(100) NULL
		, SeasonId 		BIGINT NULL
		, `SS` 			VARCHAR(50) NULL
		, PhaseId 		BIGINT NULL
		, `PH` 			VARCHAR(50) NULL
		, `DT` 			DATETIME NULL
		, HomeTeamId 	BIGINT NULL
		, `HM`			VARCHAR(100) NULL
		, VisitorTeamId	BIGINT NULL
		, `VS`			VARCHAR(100) NULL
		, `SH`			INT NULL
		, `SV` 			INT NULL
		, `RSL` 		VARCHAR(4) NULL
		, `O1` 			DOUBLE NULL
		, `OX` 			DOUBLE NULL
		, `O2` 			DOUBLE NULL
		, `VAL` 		DOUBLE NULL
		, `GSH` 		INT NULL
		, `GAH` 		INT NULL
		, `PTH` 		INT NULL
		, `LH` 			VARCHAR(4) NULL
		, `GSV` 		INT NULL
		, `GAV` 		INT NULL
		, `PTV` 		INT NULL
		, `LV`  		VARCHAR(4) NULL
		, `DPT` 		DOUBLE NULL
		, `DFT` 		DOUBLE NULL
		, `DFS` 		INT NULL
		, `DFA` 		INT NULL
		, `DFH` 		INT NULL
		, `DFV` 		INT NULL
		, `DGS`			DOUBLE NULL
		, `DGA`			DOUBLE NULL
		, `GPR` 		DOUBLE NULL
		, `PWI` 		DOUBLE NULL
		, `PDR` 		DOUBLE NULL
		, `PLT` 		DOUBLE NULL
		, `TD`  		VARCHAR(4) NULL
		, `DO1` 		DOUBLE NULL
		, `DOX` 		DOUBLE NULL
		, `DO2` 		DOUBLE NULL
        , `Mask`		VARCHAR(6) NULL
);