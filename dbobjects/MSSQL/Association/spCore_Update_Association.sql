USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Update_Association]'))
	DROP PROCEDURE [dbo].[spCore_Update_Association]
GO

CREATE PROCEDURE [dbo].[spCore_Update_Association]
      @AssociationId	BIGINT
	, @ShortName		VARCHAR(50)
	, @Name				VARCHAR(255)
	, @IsActive			BIT
	, @ConfederationId	BIGINT
	, @CountryId		BIGINT
	, @UserId			BIGINT
	, @Msg				VARCHAR(255) OUTPUT
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Association] [CC] WHERE [CC].[ShortName] = @ShortName AND [CC].[AssociationId] <> @AssociationId)
		SELECT
			@Msg = 'Association already exist. Please verify!'
	ELSE IF NOT EXISTS(SELECT * FROM [dbo].[tbCore_Association] [CC] WHERE [CC].[AssociationId] = @AssociationId)
		SELECT
			@Msg = 'Association does not exist. Please verify!'
	ELSE
		UPDATE [dbo].[tbCore_Association] SET
			  [ShortName]		= @ShortName
			, [Name]			= @Name
			, [IsActive]		= @IsActive
			, [ConfederationId]	= @ConfederationId
			, [CountryId]		= @CountryId
			, [ModUserId]		= @UserId
			, [ModDate]			= @Date
		 WHERE
			[AssociationId] = @AssociationId
END
