DROP TABLE IF EXISTS tbCore_FixtureStatus;
CREATE TABLE tbCore_FixtureStatus(
	`FixtureStatusId`	BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`ShortName`			VARCHAR(50) NOT NULL,
	`Name`				VARCHAR(255) NOT NULL
);

INSERT INTO tbCore_FixtureStatus (`ShortName`, `Name`) VALUES ('SCH', 'Scheduled');
INSERT INTO tbCore_FixtureStatus (`ShortName`, `Name`) VALUES ('FNL', 'Finished');
INSERT INTO tbCore_FixtureStatus (`ShortName`, `Name`) VALUES ('POS', 'Posponed');
INSERT INTO tbCore_FixtureStatus (`ShortName`, `Name`) VALUES ('ABN', 'Abandoned');
INSERT INTO tbCore_FixtureStatus (`ShortName`, `Name`) VALUES ('AWD', 'Awarded');

DROP TABLE IF EXISTS tbCore_Fixture;
CREATE TABLE tbCore_Fixture(
	`FixtureId`			BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`Round`				INT NULL,
	`FixtureStatusId`	INT NULL,
	`Time`				DATETIME NULL,
	`HomeTeamId`		BIGINT NULL,
	`ScoredHome`		INT NULL,
	`ScoredVisitor`		INT NULL,
	`VisitorTeamId`		BIGINT NULL,
    `Odd_1`				FLOAT NULL,
    `Odd_X`				FLOAT NULL,
    `Odd_2`				FLOAT NULL,
    `aOdd_1`			FLOAT NULL,
    `aOdd_X`			FLOAT NULL,
    `aOdd_2`			FLOAT NULL,
	`StadiumId`			BIGINT NULL,
	`RefereeId`			BIGINT NULL,
	`SeasonId`			BIGINT NOT NULL,
	`PhaseId`			BIGINT NOT NULL,
    `WeekNo`			INT NULL,
    `Tendency`			VARCHAR(3) NULL,
	`EntryUserId`		BIGINT NULL,
	`EntryDate`			DATETIME NULL,
	`ModUserId`			BIGINT NULL,
	`ModDate`			DATETIME NULL
);

DROP TABLE IF EXISTS tbCore_FixtureTmp;
CREATE TABLE tbCore_FixtureTmp(
	`FixtureId`			BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	`Round`				INT NULL,
	`FixtureStatusId`	INT NULL,
	`Time`				DATETIME NULL,
	`HomeTeamId`		BIGINT NULL,
	`ScoredHome`		INT NULL,
	`ScoredVisitor`		INT NULL,
	`VisitorTeamId`		BIGINT NULL,
    `Odd_1`				FLOAT NULL,
    `Odd_X`				FLOAT NULL,
    `Odd_2`				FLOAT NULL,
	`StadiumId`			BIGINT NULL,
	`RefereeId`			BIGINT NULL,
	`SeasonId`			BIGINT NOT NULL,
	`PhaseId`			BIGINT NOT NULL,
    `WeekNo`			INT NULL,
	`EntryUserId`		BIGINT NULL,
	`EntryDate`			DATETIME NULL,
	`ModUserId`			BIGINT NULL,
	`ModDate`			DATETIME NULL
);

