DROP TABLE IF EXISTS tbCore_Referee;
CREATE TABLE tbCore_Referee(
	`RefereeId`		BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`NickName`		VARCHAR(30) NULL,
	`FirstName`		VARCHAR(30) NULL,
	`MiddleName`	VARCHAR(30) NULL,
	`LastName`		VARCHAR(30) NULL,
	`IsActive`		INT NULL,
	`BirthDate`		DATETIME NULL,
	`CountryId`		BIGINT NULL,
	`EntryUserId`	BIGINT NULL,
	`EntryDate`		DATETIME NULL,
	`ModUserId`		BIGINT NULL,
	`ModDate`		DATETIME NULL
);