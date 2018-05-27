DROP TABLE IF EXISTS tbStats_HomeTable;
CREATE TABLE tbStats_HomeTable(
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