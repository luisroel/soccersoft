USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_FixtureType]'))
	DROP PROCEDURE [dbo].[spCore_Update_FixtureType]
GO

CREATE PROCEDURE [dbo].[spCore_Update_FixtureType]
      @FixtureTypeId	BIGINT
	, @ShortName	VARCHAR(15)
	, @Name			VARCHAR(50)
	, @IsActive		BIT
	, @UserId		BIGINT
	, @Msg			VARCHAR(255) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT FixtureTypeements.
	SET NOCOUNT ON;

	DECLARE @Date DATETIME

	SELECT
		  @Date = GETDATE()
		, @Msg = ''

    -- Insert FixtureTypeements for procedure here
	IF EXISTS(SELECT * FROM [dbo].[tbCore_FixtureType] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[FixtureTypeId] <> @FixtureTypeId)
		SELECT
			@Msg = 'FixtureType already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_FixtureType] [CC] WHERE [CC].[FixtureTypeId] = @FixtureTypeId)
		SELECT
			@Msg = 'FixtureType does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_FixtureType] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[FixtureTypeId] = @FixtureTypeId
END
