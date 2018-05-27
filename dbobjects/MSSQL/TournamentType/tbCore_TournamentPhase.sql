USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_TournamentPhase]'))
	DROP TABLE [dbo].[tbCore_TournamentPhase]
GO

CREATE TABLE [dbo].[tbCore_TournamentPhase](
	[TournamentTypeId]	[bigint] NOT NULL,
	[PhaseId]		[bigint] NOT NULL
) ON [PRIMARY]

GO
