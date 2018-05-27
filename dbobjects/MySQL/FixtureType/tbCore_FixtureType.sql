DROP TABLE IF EXISTS tbCore_FixtureType;
CREATE TABLE tbCore_FixtureType(
	`FixtureTypeId`	BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`		VARCHAR(15) NULL,
	`Name`			VARCHAR(50) NULL,
	`IsActive`		INT NULL,
	`EntryUserId`	BIGINT NULL,
	`EntryDate`		DATETIME NULL,
	`ModUserId`		BIGINT NULL,
	`ModDate`		DATETIME NULL
);
