USE [SoccerSoft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCore_Insert_Association]'))
	DROP PROCEDURE [dbo].[spCore_Insert_Association]
GO

CREATE PROCEDURE [dbo].[spCore_Insert_Association]
	  @ShortName		VARCHAR(55)
	, @Name				VARCHAR(255)
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
	IF EXISTS(SELECT * FROM [dbo].[tbCore_Association] [SO] WHERE [SO].[ShortName] = @ShortName)
		SELECT
			@Msg = 'Association already exist. Please verify!'
	ELSE
		INSERT [dbo].[tbCore_Association] ( 
			  [ShortName]
			, [Name]
			, [IsActive]
			, [ConfederationId]
			, [CountryId]
			, [EntryUserId]
			, [EntryDate]
			, [ModUserId]
			, [ModDate]
		 ) VALUES (
		 	  @ShortName
			, @Name 
			, 1
			, @ConfederationId
			, @CountryId
			, @UserId
			, @Date
			, @UserId
			, @Date
		)
END
