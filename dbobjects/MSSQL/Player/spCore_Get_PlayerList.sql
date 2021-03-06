USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Get_PlayerList]'))
	DROP PROCEDURE [dbo].[spCore_Get_PlayerList]
GO

CREATE PROCEDURE [dbo].[spCore_Get_PlayerList]
	@IsActive INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @IsActive = 2
		SELECT 
			  [CC].[PlayerId]
			, [CC].[NickName]
			, [CC].[FirstName]
			, [CC].[MiddleName]
			, [CC].[LastName]
			, [CC].[PositionId]
			, [PS].[Abbrev]			AS [Position]
			, [CC].[IsActive]
			, [CC].[BirthDate]
			, [CC].[CountryId]
			, [CT].[ShortName]		AS [CountryName]
			, [CC].[EntryDate]
			, [CC].[EntryUserId]
			, [U1].[Username]		AS [EntryUser]
			, [CC].[ModDate]
			, [CC].[ModUserId]
			, [U2].[Username]		AS [ModUser]
		FROM 
			[dbo].[tbCore_Player] [CC]
			INNER JOIN [dbo].[tbCore_Position] [PS] ON
				[PS].[PositionId] = [CC].[PositionId]
			INNER JOIN [dbo].[tbCore_Country] [CT] ON
				[CT].[CountryId] = [CC].[CountryId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U1] ON
				[U1].[UserId] = [CC].[EntryUserId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U2] ON
				[U2].[UserId] = [CC].[ModUserId]
		ORDER BY
		  	  [CC].[FirstName]
			, [CC].[LastName]
	ELSE
		SELECT 
			  [CC].[PlayerId]
			, [CC].[NickName]
			, [CC].[FirstName]
			, [CC].[MiddleName]
			, [CC].[LastName]
			, [CC].[PositionId]
			, [PS].[Abbrev]			AS [Position]
			, [CC].[IsActive]
			, [CC].[BirthDate]
			, [CC].[CountryId]
			, [CT].[ShortName]		AS [CountryName]
			, [CC].[EntryDate]
			, [CC].[EntryUserId]
			, [U1].[Username]		AS [EntryUser]
			, [CC].[ModDate]
			, [CC].[ModUserId]
			, [U2].[Username]		AS [ModUser]
		FROM 
			[dbo].[tbCore_Player] [CC]
			INNER JOIN [dbo].[tbCore_Position] [PS] ON
				[PS].[PositionId] = [CC].[PositionId]
			INNER JOIN [dbo].[tbCore_Country] [CT] ON
				[CT].[CountryId] = [CC].[CountryId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U1] ON
				[U1].[UserId] = [CC].[EntryUserId]
			INNER JOIN [Credentials].[dbo].[tbSecurity_User] [U2] ON
				[U2].[UserId] = [CC].[ModUserId]
		WHERE 
			[CC].[IsActive] = @IsActive
		ORDER BY
		  	  [CC].[FirstName]
			, [CC].[LastName]
END
