DROP TABLE IF EXISTS tbStats_Home60HODetail;
CREATE TABLE tbStats_Home60HODetail(
	  `FixtureId`	BIGINT NULL
	, `Time`		DATETIME
	, `SH`			INT NULL
    , `SV`			INT NULL
	, `Rsl`			VARCHAR(1) NULL
    , `Odd_1`		FLOAT NULL
	, `Odd_X`		FLOAT NULL
	, `Odd_2`		FLOAT NULL
    , `GrpTime`		DATETIME NULL
    , `GrpId`		INT NULL
    , `PBet`		FLOAT NULL
    , `RBet`		FLOAT NULL
    , `Bet`			FLOAT NULL
    , `Profit`		FLOAT NULL
    , `Lost`		FLOAT NULL
);
