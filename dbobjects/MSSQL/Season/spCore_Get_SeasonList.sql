USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Get_SeasonList]'))
	DROP PROCEDURE [dbo].[spCore_Get_SeasonList]
GO

CREATE PROCEDURE [dbo].[spCore_Get_SeasonList]
	@TournamentId BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
			  [SS].[SeasonId]
			, [SS].[ShortName]
			, [SS].[Name]
			, [SS].[SeasonTypeId]
			, [ST].[ShortName]		AS [SeasonTypeName]
			, [SS].[TournamentId]
			, [TN].[ShortName]		AS [TournamentName]
		FROM 
			[dbo].[tbCore_Season] [SS]
			INNER JOIN [dbo].[tbCore_SeasonType] [ST] ON
				[ST].[SeasonTypeId] = [SS].[SeasonTypeId]
			INNER JOIN [dbo].[tbCore_Tournament] [TN] ON
				[TN].[TournamentId] = [SS].[TournamentId]
		WHERE 
			[SS].[TournamentId] = @TournamentId
		ORDER BY
			[SS].[ShortName]
END
