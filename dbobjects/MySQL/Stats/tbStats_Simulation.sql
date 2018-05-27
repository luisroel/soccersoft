DROP TABLE IF EXISTS tbStats_Simulation;
CREATE TABLE tbStats_Simulation (
    `PeriodId`	BIGINT NULL,
	`FixtureId`	BIGINT NULL,
    `Date`		DATETIME,
	`Type`		VARCHAR(30)
);
