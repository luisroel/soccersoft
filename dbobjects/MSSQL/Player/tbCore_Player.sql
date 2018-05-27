USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Player]'))
	DROP TABLE [dbo].[tbCore_Player]
GO

CREATE TABLE [dbo].[tbCore_Player](
	[PlayerId]		[bigint] IDENTITY(0,1) NOT NULL,
	[NickName]		[varchar](30) NULL,
	[FirstName]		[varchar](30) NULL,
	[MiddleName]	[varchar](30) NULL,
	[LastName]		[varchar](30) NULL,
	[PositionId]	[bigint] NULL,
	[IsActive]		[int] NULL,
	[BirthDate]		[datetime] NULL,
	[CountryId]		[bigint] NULL,
	[EntryUserId]	[bigint] NULL,
	[EntryDate]		[datetime] NULL,
	[ModUserId]		[bigint] NULL,
	[ModDate]		[datetime] NULL
) ON [PRIMARY]

GO

INSERT INTO [dbo].[tbCore_Player] (
	  [NickName]
	, [FirstName]
	, [MiddleName]
	, [LastName]
	, [PositionId]
	, [IsActive]
	, [BirthDate]
	, [CountryId]
	, [EntryUserId]
	, [EntryDate]
	, [ModUserId]
	, [ModDate]
) VALUES (
	  'Default'
	, 'Default'
	, ''
	, 'Player'
	, 1
	, 1
	, '1/1/1990'
	, 1
	, 1
	, GETDATE()
	, 1
	, GETDATE()
)
GO