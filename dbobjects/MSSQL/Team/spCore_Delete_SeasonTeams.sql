USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Delete_SeasonTeams]'))
	DROP PROCEDURE [dbo].[spCore_Delete_SeasonTeams]
GO

CREATE PROCEDURE [dbo].[spCore_Delete_SeasonTeams]
	  @SeasonId BIGINT
	, @Msg		VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		@Msg = ''

	IF EXISTS(SELECT * FROM [dbo].[tbCore_Fixture] [FT] WHERE [FT].[AwayTeamId] IN (
					SELECT [ST].[TeamId] FROM [dbo].[tbCore_SeasonTeam] [ST] WHERE [ST].[SeasonId] = @SeasonId)	) 
		OR EXISTS(SELECT * FROM [dbo].[tbCore_Fixture] [FT] WHERE [FT].[HomeTeamId] IN (
					SELECT [ST].[TeamId] FROM [dbo].[tbCore_SeasonTeam] [ST] WHERE [ST].[SeasonId] = @SeasonId)	) 
		SELECT	
			@Msg = 'Teams list cannot change. There is already a schedule!'
    ELSE
		DELETE FROM [dbo].[tbCore_SeasonTeam] WHERE [SeasonId] = @SeasonId
END
