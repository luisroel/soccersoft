USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Confederation]'))
	DROP TABLE [dbo].[tbCore_Confederation]
GO

CREATE TABLE [dbo].[tbCore_Confederation](
	[ConfederationId]	[bigint] IDENTITY(1,1) NOT NULL,
	[ShortName]			[varchar](10) NULL,
	[Name]				[varchar](100) NULL,
	[IsActive]			[int] NULL,
	[EntryUserId]		[bigint] NULL,
	[EntryDate]			[datetime] NULL,
	[ModUserId]			[bigint] NULL,
	[ModDate]			[datetime] NULL
) ON [PRIMARY]

GO
