USE [SoccerSoft]
GO

/****** Object:  Table [dbo].[ASeasonATeam]    Script Date: 2/5/2015 8:52:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_SeasonTeam]'))
	DROP TABLE [dbo].[tbCore_SeasonTeam]
GO

CREATE TABLE [dbo].[tbCore_SeasonTeam](
	[SeasonId]	[bigint] NOT NULL,
	[TeamId]	[bigint] NOT NULL
) ON [PRIMARY]

GO


