USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_TournamentType]'))
	DROP PROCEDURE [dbo].[spCore_Update_TournamentType]
GO

CREATE PROCEDURE [dbo].[spCore_Update_TournamentType]
      @TournamentTypeId	BIGINT
	, @ShortName	VARCHAR(15)
	, @Name			VARCHAR(50)
	, @IsActive		BIT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_TournamentType] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[TournamentTypeId] <> @TournamentTypeId)
		SELECT
			@Msg = 'TournamentType already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_TournamentType] [CC] WHERE [CC].[TournamentTypeId] = @TournamentTypeId)
		SELECT
			@Msg = 'TournamentType does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_TournamentType] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[TournamentTypeId] = @TournamentTypeId
END
