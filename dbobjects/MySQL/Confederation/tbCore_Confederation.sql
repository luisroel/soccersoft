DROP TABLE IF EXISTS tbCore_Confederation;
CREATE TABLE tbCore_Confederation(
	`ConfederationId`	BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`			VARCHAR(10) NULL,
	`Name`				VARCHAR(200) NULL,
	`IsActive`			INT NULL,
	`EntryUserId`		BIGINT NULL,
	`EntryDate`			DATETIME NULL,
	`ModUserId`			BIGINT NULL,
	`ModDate`			DATETIME NULL
);

