DROP TABLE IF EXISTS tbCore_Tournament;
CREATE TABLE tbCore_Tournament(
	`TournamentId`	BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`		VARCHAR(50) NULL,
	`Name`			VARCHAR(255) NULL,
	`IsActive`		INT NULL,
	`AssociationId`	BIGINT NULL,
	`EntryUserId`	BIGINT NULL,
	`EntryDate`		DATETIME NULL,
	`ModUserId`		BIGINT NULL,
	`ModDate`		DATETIME NULL
);

