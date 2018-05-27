USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Stadium]'))
	DROP PROCEDURE [dbo].[spCore_Update_Stadium]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Stadium]
      @StadiumId	BIGINT
	, @ShortName	VARCHAR(10)
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Stadium] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[StadiumId] <> @StadiumId)
		SELECT
			@Msg = 'Stadium already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Stadium] [CC] WHERE [CC].[StadiumId] = @StadiumId)
		SELECT
			@Msg = 'Stadium does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Stadium] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[StadiumId] = @StadiumId
END
