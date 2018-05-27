USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Team]'))
	DROP TABLE [dbo].[tbCore_Team]
GO

CREATE TABLE [dbo].[tbCore_Team](
	[TeamId]		[bigint] IDENTITY(1,1) NOT NULL,
	[ShortName]		[varchar](50) NULL,
	[Name]			[varchar](255) NULL,
	[IsActive]		[int] NULL,
	[AssociationId]	[bigint] NULL,
	[Alias01]		[varchar](50) NULL,
	[Alias02]		[varchar](50) NULL,
	[Alias03]		[varchar](50) NULL,
	[Alias04]		[varchar](50) NULL,
	[Alias05]		[varchar](50) NULL,
	[Alias06]		[varchar](50) NULL,
	[Alias07]		[varchar](50) NULL,
	[Alias08]		[varchar](50) NULL,
	[Alias09]		[varchar](50) NULL,
	[Alias10]		[varchar](50) NULL,
	[EntryUserId]	[bigint] NULL,
	[EntryDate]		[datetime] NULL,
	[ModUserId]		[bigint] NULL,
	[ModDate]		[datetime] NULL
) ON [PRIMARY]

GO
