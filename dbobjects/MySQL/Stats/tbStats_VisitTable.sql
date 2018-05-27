DROP TABLE IF EXISTS tbStats_VisitTable;
CREATE TABLE tbStats_VisitTable(
	`SeasonId`	BIGINT NULL,
	`Season`	VARCHAR(30),
	`WeekNo`	BIGINT NULL,
    `Position`	INT NULL,
	`TeamId`	BIGINT NULL,
    `Team`		VARCHAR(50),
	`Played`	INT NULL,
	`Wins`		INT NULL,
	`Draws`		INT NULL,
	`Losses`	INT NULL,
	`Scored`	INT NULL,
	`Against`	INT NULL,
	`Diff`		INT NULL,
	`Points`	INT NULL
);
