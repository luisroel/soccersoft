DROP TABLE IF EXISTS tbCore_Association;
DELIMITER $$
CREATE TABLE tbCore_Association(
	`AssociationId`		BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`			VARCHAR(50) NULL,
	`Name`				VARCHAR(255) NULL,
	`IsActive`			INT NULL,
	`ConfederationId`	BIGINT NULL,
	`CountryId`			BIGINT NULL,
	`EntryUserId`		BIGINT NULL,
	`EntryDate`			DATETIME NULL,
	`ModUserId`			BIGINT NULL,
	`ModDate`			DATETIME NULL
);
