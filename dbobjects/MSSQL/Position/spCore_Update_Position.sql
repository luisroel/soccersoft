USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Position]'))
	DROP PROCEDURE [dbo].[spCore_Update_Position]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Position]
      @PositionId	BIGINT
	, @Position		VARCHAR(30)
	, @Abbrev		VARCHAR(5)
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Position] [CC] WHERE [CC].[Position] = @Position AND [CC].[PositionId] <> @PositionId)
		SELECT
			@Msg = 'Position already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Position] [CC] WHERE [CC].[PositionId] = @PositionId)
		SELECT
			@Msg = 'Position does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Position] SET
			  [Position]		= @Position
			, [Abbrev]			= @Abbrev
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[PositionId] = @PositionId
END
