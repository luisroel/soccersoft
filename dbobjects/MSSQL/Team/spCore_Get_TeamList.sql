USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Get_TeamList]'))
	DROP PROCEDURE [dbo].[spCore_Get_TeamList]
GO

CREATE PROCEDURE [dbo].[spCore_Get_TeamList]
	@IsActive INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @IsActive = 2
		SELECT 
			  [CC].[TeamId]
			, [CC].[Name]
			, [CC].[ShortName]
			, [CC].[IsActive]
			, [CC].[AssociationId]
			, [AS].[ShortName]			AS [AssociationName]
			, [CC].[Alias01]
			, [CC].[Alias02]
			, [CC].[Alias03]
			, [CC].[Alias04]
			, [CC].[Alias05]
			, [CC].[Alias06]
			, [CC].[Alias07]
			, [CC].[Alias08]
			, [CC].[Alias09]
			, [CC].[Alias10]
			, [CC].[EntryDate]
			, [CC].[EntryUserId]
			, [U1].[Username] AS [EntryUser]
			, [CC].[ModDate]
			, [CC].[ModUserId]
			, [U2].[Username] AS [ModUser]
		FROM 
			[dbo].[tbCore_Team] [CC]
			INNER JOIN [dbo].[tbCore_Association] [AS] ON
				[AS].[AssociationId] = [CC].[AssociationId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U1] ON
				[U1].[UserId] = [CC].[EntryUserId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U2] ON
				[U2].[UserId] = [CC].[ModUserId]
		ORDER BY
			[CC].[ShortName]
	ELSE
		SELECT 
			  [CC].[TeamId]
			, [CC].[Name]
			, [CC].[ShortName]
			, [CC].[IsActive]
			, [CC].[AssociationId]
			, [AS].[ShortName]			AS [AssociationName]
			, [CC].[Alias01]
			, [CC].[Alias02]
			, [CC].[Alias03]
			, [CC].[Alias04]
			, [CC].[Alias05]
			, [CC].[Alias06]
			, [CC].[Alias07]
			, [CC].[Alias08]
			, [CC].[Alias09]
			, [CC].[Alias10]
			, [CC].[EntryDate]
			, [CC].[EntryUserId]
			, [U1].[Username] AS [EntryUser]
			, [CC].[ModDate]
			, [CC].[ModUserId]
			, [U2].[Username] AS [ModUser]
		FROM 
			[dbo].[tbCore_Team] [CC]
			INNER JOIN [dbo].[tbCore_Association] [AS] ON
				[AS].[AssociationId] = [CC].[AssociationId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U1] ON
				[U1].[UserId] = [CC].[EntryUserId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U2] ON
				[U2].[UserId] = [CC].[ModUserId]
		WHERE 
			[CC].[IsActive] = @IsActive
		ORDER BY
			[CC].[ShortName]
END
