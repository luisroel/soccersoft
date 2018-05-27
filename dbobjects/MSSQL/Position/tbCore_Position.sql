USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Position]'))
	DROP TABLE [dbo].[tbCore_Position]
GO

CREATE TABLE [dbo].[tbCore_Position](
	[PositionId]	[bigint] IDENTITY(1,1) NOT NULL,
	[Position]		[varchar](30) NULL,
	[Abbrev]		[varchar](5) NULL,
	[IsActive]		[int] NULL,
	[EntryUserId]	[bigint] NULL,
	[EntryDate]		[datetime] NULL,
	[ModUserId]		[bigint] NULL,
	[ModDate]		[datetime] NULL
) ON [PRIMARY]

GO
