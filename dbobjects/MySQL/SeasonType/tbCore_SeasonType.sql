DROP TABLE IF EXISTS tbCore_SeasonType;
CREATE TABLE tbCore_SeasonType(
	`SeasonTypeId`	BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`		VARCHAR(15) NULL,
	`Name`			VARCHAR(50) NULL,
	`IsActive`		INT NULL,
	`EntryUserId`	BIGINT NULL,
	`EntryDate`		DATETIME NULL,
	`ModUserId`		BIGINT NULL,
	`ModDate`		DATETIME NULL
);

DROP TABLE IF EXISTS tbCore_SeasonTypePhase;
CREATE TABLE tbCore_SeasonTypePhase(
	`SeasonTypeId`	BIGINT NOT NULL,
	`PhaseId`		BIGINT NOT NULL
);

