USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Season]'))
	DROP TABLE [dbo].[tbCore_Season]
GO

CREATE TABLE [dbo].[tbCore_Season](
	[SeasonId]		[bigint] IDENTITY(1,1) NOT NULL,
	[SeasonTypeId]	[bigint] NULL,
	[ShortName]		[varchar](50) NULL,
	[Name]			[varchar](255) NULL,
	[TournamentId]	[bigint] NULL
) ON [PRIMARY]

GO
