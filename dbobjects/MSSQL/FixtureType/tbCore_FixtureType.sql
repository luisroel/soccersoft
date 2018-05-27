USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_FixtureType]'))
	DROP TABLE [dbo].[tbCore_FixtureType]
GO

CREATE TABLE [dbo].[tbCore_FixtureType](
	[FixtureTypeId]		[bigint] IDENTITY(1,1) NOT NULL,
	[ShortName]		[varchar](15) NULL,
	[Name]			[varchar](50) NULL,
	[IsActive]		[int] NULL,
	[EntryUserId]	[bigint] NULL,
	[EntryDate]		[datetime] NULL,
	[ModUserId]		[bigint] NULL,
	[ModDate]		[datetime] NULL
) ON [PRIMARY]

GO
