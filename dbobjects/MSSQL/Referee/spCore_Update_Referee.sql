USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Referee]'))
	DROP PROCEDURE [dbo].[spCore_Update_Referee]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Referee]
      @RefereeId		BIGINT
	, @NickName		VARCHAR(30)
	, @FirstName	VARCHAR(30)
	, @MiddleName	VARCHAR(30)
	, @LastName		VARCHAR(30)
	, @IsActive		BIT
	, @BirthDate	DATETIME
	, @CountryId	BIGINT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Referee] [CC] WHERE [CC].[FirstName] = @FirstName AND [CC].[LastName] = @LastName AND [CC].[RefereeId] <> @RefereeId)
		SELECT
			@Msg = 'Referee already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Referee] [CC] WHERE [CC].[RefereeId] = @RefereeId)
		SELECT
			@Msg = 'Referee does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Referee] SET
			  [NickName]	= @NickName
			, [FirstName]	= @FirstName
			, [MiddleName]	= @MiddleName
			, [LastName]	= @LastName
			, [IsActive]	= @IsActive
			, [BirthDate]	= @BirthDate
			, [CountryId]	= @CountryId
			, [ModUserId]	= @UserId
			, [ModDate]		= @Date
		 WHERE
			[RefereeId] = @RefereeId
END
