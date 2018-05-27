USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Market]'))
	DROP PROCEDURE [dbo].[spCore_Update_Market]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Market]
      @MarketId	BIGINT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Market] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[MarketId] <> @MarketId)
		SELECT
			@Msg = 'Market already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Market] [CC] WHERE [CC].[MarketId] = @MarketId)
		SELECT
			@Msg = 'Market does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Market] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[MarketId] = @MarketId
END
