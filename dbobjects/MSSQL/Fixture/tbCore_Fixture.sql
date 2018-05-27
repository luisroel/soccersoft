USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Fixture]'))
	DROP TABLE [dbo].[tbCore_Fixture]
GO

CREATE TABLE [dbo].[tbCore_Fixture](
	[FixtureId]		[bigint] IDENTITY(1,1) NOT NULL,
	[SeasonId]		[bigint] NOT NULL,
	[PhaseId]		[bigint] NOT NULL,
	[Round]			[int] NULL,
	[Time]			[datetime] NULL,
	[HomeTeamId]	[bigint] NULL,
	[AwayTeamId]	[bigint] NULL,
	[StadiumId]		[bigint] NULL,
	[RefereeId]		[bigint] NULL,
	[StatusId]		[int] NULL,
	[EntryUserId]	[bigint] NULL,
	[EntryDate]		[datetime] NULL,
	[ModUserId]		[bigint] NULL,
	[ModDate]		[datetime] NULL
) ON [PRIMARY]

GO


