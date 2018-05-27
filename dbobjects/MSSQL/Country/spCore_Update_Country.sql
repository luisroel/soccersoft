USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Country]'))
	DROP PROCEDURE [dbo].[spCore_Update_Country]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Country]
      @CountryId	BIGINT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Country] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[CountryId] <> @CountryId)
		SELECT
			@Msg = 'Country already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Country] [CC] WHERE [CC].[CountryId] = @CountryId)
		SELECT
			@Msg = 'Country does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Country] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[CountryId] = @CountryId
END
