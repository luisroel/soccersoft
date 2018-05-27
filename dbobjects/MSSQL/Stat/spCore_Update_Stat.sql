USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Stat]'))
	DROP PROCEDURE [dbo].[spCore_Update_Stat]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Stat]
      @StatId	BIGINT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Stat] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[StatId] <> @StatId)
		SELECT
			@Msg = 'Stat already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Stat] [CC] WHERE [CC].[StatId] = @StatId)
		SELECT
			@Msg = 'Stat does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Stat] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[StatId] = @StatId
END
