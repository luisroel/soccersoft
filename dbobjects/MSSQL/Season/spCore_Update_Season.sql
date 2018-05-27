USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Season]'))
	DROP PROCEDURE [dbo].[spCore_Update_Season]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Season]
      @SeasonId		BIGINT
	, @SeasonTypeId	BIGINT
	, @ShortName	VARCHAR(50)
	, @Name			VARCHAR(255)
	, @TournamentId	BIGINT
	, @UserId		BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Date DATETIME

	SELECT
		  @Date = GETDATE()
		, @Msg = ''

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Season] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[SeasonId] <> @SeasonId)
		SELECT
			@Msg = 'Season already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Season] [CC] WHERE [CC].[SeasonId] = @SeasonId)
		SELECT
			@Msg = 'Season does not exist. Please verify!'
	ELSE
	BEGIN
		UPDATE [dbo].[tbCore_Season] SET
			  [SeasonTypeId]	= @SeasonTypeId
			, [ShortName]		= @ShortName
			, [Name]			= @Name
			, [TournamentId]	= @TournamentId
		 WHERE
			[SeasonId] = @SeasonId

		UPDATE [dbo].[tbCore_Tournament] SET
			  [ModDate]   = @Date
			, [ModUserId] = @UserId
		WHERE
			[TournamentId] = @TournamentId
	END

END
