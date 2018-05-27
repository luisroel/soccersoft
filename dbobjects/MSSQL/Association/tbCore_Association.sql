USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbCore_Association]'))
	DROP TABLE [dbo].[tbCore_Association]
GO

CREATE TABLE [dbo].[tbCore_Association](
	[AssociationId]		[bigint] IDENTITY(1,1) NOT NULL,
	[ShortName]			[varchar](50) NULL,
	[Name]				[varchar](255) NULL,
	[IsActive]			[int] NULL,
	[ConfederationId]	[bigint] NULL,
	[CountryId]			[bigint] NULL,
	[EntryUserId]		[bigint] NULL,
	[EntryDate]			[datetime] NULL,
	[ModUserId]			[bigint] NULL,
	[ModDate]			[datetime] NULL
) ON [PRIMARY]

GO
