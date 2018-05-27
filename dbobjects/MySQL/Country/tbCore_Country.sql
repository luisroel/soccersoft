DROP TABLE IF EXISTS tbCore_Country;
CREATE TABLE tbCore_Country(
	`CountryId`		BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`		VARCHAR(10) NULL,
	`Name`			VARCHAR(50) NULL,
	`IsActive`		INT NULL,
	`EntryUserId`	BIGINT NULL,
	`EntryDate`		DATETIME NULL,
	`ModUserId`		BIGINT NULL,
	`ModDate`		DATETIME NULL
);
